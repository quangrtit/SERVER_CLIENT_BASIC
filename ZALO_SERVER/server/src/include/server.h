#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QHash>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QVector>

class Server: public QObject {
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);
public: 
    QString getClientKey(QTcpSocket *client);
signals:
    void dataReceived(QByteArray data);
public slots:
    void onNewConnection(); // create one new connection
    void onReadData();
    void onNewMessage(QByteArray ba); // send data for all client 
    void onClientDisconnected();
public: 
    QString accessSuccess(QString userphone, QString password);
    void setStatusLogin(QString status, QString userphone);
    bool checkUserphoneExist(QString userphone); // check one phone number is exist 
    int checkGroupExist(QString userphone, QString userphoneFriend, QJsonObject& jsonF); // check two phone number is friend if not have it will create 1 group 
    QString getNameIndatabase(QString userphone); 
    void sendMessageForGroup(QString userphone, QString group_id, QString message);
    void getAllGroupChatForUser(QString userphone, QJsonObject& jsonF);
    void getAllMessage(QString userphone, QString group_id, QJsonObject& jsonF);
    bool checkInfoRegister(QString userphone, QString password, QJsonObject& jsonF);
    void registerAccount(QString userphone, QString password, QJsonObject& jsonF);
private:
    QTcpServer server;
    QHash<QString, QTcpSocket*> _clients;// list save all clients

};

#endif
