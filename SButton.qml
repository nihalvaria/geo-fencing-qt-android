import QtQuick 2.0

Item {
    id: button
        property string mode: "normal"
        property string source: ""
        property real inactiveRestOpacity: 1.0
        signal clicked()
        signal pressed()

        Image {
            id: image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: button.source + ".png"
        }

        MultiPointTouchArea {
            anchors.fill: parent
            mouseEnabled: true
            onPressed: {
                button.pressed()
                clickAnimation.start()
            }
        }

        SequentialAnimation {
            id: clickAnimation
            PropertyAnimation { target: image; property: "scale"; from: 1.0; to: 0.9; duration: 100 }
            PropertyAnimation { target: image; property: "scale"; from: 0.9; to: 1.0; duration: 100 }
            onStopped: button.clicked()
        }


}
