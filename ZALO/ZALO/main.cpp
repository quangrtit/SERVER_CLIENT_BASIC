#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "src/include/user.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<User>("user", 1, 0, "MyUser");
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/zalo/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
