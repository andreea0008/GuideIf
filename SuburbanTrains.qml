import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0

Item {
    width: parent.width
    height: parent.height

    property bool isLandscape: Screen.primaryOrientation === Qt.LandscapeOrientation

    FontLoader{
        id: forTextFont
        source: "qrc:/fonts/resource/fonts/GOST_2.30481_type_B_Bold.ttf"
    }

    TabView {
        anchors.fill: parent
        style: touchStyle
        z: 20


        Tab {
            title: "Прибуття"
            SuburbanTrainsArrived{visible: true}
        }
        Tab {
            title: "Відправлення"
            SuburbanTrainsDeparture{visible: true}
        }
    }

    Component {
        id: touchStyle
        TabViewStyle {
            tabsAlignment: Qt.AlignVCenter
            tabOverlap: 0
            frame: Item { }
            tab: Item {
                implicitWidth: control.width/control.count
                implicitHeight: 75
                Rectangle {
                    anchors.fill: parent
                    color: styleData.selected ? "white" : "lightgray";
                    border.color: styleData.selected ? "red" : "lightgray";
                    border.width: styleData.selected ? 1 : 0;
                    height: isLandscape ? parent.height* 0.1 : parent.height * 0.1
//                    source: styleData.selected ? "../images/tab_selected.png":"../images/tabs_standard.png"
                    Text {
                        anchors.centerIn: parent
                        color: styleData.selected ? "#a1a1a1a" : "white"
                        text: styleData.title.toUpperCase()
                        font.pixelSize: parent.height / 2
                        font.family: forTextFont.name
                    }
                    Rectangle {
                        visible: index > 0
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: 10
                        width:1
                        color: "#3a3a3a"
                    }
                }
            }
        }
    }
}
