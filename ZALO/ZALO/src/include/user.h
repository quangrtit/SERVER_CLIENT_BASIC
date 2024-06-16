#ifndef USER_H
#define USER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
class User: public QObject {
    Q_OBJECT
public:
    explicit User(QObject *parent = nullptr);

public:
    Q_INVOKABLE void sendInfoLoginToServer(QString userphone, QString password);
    Q_INVOKABLE void sendInfoLogoffToServer(QString userphone);
    Q_INVOKABLE void sendInfoAddFriend(QString userphoneFriend, QString userphoneSender);
    Q_INVOKABLE void sendInfoStartRoomChat(QString userphoneSender);
    Q_INVOKABLE void sendMessage(QString userphone, QString group_id, QString message, QString timeAndDate);
    Q_INVOKABLE void reloadRoomChat(QString userphone, QString group_id);
    Q_INVOKABLE void sendInfoRegister(QString userphone, QString password, QString passwordAgain);

    Q_INVOKABLE void getListFriend(QString userphone);
    Q_INVOKABLE void sendListFriendForGroup(QString userphone, QVariantList arrayUserphone, QString groupName);

    Q_INVOKABLE void deleteGroupChat(QString userphone, QString group_id); // remover friend 

    Q_INVOKABLE void addMemberToGroupChat(QString userphone, QString group_id, QVariantList arrayUserphone); // add new members

    Q_INVOKABLE void outGroup(QString userphone, QString group_id);// out group

signals:
    void dataReceived(QString data);
public slots: 
    //void sendData(QString data);
    void connectToServer(QString ip, QString port);
    void onConnected();
    void onReadData();
    void onErrorOccurred();
private:
    QTcpSocket client;
};

#endif