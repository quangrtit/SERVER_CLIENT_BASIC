import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import user
Window {
    id: root
    width: 1000
    height: 1500 / 2
    //visibility: Qt.WindowFullScreen
    visible: true
    title: qsTr("ZALO CỦA QUẢNG")
    property var userphonePlayer: ""
    property var group_now: "" //  id group onclick
    MyUser {
        id: user
    }
    onClosing: {
        user.sendInfoLogoffToServer(userphonePlayer)
    }
    MouseArea {
        anchors.fill: parent
        onClicked: forceActiveFocus()
    }
    Loader {
        id: loader_screen
        anchors.fill: parent
        source: "qrc:/zalo/src/qml/screens/login.qml" //Don't remove this line (!importain)
        //source: "qrc:/zalo/src/qml/screens/mainScreen.qml"
    }
    Connections {
        target: loader_screen.item
        function onChangeScreen(source, username) {
            if(username !== "") userphonePlayer = username; // đặt sdt lấy từ db

            loader_screen.source = source
            // if (source) {
            //     //if(source == "qrc:/zalo/src/qml/screens/mainScreen.qml") user.sendInfoStartRoomChat(userphonePlayer)
            //     loader_screen.source = source
            // }
            // else 
            // {
            //     //loader_screen.source = "";
            //     loader_screen.source = "qrc:/zalo/src/qml/screens/login.qml"
            // }
        }
    }
}
// build program: powershell -ExecutionPolicy Bypass -File .\buildApp.ps1