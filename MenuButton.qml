// MenuButton.qml
import QtQuick
import QtQuick.Controls

Button {
    id: root
    property var menuObject: null

    onClicked: {
        if (menuObject) {
            menuObject.popup()
        }
    }
}
