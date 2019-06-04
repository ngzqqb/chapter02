/* appqml/multimedia_wrap/main.qml */
import QtQuick 2.9
import QtQuick.Controls 2.5

/*begin:import*/
import theqml_the_debug.multimedia_wrap_module 1.0
/*end:import*/

ApplicationWindow {

    width: 800 ;
    height: 450 ;
    visible: true ;

    Video{
        anchors.fill: parent
        source: "source.avi"
        loops: MediaPlayer.Infinite
        Component.onCompleted: {
            play();
        }
    }

}
/*endl_input_of_latex_for_clanguage_lick*/
/*begin:debug*/
/*end:debug*/

//Window：DirectShowPlayerService
//DirectShowPlayerService::doRender: Unresolved error code 0x80040266 ()
//lavfilter
//https://github.com/Nevcairiel/LAVFilters/releases
//sudo apt-get install libgstreamer1.0-dev
//sudo apt-get install libpulse-dev
//sudo apt-get install gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav
//https://zhuanlan.zhihu.com/p/67795412
//QMediaPlayer依赖本地解码器，WIN上下载k-lite或者LAV Filters安装即可。

