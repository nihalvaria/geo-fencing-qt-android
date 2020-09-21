#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGeoRoute>
#include <QGeoCoordinate>
#include <QGeoPositionInfoSource>
#include <QtDebug>
#include <QSslSocket>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // Emit updates every 1 seconds if available
//    qDebug() << "CHECKING OPEN SSL : " << QSslSocket::sslLibraryBuildVersionString();
//    QGeoPositionInfoSource *source = QGeoPositionInfoSource::createDefaultSource(0);
//    if (source)
//        qDebug() << "source" << source;
//        source->setUpdateInterval(10000);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
