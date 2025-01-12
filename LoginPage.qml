import QtQuick
import QtQuick.Controls

Item {
    id: loginPage
    anchors.fill: parent

    // On suppose qu'on va manipuler rootItem de Main.qml en C++ ou via parent
    signal loginSuccessful()

    Column {
        anchors.centerIn: parent
        spacing: 20

        TextField {
            id: usernameField
            placeholderText: qsTr("Identifiant")
            width: 200
        }

        TextField {
            id: passwordField
            placeholderText: qsTr("Mot de passe")
            echoMode: TextInput.Password
            width: 200
        }

        Button {
            text: qsTr("Se connecter")
            onClicked: {
                // Exemple de validation simpliste
                if (usernameField.text === "admin" && passwordField.text === "1234") {
                    loginSuccessful() // Émet un signal
                } else {
                    // Afficher un message d'erreur
                    console.log("Identifiants incorrects")
                }
            }
        }

        Button {
            text: qsTr("Changer le mot de passe")
            onClicked: {
                changePasswordDialog.open()
            }
        }
    }

    // Dialogue pour changer le mot de passe
    Dialog {
        id: changePasswordDialog
        title: qsTr("Changer le mot de passe")
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        visible: false

        Column {
            spacing: 10
            TextField {
                id: oldPassword
                placeholderText: qsTr("Ancien mot de passe")
                echoMode: TextInput.Password
            }
            TextField {
                id: newPassword
                placeholderText: qsTr("Nouveau mot de passe")
                echoMode: TextInput.Password
            }
        }

        onAccepted: {
            // Faire un appel à la logique backend pour changer le mot de passe
            console.log("Mot de passe changé (simulation)")
        }
    }

    // Quand la connexion est validée, on signale au parent d'afficher la Home
    onLoginSuccessful: {
        // Méthode pour accéder au parent ou root
        // Selon votre structure, vous pouvez faire : parent.authenticated = true
        // ou root.authenticated = true
        if (root) {
            root.authenticated = true
        }
    }
}
