#include "../include/server.h"
#include <QSqlDatabase>
#include <QSqlQuery>
Server::Server(QObject *parent) : QObject(parent){
    connect(&server, &QTcpServer::newConnection, this, &Server::onNewConnection);
    connect(this, Server::dataReceived, this, Server::onNewMessage); // when signal dataReceived generate onNewMessage callback
    if(server.listen(QHostAddress::Any, 1234))// port 1234 is openning and listening 
    {
        qDebug() << "Server is Listening.......";
    }
}
void Server::onNewConnection()
{
    const auto client = server.nextPendingConnection();
    if(client == nullptr)
    {
        return;
    }
    qDebug() << "New client connected ....";
    _clients.insert(this->getClientKey(client), client);
    // processing
    connect(client, &QTcpSocket::readyRead, this, &Server::onReadData);
    connect(client, &QTcpSocket::disconnected, this, &Server::onClientDisconnected);
}
void Server::onReadData() // processing 
{
    const auto client = qobject_cast<QTcpSocket*>(sender());
    if(client == nullptr)
    {
        return;
    }
    QByteArray jsonData = client->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData);
    QJsonObject json = jsonDoc.object();
    // processing data is one messege
    if(json.contains("type"))
    {
        QString type = json["type"].toString();
        if(type == "login")
        {
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["userphone"] = json["userphone"].toString();
            json1["type"] = "login";
            json1["result"] = this->accessSuccess(json["userphone"].toString(), json["password"].toString());
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
        else if(type == "logoff")
        {
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["userphone"] = json["userphone"].toString();
            json1["type"] = "logoff";
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
        else if(type == "addFriend")
        {
            // add friend and add group
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["type"] = "addFriend";
            // info about friend 
            this->checkGroupExist(json["userphoneSender"].toString(), json["userphoneFriend"].toString(), json1);
            // qDebug() << "haha " << json1;
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
        else if(type == "startChat")
        {
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["type"] = "startChat";
            json1["userphoneSender"] = json["userphoneSender"].toString();
            this->getAllGroupChatForUser(json["userphoneSender"].toString(), json1);
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
        else if(type == "chat")
        {
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["type"] = "chat";
            json1["userphoneSender"] = json["userphoneSender"].toString();
            json1["message"] = json["message"].toString();
            json1["group_id"] = json["group_id"].toString();
            this->sendMessageForGroup(json["userphoneSender"].toString(), json["group_id"].toString(), json["message"].toString());
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
        else if(type == "reloadRoomChat")
        {
            QJsonObject json1;
            json1["sender"] = this->getClientKey(client);
            json1["type"] = "reloadRoomChat";
            json1["userphoneSender"] = json["userphoneSender"].toString();
            this->getAllMessage(json["userphoneSender"].toString(), json["group_id"].toString(), json1);
            QJsonDocument jsonDoc1(json1);
            QByteArray jsonData = jsonDoc1.toJson();
            emit dataReceived(jsonData);
        }
    }
}
void Server::onClientDisconnected()
{
    //const auto client = (QTcpSocket*)(sender());
    const auto client = qobject_cast<QTcpSocket*>(sender());
    if(client == nullptr)
    {
        return;
    }
    _clients.remove(this->getClientKey(client));
}
void Server::onNewMessage(QByteArray ba)
{
    QByteArray jsonData = ba;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData);
    QJsonObject json = jsonDoc.object();
    if(json.contains("type"))
    {
        QString type = json["type"].toString();
        if(type == "login")
        {
            _clients[json["sender"].toString()]->write(ba);
            _clients[json["sender"].toString()]->waitForBytesWritten();
            _clients[json["sender"].toString()]->flush();
            // send result for sender about status log 
        }
        else if(type == "logoff")
        {
            this->setStatusLogin("0", json["userphone"].toString());
        }
        else if(type == "addFriend")
        {
            qDebug() << "last json: " << json;
            for(auto &client: _clients)
            {
                client->write(ba);
                client->waitForBytesWritten();
                client->flush();
            }
        }
        else if(type == "startChat")
        {
            _clients[json["sender"].toString()]->write(ba);
            _clients[json["sender"].toString()]->waitForBytesWritten();
            _clients[json["sender"].toString()]->flush();
        }
        else if(type == "reloadRoomChat")
        {
            for(auto &client: _clients)
            {
                client->write(ba);
                client->waitForBytesWritten();
                client->flush();
            }
        }
        else if(type == "chat")
        {
            qDebug() << "demo: " << ba;
            for(auto &client: _clients)
            {
                client->write(ba);
                client->waitForBytesWritten();
                client->flush();
            }
        }
        return;
    }
    // send data for all clients 
    for(auto &client: _clients)
    {
        client->write(ba);
        client->waitForBytesWritten();
        client->flush();
    }
}
QString Server::accessSuccess(QString userphone, QString password)
{
    
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        qDebug() << "connect check username and password success!" << "\n";
        QSqlQuery getDb;
        getDb.exec("SELECT * FROM database1.users");
        while(getDb.next())
        {
            QString valueUserphone = getDb.value(0).toString();
            QString valuePassword = getDb.value(2).toString();
            QString valueStatus = getDb.value(3).toString();
            //qDebug() << valueUserphone << " " << valuePassword << " " << valueStatus << "\n";
            if(valueUserphone == userphone && valuePassword == password && valueStatus == "0")
            {
                this->setStatusLogin("1", userphone);
                return "accept";
            }
        }
    }
    else 
    {
        qDebug() << "connect check userphone and password not success!" << "\n";
    }
    return "deny";
}
void Server::setStatusLogin(QString status, QString userphone)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        qDebug() << "connect set status login success";
        QSqlQuery getDb;
        QString qr = "UPDATE database1.users SET statuslogin = " + status + " WHERE user_idphone = " + "'" + userphone + "'";
        //qDebug() << qr << "\n";
        getDb.exec(qr);
    }
    else 
    {
        qDebug() << "connect set status login not success";
    }
}

bool Server::checkUserphoneExist(QString userphone)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        qDebug() << "connect check users success";
        QSqlQuery getDb;
        QString qr = "SELECT COUNT(*) FROM database1.users WHERE user_idphone = '" + userphone + "'";
        //qDebug() << qr << "\n";
        if(getDb.exec(qr))
        {
            if(getDb.next())
            {
                if(getDb.value(0).toInt() > 0)
                {
                    // qDebug() << "this is: " << getDb.value(0).toInt() << '\n';
                    return true;
                }
            }
        }
    }
    else 
    {
        qDebug() << "connect not success";
    }
    return false;
}
int Server::checkGroupExist(QString userphone, QString userphoneFriend, QJsonObject& jsonF)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        if(this->checkUserphoneExist(userphoneFriend) == false || userphone == userphoneFriend)
        {
            jsonF["stt"] = "notExist";
            return 1; // user không tồn tại
        }
        
        qDebug() << "connect check group success";
        QSqlQuery getDb;
        QString qr = "select database1.users_groupx.group_id from database1.users_groupx where user_idphone = '" + userphone + "'";
        //qDebug() << qr << "\n";
        if(getDb.exec(qr))
        {
            while(getDb.next())
            {
                QSqlQuery getDb1;
                QString checkValue = getDb.value(0).toString();
                QString qr1 = "select count(*) from database1.users_groupx where group_id = " + getDb.value(0).toString();
                if(getDb1.exec(qr1))
                {
                    if(getDb1.next())
                    {
                        if(getDb1.value(0).toInt() == 2)
                        {
                            // kiểm tra xem friend có không group_id này không
                            QSqlQuery getDb2;
                            QString qr2 = "select count(*) from database1.users_groupx where group_id = " + checkValue + " and user_idphone = '" + userphoneFriend + "'"; 
                            if(getDb2.exec(qr2))
                            {
                                if(getDb2.next())
                                {
                                    qDebug() << "error" << qr2 << " " << getDb.value(0).toInt();
                                    if(getDb2.value(0).toInt() == 1)
                                    {
                                        //qDebug() << "yes sir";
                                        jsonF["stt"] = "exist";
                                        jsonF["group_id"] = checkValue;
                                        jsonF["userphone"] = userphone;
                                        jsonF["userphoneFriend"] = userphoneFriend;
                                        jsonF["usernameFriend"] = this->getNameIndatabase(userphoneFriend);
                                        return 0; // có tồn tại
                                    }
                                }
                            }          
                        }
                    }
                }    
            }
            // cố gắng tạo ra thêm 1 chatgroup từ 2 người 
            QSqlQuery execQr;
            QString qry = "insert into database1.groupx (group_name) values ('" + userphone + userphoneFriend + "')";
            if(execQr.exec(qry))
            {
                qDebug() << "yeo 2";
            }
            if(execQr.exec("SELECT database1.groupx.group_id FROM database1.groupx ORDER BY group_id DESC LIMIT 1;"))
            {
                qDebug() << "yeo 1";
            }
            if(execQr.next())
            {
                //qDebug() << "fix bug";
                int nextins = execQr.value(0).toInt();
                execQr.exec("insert into database1.users_groupx values (" + QString::number(nextins) + ", '" + userphone + "')");
                execQr.exec("insert into database1.users_groupx values (" + QString::number(nextins) + ", '" + userphoneFriend + "')");
                jsonF["stt"] = "newExist";
                jsonF["group_id"] = QString::number(nextins);
                jsonF["userphone"] = userphone;
                jsonF["userphoneFriend"] = userphoneFriend;
                jsonF["usernameFriend"] = this->getNameIndatabase(userphoneFriend);
                //qDebug() << "dây là: " << jsonF;
            }
            return 2; // cần tạo thêm
        }

    }
    else 
    {
        qDebug() << "connect not success";
    }
    jsonF["stt"] = "notConnect";
    return 3; // lỗi không truy cập được database
}
QString Server::getNameIndatabase(QString userphone)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    QString result = "";
    if(db.open())
    {
        QSqlQuery getDb;
        QString qr = "select database1.users.user_name from database1.users where user_idphone = '" + userphone + "'";
        getDb.exec(qr);
        if(getDb.next())
        {
            result = getDb.value(0).toString();
        }
    }
    else 
    {
        qDebug() << "connect not success";
    }
    return result;
}
void Server::getAllGroupChatForUser(QString userphone, QJsonObject& jsonF)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        QSqlQuery getDb;
        QString qr = "select database1.users_groupx.group_id from database1.users_groupx where user_idphone = '" + userphone + "'";
        getDb.exec(qr);
        QJsonArray arrInGroup_id, arrInGroup_name;
        while(getDb.next())
        {
            int check = getDb.value(0).toInt();
            QString qry = "select database1.groupx.group_name from database1.groupx where group_id = " + QString::number(check);
            QSqlQuery g;
            arrInGroup_id.append(QString::number(check));
            //jsonF["group_id"] = QString::number(check);
            g.exec(qry);
            if(g.next())
            {
                arrInGroup_name.append(g.value(0).toString());
                //jsonF["group_name"] = g.value(0).toString();
            }
            g.exec("select database1.users_groupx.user_idphone from database1.users_groupx where group_id = " + QString::number(check));
            QJsonArray jsonArrayUsername;
            while(g.next())
            {
                jsonArrayUsername.append(g.value(0).toString());
            }
            jsonF[QString::number(check)] = jsonArrayUsername;
        }
        jsonF["arrGroup_id"] = arrInGroup_id;
        jsonF["arrGroup_name"] = arrInGroup_name;
    }
    else 
    {
        qDebug() << "connect not success";
    }
    //qDebug() << "data is: " << jsonF;
}
void Server::sendMessageForGroup(QString userphone, QString group_id, QString message)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        QSqlQuery getDb;
        QString qr = "insert into database1.chathistory (group_id, user_idphone, chat_message, chat_time) values (" + group_id + ", '" + userphone + "', '" + message + "', '')";
        if(getDb.exec(qr))
        {
            qDebug() << "insert message thành công";
        }
    }
    else 
    {
        qDebug() << "connect not success";
    }
}
void Server::getAllMessage(QString userphone, QString group_id, QJsonObject& jsonF)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("networking");
    db.setUserName("postgres");
    db.setPassword("123456");
    if(db.open())
    {
        QSqlQuery getDb;
        QString qr = "select database1.chathistory.chat_message, database1.chathistory.user_idphone from database1.chathistory where group_id = " + group_id;
        if(getDb.exec(qr))
        {
            QJsonArray arrChat;
            QJsonArray arrUser;
            while(getDb.next())
            {
                arrChat.append(getDb.value(0).toString());
                arrUser.append(getDb.value(1).toString());
            }
            jsonF["arrChat"] = arrChat;
            jsonF["arrUser"] = arrUser;
            jsonF["group_id"] = group_id;
        }
    }
    else 
    {
        qDebug() << "connect not success";
    }
}
QString Server::getClientKey(QTcpSocket *client)
{
    // return client->peerAddress().toString() + ":" + QString::number(client->peerPort());
    return client->peerAddress().toString().append(":").append(QString::number(client->peerPort()));
}