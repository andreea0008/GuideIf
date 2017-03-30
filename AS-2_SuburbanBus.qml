import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0

Rectangle {
    id: mainBox

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation


    width: parent.width
    height: parent.height

    XmlListModel{
        id: xmlModel
            source: "qrc:/xml/resource/xml/route_as2.xml"
            query: "/rss/channel/item"

            XmlRole { name: "time"; query: "time/string()" }
            XmlRole { name: "route"; query: "route/string()" }
    }

    ListView {
        width: mainBox.width;
        height: mainBox.height
        model: xmlModel
        focus: true
        delegate: StantionDelegate{
            timeText: time;
            routeText: route;
            heightValue: isLandscape ? Screen.height / 15 : Screen.height / 20;
            fontPixelSize:heightValue * 0.5 ;
        }
    }
}
