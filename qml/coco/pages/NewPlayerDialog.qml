import QtQuick 1.1
import com.nokia.meego 1.0
import "../delegates"
import "../js/UIConstants.js" as Ui
import "../js/core.js" as Core

QueryDialog {
    property alias name:nameField.text
    property alias imagepath:playerPhoto.imagepath

    id: root

    acceptButtonText: "Ok"
    rejectButtonText: "Cancel"

    titleText: "Add new player"

    content: Column {
        id: column
        spacing: 5
        anchors.left: parent.left; anchors.right: parent.right

        Text {
            id: imageLabel
            text: "Click to take a photo"
            font.pixelSize: Ui.FONT_LARGE
            color: Ui.COLOR_BACKGROUND
            anchors.margins: 5
        }

        GetPlayerPhoto {
            id: playerPhoto
            width: 400; height: 400;
            color: Ui.COLOR_INVERTED_BACKGROUND;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: nameLabel
            text: "Name"
            font.pixelSize: Ui.FONT_LARGE
            color: Ui.COLOR_BACKGROUND
            anchors.margins: 5
        }

        TextField {
            id: nameField
            font.pixelSize: Ui.FONT_DEFAULT
            placeholderText: "Enter player name..."
            anchors {
                right: parent.right; left: parent.left
                margins: 5
            }

            onActiveFocusChanged: {
                playerPhoto.enabled = !activeFocus
            }
        }
    }
}
