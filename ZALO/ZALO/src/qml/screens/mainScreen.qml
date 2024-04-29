import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects



Rectangle {
    id: root
    anchors.fill:parent
    signal changeScreen(string source, string username)
    property var nameGroup: "not know" 
    property var st: 1
    property var takeIndex: -1
    Row {
        anchors.fill: parent
        Rectangle {
            id: rectTitle
            width: parent.width / 24
            height: parent.height
            color: "#3399FF"
            Column {
                width: parent.width
                height: parent.height / 2
                Rectangle {
                    id: rectAvatar
                    width: parent.width
                    height: parent.width * 1.5
                    color: "#3399FF"
                    Rectangle {
                        width: parent.width - 20
                        height: parent.width - 20
                        anchors.centerIn: parent
                        radius: 180
                        color: "#3399FF"
                        border.width: 2
                        border.color: "white"
                        Image {
                            source: ""
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                this.cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                
                            }
                            onClicked: {

                            }
                        }
                    }
                }
                Rectangle {
                    id: rectChat
                    width: parent.width
                    height: parent.width
                    color: "#3399FF"
                    Image {
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        anchors.centerIn: parent
                        source: "qrc:/zalo/images/symbolChat2.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            this.cursorShape = Qt.PointingHandCursor
                            rectChat.color = "#0066CC"
                        }
                        onExited: {
                            rectChat.color = "#3399FF"
                        }
                        onClicked: {
                            
                        }
                    }
                }
                Rectangle {
                    id: rectFriend
                    width: parent.width
                    height: parent.width
                    color: "#3399FF"
                    Image {
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        anchors.centerIn: parent
                        source: "qrc:/zalo/images/contacts.jpg"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            this.cursorShape = Qt.PointingHandCursor
                            rectFriend.color = "#0066CC"
                        }
                        onExited: {
                            rectFriend.color = "#3399FF"
                        }
                        onClicked: {
                            
                        }
                    }
                }
            }
            Column {
                width: parent.width 
                height: parent.width * 2
                anchors.bottom: parent.bottom
                //ZALO/images/st.png
                Rectangle {
                    id: rectSetting
                    width: parent.width
                    height: parent.width 
                    color: "#3399FF"
                    Image {
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        anchors.centerIn: parent
                        source: "qrc:/zalo/images/toolBox.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            this.cursorShape = Qt.PointingHandCursor
                            rectSetting.color = "#0066CC"
                        }
                        onExited: {
                            rectSetting.color = "#3399FF"
                        }
                        onClicked: {
                            
                        }
                    }
                }
                Rectangle {
                    id: rectToolBox
                    width: parent.width
                    height: parent.width 
                    color: "#3399FF"
                    Image {
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        anchors.centerIn: parent
                        source: "qrc:/zalo/images/st.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            this.cursorShape = Qt.PointingHandCursor
                            rectToolBox.color = "#0066CC"
                        }
                        onExited: {
                            rectToolBox.color = "#3399FF"
                        }
                        onClicked: {
                            // exit
                            user.sendInfoLogoffToServer(userphonePlayer)
                            changeScreen("", "");
                        }
                    }
                }
            }
        }
        Rectangle {
            id: rectListChat
            width: parent.width / 4
            height: parent.height
            
            Column {
                anchors.fill: parent
                Rectangle {
                    id: rectTilteChat
                    width: parent.width 
                    height: parent.width * 4 / 24 * 1.5 - 25
                    Rectangle {
                        width: parent.width - 20
                        height: parent.height / 2.5
                        anchors.centerIn: parent
                        Row {
                            spacing: 10
                            anchors.fill: parent
                            Rectangle {
                                width: parent.width * 4 / 5
                                height: parent.height
                                color: "lightgray"
                                radius: 10
                                Row {
                                    anchors.fill: parent
                                    Rectangle {
                                        width: parent.height
                                        height: parent.height
                                        color: "lightgray"
                                        radius: 10
                                        Image {
                                            width: parent.width / 1.5
                                            height: parent.height / 1.5
                                            anchors.centerIn: parent
                                            source: "qrc:/zalo/images/search.png"
                                        }
                                    }
                                    // Rectangle {
                                    //     width: parent.width - parent.height
                                    //     height: parent.height
                                    //     // anchors.centerIn: parent
                                    //     radius: 10
                                    //     // TextField {
                                    //     //     width: parent.width
                                    //     //     height: parent.height 
                                    //     //     placeholderText: "search username"
                                    //     //     font.pointSize: 10
                                    //     //     color: "lightgray"
                                    //     //     // background: Rectangle {
                                                
                                    //     //     // }
                                    //     //     // color: "black"
                                    //     // }
                                    // }
                                }
                            }
                            Rectangle {
                                id: rectAddUser
                                width: parent.height
                                height: parent.height
                                Image {
                                    // width: parent.width / 1.5   
                                    // height: parent.width / 1.5
                                    // anchors.centerIn: parent
                                    anchors.fill: parent
                                    source: "qrc:/zalo/images/addUser.png"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                        rectAddUser.color = "lightgray"
                                    }
                                    onExited: {
                                        rectAddUser.color = "white"
                                    }
                                    onClicked: {
                                        addNewPhone.visible = true
                                    }
                                }
                            }
                            Rectangle {
                                id: rectCreateGroup
                                width: parent.height
                                height: parent.height
                                Image {
                                    // width: parent.width / 1.5   
                                    // height: parent.width / 1.5
                                    // anchors.centerIn: parent
                                    anchors.fill: parent
                                    source: "qrc:/zalo/images/createGroup.png"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                        rectCreateGroup.color = "lightgray"
                                    }
                                    onExited: {
                                        rectCreateGroup.color = "white"
                                    }
                                    onClicked: {
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: rectOption
                    width: parent.width 
                    height: 25
                    // color: "green"
                    Rectangle {
                        width: parent.width - 20
                        height: parent.height / 1.2
                        anchors.centerIn: parent
                        Row {
                            width: parent.width / 2
                            height: parent.height
                            spacing: 10
                            Rectangle {
                                width: parent.width / 4
                                height: parent.height
                                Text {
                                    id: textStatus1
                                    text: "Tất cả"
                                    font.pointSize: 10
                                    font.bold: true
                                    color: "gray"
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            textStatus1.color = "blue"
                                        }
                                        onExited: {
                                            textStatus1.color = "gray"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
                                }
                            }
                            Rectangle {
                                width: parent.width / 4
                                height: parent.height
                                Text {
                                    id: textStatus2
                                    text: "Chưa đọc"
                                    font.pointSize: 10
                                    font.bold: true
                                    color: "gray"
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            textStatus2.color = "blue"
                                        }
                                        onExited: {
                                            textStatus2.color = "gray"
                                        }
                                        onClicked: {
                                            
                                        }
                                    }
                                }
                            }
                        }
                        Rectangle {
                            id: rectOptionSelect
                            width: parent.width / 2.5
                            height: parent.height
                            x: parent.width - width 
                            color: "white"
                            Row {

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
                    width: parent.width
                    height: parent.height - rectOption.height - rectTilteChat.height
                    // color: "red"
                    clip: true
                    ListView {
                        id: listRoomChat
                        width: parent.width 
                        height: parent.height
                        contentWidth: parent.width 
                        contentHeight: parent.height * 1.1
                        ScrollBar.vertical: ScrollBar {
                            policy: ScrollBar.AsNeeded
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: listUsers
                        delegate: Rectangle{
                            id: rectUser
                            width: listRoomChat.width 
                            height: 80
                            color: "white"
                            Rectangle {
                                width: parent.width - 20
                                height: parent.height- 20
                                anchors.centerIn: parent
                                color: parent.color
                                Row {
                                    anchors.fill: parent
                                    spacing: 10
                                    Rectangle {
                                        width: parent.height
                                        height: parent.height
                                        radius: 180
                                        border.width: 2
                                        border.color: "lightblue"
                                        color: listUsers.get(index).colors
                                    }
                                    Rectangle {
                                        width: parent.width - 2 * parent.height - 20
                                        height: parent.height - 10
                                        color: rectUser.color
                                        anchors.verticalCenter: parent.verticalCenter
                                        Column {
                                            anchors.fill: parent
                                            spacing: 10
                                            Text {
                                                text: listUsers.get(index).name
                                                font.pointSize: 11
                                                width: parent.width 
                                                elide: Text.ElideRight 
                                                wrapMode: Text.Wrap 
                                                color: "black"
                                                font.bold: true
                                            }
                                            Text {
                                                text: listUsers.get(index).lastText
                                                font.pointSize: 11
                                                width: parent.width 
                                                elide: Text.ElideRight 
                                                wrapMode: Text.Wrap 
                                                color: "gray"
                                            }
                                        }
                                    }
                                    Rectangle {
                                        width: parent.height
                                        height: parent.height / 4
                                        color: rectUser.color
                                        Text {
                                            text: listUsers.get(index).timeLastText
                                            font.pointSize: 11
                                            width: parent.width 
                                            elide: Text.ElideRight 
                                            wrapMode: Text.Wrap 
                                            color: "gray"
                                        }
                                    }
                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    this.cursorShape = Qt.PointingHandCursor
                                    rectUser.color = "#E0E0E0"
                                }
                                onExited: {
                                    rectUser.color = "white"
                                }
                                onClicked: { 
                                    for(var i = 0; i < listUsers.count; i++)
                                    {
                                        listUsers.setProperty(i, "colors", "white");
                                    }
                                    listUsers.setProperty(index, "colors", "#E0E0E0");
                                    group_now = listUsers.get(index).id
                                    nameGroup = listUsers.get(index).name
                                    user.reloadRoomChat(userphonePlayer, group_now)
                                    loadRoomChat.source = "qrc:/zalo/src/qml/socicalNetwork/chatRoomUser.qml"
                                    //source: "qrc:/zalo/src/qml/socicalNetwork/chatRoomUser.qml"
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
                    ctx.moveTo(this.width, 0)
                    ctx.lineTo(this.width, this.height)
                    ctx.stroke()
                }
            }
        }
        Rectangle {
            width: parent.width - rectTitle.width - rectListChat.width
            height: parent.height
            Rectangle {
                width: parent.width - 120
                height: parent.height * 3 / 4
                anchors.centerIn: parent
                Row {
                    anchors.fill: parent
                    spacing: 20
                    Rectangle {
                        id: buttonLeft
                        width: 20
                        height: 40
                        radius: 10
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                            anchors.fill: parent
                            source: "qrc:/zalo/images/right-arrow.png"
                            rotation: 180
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                this.cursorShape = Qt.PointingHandCursor
                                buttonLeft.color = "gray"
                            }
                            onExited: {
                                buttonLeft.color = "white"
                            }
                            onClicked: {
                                swipeViewIntroduce.decrementCurrentIndex()
                            }
                        }
                    }
                    Column {
                        width: parent.width - 80
                        height: parent.height
                        Rectangle {
                            width: parent.width 
                            height: parent.height / 5
                            TextArea {
                                text: "Chào mừng em đến với nhà của bọn anh!"
                                font.pointSize: 20
                                anchors.centerIn: parent
                                font.bold: true
                                color: "black"
                            }
                        }
                        Rectangle {
                            width: parent.width 
                            height: parent.height * 4 / 5

                            SwipeView {
                                id: swipeViewIntroduce
                                width: parent.width
                                height: parent.height
                                clip: true
                                Repeater {
                                    anchors.fill: parent
                                    model: listIntroduce
                                    delegate: Rectangle {
                                        // width: parent.width
                                        // height: parent.height
                                        // Component.onCompleted: {
                                        //     console.log("this is: ", width)
                                        // }
                                        Rectangle {
                                            width: parent.width / 2
                                            height: parent.height
                                            anchors.centerIn: parent
                                            Column {
                                                anchors.fill: parent
                                                Image {
                                                    width: parent.width 
                                                    height: parent.height * 4 / 5
                                                    source: listIntroduce.get(index).source
                                                }
                                                Rectangle {
                                                    width: parent.width 
                                                    height: parent.height / 5
                                                    Text {
                                                        text: listIntroduce.get(index).name
                                                        font.pointSize: 15
                                                        color: "black"
                                                        anchors.centerIn: parent
                                                        font.bold: parent
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
                        id: buttonRight
                        width: 20
                        height: 40
                        radius: 10
                        anchors.verticalCenter: parent.verticalCenter
                        Image {
                            anchors.fill: parent
                            source: "qrc:/zalo/images/right-arrow.png"
                            
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                this.cursorShape = Qt.PointingHandCursor
                                buttonRight.color = "gray"
                            }
                            onExited: {
                                buttonRight.color = "white"
                            }
                            onClicked: {
                                swipeViewIntroduce.incrementCurrentIndex()
                            }
                        }
                    }
                }
            }
            Loader {
                id: loadRoomChat
                anchors.fill: parent
                //source: "qrc:/zalo/src/qml/socicalNetwork/chatRoomUser.qml"
            }
            
        }
        
    }
    ListModel {
        id: listIntroduce
        ListElement {
            source: "qrc:/zalo/images/effectiveWork.png"
            name: "Nhắn nhiều người một lúc :)))"
        }
        ListElement {
            source: "qrc:/zalo/images/deleteMessage.png"
            name: "Tin nhắn tự xoá :))"
        }
        ListElement {
            source: "qrc:/zalo/images/effectiveParty.jpg"
            name: "Làm nhóm hiệu quá bớt toxic"
        }
        ListElement {
            source: "qrc:/zalo/images/exchangeFile.png"
            name: "Gửi file nặng"
        }
    }
    ListModel {
        id: listUsers
        // ListElement {
        //     code: "quang"
        //     name: "QUANG"
        //     lastText: "not have"
        //     timeLastText: "not have"
        //     colors: "white"
        // }
    }
    Connections {
        target: user
        function onDataReceived(data)
        {
            var jsonData = JSON.parse(data)
            var type = jsonData.type
            if(type === "addFriend" && jsonData.stt === "newExist")
            {
                if(userphonePlayer == jsonData["userphone"].toString())
                {
                    listUsers.append({
                        "id": jsonData["group_id"].toString(),
                        "code": jsonData["userphoneFriend"].toString(),
                        "name": jsonData["userphoneFriend"].toString(),
                        "lastText": "",
                        "timeLastText": "",
                        "colors": "white"
                    })
                }
                else if(userphonePlayer == jsonData["userphoneFriend"].toString())
                {
                    listUsers.append({
                        "id": jsonData["group_id"].toString(),
                        "code": jsonData["userphone"].toString(),
                        "name": jsonData["userphone"].toString(),
                        "lastText": "",
                        "timeLastText": "",
                        "colors": "white"
                    })
                }
            }
            else if(type == "startChat")
            {
                var arrGroupReceived = jsonData["arrGroup_id"];
                for(var i = 0; i < arrGroupReceived.length; i++)
                {
                    if(jsonData[arrGroupReceived[i].toString()].length == 2)
                    {
                        var nameFriend = "";
                        var checky = jsonData[arrGroupReceived[i].toString()]
                        for(var j = 0; j < checky.length; j++)
                        {
                            if(checky[j].toString() != userphonePlayer)
                            {
                                nameFriend = checky[j].toString();
                            }
                        }
                        listUsers.append({
                            "id": arrGroupReceived[i].toString(),
                            "code": nameFriend,
                            "name": nameFriend,
                            "lastText": "",
                            "timeLastText": "",
                            "colors": "white"
                        })
                    }
                    
                }
            }
            //console.log(data)
        }
    }
    MouseArea {
        id: addNewPhone
        anchors.fill: parent
        visible: false
        hoverEnabled: false
        Rectangle { 
            anchors.fill: parent
            color: "lightgray"
            opacity: 0.8
            visible: addNewPhone.visible
            radius: 10
            Rectangle {
                width: parent.width / 5
                height: parent.height / 4
                anchors.centerIn: parent
                radius: 10
                Column {
                    anchors.fill: parent
                    spacing: 20
                    Rectangle {
                        width: parent.width 
                        height: parent.height / 5
                        Rectangle {
                            width: parent.width - 20
                            height: parent.height - 10
                            anchors.centerIn: parent
                            Text {
                                text: "Thêm bạn"
                                font.pointSize: 12
                                font.bold: true
                            }
                            Rectangle {
                                id: rectClose
                                width: parent.height
                                height: parent.height
                                anchors.right: parent.right
                                radius: 180
                                Image {
                                    width: parent.width / 2
                                    height: parent.height / 2
                                    anchors.centerIn: parent
                                    source: "qrc:/zalo/images/close.png"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                        rectClose.color = "lightgray"
                                    }
                                    onExited: {
                                        rectClose.color = "white"
                                    }
                                    onClicked: {
                                        addNewPhone.visible = false
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
                        width: parent.width 
                        height: parent.height * 2 / 5
                        Rectangle {
                            width: parent.width - 20
                            height: parent.height 
                            anchors.horizontalCenter: parent.horizontalCenter
                            Row {
                                anchors.fill: parent
                                spacing: 20
                                Rectangle {
                                    id: rectOutH20
                                    implicitWidth: h20.width
                                    implicitHeight: h20.height
                                    Text {
                                        id: h20
                                        text: "Việt\nNam"
                                        font.pointSize: 12
                                        font.bold: true
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    width: parent.width - rectOutH20.width - 20
                                    implicitHeight: textPhone.height
                                    TextField {
                                        id: textPhone
                                        width: parent.width 
                                        placeholderText: "Search phone"
                                        font.pointSize: 10
                                        // wrapMode: Text.wordWrap
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
                        width: parent.width
                        height: parent.height * 2 / 5
                        Rectangle {
                            width: parent.width - 20
                            height: parent.height - 10
                            anchors.centerIn: parent
                            Rectangle {
                                width: parent.height * 1.2
                                height: parent.height
                                radius: 10
                                color: "red"
                                Text {
                                    text: "Cancel"
                                    font.bold: true
                                    font.pointSize: 10
                                    anchors.centerIn: parent
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                
                                    }
                                    onExited: {
                                        
                                    }
                                    onClicked: {
                                        addNewPhone.visible = false
                                    }
                                }
                            }
                            Rectangle {
                                width: parent.height * 1.2
                                height: parent.height
                                radius: 10
                                anchors.right: parent.right
                                color: "lightgreen"
                                Text {
                                    text: "Ok"
                                    font.bold: true
                                    font.pointSize: 10
                                    anchors.centerIn: parent
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        this.cursorShape = Qt.PointingHandCursor
                                
                                    }
                                    onExited: {
                                        
                                    }
                                    onClicked: {
                                        
                                        user.sendInfoAddFriend(textPhone.text, userphonePlayer)
                                        addNewPhone.visible = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        if(st === 1)
        {
            user.sendInfoStartRoomChat(userphonePlayer)
            st++;
        }
    }
}