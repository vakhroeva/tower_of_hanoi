import QtQuick 2.9
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Rectangle
{
    id: game
    height: 500
    width: 900

    function clickCol(inputobj)
    {
        var obj = helper.selectItem(inputobj)
        if(obj)
        {
            obj.border.color = "black"; obj.border.width = 2
        }
        else
        {
            obj = helper.moveItem(inputobj)
            if(obj)
            {
                var cStep = helper.getCurrentStep()
                cl_tool.setTextFieldText("   " + cStep.toString())
                obj.border.width = 0; obj.parent = inputobj
                obj.y = 400 - (obj.parent.children.length - 2) * 30
                if ((obj.parent.children.length === 8)
                        &&(obj.parent.objectName !== "col1"))
                {
                    helper.win()
                    cl_tool.newGame()
                }
            }
        }
    }

    Rectangle
    {
        id:col_1
        width: 300
        height: 500
        color:"pink"
        objectName: "col1"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                clickCol(parent)
            }
        }

        Rectangle
        {
            id: r1
            objectName: "1"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 400
            width: 180
            height: 30
            color: "red"
        }

        Rectangle
        {
            id: r2
            objectName: "2"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 370
            width: 160
            height: 30
            color: "orange"
        }

        Rectangle
        {
            id: r3
            objectName: "3"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 340
            width: 140
            height: 30
            color: "yellow"
        }

        Rectangle
        {
            id: r4
            objectName: "4"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 310
            width: 120
            height: 30
            color: "green"
        }

        Rectangle
        {
            id: r5
            objectName: "5"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 280
            width: 100
            height: 30
            color: "blue"
        }

        Rectangle
        {
            id: r6
            objectName: "6"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 250
            width: 80
            height: 30
            color: "darkblue"
        }

        Rectangle
        {
            id: r7
            objectName: "7"
            anchors.horizontalCenter: col_1.horizontalCenter
            y: 220
            width: 60
            height: 30
            color: "darkMagenta"
        }
    }

    Rectangle
    {
        id:col_2
        x:300
        width: 300
        height: 500
        color:"pink"
        objectName: "col2"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                clickCol(parent)
            }
        }
    }

    Rectangle
    {
        id:col_3
        x:600
        width: 300
        height: 500
        color:"pink"
        objectName: "col3"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                clickCol(parent)
            }
        }
    }
}


