import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    x: 100
    y: 100
    width: 800
    height: 600

    Item {
        id: root
        width: 800
        height: 600

        property bool authenticated: false

        // Quand authenticated = false => on affiche la page de login
        // Quand authenticated = true  => on affiche la page d'accueil

        Loader {
            id: pageLoader
            anchors.fill: parent
            source: root.authenticated ? "HomePage.qml" : "LoginPage.qml"
        }
    }
}


