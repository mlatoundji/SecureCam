# SecureCam – Système de Surveillance avec Interface Qt Quick

## Description
SecureCam est une application de bureau réalisée en **Qt Quick** permettant de contrôler un système de surveillance hébergé sur **Raspberry Pi**. L’interface offre des fonctionnalités d’authentification, de gestion des fichiers vidéos (enregistrements, images, logs) et de streaming en direct. Un script Python sur la Raspberry Pi gère la détection de mouvement et la reconnaissance faciale, puis notifie l’application des alertes en temps réel. Les événements sont consignés dans une base de données (SQLite, MariaDB ou autre), et l’opérateur peut ajouter des annotations pour un meilleur suivi.

## Fonctionnalités
- **Gestion des comptes** : Interface de login, changement de mot de passe, sessions sécurisées.
- **Navigation dans le stockage** : Télécharger / Visionner des enregistrements vidéo, consulter les logs.
- **Flux vidéo en temps réel** : Visualiser la caméra IP, PiCam ou Webcam USB.
- **Détection de mouvement et reconnaissance faciale** : Alertes instantanées, statut “autorisé” / “non autorisé”.
- **Prise de notes** : Association de commentaires aux alertes.
- **Base de données** : Historiser les utilisateurs, événements, notes.
- **Style épuré** : Pages Qt Quick “Login” et “Home” avec menu latéral.

## Installation
1. Cloner le dépôt.
2. Ouvrir le projet `SecureCam.pro` (ou le CMakeLists.txt si disponible) dans Qt Creator.
3. Compiler et exécuter.

## Utilisation
1. **Lancer** l’application sur PC (Windows/Linux).
2. **S’authentifier** (login/mot de passe).
3. Accéder aux fonctionnalités (visionnage caméra, fichiers, base de données, etc.).

## Auteurs et Licence
- Projet développé par [VotreNom] et la communauté.
- Licence : MIT / GPL / Autre (à préciser).
