
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11

//import Qt.labs.calendar 1.0

ItemDelegate {
    id: rootAlarm
    width: parent.width
    checkable: true

    onClicked: ListView.view.currentIndex = index

    contentItem: ColumnLayout {
        spacing: 0

        RowLayout {
            ColumnLayout {
                id: dateColumn

                readonly property date alarmDate: new Date(
                    model.year, model.month - 1, model.day, model.hour, model.minute)

                Label {
                    id: timeLabel
                    font.pixelSize: Qt.application.font.pixelSize * 2
//                    color: "ghostwhite"
                    text: dateColumn.alarmDate.toLocaleTimeString(locale, Locale.ShortFormat)//window.
                }
//                RowLayout {
//                    Label {
//                        id: dateLabel
//                        text: dateColumn.alarmDate.toLocaleDateString(window.locale, Locale.ShortFormat)
//                    }
//                    Label {
//                        id: alarmAbout
//                        text: "⸱ " + model.label
//                        visible: model.label.length > 0 && !root.checked
//                    }
//                }
            }
            Item {
                Layout.fillWidth: true
            }
            Switch {
                checked: model.activated
                Layout.alignment: Qt.AlignTop
                onClicked: model.activated = checked
            }
        }

        CheckBox {
            id: alarmRepeat
            text: qsTr("Repeat")
            checked: model.repeat
            visible: rootAlarm.checked
            onToggled: model.repeat = checked
        }
        Flow {
            visible: rootAlarm.checked && model.repeat
            Layout.fillWidth: true

            Repeater {
                id: dayRepeater
                model: daysToRepeat
                delegate: RoundButton {
                    text: Qt.locale().dayName(model.dayOfWeek, Locale.NarrowFormat)
                    flat: true
                    checked: model.repeat
                    checkable: true
                    Material.background: checked ? Material.accent : "transparent"
                    onToggled: model.repeat = checked
                }
            }
        }

//        TextField {
//            id: alarmDescriptionTextField
//            placeholderText: qsTr("Enter description here")
//            cursorVisible: true
//            visible: root.checked
//            text: model.label
//            onTextEdited: model.label = text
//        }
        RowLayout {
            visible: rootAlarm.checked
            Label{
                id: cleanNumLabel
                text: qsTr("清扫次数")
            }
            SpinBox {
                value: 1
            }
        }
        RowLayout{
            visible: rootAlarm.checked
            Label{
                id: cleanModelLabel
                text: qsTr("清扫模式")
            }
            ComboBox {
                editable: true
                model: ListModel {
                    id: cleanmodel
                    ListElement { text: qsTr("Banana") }
                    ListElement { text: qsTr("Apple") }
                    ListElement { text: qsTr("Coconut") }
                }
                onAccepted: {
                    if (find(editText) === -1)
                        cleanmodel.append({text: editText})
                }
            }
        }
        RowLayout {
            visible: rootAlarm.checked
            Label{
                id: cooseROILabel
                text: qsTr("选择区域")
            }

            ComboBox {
                editable: true
                model: ListModel {
                    id: choosemodel
                    ListElement { text: qsTr("default") }
                    ListElement { text: qsTr("other1") }
                    ListElement { text: qsTr("other2") }
                }
                onAccepted: {
                    if (find(editText) === -1)
                        choosemodel.append({text: editText})
                }
            }
        }
        Button {
            id: deleteAlarmButton
            text: qsTr("Delete")
            width: 40
            height: 40
            visible: rootAlarm.checked
            onClicked: rootAlarm.ListView.view.model.remove(rootAlarm.ListView.view.currentIndex, 1)
        }
    }
}
