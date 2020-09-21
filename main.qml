import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    property real ratio: 0.75
    width: 1920 * ratio
    height: 1080 * ratio
    title: "Multitaction++"

    visible: true

    Rectangle {
        id: main
        anchors.fill: parent
        color: "white"
        state: "home"

        function setState( newState ) {
            main.state = newState
        }

        Loader {
            id: pageLoader
            anchors.fill: parent
        }

        states: [
            State {
                name: "home"
                PropertyChanges { target: pageLoader; source: "Home.qml" }
            }
        ]
    }
}
