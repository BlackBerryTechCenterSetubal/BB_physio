import bb.cascades 1.2

Page {
    id: exercise
    Container {
        Container {
            background: Color.create("#2980B9")
            preferredWidth: 800.0
            preferredHeight: 120.0
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "Exercise"
                textStyle.color: Color.White
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontSize: FontSize.XLarge
                translationY: 20.0
            }

        }
        background: Color.create("#84d0d3d4")
        preferredHeight: 1280.0
        TextArea {
            text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
            editable: false
            horizontalAlignment: HorizontalAlignment.Center
            translationY: -30.0
            preferredHeight: 200.0
        }
        Container {
            translationY: -20.0
            preferredHeight: 840.0
            ListView {
                id: listItem
                dataModel: XmlDataModel {
                    source: "models/listModel.xml"
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "recipeitem"
                        CostumList {
                        }
                    }
                ]
                onTriggered: {
                    borg.open()
                }

            } // ListView
        }
    }
    attachedObjects: [
        BorgScale {
            id: borg
            peekEnabled: false
        }
    ]
}
