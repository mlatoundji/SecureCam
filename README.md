# SecureCam – Surveillance System with Qt Quick Interface

## Description
SecureCam is a desktop application made in **Qt Quick** to control a surveillance system hosted on **Raspberry Pi**. The interface offers authentication, video file management (recordings, images, logs) and live streaming features. A Python script on the Raspberry Pi handles motion detection and facial recognition, then notifies the application of alerts in real time. Events are logged in a database (SQLite, MariaDB or other), and the operator can add annotations for better tracking.

## Installation
1. Clone the repository.
2. Open the `SecureCam.pro` project (or the CMakeLists.txt if available) in Qt Creator.
3. Compile and run.
