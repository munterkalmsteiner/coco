import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/UIConstants.js" as Ui

Item {
    width: parent.width; height: 200


    Rectangle {
        width: parent.width; height: parent.height
        color: selected === true ? Ui.COLOR_INVERTED_SELECT : Ui.COLOR_INVERTED_BACKGROUND

        MouseArea {
            anchors.fill: parent
            onClicked: {
                itemModel.setProperty(index, "selected", !selected);
            }
        }

        Row {
            spacing: 10

            Image {
                id: photo
                source: imagepath === "" ? "../images/no_photo.png": imagepath
                width: 200; height: 200
                fillMode: Image.PreserveAspectFit
                rotation: screen.currentOrientation === 1 ? 90 : 0
            }

            Text {
                id: nameTxt
                font.pointSize: Ui.FONT_LARGE
                color: Ui.COLOR_INVERTED_FOREGROUND
                anchors.verticalCenter: photo.verticalCenter
                text: name
            }
        }
    }
}
