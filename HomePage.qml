import QtQuick
import QtQuick.Controls

Item {
    id: homePage
    anchors.fill: parent

    // Menu latéral (Drawer)
    Drawer {
        id: drawer
        edge: Qt.LeftEdge
        width: parent.width * 0.3
        // Style épuré
        contentItem: ListView {
            anchors.fill: parent
            model: ListModel {
                ListElement { text: "Dashboard" }
                ListElement { text: "Reports" }
                ListElement { text: "Settings" }
            }
            delegate: ItemDelegate {
                text: model.text
                onClicked: {
                    drawer.close()
                    // Gérer la navigation interne si besoin
                }
            }
        }
    }

    // Bouton ou icône pour ouvrir le drawer
    Button {
        id: menuButton
        text: qsTr("Menu")
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: drawer.open()
    }

    // Contenu principal (ex: un Label + un rectangle "design épuré")
    Column {
        id: mainContent
        anchors.left: menuButton.right
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        spacing: 20
        padding: 20

        Text {
            text: qsTr("Bienvenue dans l'application")
            font.pixelSize: 24
            color: "black"
        }

        Rectangle {
            width: parent.width * 0.8
            height: 200
            color: "lightgray"
            radius: 8
            Text {
                anchors.centerIn: parent
                text: qsTr("Contenu principal... (graphique, stats, etc.)")
                color: "#555"
            }
        }
    }
}
