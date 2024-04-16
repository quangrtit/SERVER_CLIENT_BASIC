#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "src/include/server.h"
#include <qdebug.h>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Server>("server", 1, 0, "MyServer");
    Server mySv;
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/casino/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

// build program: powershell -ExecutionPolicy Bypass -File .\buildApp.ps1