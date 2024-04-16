import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects



Rectangle {
    anchors.fill: parent
    property var stx: 0
    Rectangle {
        id: rectDivideChatInfo
        width: parent.width
        height: parent.height
        Row { 
            anchors.fill: parent
            Column {
                width: parent.width - rectInfomationChat.width
                height: parent.height
                Rectangle {
                    id: rectTitleInChat
                    width: parent.width
                    height: parent.height / 12
                    Rectangle {
                        width: parent.width - 20
                        height: parent.height - 20
                        anchors.centerIn: parent
                        Row {
                            anchors.fill: parent
                            spacing: 10
                            Rectangle {
                                width: parent.height
                                height: parent.height
                                radius: 180
                                color: "lightblue"
                            }
                            Rectangle {
                                width: parent.height * 3
                                height: parent.height
                                Column {
                                    anchors.fill: parent
                                    spacing: 5
                                    Text {
                                        id: textNamefriend
                                        text: nameGroup
                                        font.pointSize: 12
                                        color: "black"
                                        font.bold: true
                                    }
                                    Text {
                                        text: ""
                                        font.pointSize: 10
                                        color: "gray"
                                    }
                                }
                            }
                        }
                        Rectangle {
                            width: parent.width / 6
                            height: parent.height / 1.5
                            anchors.verticalCenter: parent.verticalCenter
                            radius: 10
                            x: parent.width - width - 50
                            Row {
                                anchors.fill: parent
                                spacing: 10
                                Rectangle {
                                    id: addUser
                                    width: parent.height
                                    height: parent.height
                                    radius: 10
                                    Image {
                                        width: parent.width / 1.5
                                        height: parent.height / 1.5
                                        anchors.centerIn: parent
                                        source: "qrc:/zalo/images/createGroup.png"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            addUser.color = "#E0E0E0"
                                        }
                                        onExited: {
                                            addUser.color = "white"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rectFindMessage
                                    width: parent.height
                                    height: parent.height
                                    radius: 10
                                    Image {
                                        width: parent.width / 1.5
                                        height: parent.height / 1.5
                                        anchors.centerIn: parent
                                        source: "qrc:/zalo/images/search.png"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectFindMessage.color = "#E0E0E0"
                                        }
                                        onExited: {
                                            rectFindMessage.color = "white"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rectCall
                                    width: parent.height
                                    height: parent.height
                                    radius: 10
                                    Image {
                                        width: parent.width / 1.5
                                        height: parent.height / 1.5
                                        anchors.centerIn: parent
                                        source: "qrc:/zalo/images/callVideo.png"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectCall.color = "#E0E0E0"
                                        }
                                        onExited: {
                                            rectCall.color = "white"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
                                }
                                Rectangle {
                                    id: rectDivide
                                    width: parent.height
                                    height: parent.height
                                    radius: 10
                                    Image {
                                        width: parent.width / 1.5
                                        height: parent.height / 1.5
                                        anchors.centerIn: parent
                                        source: rectInfomationChat.width === 0 ? "qrc:/zalo/images/divide.png" : "qrc:/zalo/images/divide1.png"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectDivide.color = "#E0E0E0"
                                        }
                                        onExited: {
                                            rectDivide.color = "white"
                                        }
                                        onClicked: {
                                            if(rectInfomationChat.width === 0) 
                                            {
                                                rectInfomationChat.width = rectListChat.width / 1.1
                                            }
                                            else 
                                            {
                                                
                                                rectInfomationChat.width = 0

                                            }
                                        }
                                    }
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
                        }
                    }
                }
                Rectangle {
                    id: rectContentChat
                    width: parent.width
                    height: parent.height * 8.5 / 12
                    color: "lightgray"
                    clip: true
                    ListView {
                        id: listDataChat
                        width: parent.width - 20
                        height: parent.height - 20
                        anchors.centerIn: parent
                        contentWidth: width
                        contentHeight: height
                        ScrollBar.vertical: ScrollBar {
                            policy: ScrollBar.AsNeeded
                        }
                        // signal scrollToBottom
                        // Connections {
                        //     target: listDataChat

                        //     function onScrollToBottom() {
                        //         // Đặt giá trị contentY là đủ lớn để cuộn về cuối cùng
                        //         listDataChat.contentY = listDataChat.contentHeight - listDataChat.height - 20
                        //     }
                        // }
                        boundsBehavior: Flickable.StopAtBounds
                        model: listDataChatRealTime
                        spacing: 10
                        clip: true
                        delegate: Rectangle {
                            width: listDataChat.width / 2 
                            height: listDataChat.height / 12
                            color: "lightgray"
                            x: listDataChatRealTime.get(index)?.objects === "me" ? listDataChat.width / 2 : 0
                            Rectangle {
                                id: rectAvatarFriend
                                width: parent.height 
                                height: parent.height
                                visible: listDataChatRealTime.count > 0 ? (listDataChatRealTime.get(index)?.checkAvatar === 0 ? false : true) : false
                                radius: 180
                                color: "lightblue"
                                // Component.onCompleted: {
                                //     console.log(rectAvatarFriend.x, " " , listDataChatRealTime.get(index).checkAvatar)
                                // }
                                //anchors.left: parent.left
                            }
                            Rectangle {
                                visible: listDataChatRealTime.count > 0 ? (listDataChatRealTime.get(index)?.objects !== "me" ? true : false) : false
                                x: rectAvatarFriend.x + rectAvatarFriend.width + 20
                                implicitHeight: textMessage.height * 2
                                implicitWidth: textMessage.width + 10
                                color: "white"
                                radius: 10
                                Text {
                                    id: textMessage
                                    text: listDataChatRealTime.get(index).message
                                    //width: listDataChatRealTime.get(index).message > 50 ? listDataChat.width / 2 : undefined 
                                    font.bold: true
                                    font.pointSize: 10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    //wrapMode: listDataChatRealTime.get(index).message > 50 ? Text.WrapAnywhere : Text.NoWrap
                                }
                            }
                            Rectangle {
                                visible: listDataChatRealTime.count > 0 ? (listDataChatRealTime.get(index)?.objects === "me" ? true : false) : false
                                anchors.right: parent.right
                                implicitHeight: textMessage1.height * 2
                                implicitWidth: textMessage1.width + 10
                                radius: 5
                                color: "lightblue"
                                Text {
                                    id: textMessage1
                                    text: listDataChatRealTime.get(index)?.message
                                    //width: listDataChatRealTime.get(index).message > 50 ? listDataChat.width / 2 : undefined 
                                    font.bold: true
                                    font.pointSize: 10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    //wrapMode: listDataChatRealTime.get(index).message > 50 ? Text.WrapAnywhere : Text.NoWrap
                                }
                            }
                        }
                        // onContentHeightChanged: {
                        //     if(stx !== 0)
                        //     {
                        //         listDataChat.contentY = listDataChat.contentHeight
                        //         stx++;
                        //     }
                        // }
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
                    id: rectTool
                    width: parent.width 
                    height: parent.height * 0.4 / 12
                    Rectangle {
                        width: parent.width - 10
                        height: parent.height / 1.6
                        x: 10
                        radius: 10
                        anchors.verticalCenter: parent.verticalCenter
                        ListModel {
                            id: listToolChat
                            ListElement {
                                source: "qrc:/zalo/images/sticker.png" 
                                name: "send sticker"
                            }
                            ListElement {
                                source: "qrc:/zalo/images/imageSymbol.png"
                                name: "send Image"
                            }
                            ListElement {
                                source: "qrc:/zalo/images/attachFile.png"
                                name: "send file"
                            }
                        }
                        Row {
                            anchors.fill: parent
                            spacing: 20
                            Repeater {
                                anchors.fill: parent
                                model: listToolChat
                                delegate: Rectangle {
                                    id: rectToolWhenChat
                                    width: parent.height
                                    height: parent.height
                                    radius: 10
                                    Image {
                                        anchors.fill: parent
                                        source: listToolChat.get(index).source
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectToolWhenChat.color = "#E0E0E0"
                                        }
                                        onExited: {
                                            rectToolWhenChat.color = "white"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
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
                        }
                    }
                }
                Rectangle {
                    id: rectWriteChat
                    width: parent.width
                    height: parent.height - rectTool.height -rectContentChat.height - rectTitleInChat.height
                    Column {
                        anchors.fill: parent
                        Rectangle {
                            width: parent.width - 20
                            height: parent.height - 35
                            // anchors.centerIn: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                            clip: true
                            TextArea {
                                id: chatNow
                                width: parent.width
                                placeholderText: "@, Message...."
                                font.pointSize: 11
                                color: "black"
                                wrapMode: TextArea.Wrap
                                onContentHeightChanged: {
                                    
                                }
                            }
                            
                        }
                        Rectangle {
                            width: parent.width
                            height: 35
                            //anchors.bottom: parent.bottom
                            Rectangle {
                                width: parent.height * 2
                                height: parent.height - 10
                                //anchors.right: parent.right
                                x: parent.width - width - 10
                                anchors.verticalCenter: parent.verticalCenter
                                Row {
                                    anchors.fill: parent
                                    spacing: 20
                                    Rectangle {
                                        id: rectEmot
                                        width: parent.height
                                        height: parent.height

                                        Image {
                                            anchors.fill: parent
                                            source: "qrc:/zalo/images/faceSymbol.png"
                                        }
                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: {
                                                this.cursorShape = Qt.PointingHandCursor
                                                rectEmot.color = "#E0E0E0"
                                            }
                                            onExited: {
                                                rectEmot.color = "white"
                                            }
                                            onClicked: {
                                                
                                            }
                                        }
                                    }
                                    Rectangle {
                                        id: rectSendMessage
                                        width: parent.height 
                                        height: parent.height

                                        Image {
                                            anchors.fill: parent
                                            source: "qrc:/zalo/images/like.png"
                                        }
                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: {
                                                this.cursorShape = Qt.PointingHandCursor
                                                rectSendMessage.color = "#E0E0E0"
                                            }
                                            onExited: {
                                                rectSendMessage.color = "white"
                                            }
                                            onClicked: {
                                                if(chatNow.text !== "")
                                                {
                                                    user.sendMessage(userphonePlayer, group_now, chatNow.text)
                                                    listDataChatRealTime.append({
                                                        "objects": "me",
                                                        "message": chatNow.text,
                                                        "time": "10.20",
                                                        "w": 0,
                                                        "h": 0,
                                                        "x": 0,
                                                        "checkAvatar": 0,
                                                        "moreInfo": ""
                                                    })
                                                    listDataChat.contentY = listDataChat.contentHeight //- listDataChat.height + listDataChatRealTime.get(index).message
                                                    chatNow.text = ""
                                                    
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
            Rectangle {
                id: rectInfomationChat
                width: 0//rectListChat.width / 1.1
                height: parent.height
                Column {
                    anchors.fill: parent
                    Rectangle {
                        id: rectTitleDivide
                        width: parent.width 
                        height: rectTitleInChat.height
                        Text {
                            text: "Thông tin hội thoại"
                            font.pointSize: 12
                            font.bold: true
                            anchors.centerIn: parent
                            visible: rectInfomationChat.width === 0 ? false : true
                        }
                    }
                    Column {
                        width: parent.width 
                        height: parent.height - rectTitleDivide.height
                        Rectangle {
                            id: rectDivideAvatar
                            width: parent.width 
                            height: parent.height / 3
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
                            Rectangle {
                                width: parent.width - 80
                                height: parent.height - 40
                                anchors.centerIn: parent
                                Column {
                                    anchors.fill: parent
                                    spacing: 10
                                    Rectangle {
                                        width: parent.width / 4
                                        height: width
                                        radius: 180
                                        color: "blue"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    Rectangle {
                                        width: parent.width / 4 
                                        height: 20
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        Rectangle {
                                            width: parent.width - parent.height - 10
                                            height: parent.height
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            Text {
                                                id: rectInfoAboutPhone
                                                text: nameGroup
                                                font.pointSize: 12
                                                font.bold: true
                                                anchors.centerIn: parent
                                                visible: rectInfomationChat.width === 0 ? false : true
                                            }
                                        }
                                        Rectangle {
                                            id: rectChangeName
                                            width: parent.height
                                            height: parent.height
                                            x: parent.width + 10
                                            radius: 180
                                            visible: rectInfomationChat.width === 0 ? false : true
                                            Image {
                                                anchors.fill: parent
                                                source: "qrc:/zalo/images/write.png"
                                            }
                                            MouseArea {
                                                anchors.fill: parent
                                                hoverEnabled: true
                                                onEntered: {
                                                    this.cursorShape = Qt.PointingHandCursor
                                                    rectChangeName.color = "#E0E0E0"
                                                }
                                                onExited: {
                                                    rectChangeName.color = "white"
                                                }
                                                onClicked: {
                                                    
                                                }
                                            }
                                        }
                                    }
                                    Rectangle {
                                        id: rectAboutCustomer
                                        width: parent.width / 4
                                        height: width * 1.5
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        visible: rectInfomationChat.width === 0 ? false : true
                                        Column {
                                            anchors.fill: parent
                                            spacing: 10
                                            Rectangle {
                                                width: 30
                                                height: 30
                                                radius: 180
                                                anchors.horizontalCenter: parent.horizontalCenter   
                                                Image {
                                                    anchors.fill: parent
                                                    source: "qrc:/zalo/images/bell.png"
                                                }
                                                MouseArea {
                                                    anchors.fill: parent
                                                    hoverEnabled: true
                                                    onEntered: {
                                                        this.cursorShape = Qt.PointingHandCursor
                                                        parent.color = "#E0E0E0"
                                                    }
                                                    onExited: {
                                                        parent.color = "white"
                                                    }
                                                    onClicked: {
                                                        
                                                    }
                                                }
                                            }
                                            Rectangle {
                                                width: 30
                                                height: 30
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                Text {
                                                    text: "Turn off infomation"
                                                    font.pointSize: 8
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                    color: "gray"
                                                    visible: rectInfomationChat.width === 0 ? false : true
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                            }
                        }
                        Rectangle {
                            id: allFileOrLinkSend
                            width: parent.width 
                            height: parent.height - rectDivideAvatar.height
                            color: "lightblue"
                            Column {
                                anchors.fill: parent
                                Rectangle {
                                    width: parent.width 
                                    height: 40
                                    Text {
                                        text: "All link or file"
                                        font.pointSize: 12
                                        anchors.centerIn: parent
                                        visible: rectInfomationChat.width === 0 ? false : true
                                    }
                                }
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
                        ctx.moveTo(0, 0)
                        ctx.lineTo(0, this.height)

                        ctx.moveTo(0, rectTitleDivide.height)
                        ctx.lineTo(rectTitleDivide.width, rectTitleDivide.height)
                        
                        ctx.stroke()
                    }
                }
            }

        }
    }
    function resolve()
    {
        
        for(var i = 0; i < listDataChatRealTime.count; i++)
        {
            if(listDataChatRealTime.get(i).objects !== "me")
            {
                if(i == 0) {
                    listDataChatRealTime.get(i).checkAvatar = 1;
                }
                else if(listDataChatRealTime.get(i - 1).checkAvatar === 0) {
                    listDataChatRealTime.get(i).checkAvatar = 1;
                }
                listDataChatRealTime.get(i).x = 20 + rectDivideChatInfo.width / 12
            }
            else 
            {
                listDataChatRealTime.get(i).checkAvatar = 0;
            }
            // solve width and hight from message
            
        }
    }
    function loadDataChat()
    {

    }
    ListModel {
        id: listDataChatRealTime
        // ListElement {
        //     objects: "me"
        //     message: "hello world"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
        //     checkAvatar: 0
        //     moreInfo: "" 
        // }
        // ListElement {
        //     objects: "me"
        //     message: "hello world"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
        //     checkAvatar: 0
        //     moreInfo: "" 
        // }
        // ListElement {
        //     objects: "friend"
        //     message: "hello world"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
            
        //     moreInfo: "" 
        // }
        // ListElement {
        //     objects: "me"
        //     message: "hello worldcscccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
        //     checkAvatar: 0
        //     moreInfo: "" 
        // }
        // ListElement {
        //     objects: "friend"
        //     message: "hello world"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
        //     checkAvatar: 0
        //     moreInfo: "" 
        // }
        // ListElement {
        //     objects: "friend"
        //     message: "hello worldccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
        //     time: "10:20"
        //     w: 0
        //     h: 0
        //     x: 0
        //     checkAvatar: 0
        //     moreInfo: "" 
        // }
    }
    Connections {
        target: user
        function onDataReceived(data)
        {
            var jsonData = JSON.parse(data)
            var type = jsonData.type
            if(jsonData["type"] === "reloadRoomChat" && group_now === jsonData["group_id"].toString())
            {
                listDataChatRealTime.clear();
                var arr1 = jsonData["arrChat"]
                var arr2 = jsonData["arrUser"]
                for(var i = 0; i < arr1.length; i++)
                {
                    listDataChatRealTime.append({
                        "objects": arr2[i] === userphonePlayer ? "me" : "friend",
                        "message": arr1[i],
                        "time": "0000",
                        "w": 0,
                        "h": 0,
                        "x": 0,
                        "checkAvatar": arr2[i] === userphonePlayer ? 0 : 1,
                        "moreInfo": ""
                    })
                }
                //console.log("this size: ", listDataChatRealTime.count)
            }
            else if(jsonData["type"] === "chat" && userphonePlayer !== jsonData["userphoneSender"] && group_now === jsonData["group_id"])
            {
                listDataChatRealTime.append({
                    "objects": "friend",
                    "message": jsonData["message"].toString(),
                    "time": "0000",
                    "w": 0,
                    "h": 0,
                    "x": 0,
                    "checkAvatar": 1,
                    "moreInfo": ""
                })
                // listDataChat.scrollToBottom()
                console.log(data);
            }
            // if(jsonData["type"] === "chat") console.log(data)
            
        }
    }
    Component.onCompleted: {
        resolve()
    }
}