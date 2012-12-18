import QtQuick 1.1
import com.nokia.meego 1.0
import Qt 4.7
import QtMultimediaKit 1.1

Rectangle {
    property alias imagepath:camera.capturedImagePath
    property alias enabled:mousearea.enabled
    rotation: screen.currentOrientation === 1 ? 90 : 0

    Camera {
        id: camera

        width: parent.width; height: parent.height;
        anchors.centerIn: parent

        focus: visible
        flashMode: Camera.FlashRedEyeReduction
        whiteBalanceMode: Camera.WhiteBalanceFlash
        exposureCompensation: -1.0
        captureResolution: Qt.size( 640, 480 )

        onImageCaptured : {
            console.debug("Captured Image preview:" + preview);
            playerPhoto.source = preview;
        }

        onImageSaved: {
            console.debug("Captured Image:" + capturedImagePath);
        }

    }

    Image {
        id: playerPhoto
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: ""
    }

    MouseArea {
        id: mousearea
        property bool photo_made: false

        anchors.fill: parent
        onClicked: {
            if(!photo_made) {
                camera.captureImage();
                playerPhoto.opacity = 1;
                camera.opacity = 0;
                photo_made = true;
            }
            else {
                photo_made = false;
                camera.opacity = 1;
                playerPhoto.opacity = 0;
            }
        }
    }

}
