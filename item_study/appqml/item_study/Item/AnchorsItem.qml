import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

PrivateBasic{

    Item{
        anchors.fill: parent;

        Rectangle{
            id : idBlackRectangle
            color: "black"
            anchors.fill: parent;
        }

        Rectangle{
            width: idBlackRectangle.width * 0.3
            anchors.left: idBlackRectangle.left;
            anchors.top: idBlackRectangle.top
            anchors.bottom: idBlackRectangle.bottom
            anchors.margins: 6
            color: "yellow"
        }

        Rectangle{
            width: 64
            height: 64
            anchors.centerIn: idBlackRectangle
            color: "red"
        }

        Rectangle{
            id : idBlueRectangle
            width: idBlackRectangle.width * 0.3
            height: idBlackRectangle.height *0.5
            color: "lightblue"
            state:"anchorsTop"

            states: [
                State {
                    name: "anchorsTop"
                    AnchorChanges{
                        target: idBlueRectangle
                        anchors.top: idBlackRectangle.top
                        anchors.right: idBlackRectangle.right
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
                        anchors.bottom: idBlackRectangle.bottom
                        anchors.right: idBlackRectangle.right
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
















