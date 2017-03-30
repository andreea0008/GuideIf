TEMPLATE = app

QT += qml quick widgets xmlpatterns xml websockets network

SOURCES += main.cpp \
    phonecalls.cpp \
    message.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    phonecalls.h \
    message.h

RC_FILE = app.rc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml
