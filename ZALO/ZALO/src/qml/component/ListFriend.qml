import QtQuick 
import QtQuick.Controls.Basic
import QtQuick.Layouts


MouseArea {
    id: root
    anchors.fill: parent
    // ListModel {
    //     id: listFriend
    //     // ListElement {
    //     //     name: "quang"
    //     //     ok: "0"
    //     // }
    // }
    // Component.onCompleted: {

    // }
    Rectangle { 
        anchors.fill: parent
        color: "lightgray"
        opacity: 0.8
        radius: 10
        Rectangle {
            width: parent.width / 3
            height: parent.height / 1.5
            anchors.centerIn: parent
            Rectangle {
                width: parent.width - 20
                height: parent.height - 10
                anchors.centerIn: parent
                Column{
                    anchors.fill: parent
                    spacing: 10
                    Rectangle {
                        id: rectTitleAddGroup
                        width: parent.width
                        height: parent.height / 15
                        Text {
                            text: "All friend"
                            font.pointSize: 10
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Rectangle {
                            id: rectCloseAddGroup
                            width: parent.height / 1.5
                            height: parent.height / 1.5
                            radius: 180
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            color: "white"
                            Image {
                                anchors.fill: parent
                                source: "qrc:/zalo/images/close.png"
                                fillMode: Image.PreserveAspectFit
                                scale: 0.6
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    this.cursorShape = Qt.PointingHandCursor
                                    rectCloseAddGroup.color = "lightgray"
                                }
                                onExited: {
                                    rectCloseAddGroup.color = "white"
                                }
                                onClicked: {
                                    loadListFriend.source = ""
                                }
                            }
                        }
                        Canvas{
                            anchors.fill: parent
                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.fillStyle = "transparent"
                                ctx.fillRect(0,0,this.width ,this.height )
                                ctx.lineWidth = 4;
                                ctx.strokeStyle = "lightgray"
                                ctx.beginPath()
                                ctx.moveTo(0, this.height)
                                ctx.lineTo(this.width, this.height)
                                ctx.stroke()
                            }
                        }
                    }
                    Rectangle {
                        id: rectAddGroupAddName
                        width: parent.width 
                        height: parent.height / 10
                        Text {
                            id: textStart
                            text: "Add New friend to group"
                            anchors.centerIn: parent                                
                            font.pixelSize: 15
                            color: "black"
                        }
                        Canvas{
                            anchors.fill: parent
                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.fillStyle = "transparent"
                                ctx.fillRect(0,0,this.width ,this.height )
                                ctx.lineWidth = 4;
                                ctx.strokeStyle = "lightblue"
                                ctx.beginPath()
                                ctx.moveTo(0, this.height)
                                ctx.lineTo(this.width, this.height)
                                ctx.stroke()
                            }
                        }
                    }
                    Rectangle {
                        id: rectAddGroupSearchName
                        width: parent.width
                        height: parent.height / 10
                        radius: 10
                        border {
                            width: 1
                            color: "black"
                        }
                        Row {
                            anchors.fill: parent
                            spacing: 10
                            Image {
                                width: parent.height / 1.5
                                height: parent.height / 1.5
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/zalo/images/search.png"
                                fillMode: Image.PreserveAspectFit
                                scale: 0.6
                            }
                            TextField {
                                id: searchUserAddGroup
                                width: parent.width - 10 - parent.height / 2
                                placeholderText: "Enter name, phone number, or list of phone number here"
                                placeholderTextColor: "black"                                
                                font.pixelSize: 15
                                color: "black"
                                anchors.verticalCenter: parent.verticalCenter
                                background: Rectangle {
                                    anchors.fill: parent
                                    color: "transparent"
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: rectAddGroupListUser
                        width: parent.width
                        height: parent.height * 5.5 / 10
                        ListView {
                            width: parent.width 
                            height: parent.height
                            contentHeight: parent.height
                            contentWidth: parent.width
                            clip: true
                            ScrollBar.vertical: ScrollBar {
                                policy: ScrollBar.AsNeeded
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: listFriend
                            spacing: 10
                            delegate: friendDelegate
                        }
                        Component {
                            id: friendDelegate
                            Rectangle {
                                id: rectfriendDelegate
                                width: rectAddGroupListUser.width 
                                height: 30
                                color: "white"
                                Row {
                                    anchors.fill: parent
                                    spacing: 10
                                    CheckBox {
                                        id: checkBoxGetUser
                                        checked: false
                                        indicator.width: 15
                                        indicator.height: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        onClicked: {
                                            if(checked) {
                                                listFriend.setProperty(index, "ok", "1")
                                            } else {
                                                listFriend.setProperty(index, "ok", "0")
                                            }
                                        }
                                    }
                                    Text {
                                        text: code
                                        font.pointSize: 13
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: parent.width / 2
                                        elide: Text.ElideRight
                                        color:"black"
                                    }
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onPressed: (mouse) => mouse.accepted = false
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                        rectfriendDelegate.color = "lightgray"
                                    }
                                    onExited: {
                                        rectfriendDelegate.color = "white"
                                    }
                                    onClicked: {
                                        
                                    }
                                }
                            }
                        }
                        Canvas{
                            anchors.fill: parent
                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.fillStyle = "transparent"
                                ctx.fillRect(0,0,this.width ,this.height )
                                ctx.lineWidth = 4;
                                ctx.strokeStyle = "lightgray"
                                ctx.beginPath()
                                ctx.moveTo(0, this.height)
                                ctx.lineTo(this.width, this.height)
                                ctx.stroke()

                                ctx.moveTo(0, 0)
                                ctx.lineTo(this.width, 0)
                                ctx.stroke()
                            }
                        }
                    }
                    Rectangle {
                        id: rectAddGroupOption
                        width: parent.width
                        height: parent.height - rectTitleAddGroup.height - rectAddGroupAddName.height - rectAddGroupSearchName.height - rectAddGroupListUser.height - 40
                        Rectangle {
                            width: parent.width / 2
                            height: parent.height
                            anchors.right: parent.right
                            Row {
                                anchors.fill: parent
                                spacing: 20
                                Rectangle {
                                    id: rectCancelGroup
                                    width: parent.width / 3
                                    height: parent.height
                                    color: "#A0A0A0"
                                    radius: 10
                                    Text {
                                        text: "Cancel"
                                        font.pointSize: 10
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectCancelGroup.color = "gray"
                                        }
                                        onExited: {
                                            rectCancelGroup.color = "#A0A0A0"
                                        }
                                        onClicked: {
                                            loadListFriend.source = ""
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rectOkGroup
                                    width: parent.width / 2
                                    height: parent.height
                                    color: "#0000FF"
                                    radius: 10
                                    Text {
                                        text: "Add member"
                                        font.pointSize: 10
                                        font.bold: true
                                        color: "white"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true
                        
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectOkGroup.color = "#0000CC"
                                        }
                                        onExited: {
                                            rectOkGroup.color = "#0000FF"
                                        }
                                        onClicked: {
                                            var arrFriend = []
                                            for(var i = 0; i < listFriend.count; i++)
                                            {
                                                if(listFriend.get(i).ok != "0")
                                                {
                                                    arrFriend.push(listFriend.get(i).code);
                                                }
                                            }
                                            //addNewMembers
                                            //console.log(group_now)
                                            user.addMemberToGroupChat(userphonePlayer, group_now, arrFriend)
                                            loadListFriend.source = ""
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}
