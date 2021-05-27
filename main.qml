import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window
{
    minimumWidth: 900
    minimumHeight: 600
    maximumWidth: 900
    maximumHeight: 600
    visible: true
    title: qsTr("Tower of Hanoi")

    ColumnLayout
    {
        id:cl
        anchors.centerIn: parent
        spacing: 2

        Gameplay
        {
            id:cl_game
            objectName: "cl_game"
        }
        Toolbar
        {
            id:cl_tool
            objectName: "cl_tool"
        }
    }
}
