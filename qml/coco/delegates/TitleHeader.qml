import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/UIConstants.js" as Ui

Rectangle {
    id: root

    property alias text: item.text

    height: 60
    border.width: 2
    color: "lightgrey"

    anchors { left: parent.left; right: parent.right; top:  parent.top }

    Label {
        id: item
        anchors.centerIn: parent
        font.bold: true
        horizontalAlignment: Text.AlignHCenter

    }
}
