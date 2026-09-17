#include <QCommandLineParser>
#include <QGuiApplication>
#include <QImage>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QTimer>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QCommandLineParser parser;
    parser.addHelpOption();
    parser.addOptions({
        {"pack", "Style pack key.", "key", "minimalism"},
        {"route", "gallery or workbench.", "route", "workbench"},
        {"size", "Window size as WIDTHxHEIGHT.", "size", "1320x1600"},
        {"delay", "Milliseconds to settle before capture.", "ms", "1200"},
        {"out", "Output PNG path.", "file", "snapshot.png"},
    });
    parser.process(app);

    const QStringList size = parser.value("size").split('x');
    if (size.size() != 2) {
        qCritical("--size must look like 1320x1600");
        return 2;
    }

    QQmlApplicationEngine engine;
    engine.setInitialProperties({
        {"styleKey", parser.value("pack")},
        {"route", parser.value("route")},
        {"width", size.at(0).toInt()},
        {"height", size.at(1).toInt()},
    });
    engine.loadFromModule("UIverse.Snapshot", "SnapshotWindow");

    if (engine.rootObjects().isEmpty())
        return 1;

    auto *window = qobject_cast<QQuickWindow *>(engine.rootObjects().constFirst());
    if (!window)
        return 1;

    const QString out = parser.value("out");
    QTimer::singleShot(parser.value("delay").toInt(), &app, [window, out]() {
        const QImage image = window->grabWindow();
        QCoreApplication::exit(!image.isNull() && image.save(out) ? 0 : 3);
    });

    return app.exec();
}
