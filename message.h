#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

class Message : public QObject
{
    Q_OBJECT
public:
    explicit Message(QObject *parent = 0);

signals:
    void stateMessage(QString state);

public slots:
    Q_INVOKABLE void getMessage(QString message);
    void replyFinished();

};

#endif // MESSAGE_H
