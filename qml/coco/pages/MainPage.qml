import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 200
        spacing: 20

        Button {
            id: newgame
            width: parent.width
            height: 40
            text: "New Game"
            onClicked: {
                pageStack.push(Qt.resolvedUrl("ChoosePlayers.qml"));
            }

        }

        Button {
            id: listgames
            width: parent.width
            height: 40
            text: "List games"
        }

        Button {
            id: statistics
            width: parent.width
            height: 40
            text: "Statistics"
        }
    }
}
