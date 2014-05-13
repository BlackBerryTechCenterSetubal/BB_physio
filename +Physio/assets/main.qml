/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */import bb.cascades 1.2
import bb.cascades 1.2
import bb.data 1.0
import "Common"
import "controls"

NavigationPane {
    id: main
    Menu.definition: MenuDefinition {
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: "Logout"
                imageSource: "asset:///icons/ic_cancel.png"
                onTriggered: {
                    login.open()
                }
            }
        ] // end of actions list
    } // end of MenuDefinition
    Page {
        id: home
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
                            main.push(registo.createObject());
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
            },
            Login {
                id: login
            }
        ]
        // ListView
    }
    onCreationCompleted: {
        if (_app.loginData(false) == false)
            login.open()
    }
    // Container
}
