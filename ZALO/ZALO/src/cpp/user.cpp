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
void User::sendMessage(QString userphone, QString group_id, QString message)
{
    if(client.state() == QAbstractSocket::UnconnectedState) client.connectToHost("localhost", 1234);
    QJsonObject json;
    json["type"] = "chat";
    json["userphoneSender"] = userphone;
    json["group_id"] = group_id;
    json["message"] = message;
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