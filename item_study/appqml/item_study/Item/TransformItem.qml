import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

PrivateBasic{

    Item{
        anchors.fill: parent;

        Rectangle{
            id : idGraykRectangle
            antialiasing : true;
            gradient: Gradient {
                GradientStop {
                    position: 0.0;
                    color: "blue"
                }
                GradientStop {
                    position: 1.0;
                    color: "darkMagenta"
                }
            }

            transform: Rotation{
                id : idRotation
                origin.x: idGraykRectangle.width*0.5 ;
                origin.y: idGraykRectangle.height*0.5;
                angle: 0;
                axis{ x : 0 ; y:1; z:0 }
            }

            states: State {
                name: "Rotation"
                PropertyChanges {
                    target: idRotation
                    angle : 135
                }
            }

            transitions: Transition {
                  NumberAnimation {
                      target: idRotation;
                      property: "angle";
                      duration: 1000
                  }
            }

            anchors.centerIn: parent ;
            width: 128
            height: 128
        }

        Timer{
            interval: 1500;
            running: true;
            repeat: true
            onTriggered: {
               if( idGraykRectangle.state === "Rotation" ){
                   idGraykRectangle.state = "";
               }else{
                   idGraykRectangle.state = "Rotation";
               }
            }
        }
    }
}

















