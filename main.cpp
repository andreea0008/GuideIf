#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "message.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Message message;

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    context->setContextProperty("MESSAGE", &message);
    return app.exec();
}
