import QtQuick 2.3

//Rectangle{
//    width: 96; height: input.height + 8;
//    color: "lightsteelblue"
//    border.color: "gray"

//    property alias text: input.text
//    property alias input: input

//    TextInput{
//        id: input
//        width: 96; height: 20
//        anchors.fill: parent
//        anchors.margins: 4
//        focus: true
//    }
//}

FocusScope{
    width: 96; height: input.height + 8;

    Rectangle{
        anchors.fill: parent
        color: "lightsteelblue"
        border.color: "gray"
    }

    property alias text: input.text
    property alias input: input

    TextInput{
        id: input
        width: 96; height: 20
        anchors.fill: parent
        anchors.margins: 4
        focus: true
    }
}
