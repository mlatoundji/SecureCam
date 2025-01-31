import QtQuick
import QtQuick.Controls

Item {
    id: homePage
    anchors.fill: parent

    // Drawer latéral
     Drawer {
         id: drawer
         // Tiroir qui s’ouvre depuis la gauche
         edge: Qt.LeftEdge
         width: parent.width * 0.3
         height : parent.height

         // Contenu du Drawer : ListView avec un modèle
         contentItem: ListView {
             anchors.fill: parent
             // On définit un modèle statique pour l’exemple
             model: ListModel {
                 ListElement {
                     text: "Dashboard"
                     pageSource: "DashboardPage.qml" // Le fichier à charger
                 }
                 ListElement {
                     text: "Devices"
                     pageSource: "DevicesPage.qml"
                 }
                 ListElement {
                     text: "Settings"
                     pageSource: "SettingsPage.qml"
                 }
             }

             delegate: ItemDelegate {
                 text: model.text
                 onClicked: {
                     // Fermer le Drawer
                     drawer.close()
                     // Charger la nouvelle page dans le Loader
                     // On suppose qu'on peut accéder à mainLoader via id:
                     mainLoader.source = model.pageSource
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
        anchors.margins: 20
        onClicked: {
            console.log("Drawer opening...")
            drawer.open()
        }
    }

    // Loader qui affichera la page courante
    Loader {
        id: mainLoader
        anchors.top: menuButton.bottom
        anchors.left: menuButton.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        // On peut définir une page par défaut
        source: "DashboardPage.qml"
    }


}
