import QtQuick 1.1
import com.nokia.meego 1.0
import "../delegates"

Page {
    id: playingGame

    ListView {
        id: view2
        width: parent.width
        height: parent.height

        model: ListModel {
            id: itemModel2

            ListElement {
                name: "a"
            }

            ListElement {
                name: "b"
            }

            ListElement {
                name: "b"
            }

            ListElement {
                name: "b"
            }

            ListElement {
                name: "b"
            }
        }
        delegate: ScoreDelegate {
            id: itemDelegate2
        }
    }
}
