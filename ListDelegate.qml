import QtQuick 2.0
import QtQuick.Window 2.0


Rectangle {
    id: box
    height: isLandscape ? (Screen.height / 5) : (Screen.height / 4)
    radius: 0
    border.width: 1
    width: parent.width

    property alias company: nameCompany.text
    property alias vodaphone: phoneVodaphone.text
    property alias kyivstar: phoneKyivstar.text
    property alias home: phoneHome.text
    property alias description: description.text
    property alias iconCom: iconCompany.source
    property int   fontPixelSize: isLandscape ? box.height/7 : box.height / 13
    property int   fontPixelSizePhone: fontPixelSize * 0.6
    property string colorText: "#3A3938"
    property string colorPhoneText: "blue"

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation


    Component.onCompleted: {
        console.log(height, width,fontPixelSize, fontPixelSizePhone)
    }

    FontLoader{
        id: forPhoneFont
        source: "qrc:/fonts/resource/fonts/7Seconds.ttf"
    }

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Item {
        id: item1
        anchors.left: parent.left
        anchors.right: isLandscape ? parent.horizontalCenter : parent.right
        anchors.top: parent.top
        anchors.bottom: isLandscape ? parent.bottom : parent.verticalCenter

        Item {
            id: itemNameCompany
            width: parent.width
            height: parent.height
            anchors.top:item1.top
            anchors.bottom: item1.verticalCenter
            anchors.right: item1.right
            anchors.left: item1.left
            anchors.topMargin: 2
            anchors.leftMargin: 10

            Image {
                id: iconCompany
                source: iconCom
                height: itemNameCompany.height
                width: itemNameCompany.height
                antialiasing: true
            }
            Item{
                id: itemTextNameCompany
                anchors.left: iconCompany.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors{
                    topMargin: 2
                    leftMargin: 5
                    rightMargin: 0
                    bottomMargin: 2
                }

                Text {
                    id: nameCompany
                    color: colorText
                    text: qsTr("nameCompany")
                    font.pointSize: fontPixelSize
                    font.family: forTextFont.name
                    font.bold: true
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    wrapMode: Text.Wrap

                    states: [
                        State {
                            name: "less15"
                            when: isLandscape === true &&  nameCompany.text.length < 19
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize
                            }
                        },
                        State {
                            name: "less18t"
                            when: isLandscape === false &&  nameCompany.text.length < 19
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize
                                clip:true
                                wrapMode: Text.NoWrap
                            }
                        },
                        State {
                            name: "less1830"
                            when: isLandscape === true &&  nameCompany.text.length >= 19 && nameCompany.text.length < 30
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize * 0.7
                                clip:true
                                wrapMode: Text.Wrap
                            }
                        },
                        State {
                            name: "less1830t"
                            when: isLandscape === false &&  nameCompany.text.length >= 19 && nameCompany.text.length < 30
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize * 0.6
                                clip:true
                                wrapMode: Text.Wrap
                            }
                        },
                        State {
                            name: "more30"
                            when: isLandscape === true &&  nameCompany.text.length >= 18 && nameCompany.text.length < 40
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize * 0.6
                                clip:true
                                wrapMode: Text.Wrap
                            }
                        },
                        State {
                            name: "more30t"
                            when: isLandscape === false &&  nameCompany.text.length >= 18 && nameCompany.text.length < 40
                            PropertyChanges {
                                target: nameCompany
                                font.pointSize: fontPixelSize * 0.5
                                clip:true
                                wrapMode: Text.Wrap
                            }
                        }
                    ]
                }
            }


        }

        Item {
            id: itemDescCompany
            width: parent.width
            height: parent.height
            anchors.top:item1.verticalCenter
            anchors.topMargin: 10
            anchors.bottom: item1.bottom
            anchors.right: item1.right
            anchors.left: item1.left
            anchors.leftMargin: 20
            anchors.bottomMargin: 10
            anchors.rightMargin: 20

            Row{
                spacing: 10
                anchors.fill: parent

                Image {
                    id: location
                    source: "qrc:/img/resource/img/LocationIcon.png"
                    height: itemDescCompany.height
                    width: itemDescCompany.height
                    antialiasing: true
                }

                Text {
                    id: description
                    color: colorText
                    width: parent.width  - location.width
                    text: qsTr("description")
                    font.family: forTextFont.name
                    font.pointSize: fontPixelSizePhone
                    font.weight: Font.DemiBold
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter

                    states: [
                        State {
                            name: "less12"
                            when: description.text.length <= 30
                            PropertyChanges {
                                target: description
                                font.pointSize: fontPixelSizePhone
                                clip:true
                            }
                        },
                        State {
                            name: "more12"
                            when: description.text.length > 30
                            PropertyChanges {
                                target: description
                                font.pointSize: fontPixelSizePhone*0.75
                                clip:true
                            }
                        }
                    ]
                }
            }


        }
    }

    Item {
        anchors.left:isLandscape ? parent.horizontalCenter : parent.left
        anchors.right: parent.right
        anchors.top: isLandscape ? parent.top : item1.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 15

        Item {
            id: vodaphoneItem
            height: parent.height/3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            visible: vodaphone.length > 0 ? true : false

            Row{
                spacing: 10

                Image {
                    id: imgVodaphone
                    source: "qrc:/img/resource/img/vodafone.png"
                    height: vodaphoneItem.height
                    width: vodaphoneItem.height
                    antialiasing: true
                }

                Text {
                    id: phoneVodaphone
                    height: vodaphoneItem.height / 2
                    text: qsTr("099 - 999 - 99 - 99")
                    font.pointSize:
                        areaVodaphone.pressed ?fontPixelSizePhone * 1.25
                                              : fontPixelSizePhone
                    font.bold: true
                    font.family: forPhoneFont.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: imgVodaphone.verticalCenter
                    color: areaVodaphone.pressed ? "red" : colorPhoneText

                    MouseArea {
                        id: areaVodaphone
                        anchors.fill: parent
                        onClicked: {
                            var phoneNumberFormat = "tel:%1"
                            var phoneNumber = phoneVodaphone.text.replace('/-/gi', '');
                            console.log(phoneNumberFormat.arg(phoneNumber))
                            Qt.openUrlExternally(phoneNumberFormat.arg(phoneNumber));
                        }
                    }
                }

            }

        }

        Item {
            id: kyivstarItem
            height: parent.height/3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            visible: kyivstar.length > 0 ? true : false

            Row{
                spacing: 10

                Image {
                    id: imgKyivstar
                    source: "qrc:/img/resource/img/kyivstar.png"
                    height: vodaphoneItem.height
                    width: vodaphoneItem.height
                    antialiasing: true
                }

                Text {
                    id: phoneKyivstar
                    text: qsTr("067 - 45 - 45 - 455")
                    font.pointSize: areaKyivstar.pressed ? fontPixelSizePhone * 1.25 : fontPixelSizePhone

                    font.bold: true
                    font.family: forPhoneFont.name
                    height: vodaphoneItem.height / 2
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: imgKyivstar.verticalCenter
                    color: areaKyivstar.pressed ? "red" : colorPhoneText
                    MouseArea {
                        id: areaKyivstar
                        anchors.fill: parent
                        onClicked: {
                            var phoneNumberFormat = "tel:%1"
                            var phoneNumber = phoneKyivstar.text.replace('/-/gi', '');
                            console.log(phoneNumberFormat.arg(phoneNumber))
                            Qt.openUrlExternally(phoneNumberFormat.arg(phoneNumber));
                        }
                    }
                }
            }


        }

        Item {
            id: homeItem
            height: parent.height/3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            visible: home.length > 0 ? true : false
            Row{
                spacing: 10

                Image {
                    id: imgKHome
                    source: "qrc:/img/resource/img/home.ico"
                    height: homeItem.height
                    width: homeItem.height
                    antialiasing: true
                }

                Text {
                    id: phoneHome
                    text: qsTr("067 - 45 - 45 - 455")
                    font.bold: true
                    font.family: forPhoneFont.name
                    font.pointSize: areaHome.pressed ? fontPixelSizePhone * 1.25 : fontPixelSizePhone
                    height: vodaphoneItem.height / 2
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: imgKHome.verticalCenter
                    color: areaHome.pressed ? "red" : colorPhoneText

                    MouseArea {
                        id: areaHome
                        anchors.fill: parent
                        onClicked: {
                            var phoneNumberFormat = "tel:%1"
                            var phoneNumber = phoneHome.text.replace('/-/gi', '');
                            console.log(phoneNumberFormat.arg(phoneNumber))
                            Qt.openUrlExternally(phoneNumberFormat.arg(phoneNumber));
                        }
                    }
                }
            }


        }
    }

}
