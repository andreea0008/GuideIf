#ifndef PHONECALLS_H
#define PHONECALLS_H

#include <QObject>

class PhoneCalls : public QObject
{
    Q_OBJECT
public:
    explicit PhoneCalls(QObject *parent = 0);


signals:

public slots:
    Q_INVOKABLE void callToPhone(QString phoneNumber);

};

#endif // PHONECALLS_H
