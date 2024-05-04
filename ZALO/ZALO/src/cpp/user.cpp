#include "../include/user.h"
#include <QSqlDatabase>
#include <QSqlQuery>


User::User(QObject *parent) : QObject(parent){
    connect(&client, &QTcpSocket::connected, this, &User::onConnected);
    connect(&client, &QTcpSocket::errorOccurred, this, &User::onErrorOccurred);
    connect(&client, &QTcpSocket::readyRead, this, &User::onReadData);
}
void User::connectToServer(QString ip, QString port)
{
    client.connectToHost(ip, port.toUInt());
}
void User::onConnected()
{
    qDebug() << "Connect to host....";
}
void User::onErrorOccurred()
{
    qDebug() << "Error...";
}
void User::onReadData()
{
    QByteArray jsonData = client.readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData);
    if(jsonDoc.toJson().contains("type"))
    {
        //qDebug() << QString::fromUtf8(jsonDoc.toJson());
        emit dataReceived(QString::fromUtf8(jsonDoc.toJson()));
    }
}
void User::sendInfoLoginToServer(QString userphone, QString password)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "login";
    json["userphone"] = userphone;
    json["password"] = password;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendInfoLogoffToServer(QString userphone)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "logoff";
    json["userphone"] = userphone;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendInfoAddFriend(QString userphoneFriend, QString userphoneSender)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "addFriend";
    json["userphoneFriend"] = userphoneFriend;
    json["userphoneSender"] = userphoneSender;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendInfoStartRoomChat(QString userphoneSender)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "startChat";
    json["userphoneSender"] = userphoneSender;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendMessage(QString userphone, QString group_id, QString message, QString timeAndDate)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "chat";
    json["userphoneSender"] = userphone;
    json["group_id"] = group_id;
    json["message"] = message;
    json["timeAndDate"] = timeAndDate;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::reloadRoomChat(QString userphone, QString group_id)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "reloadRoomChat";
    json["userphoneSender"] = userphone;
    json["group_id"] = group_id;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendInfoRegister(QString userphone, QString password, QString passwordAgain)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "register";
    json["userphoneSender"] = userphone;
    json["password"] = password;
    json["passwordAgain"] = passwordAgain;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::getListFriend(QString userphone)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "listFriend";
    json["userphoneSender"] = userphone;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::sendListFriendForGroup(QString userphone, QVariantList arrayUserphone, QString groupName)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "listFriendForGroup";
    json["userphoneSender"] = userphone;
    json["groupName"] = groupName;
    QJsonArray jsonArrayUserphone;
    for(QVariant &variant : arrayUserphone)
    {
        if(variant.canConvert<QString>()) 
        {
            QString stringValue = variant.toString();
            jsonArrayUserphone.append(stringValue);
        }
    }
    jsonArrayUserphone.append(userphone); // last check ? 
    json["allUserphoneForGroup"] = jsonArrayUserphone;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}
void User::getLastTextForGroup(QString userphone)
{
    // if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    // QJsonObject json;
    // json["type"] = "getLastText";
    // json["userphoneSender"] = userphone;
    // QJsonDocument jsonDoc(json);
    // QByteArray jsonData = jsonDoc.toJson();
    // client.write(jsonData);
    // client.waitForBytesWritten();
    // client.flush();
}
void User::getListMemberForGroup(QString group_id)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "getListMember";
    json["group_id"] = group_id;
    QJsonDocument jsonDoc(json);
    QByteArray jsonData = jsonDoc.toJson();
    client.write(jsonData);
    client.waitForBytesWritten();
    client.flush();
}