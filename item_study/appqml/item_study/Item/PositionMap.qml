import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

import "RandomText.js" as RandomText

PrivateBasic{

    id : idRoot
    ColumnLayout{

        anchors.fill: parent ;
        Label {
            Layout.fillWidth: true
            id : idTheItemPos
            text: "Yellow : " + idYellow.x + " , " + idYellow.y ;
        }

        Label {
            Layout.fillWidth: true
            id : idThatItemPos
            function updateText(){
                var varPos = idYellow.mapToItem( idBlue , 0 , 0 )
                text = "Yellow in Blue : " + varPos.x + " , " + varPos.y ;
            }
            Component.onCompleted: {
                idThatItemPos.updateText()
            }
            Connections{
                target: idBlue
                onXChanged:{
                    idThatItemPos.updateText()
                }
                onYChanged:{
                    idThatItemPos.updateText()
                }
            }
            Connections{
                target: idYellow
                onXChanged:{
                    idThatItemPos.updateText()
                }
                onYChanged:{
                    idThatItemPos.updateText()
                }
            }
        }

        Label {
            Layout.fillWidth: true
            id : idGlobalItemPos
            function updateText(){
                var varGlobalPos = idYellow.mapToGlobal( 0 , 0 )
                text = "Yellow Global : " + varGlobalPos.x + " , " + varGlobalPos.y ;
            }
            Component.onCompleted: {
                idGlobalItemPos.updateText()
            }
            Connections{
                target: idRoot
                onXChanged:{
                    idGlobalItemPos.updateText()
                }
                onYChanged:{
                    idGlobalItemPos.updateText()
                }
            }
            Connections{
                target: idYellow
                onXChanged:{
                    idGlobalItemPos.updateText()
                }
                onYChanged:{
                    idGlobalItemPos.updateText()
                }
            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }

    Rectangle{
        id : idYellow
        width: 32  ;
        height: 32 ;
        color: "yellow"
        anchors.centerIn: parent
        Text {
            anchors.centerIn: parent
            text: qsTr("黄")
        }
    }

    Rectangle{
        id : idBlue
        x : 111
        y : 112
        width: 32
        height: 32
        color: "lightblue"
        Text {
            anchors.centerIn: parent
            text: qsTr("蓝")
        }
    }

    MouseArea{
        anchors.fill: parent;
        drag.target: idBlue
        drag.axis: Drag.XAndYAxis
    }

}
