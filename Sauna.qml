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
            source: "qrc:/xml/resource/xml/sauna.xml"
            query: "/rss/channel/item"

            XmlRole { name: "sauna"; query: "sauna/string()" }
            XmlRole { name: "address"; query: "address/string()" }
            XmlRole { name: "phoneVodaphone"; query: "phoneVodaphone/string()" }
            XmlRole { name: "phoneKyivstar"; query: "phoneKyivstar/string()" }
            XmlRole { name: "phoneHome"; query: "phoneHome/string()" }
            XmlRole { name: "icon"; query: "icon/string()" }

    }

    ListView {
        width: mainBox.width;
        height: mainBox.height
        model: xmlModel
        focus: true

        delegate: ListDelegate{
            company: sauna;
            vodaphone: phoneVodaphone
            kyivstar: phoneKyivstar
            home: phoneHome
            description: address
            iconCom: icon
        }
    }
}
