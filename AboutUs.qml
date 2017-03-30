import QtQuick 2.0
import Qt.WebSockets 1.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0


Rectangle {
    width: parent.width
    height: parent.height

    property bool  isLandscape: Screen.orientation === Qt.LandscapeOrientation

    Connections{
        target: MESSAGE
        onStateMessage: {
            textAreaMessage.text = state;
        }
    }

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Text{
        id: textVersion
        anchors{
            top: parent.top
            left: parent.left
            margins: isLandscape ? 5 : (parent.width * 0.05)
        }
        width: parent.width
        height: parent.height * 0.1
        text: "Product name: GuideIf\nVersion: 1.0\n"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: textAreaMessage.font.pixelSize
    }

    Text{
        id: contactIdTxt
        anchors{
            top: textVersion.bottom
            left: parent.left
            margins: 10
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width
        height: parent.height * 0.1
        text: "Контакти:"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: textAreaMessage.font.pixelSize
    }
    Rectangle{
        id: boxForFace

        anchors{
            top: contactIdTxt.bottom
            left: parent.left
            margins: 5
            horizontalCenter: parent.horizontalCenter

        }
        width: parent.width
        height: isLandscape ? (parent.height * 0.15) : (parent.height * 0.2)

        Image {
            anchors{
                verticalCenter: boxForFace.verticalCenter
                left: boxForFace.horizontalCenter
                leftMargin: 10
            }
            id: facebookImg
            height: boxForFace.height * 0.9
            width: boxForFace.height * 0.9
            source: "qrc:/img/resource/img/fb.png"
            MouseArea{
                anchors.fill: parent
                onClicked: Qt.openUrlExternally("https://www.facebook.com/Smartgamepro-181848338965859/")
            }
        }
        Image {
            anchors{
                verticalCenter: boxForFace.verticalCenter
                right: boxForFace.horizontalCenter
                rightMargin: 10
            }
            id: facebookImg1
            height: boxForFace.height * 0.9
            width: boxForFace.height * 0.9
            source: "qrc:/img/resource/img/Web-icon.png"
            MouseArea{
                anchors.fill: parent
                onClicked: Qt.openUrlExternally("http://www.smartgame.pro/")
            }
        }
    }

    Rectangle {
        id: blochMessage
        anchors{
            top: boxForFace.bottom
            bottom: parent.bottom
            right: parent.right
            left: parent.left
            margins: 20
        }

        Text{
            id: txtMessageFace
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: facebookImg.height
            text: "Якщо у Вас є уточнення, знайшли помилку, пропозиції чи інше - просто надішліть нам повідомлення))"
            width: isLandscape ? blochMessage.height * 0.15 : blochMessage.width * 0.15
            font.pixelSize: textAreaMessage.font.pixelSize * 1.5
            wrapMode: Text.WordWrap
        }

        TextArea{
            id: textAreaMessage
            anchors{
                top: txtMessageFace.bottom
                right: parent.right
                left: parent.left
            }

            height: blochMessage.height * 0.5

            font{
                family: forTextFont.name
                bold: true
                pixelSize: isLandscape ? height * 0.1 : height *0.1
            }

            style: TextAreaStyle {
                backgroundColor : "lightgray"
            }
        }

        Button{
            id: send
            anchors{
                top: textAreaMessage.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 5
            }
            width: textAreaMessage.width * 0.25
            height: width * 0.4

            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width:  1
                        border.color: "gray"
                        radius: height * 0.1
                        color: control.pressed ? "lightblue" : "#288423"
                    }
                    label: Text {
                            renderType: Text.NativeRendering
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: forTextFont.name
                            font.pointSize: width / 15
                            color: "white"
                            text: "Відправити"
                          }
                }
            onClicked: {
                MESSAGE.getMessage(textAreaMessage.text)
                textAreaMessage.text = "";
            }
        }

    }


}
