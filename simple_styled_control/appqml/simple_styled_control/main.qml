/* appqml/simple_styled_control/main.qml */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {

    width: 256 ;
    height: 32 ;
    visible: true ;

    property bool isDark: true
    property var appStyle : Material

    SimpleStyledItem{
        anchors.centerIn: parent
        width: parent.width*0.8
        height: parent.height*0.8
    }

    onIsDarkChanged: checkAndUpdateStyle();

    function checkAndUpdateStyle(){
        if( isDark ){
            appStyle.theme = appStyle.Dark;
        }else{
            appStyle.theme = appStyle.Light;
        }
    }

    Component.onCompleted: checkAndUpdateStyle();

    Timer{
        interval: 1500;
        running: true;
        repeat: true
        onTriggered : { isDark=!isDark ; }
    }

}

