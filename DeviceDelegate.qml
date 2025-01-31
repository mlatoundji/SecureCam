import QtQuick
import QtQuick.Controls

Item {
    id: root
    property alias username: usernameText.text
    property alias hostname: hostnameText.text
    property alias ip: ipText.text
    property alias deviceType: typeText.text
    property alias status: statusText.text

    // Signaux pour les actions
    signal connectRequest()
    signal disconnectRequest()
    signal removeRequest()

    onConnectRequest: {
        if (deviceType === "Raspberry Pi" /*&& faceIsAuthorized()*/) {
            // MàJ du status
            devicesModel.set(index, { "status": "Connecté" })
        } else {
            devicesModel.set(index, { "status": "Refusé" })
        }
    }

    onDisconnectRequest: {
            devicesModel.set(index, { "status": "Déconnecté" })
    }

    width: parent ? parent.width : 600
    height: 100

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        radius: 8
        color: "#f0f0f0"
    }

    Row {
        // anchors.fill: parent
        // anchors.margins: 10
        spacing: 20

        Column {
            spacing: 5
            Text {
                id: usernameText
                text: "username"
                font.bold: true
            }
            Text {
                id: hostnameText
                text: "hostname"
            }
        }

        Column {
            spacing: 5
            Text {
                id: ipText
                text: "192.168.1.10"
            }
            Text {
                id: typeText
                text: "Raspberry Pi"
            }
        }

        Text {
            id: statusText
            text: "Connecté"
            color: statusText.text === "Connecté" ? "green" : "orange"
            font.bold: true
            // anchors.verticalCenter: parent.verticalCenter
        }

        // Menu d'options (connecter/déconnecter, supprimer)
        MenuButton  {
            text: qsTr("Options")
            // anchors.right: parent.right
            // anchors.verticalCenter: parent.verticalCenter

            menuObject: Menu {
                id: optionsMenu
                MenuItem {
                    text: (statusText.text === "Connecté") ? qsTr("Se déconnecter") : qsTr("Se connecter")
                    onTriggered: {
                        if (statusText.text === "Connecté") {
                            root.disconnectRequest()
                        } else {
                            root.connectRequest()
                        }
                    }
                }
                MenuItem {
                    text: qsTr("Supprimer ce périphérique")
                    onTriggered: root.removeRequest()
                }
            }
        }
    }
}


