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
                        id: rectaAvatar
                        width: parent.width - 20
                        height: parent.width - 20
                        anchors.centerIn: parent
                        radius: 180
                        color: "#3399FF"
                        //color : "#808080"
                        border.width: 2
                        border.color: "white"
                        Image {
                            anchors.fill: parent
                            source: "qrc:/zalo/images/user-icon.png"
                            fillMode: Image.PreserveAspectFit
                            scale: 0.6
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                this.cursorShape = Qt.PointingHandCursor
                                rectaAvatar.color = "#0066CC";
                            }
                            onExited: {
                                rectaAvatar.color = "#3399FF";
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
                    visible: false //-----
                    Image {
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        anchors.centerIn: parent
                        source: "qrc:/zalo/images/contacts.jpg"
                        visible: parent.visible
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        visible: parent.visible
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
                        visible: false
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        visible: false
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
                            //changeScreen("", "");
                            changeScreen("qrc:/zalo/src/qml/screens/login.qml", "");
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
                    color: "transparent"
                    Rectangle {
                        width: parent.width - 20
                        height: parent.height / 2.5
                        anchors.centerIn: parent
                        color: "transparent"
                        Row {
                            spacing: 10
                            anchors.fill: parent
                            Rectangle {
                                width: parent.width * 4 / 5
                                height: parent.height
                                color: "transparent"
                                radius: 10
                                border {
                                    width: 1
                                    color: "black"
                                }
                                Row {
                                    anchors.fill: parent
                                    spacing: 10
                                    Image {
                                        width: parent.height / 1.2
                                        height: parent.height / 1.2
                                        anchors.verticalCenter: parent.verticalCenter
                                        source: "qrc:/zalo/images/search.png"
                                        fillMode: Image.PreserveAspectFit
                                        scale: 0.6
                                    }
                                    TextField {
                                        id: searchGroupChat
                                        width: parent.width - 10 - parent.height / 2
                                        placeholderText: "Search for conversations"
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
                                id: rectAddUser
                                width: parent.height
                                height: parent.height
                                radius: 180
                                Image {
                                    anchors.fill: parent
                                    source: "qrc:/zalo/images/addUser.png"
                                    fillMode: Image.PreserveAspectFit
                                    scale: 0.6
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
                                radius: 180
                                Image {
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    scale: 0.6
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
                                        user.getListFriend(userphonePlayer)
                                        addNewGroup.visible = true
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
                                    text: ""//"Chưa đọc"
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
                                        border.color: listUsers.get(index).colors
                                        color: "white"//
                                        Image {
                                            anchors.fill: parent
                                            source: "qrc:/zalo/images/cloudChat.jpg"
                                            fillMode: Image.PreserveAspectFit
                                            scale: 0.8
                                        }
                                    }
                                    Rectangle {
                                        id: rectPhoneUser
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
                                        id: rectTimeLastText
                                        width: parent.height
                                        height: parent.height / 3
                                        color: rectUser.color
                                        y: rectPhoneUser.y
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
                                        listUsers.setProperty(i, "colors", "lightblue");
                                    }
                                    listUsers.setProperty(index, "colors", "#000099");
                                    group_now = listUsers.get(index).id
                                    nameGroup = listUsers.get(index).name
                                    user.reloadRoomChat(userphonePlayer, group_now)
                                    loadRoomChat.source = "qrc:/zalo/src/qml/socicalNetwork/chatRoomUser.qml"
                                    //source: "qrc:/zalo/src/qml/socicalNetwork/chatRoomUser.qml"
                                }
                                Rectangle {
                                    id: rectDots
                                    width: rectTimeLastText.height * 1.3
                                    height: rectTimeLastText.height
                                    color: "#E0E0E0"
                                    x: parent.width - width - 10
                                    y: rectPhoneUser.y + 10
                                    radius: 5
                                    Image {
                                        anchors.fill: parent
                                        source: "qrc:/zalo/images/threeDots.png"
                                        fillMode: Image.PreserveAspectFit
                                        scale: 0.8
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            this.cursorShape = Qt.PointingHandCursor
                                            rectDots.color = "gray"
                                        }
                                        onExited: {
                                            rectDots.color = "#E0E0E0"
                                        }
                                        onClicked: { 
                                            // delete 
                                        }
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
    function checkPersonInGroup(json)
    {
        for(var i = 0; i < json.length; i++)
        {
            if(userphonePlayer === json[i].toString())
            {
                return false;
            }
        }
        return true;
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
                        "colors": "lightblue"
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
                        "colors": "lightblue"
                    })
                }
                addNewPhone.visible = false
            }
            else if(type === "startChat")
            {
                var arrGroupReceived = jsonData["arrGroup_id"];
                var arrGroupNameReceived = jsonData["arrGroup_name"]
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
                            "colors": "lightblue"
                        })
                    }
                    else 
                    {
                        listUsers.append({
                            "id": arrGroupReceived[i].toString(),
                            "code": arrGroupNameReceived[i].toString(),
                            "name": arrGroupNameReceived[i].toString(),
                            "lastText": "",
                            "timeLastText": "",
                            "colors": "lightblue"
                        })
                    }
                    
                }
            }
            else if(type === "listFriend")
            {
                listFriend.clear()
                var arrUserphoneReceived = jsonData["allFriend"];
                for(var i = 0; i < arrUserphoneReceived.length; i++)
                {
                    listFriend.append({
                        "code": arrUserphoneReceived[i].toString(),
                        "ok": "0"
                    })
                }
            }
            else if(type === "listFriendForGroup")
            {
                var arr = jsonData["allUserphoneForGroup"]
                if(!checkPersonInGroup(arr) && jsonData["result"] === "create group success")
                {
                    listUsers.append({
                        "id": jsonData["group_id"].toString(),
                        "code": jsonData["groupName"].toString(),
                        "name": jsonData["groupName"].toString(),
                        "lastText": "",
                        "timeLastText": "",
                        "colors": "lightblue"
                    })
                    addNewGroup.visible = false
                }
            }
            else if(jsonData["type"].toString() === "reloadRoomChat" && group_now === jsonData["group_id"].toString())
            {
                listMemberInGroup.clear();
                var arrMember = jsonData["arrMember"];
                for(var i = 0; i < arrMember.length; i++)
                {
                    listMemberInGroup.append({
                        "code": arrMember[i].toString(),
                        "ok": "0"
                    })
                }
            }
        }
    }
    ListModel {
        id: listMemberInGroup
        // ListElement {
        //     code: "quang "
        //     ok: "0"
        // }
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
                                        font.pointSize: 10
                                        font.bold: true
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    width: parent.width - rectOutH20.width - 20
                                    implicitHeight: textPhone.height
                                    color: "transparent"
                                    radius: 10
                                    border {
                                        width: 1
                                        color: "black"
                                    }
                                    RowLayout {
                                        anchors.fill: parent
                                        Image {
                                            Layout.fillHeight: true
                                            Layout.fillWidth: false
                                            source: "qrc:/zalo/images/search.png"
                                            fillMode: Image.PreserveAspectFit
                                            scale: 0.6
                                        }
                                        TextField {
                                            id: textPhone
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            placeholderText: "Search phone"
                                            placeholderTextColor: "black"                                
                                            font.pixelSize: 15
                                            color: "black"
                                            background: Rectangle {
                                                anchors.fill: parent
                                                color: "transparent"
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
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    ListModel {
        id: listFriend
        ListElement {
            code: "0359899632"
            ok: "0"
        }
    }
    // add new group
    MouseArea {
        id: addNewGroup
        anchors.fill: parent
        visible: false
        hoverEnabled: false
        Rectangle { 
            anchors.fill: parent
            color: "lightgray"
            opacity: 0.8
            visible: addNewGroup.visible
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
                                text: "Create group"
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
                                        addNewGroup.visible = false
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
                            Row { 
                                anchors.fill: parent
                                Rectangle {
                                    width: parent.height
                                    height: parent.height
                                }
                                TextField {
                                    id: textGroupName
                                    width: parent.width - parent.height
                                    placeholderText: "Enter group name..."
                                    placeholderTextColor: "black"                                
                                    font.pixelSize: 15
                                    color: "black"
                                    background: Rectangle {
                                        anchors.fill: parent
                                        color: "transparent"
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
                                    ctx.strokeStyle = "lightblue"
                                    ctx.beginPath()
                                    ctx.moveTo(this.height, this.height)
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
                                                addNewGroup.visible = false
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
                                            text: "Create group"
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
                                                user.sendListFriendForGroup(userphonePlayer, arrFriend, textGroupName.text)
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
    Component.onCompleted: {
        //user.getListFriend(userphonePlayer)
        if(st === 1)
        {
            user.sendInfoStartRoomChat(userphonePlayer)
            st++;
        }
    }
}