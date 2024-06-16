QT += quick
QT += sql


HEADERS += \
        src/include/user.h

SOURCES += \
        main.cpp \
        src/cpp/user.cpp


#qml resource main file
resources.files += \
        main.qml


#qml resource social network files
resources.files += src/qml/screens/login.qml \
                        src/qml/screens/mainScreen.qml \
                        src/qml/socicalNetwork/chatRoomUser.qml \
                        src/qml/screens/login.qml \
                        src/qml/screens/register.qml \
                        src/qml/component/ListFriend.qml

resources.files += \
                images/symbolChat2.png \
                images/contacts.jpg \
                images/st.png \
                images/toolBox.png \
                images/search.png \
                images/addUser.png \
                images/createGroup.png \
                images/right-arrow.png \
                images/effectiveWork.png \
                images/effectiveParty.jpg \
                images/deleteMessage.png \
                images/exchangeFile.png \
                images/callVideo.png \
                images/divide.png \
                images/sticker.png \
                images/imageSymbol.png \
                images/attachFile.png \
                images/faceSymbol.png \
                images/like.png \
                images/divide1.png \
                images/write.png \
                images/bell.png \
                images/close.png \
                images/user-icon.png \
                images/background-login.jpg \
                images/background-login1.jpg \
                images/defaultAvatar.jpg \
                images/cloudChat.jpg \
                images/threeDots.png
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

CONFIG += console

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
