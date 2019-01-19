import QtQuick 2.3

Item{
    id: root
    width: container.childrenRect.width
    height: container.childrenRect.height
    property alias text: label.text
    property alias source: image.source
    signal clicked

    Column{
        id: container
        Image{
            id:image
        }
        Text{
            id: label
            width: image.width
            horizontalAlignment: Text.AlignHCenter
//            wrapMode: Text.WordWrap
            color: "black"
            elide: Text.ElideMiddle
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked();
    }
}
