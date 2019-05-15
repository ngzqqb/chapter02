/* appqml/text_path_view/main.qml */
import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import sstd.styled.app 1.0

/*begin:import*/
import theqml_the_debug.text_path_view_module 1.0
/*end:import*/

ApplicationWindow {

    width: 280 ;
    height: 130 ;

    TextPathView{
        x : 32
        y : 32
        width : 256
        height: 256
    }

    property bool isDark: GlobalAppData.isDark
    function updateTheme(){
        if( isDark ){
            Material.theme = Material.Dark ;
        }else{
            Material.theme = Material.Light ;
        }
    }
    onIsDarkChanged: {
        updateTheme();
    }
    Component.onCompleted: {
        updateTheme();
        visible = true ;
    }

    Timer{
        interval: 500;
        running: true;
        repeat: true
        onTriggered: GlobalAppData.isDark=!GlobalAppData.isDark
    }

}
/*endl_input_of_latex_for_clanguage_lick*/
/*begin:debug*/
/*end:debug*/
