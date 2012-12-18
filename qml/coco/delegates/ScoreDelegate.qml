import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    width: parent.width; height: 100

    Image {
        id: image
        width: 100
        fillMode: Image.PreserveAspectFit
        source: "../images/no_photo.png"
    }

    Row  {
        anchors.left: image.right
        anchors.verticalCenter: image.verticalCenter

        Repeater  {
            model: 8

            Rectangle  {
                width: 40; height: 40
                border.width: 5
                border.color: "black"
                radius: 10
                color: "green"


            }
        }
    }
}
