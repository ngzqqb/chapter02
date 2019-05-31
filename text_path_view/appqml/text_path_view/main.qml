/* appqml/text_path_view/main.qml */
import QtQuick 2.9
import QtQuick.Controls 2.5

/*begin:import*/
import theqml_the_debug.sstd.styled.app 1.0
import theqml_the_debug.text_path_view_module 1.0
/*end:import*/

StyledApplicationWindow {

    width: 280 ;
    height: 130 ;

    TextPathView{
        x : 32
        y : 32
        width : 256
        height: 256
    }

    Timer{
        interval: 1500;
        running: true;
        repeat: true
        onTriggered: GlobalAppData.isDark=!GlobalAppData.isDark
    }

}
/*endl_input_of_latex_for_clanguage_lick*/
/*begin:debug*/
/*end:debug*/
