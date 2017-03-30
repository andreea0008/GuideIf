import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0
import QtQuick.Window 2.0


Rectangle {
    id: mainBox

    property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation
    width: parent.width
    height: parent.height

    XmlListModel{
        id: xmlModel
            source: "qrc:/xml/resource/xml/departure-subtrain.xml"
            query: "/rss/channel/arrived/item"

            XmlRole { name: "train"; query: "train/string()" }
            XmlRole { name: "station"; query: "station/string()" }
            XmlRole { name: "time"; query: "time/string()" }
    }

    ListView {
        width: mainBox.width;
        height: mainBox.height
        model: xmlModel
        focus: true

        delegate: DelegateTrain{
            trainNumber: train
            trainTime: time
            routeName: station
        }
    }
}
