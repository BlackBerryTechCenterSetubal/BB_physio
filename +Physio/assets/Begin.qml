
import bb.cascades 1.2
import "Common"
import "controls"

Sheet {
    id: menu
    NavigationPane {
        id: navigation
        peekEnabled: false
        Page {
            Container {
                verticalAlignment: VerticalAlignment.Fill
                layout: StackLayout {
                }
                background: Color.create("#3498DB")
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 30.0
                ImageView {
                    imageSource: "asset:///icons/logo-physio-plan.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 500.0
                    preferredHeight: 500.0
                }
                // A Container for the list is padded at the top and bottom to make room for decorations.
                Container {
                    background: background.imagePaint
                    topMargin: 60.0
                    preferredWidth: 660.0
                    preferredHeight: 520.0
                    topPadding: 60.0
                    bottomPadding: topPadding
                    horizontalAlignment: HorizontalAlignment.Center
                    Container {
                        id: register
                        background: darkBlue.imagePaint
                        onTouch: {
                            register.background = Color.create("#ff2925b9")
                            if (event.isUp()) {
                                navigation.push(registo.createObject());
                                register.background = darkBlue.imagePaint
                            }
                        }
                        Label {
                            text: "Register"
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.White
                            textStyle.fontSize: FontSize.Large
                        }
                        preferredWidth: 600.0
                        preferredHeight: 120.0
                        topPadding: 20.0
                        horizontalAlignment: HorizontalAlignment.Center
                        topMargin: 30.0
                    }
                    Container {
                        id: exercise
                        background: darkBlue.imagePaint
                        onTouch: {
                            exercise.background = Color.create("#ff2925b9")
                            if (event.isUp()) {
                                navigation.push(exercicio.createObject());
                                exercise.background = darkBlue.imagePaint
                            }
                        }
                        Label {
                            text: "Exercise"
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.White
                            textStyle.fontSize: FontSize.Large

                        }
                        preferredWidth: 600.0
                        preferredHeight: 120.0
                        topPadding: 20.0
                        horizontalAlignment: HorizontalAlignment.Center
                        topMargin: 50.0
                    }
                    Container {
                        id: glossary
                        background: darkBlue.imagePaint
                        onTouch: {
                            glossary.background = Color.create("#ff2925b9")
                            if (event.isUp()) {
                                glossary.background = darkBlue.imagePaint
                                // Handle click here.
                            }
                        }
                        Label {
                            text: "Glossary"
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.White
                            textStyle.fontSize: FontSize.Large

                        }
                        preferredWidth: 600.0
                        preferredHeight: 120.0
                        topPadding: 20.0
                        horizontalAlignment: HorizontalAlignment.Center
                        topMargin: 50.0
                    }
                }
                attachedObjects: [
                    ImagePaintDefinition {
                        id: background
                        repeatPattern: RepeatPattern.XY
                        imageSource: "asset:///icons/bg-round.png"
                    },
                    ImagePaintDefinition {
                        id: darkBlue
                        repeatPattern: RepeatPattern.XY
                        imageSource: "asset:///icons/botao-azul-escuro.png"
                    }
                ]
            }
            attachedObjects: [
                ComponentDefinition {
                    id: about1
                    source: "About.qml"
                },
                ComponentDefinition {
                    id: registo
                    source: "Input.qml"
                },
                ComponentDefinition {
                    id: exercicio
                    source: "Exercise.qml"
                }
            ]
            actions: [
                ActionItem {
                    title: "Logout"
                    imageSource: "asset:///icons/ic_cancel.png"
                    onTriggered: {
                        menu.close()
                    }
                    ActionBar.placement: ActionBarPlacement.InOverflow
                }
            ]
        }
    }    
}

