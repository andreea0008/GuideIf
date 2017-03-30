import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.0

Rectangle {
    id: mainBox

    property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation


    width: isPortrait ? parent.width : parent.height
    height: isPortrait ? parent.height : parent.width

    XmlListModel{
        id: xmlModel
            source: "qrc:/xml/resource/xml/route_as1.xml"
            query: "/rss/between/rogatyn/item"

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
