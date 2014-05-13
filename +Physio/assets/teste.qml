import bb.cascades 1.2

NavigationPane {
    id: nav
    Page {
        id: home1
        Menu.definition: MenuDefinition {
            
            // Specify the actions that should be included in the menu
            actions: [
                ActionItem {
                    title: "Action 1"
                    imageSource: "asset:///icons/ic_cancel.png"
                    onTriggered: {
                        
                    }
                }
            ] // end of actions list
        } // end of MenuDefinition
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
            Container {
                background: Color.create("#D0D3D4")
                topMargin: 60.0
                preferredWidth: 660.0
                preferredHeight: 520.0
                topPadding: 60.0
                bottomPadding: topPadding
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    background: Color.create("#2980B9")
                    onTouch: {
                        if (event.isUp()) {

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
                    background: Color.create("#2980B9")
                    onTouch: {
                        if (event.isUp()) {

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
                    background: Color.create("#2980B9")
                    onTouch: {
                        if (event.isUp()) {
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
        }
        attachedObjects: [
            ComponentDefinition {
                id: about1
                source: "About.qml"
            },
            ComponentDefinition {
                id: registo
                source: "Input.qml"
            }
        ]
        // ListView
    }
    // Container
}
