import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// ApplicationWindow {
//     id: window
//     visible: true
//     width: 1000
//     height: 600
//     title: qsTr("Périphériques")

Item {

    /*
      On imagine un modèle "devicesModel" qui stocke les infos pour chaque périphérique.
      Pour un vrai projet, vous pourriez gérer ce modèle en C++ ou via un ListModel dynamique.
    */
    ListModel {
        id: devicesModel
        ListElement {
            username: "pi"
            hostname: "raspberry1"
            ip: "192.168.1.10"
            deviceType: "Raspberry Pi"
            status: "Connecté"
        }
        ListElement {
            username: "john"
            hostname: "my-server"
            ip: "192.168.1.50"
            deviceType: "Raspberry Pi"
            status: "En cours..."
        }
        ListElement {
            username: "tom"
            hostname: "ext-server"
            ip: "192.168.1.70"
            deviceType: "Raspberry Pi"
            status: "Déconnecté"
        }
        // Ajoutez d'autres éléments si besoin
    }

    // Bouton Ajouter un périphérique (en haut à droite)
    Button {
        id: addDeviceButton
        text: qsTr("+ Ajouter un périphérique")
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
        onClicked: {
            addDeviceDialog.open()
        }
    }

    // Liste verticale de blocs
    ScrollView {
        id: deviceListView
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 20
        }
        anchors.topMargin: 70 // Pour ne pas masquer le bouton
        clip: true

        ListView {
            id: listView
            width: parent.width
            height: parent.height
            spacing: 10
            model: devicesModel
            delegate: DeviceDelegate {
                // On envoie les propriétés du modèle à notre delegate
                username: model.username
                hostname: model.hostname
                ip: model.ip
                deviceType: model.deviceType
                status: model.status
                onConnectRequest: {
                    // Ici, on déclenche la logique de connexion (WebSocket ?)
                    // Par exemple, on appelle une fonction checkFaceAuthorization()
                    // et on vérifie deviceType == "Raspberry Pi".
                    console.log("Tentative de connexion à", hostname, "avec l'utilisateur", username)
                }
                onDisconnectRequest: {
                    console.log("Déconnexion de", hostname)
                }
                onRemoveRequest: {
                    // On supprime l'élément du modèle
                    devicesModel.remove(index)
                }
            }
        }
    }

    // Dialog pour l'ajout d'un périphérique
    Dialog {
        id: addDeviceDialog
        title: qsTr("Ajouter un périphérique")
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        visible: false

        Column {
            spacing: 10
            padding: 20

            TextField {
                id: newUsername
                placeholderText: qsTr("Nom d'utilisateur (username)")
            }

            TextField {
                id: newHostname
                placeholderText: qsTr("Nom d'hôte (hostname)")
            }

            TextField {
                id: newIp
                placeholderText: qsTr("Adresse IP")
            }

            ComboBox {
                id: newDeviceType
                model: [ "Raspberry Pi", "Autre (à venir)" ]
                currentIndex: 0
            }
        }

        onAccepted: {
            // Ajout dans le modèle
            devicesModel.append({
                "username": newUsername.text,
                "hostname": newHostname.text,
                "ip": newIp.text,
                "deviceType": newDeviceType.currentText,
                "status": "En cours..."
            })
            // Reset
            newUsername.text = ""
            newHostname.text = ""
            newIp.text = ""
            newDeviceType.currentIndex = 0
        }
    }


}
