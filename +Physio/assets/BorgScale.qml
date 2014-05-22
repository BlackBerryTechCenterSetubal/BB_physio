import bb.cascades 1.2

Sheet {
    id: borg

    Page {
        Container {
            background: Color.create("#84d0d3d4")
            preferredHeight: 1280.0
            Container {
                background: Color.create("#2980B9")
                preferredWidth: 800.0
                preferredHeight: 120.0
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: "Borg Scale"
                    textStyle.color: Color.White
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.XLarge
                    translationY: 20.0
                }
            }
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
                        source: "models/borgModel.xml"
                    }
                    listItemComponents: [
                        ListItemComponent {
                            type: "recipeitem"
                            CostumBorg {
                            }
                        }
                    ]
                    onTriggered: {
                        // When an item is selected, we open the routine
                        var chosenItem = dataModel.data(indexPath);
                        if (_app.getFinish() == true) {
                            _app.setFinish(false)
                            borg.close();
                        } else
                            routine.open()
                    }

                } // ListView
            }
        }
    }
    attachedObjects: [
        Sheet {
            id: routine
            Page {
                id: rout
                Container {
                    background: Color.create("#84d0d3d4")
                    verticalAlignment: VerticalAlignment.Top
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredHeight: 1280.0
                    translationY: 0.0
                    Container {
                        background: Color.create("#2980B9")
                        preferredWidth: 800.0
                        preferredHeight: 120.0
                        horizontalAlignment: HorizontalAlignment.Center
                        layout: DockLayout {
                        }
                        ImageView {

                            imageSource: "asset:///icons/exercicio-small.png"
                            translationY: 10.0
                            translationX: 120.0
                        }
                        Label {
                            text: "Aquecimento" + " (1/3)"
                            textStyle.color: Color.White
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.fontSize: FontSize.Large
                            translationY: 25.0
                            translationX: 10.0
                        }
                    }
                    Container {
                        background: Color.create("#fff3c812")
                        preferredWidth: 800.0
                        preferredHeight: 100.0
                        horizontalAlignment: HorizontalAlignment.Center
                        ImageView {
                            imageSource: "asset:///icons/seta-azul.png"
                            preferredHeight: 80.0
                            preferredWidth: 50.0
                            translationX: 140.0
                        }
                        Label {
                            text: "Aquecimento - Treino - Relaxamento"
                            textStyle.color: Color.White
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.fontSize: FontSize.Large
                            translationY: -20.0
                            translationX: 0.0
                        }

                    }
                    TextArea {
                        text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                        editable: false
                        horizontalAlignment: HorizontalAlignment.Center
                        translationY: -10.0
                        preferredHeight: 200.0
                        translationX: 20.0
                    }
                    ImageView {
                        imageSource: "asset:///icons/foto-temp.png"
                        translationX: 50.0
                    }
                    TextArea {
                        text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                        editable: false
                        horizontalAlignment: HorizontalAlignment.Center
                        translationY: -10.0
                        preferredHeight: 200.0
                        translationX: 20.0
                    }
                    Container {
                        id: ok
                        background: blueButton.imagePaint
                        onTouch: {
                            ok.background = Color.create("#ff2925b9")
                            if (event.isUp()) {
                                _app.setFinish(true);
                                routine.close()
                            }
                        }
                        Label {
                            text: "Ok"
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.White
                            textStyle.fontSize: FontSize.Large

                        }
                        preferredWidth: 600.0
                        preferredHeight: 100.0
                        topPadding: 20.0
                        horizontalAlignment: HorizontalAlignment.Center
                        topMargin: 80.0
                        translationY: -70.0
                    }
                    attachedObjects: [
                        ImagePaintDefinition {
                            id: blueButton
                            repeatPattern: RepeatPattern.XY
                            imageSource: "asset:///icons/botao-azul.png"
                        }
                    ]

                }
            }
        }
    ]
}
