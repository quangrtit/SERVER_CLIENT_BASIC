import QtQuick 
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "transparent"
    signal changeScreen(string source, string username)

    // Image {
    //     anchors.fill: parent
    //     source: "qrc:/zalo/images/background-login.jpg"
    //     fillMode: Image.Stretch
    // }
    ColumnLayout {
        width: parent.width*0.5
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        
        Rectangle{
            id: dateTime
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
            Column {
                width: parent.width
                height: childrenRect.height
                anchors.centerIn: parent
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Welcome !"
                    font.pixelSize: 35
                    font.bold: true
                    color: "black"
                }
                Text {
                    id: textTime
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 35
                    font.weight: Font.DemiBold
                    color: "black"
                    textFormat: Text.RichText
                    function set() {
                        textTime.text = "<span>"+Qt.formatDateTime(new Date(), 'hh:mm')+"</span>"+"<span style='font-size: 20px;'>"+Qt.formatDateTime(new Date(), ':ss')+"</span>"
                    }
                }
                Timer {
                    id: timeTimer
                    interval: 1000
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    onTriggered: textTime.set()
                }
                Text {
                    id: dateTextTime
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12                    
                    textFormat: Text.RichText
                    color: "black"
                    function set() {
                        dateTextTime.text = Qt.formatDateTime(new Date(), 'ddd, dd-MM-yyyy')
                    }
                }
                Timer {
                    id: dateTimer
                    interval: 1000
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    onTriggered: dateTextTime.set()
                }
            }
                         
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
            ColumnLayout {
                width: parent.width*0.6
                height: parent.height
                anchors.centerIn: parent
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    Layout.preferredHeight: 40
                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1
                        text: "Tên tài khoản: "
                        font.pixelSize: 18
                        color: "black"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 15
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 2
                        color: "transparent"
                        border {
                            width: 1
                            color: "black"
                        }
                        radius: 10
                        RowLayout {
                            anchors.fill: parent
                            Image {
                                Layout.fillHeight: true
                                Layout.fillWidth: false
                                Layout.preferredWidth: parent.height
                                source: "qrc:/zalo/images/user-icon.png"
                                fillMode: Image.PreserveAspectFit
                                scale: 0.6
                            }
                            TextField {
                                id: user_name_input
                                focusReason : Qt.MouseFocusReason
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                placeholderText: "Nhập tên tài khoản"
                                placeholderTextColor: "black"                                
                                font.pixelSize: 15
                                color: "black"
                                
                                background: Rectangle {
                                    anchors.fill: parent
                                    color: "transparent"
                                }
                                onFocusChanged: {
                                    if (this.focus) {
                                        this.placeholderText = ""
                                    } else if (this.text === "") {
                                        this.placeholderText = "Nhập tên tài khoản"
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                }
                RowLayout {                    
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    Layout.preferredHeight: 40
                    Text {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1
                        text: "Mật khẩu: "
                        font.pixelSize: 18
                        color: "black"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 15
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 2
                        color: "transparent"
                        border {
                            width: 1
                            color: "black"
                        }
                        radius: 10
                        RowLayout {
                            anchors.fill: parent
                            Item {
                                Layout.fillHeight: true
                                Layout.fillWidth: false
                                Layout.preferredWidth: parent.height
                                // source: "qrc:/advanced/images/search.png"
                                // fillMode: Image.PreserveAspectFit        
                            }
                            TextField {
                                id: passwordText
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                placeholderText: "Nhập mật khẩu"
                                placeholderTextColor: "black"                                
                                font.pixelSize: 15
                                color: "black"
                                echoMode: TextInput.Password
                                background: Rectangle {
                                    anchors.fill: parent
                                    color: "transparent"
                                }
                                onFocusChanged: {
                                    if (this.focus) {
                                        this.placeholderText = ""
                                    } else if (this.text === "") {
                                        this.placeholderText = "Nhập mật khẩu"
                                    }
                                }
                                Keys.onReturnPressed: {
                                    login_btn.clicked();
                                }
                            }
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 2
                        color: "transparent"
                        CheckBox {
                            text: "Hiển thị mật khẩu"
                            checked: false
                            indicator.width: 15
                            indicator.height: 15
                            Component.onCompleted: {
                                indicator.children[0].width = 15;
                                indicator.children[0].height = 15;
                                contentItem.color =  "black"
                            }
                            onClicked: {
                                if(checked) {
                                    passwordText.echoMode = TextInput.Normal
                                } else {
                                    passwordText.echoMode = TextInput.Password
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onPressed: (mouse) => mouse.accepted = false
                                onEntered: {
                                    this.cursorShape = Qt.PointingHandCursor
                                }
                            }
                        }
                        Text{
                            id: loginNotification
                            text: "Tên hoặc mật khẩu không chính xác"
                            color: "red"
                            visible: false
                            font.pointSize: 10
                            font.italic: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    Layout.preferredHeight: 120
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 2
                        color: "transparent"
                        Row {
                            anchors.fill: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20
                            Button {
                                id: login_btn
                                width: 100
                                height: 40
                                //anchors.horizontalCenter: parent.horizontalCenter
                                background: Rectangle {
                                    anchors.fill: parent
                                    color: "#4942CE"
                                    radius: 8
                                }

                                contentItem: Text {
                                    text: "Đăng nhập"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "black"
                                }
                                Connections {
                                    target: user
                                    function onDataReceived(data)
                                    {
                                        var jsonData = JSON.parse(data)
                                        var type = jsonData.type
                                        if(type === "login")
                                        {
                                            if(jsonData.result == "accept")
                                            {
                                                loginNotification.visible = false
                                                // cần kiểm tra tên user => set trạng thái
                                                changeScreen("qrc:/zalo/src/qml/screens/mainScreen.qml", user_name_input.text);
                                            }
                                            else 
                                            {
                                                loginNotification.visible = true
                                                // //
                                                // loginNotification.visible = false
                                                // // cần kiểm tra tên user => set trạng thái
                                                // changeScreen("qrc:/zalo/src/qml/mainScreen.qml", user_name_input.text);
                                                // // 
                                            }
                                        }
                                    }
                                }
                                onClicked: {
                                    user.sendInfoLoginToServer(user_name_input.text,passwordText.text)
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onPressed: (mouse) => mouse.accepted = false
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                    }
                                }
                            }
                            Button {
                                id: register_btn
                                width: 100
                                height: 40
                                //anchors.horizontalCenter: parent.horizontalCenter
                                background: Rectangle {
                                    anchors.fill: parent
                                    color: "#4942CE"
                                    radius: 8
                                }
                                contentItem: Text {
                                    text: "Đăng ký"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "black"
                                }
                                Connections {
                                    target: user
                                    function onDataReceived(data)
                                    {
                                        var jsonData = JSON.parse(data)
                                        var type = jsonData.type
                                        
                                    }
                                }
                                onClicked: {
                                    // user.sendInfoLoginToServer(user_name_input.text,passwordText.text)
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onPressed: (mouse) => mouse.accepted = false
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                    }
                                }
                            }
                        }

                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                    }
                }
            }
            // RowLayout {
            //     anchors.horizontalCenter: parent.horizontalCenter
            //     y: parent.height * 2 / 3 + 10
            //     Layout.preferredHeight: 120
            //     Item {
            //         Layout.fillWidth: true
            //         Layout.preferredWidth: 1
            //         Layout.fillHeight: true
            //     }
            //     Rectangle {
            //         Layout.fillWidth: true
            //         Layout.fillHeight: true
            //         Layout.preferredWidth: 2
            //         color: "transparent"
            //         Button {
            //             id: register_btn
            //             width: 120
            //             height: 40
            //             anchors.horizontalCenter: parent.horizontalCenter
            //             background: Rectangle {
            //                 anchors.fill: parent
            //                 color: "#4942CE"
            //                 radius: 8
            //             }

            //             contentItem: Text {
            //                 text: "Đăng ký"
            //                 horizontalAlignment: Text.AlignHCenter
            //                 verticalAlignment: Text.AlignVCenter
            //                 font.pixelSize: 18
            //                 font.bold: true
            //                 color: "black"
            //             }
            //             Connections {
            //                 target: user
            //                 function onDataReceived(data)
            //                 {
            //                     var jsonData = JSON.parse(data)
            //                     var type = jsonData.type
            //                 }
            //             }
            //             onClicked: {
                            
            //             }
            //             MouseArea{
            //                 anchors.fill: parent
            //                 hoverEnabled: true
            //                 onPressed: (mouse) => mouse.accepted = false
            //                 onEntered: {
            //                     this.cursorShape = Qt.PointingHandCursor
            //                 }
            //             }
            //         }

            //     }
            //     Item {
            //         Layout.fillWidth: true
            //         Layout.preferredWidth: 1
            //         Layout.fillHeight: true
            //     }
            // }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"            
        }
    }    
}