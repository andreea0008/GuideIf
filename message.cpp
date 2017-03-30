#include "message.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QDebug>

Message::Message(QObject *parent) :
    QObject(parent)
{
}

void Message::getMessage(QString message)
{
    QUrl url("http://smartgame.pro/message.php?message=" + message);
    QNetworkRequest request(url);

    QNetworkAccessManager* manager = new QNetworkAccessManager(this);
    QNetworkReply* reply=  manager->get(request);

    connect( reply, SIGNAL(finished()),
                this, SLOT(replyFinished())
              );
}

void Message::replyFinished()
{
  QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
  if (reply->error() == QNetworkReply::NoError)
  {
        stateMessage("MESSAGE SENT  /   ПОВІДОМЛЕННЯ ВІДПРАВЛЕНО");
  }
  else
  {
     stateMessage("ERROR SEND MESSAGE   /   ПОМИЛКА НАДСИЛАННЯ");
  }

  reply->deleteLater();
}


