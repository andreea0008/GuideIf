import QtQuick 2.0

Rectangle {
    id: root
    border.color: "#888787"
    border.width: 1
    height: 50
    width: parent.width

    property alias text: categoryText.text
    property alias heightValue: root.height
    property alias fontPixelSize: categoryText.font.pixelSize
    signal clicked


    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    Rectangle {
        anchors.fill: parent
        color: "lightgray"
        opacity: 0.7
        visible: mouse.pressed
    }

    Text {
        id: categoryText
        color: "gray"
        font.pixelSize: 20
        font.family: forTextFont.name
        text: text
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.right: nextItemImg.left
        anchors.rightMargin: 10
        clip: true
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 15
        height: 1
        color: "white"
    }

    Image {
        id: nextItemImg
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: categoryText.height
        width: categoryText.height
        source: "qrc:/img/resource/img/navigation_next_item.png"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
