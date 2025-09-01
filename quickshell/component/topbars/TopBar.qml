import Quickshell
import Quickshell.Io
import QtQuick


Scope{
  // jadi ini konsepnya kayak ngasih nilai ke anakan
  id: root
  property string times

  Variants {
    model: Quickshell.screens;

    delegate: Component{

      PanelWindow{
        required property var modelData

        screen: modelData

          anchors{
            top: true
            left:true
            right:true
          }

          implicitHeight: 30

          Text {
            anchors.centerIn: parent
            text: root.times
          }
      }
    }
  }


  Process{
    id: dateProccess

    command: ["date"]
    running: true
    stdout: StdioCollector{
      onStreamFinished: root.times = this.text
    }
  }


  Timer{
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProccess.running = true


  }
}
