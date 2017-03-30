import QtQuick 2.0
import QtQuick.Controls 1.2


Rectangle {
    width: parent.width
    height: parent.height





    ListModel {
        id: modelPage
        ListElement{
            title: "Ресторани"
            page: "qrc:/Category/Restoraunt.qml"
        }
        ListElement{
            title: "Бари"
            page: "qml/Rest.qml"
        }
        ListElement{
            title: "Салони краси"
            page: "qml/Rest.qml"
        }
        ListElement{
            title: "Сауни"
            page: "qml/Rest.qml"
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        focus: true
        initialItem: Item{
            width: parent.width
            height: parent.height
            ListView {
                model:  modelPage
                anchors.fill: parent
                delegate:
                    Item{
                    Loader {
                        id: squareLoader
                        onLoaded: console.log(squareLoader.item.width); // prints [10], not [30]
                    }

                    Component.onCompleted: {
                        squareLoader.setSource("qrc:/Delegate.qml", { "text": modelPage.parent. });
                        // will trigger the onLoaded code when complete.
                    }
                }
            }
        }
    }
}
