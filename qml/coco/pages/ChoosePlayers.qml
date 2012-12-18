import QtQuick 1.1
import com.nokia.meego 1.0
import "../delegates"
import "../js/core.js" as Core

Page {
    id: choosePlayers

    TitleHeader {
        id: header
        text: "Choose players"
    }

    ListView {
        id: view
        width: parent.width
        height: parent.height

        model: ListModel {
            id: itemModel
        }
        delegate: PlayerDelegate {
            id: itemDelegate
        }
    }

    NewPlayerDialog {
        id: newPlayerDialog

        onAccepted: {
            var name = newPlayerDialog.name
            var imagepath = newPlayerDialog.imagepath
            if(name !== "" && imagepath !== "") {
                Core.addPlayer(name, imagepath);
            }

            updateUi();
        }
    }

    tools: ToolBarLayout {
        ToolIcon {
            iconId: "toolbar-back"
            onClicked: pageStack.pop();
        }

        ToolIcon {
            iconId: "toolbar-add"
            onClicked: newPlayerDialog.open();
        }

        ToolIcon {
            iconId: "toolbar-done"
            onClicked: pageStack.push(Qt.resolvedUrl("PlayingGame.qml"));
        }
    }

    onStatusChanged: {
        if(status === PageStatus.Activating) {
            updateUi();
        }
    }

    function updateUi() {
        var data = [];

        view.model = 0;
        itemModel.clear();

        data = Core.readPlayers();
        for (var i=0; i < data.length; i++) {
            itemModel.append(data[i]);
            itemModel.setProperty(i, "selected", false);
        }
        view.model = itemModel;
    }

}

