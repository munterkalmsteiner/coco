import QtQuick 1.1
import com.nokia.meego 1.0
import "pages"
import "js/core.js" as Core

PageStackWindow {
    id: appWindow

    property variant mainPage: MainPage{}
    property variant playersPage: PlayersPage{}

    ToolBarLayout {
        id: commonTools
    }

    Component.onCompleted: {
        theme.inverted = true;
        Core.openDB();
        pageStack.push(mainPage);
    }
}
