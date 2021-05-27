import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

RowLayout
{

    function newGame()
    {
        var first

        for( var j=0; j<cl.children.length; j++)
        {
            if( cl.children[j].objectName === "cl_game")
               {
                    var game = cl.children[j];

                    for ( var r = 0; r < game.children.length; r++ )
                        {
                            if( game.children[r].objectName === "col1")
                            {
                                first =  game.children[r];
                                break;
                            }
                        }

                  for ( var name_ring = 1; name_ring < 8; name_ring++)
                  {
                      for ( var k=0; k < game.children.length; k++ )
                      {
                        var col = game.children[k];

                        for ( var z=0; z < col.children.length; z++ )
                            {
                                if ( col.children[z].objectName === name_ring.toString())
                                {
                                    col.children[z].y = 400 - (name_ring - 1) * 30
                                    helper.setParent(col.children[z], first)
                                    col.children[z].parent = first;


                                }
                            }
                      }
                  }
               }
         }

       helper.newGame()

       text_line.text = "   0";
    }

    function setTextFieldText(txt)
    {
        text_line.text = txt;
    }

    Button
    {
        id: but_new
        text: " New game "
        onClicked:
        {
            newGame()
            text_line.text = "   0 "
        }
    }

    TextField
    {
         id: text_line
         Layout.fillWidth: true
         readOnly: true
         text: "   0"
    }

    Button
    {
            id: but_exit
            text: "  Exit  "
            onClicked: Qt.quit()
    }

    Shortcut
    {
        sequences: ["N"]
        context: Qt.ApplicationShortcut
        onActivated:
        {
            helper.newGame()
            text_line.text = "   0"
        }
    }

    Shortcut
    {
        sequences: [ "StandardKey.Close","Q"]
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

}
