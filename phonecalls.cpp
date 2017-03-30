#include "phonecalls.h"
#include <QDesktopServices>
#include <QDebug>
#include <QUrl>
PhoneCalls::PhoneCalls(QObject *parent) :
    QObject(parent)
{
}

void PhoneCalls::callToPhone(QString phoneNumber)
{
    qDebug() << "Phone: " << phoneNumber;
    QDesktopServices::openUrl(QUrl(QString("tel://%1").arg(phoneNumber)));
}
