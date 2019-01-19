import QtQuick 2.3

//Image{
////    id: root
////    property alias text: label.text
////    signal clicked

////    width: 116
////    height: 26
////    color: "grey"
////    border.color: "slategrey"

////    Text{
////        id: label
////        anchors.centerIn: parent
////        text: "Start"
////    }

////    MouseArea{
////        anchors.fill: parent
////        onClicked: root.clicked()
////    }

//    id: root
//    signal clicked

//    MouseArea{
//        anchors.fill: parent
//        onClicked: root.clicked();
//    }

//    smooth: true
//}

Rectangle{
    id: root
    width: 116; height: 26
    color: "lightsteelblue"
    border.color: "slategrey"

    property alias text: label.text
    signal clicked

    Text{
        id: label
        anchors.centerIn: parent
        text: "Start"
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.clicked();
        }
    }
}
