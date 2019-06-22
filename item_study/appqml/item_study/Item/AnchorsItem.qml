import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

PrivateBasic{

    Item{
        anchors.fill: parent;

        Rectangle{
            id : idGraykRectangle
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightgray" }
                GradientStop { position: 1.0; color: "darkgray" }
            }
            anchors.fill: parent;
        }

        Rectangle{
            width: idGraykRectangle.width * 0.3
            anchors.left: idGraykRectangle.left;
            anchors.top: idGraykRectangle.top
            anchors.bottom: idGraykRectangle.bottom
            anchors.margins: 6
            color: "yellow"
        }

        Rectangle{
            width: 64
            height: 64
            anchors.centerIn: idGraykRectangle
            color: "red"
        }

        Rectangle{
            id : idBlueRectangle
            width: idGraykRectangle.width * 0.3
            height: idGraykRectangle.height *0.5
            border.color: "black"
            border.width: 3
            color: "lightblue"
            state:"anchorsTop"

            states: [
                State {
                    name: "anchorsTop"
                    AnchorChanges{
                        target: idBlueRectangle
                        anchors.top: idGraykRectangle.top
                        anchors.right: idGraykRectangle.right
                    }
                    PropertyChanges {
                        target: idBlueRectangle
                        anchors.rightMargin: 10
                    }
                },
                State{
                    name: "anchorsBottom"
                    AnchorChanges{
                        target: idBlueRectangle
                        anchors.bottom: idGraykRectangle.bottom
                        anchors.right: idGraykRectangle.right
                    }
                    PropertyChanges {
                        target: idBlueRectangle
                        anchors.rightMargin: 36
                    }
                }
            ]

            transitions: Transition {
                 AnchorAnimation { duration: 1000 }
            }

            Timer{
                interval: 1500;
                running: true;
                repeat: true
                onTriggered: {
                    if( idBlueRectangle.state === "anchorsBottom" ){
                        idBlueRectangle.state = "anchorsTop";
                    }else{
                        idBlueRectangle.state = "anchorsBottom";
                    }
                }
            }
        }
    }
}
