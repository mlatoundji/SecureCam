import QtQuick

Item {

    // Contenu principal (ex: un Label + un rectangle "design épuré")
    Column {
        id: mainContent
        //anchors.fill: parent
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
