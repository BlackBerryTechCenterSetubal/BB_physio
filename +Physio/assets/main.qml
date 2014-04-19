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



Page {

    id: main
    Container {

        verticalAlignment: VerticalAlignment.Fill
        layout: StackLayout {
        }
        background: back.imagePaint
        Label {
            text: "+ Physio"
            textFit.maxFontSizeValue: 16.0
            textFit.minFontSizeValue: 18.0
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            textStyle.color: Color.White
        }
        Container {
            topMargin: 200.0
            horizontalAlignment: HorizontalAlignment.Center
            layout: StackLayout {

            }

            TextField {
                id: email

                topMargin: 40.0
                maxWidth: 700.0
                accessibility.name: "email"
                hintText: "email"
                validator: Validator {
                    id: validateuser
                    state: ValidationState.Invalid
                    errorMessage: "Invalid user"
                    onValidate: {

                    }
                }
            }
            TextField {
                id: pass
                topMargin: 40.0
                maxWidth: 700.0
                accessibility.name: "password"
                hintText: "password"

                validator: Validator {
                    id: validatePass
                    state: ValidationState.Invalid
                    errorMessage: "Invalid user"
                    onValidate: {

                    }
                }
            }
            Button {
                text: "LOGIN"
                topMargin: 60.0
                minWidth: 700.0
                onClicked: {
                    menu.open()
                }
            }
            Button {
                text: "RESGISTER"
                topMargin: 30.0
                minWidth: 700.0
                onClicked: {
                    menu.open()
                }
            }

        }

    }
    attachedObjects: [
        ImagePaintDefinition {
            id: back
            repeatPattern: RepeatPattern.Fill
            imageSource: "asset:///images/login_background.png"
        },
        NetworkActivity {
            id: progressIndicator

            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            title: qsTr("Retrieving Headers")
        },
        Sheet {

            id: menu
            peekEnabled: false
            NavigationPane {
                id: nav
                Page {
                    id: home1
                    Container {

                        background: background.imagePaint 
                        layout: StackLayout {
                        }

                        Label {
                            text: "+Physio"
                            textFit.maxFontSizeValue: 16.0
                            textFit.minFontSizeValue: 18.0
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            textStyle.color: Color.White
                        }

                        // A Container for the list is padded at the top and bottom to make room for decorations.
                        Container {
                            topPadding: 15
                            bottomPadding: topPadding
                            ListView {
                                id: recipeList
                                dataModel: XmlDataModel {
                                    source: "/models/recipemodel.xml"
                                }
                                listItemComponents: [
                                    ListItemComponent {
                                        type: "recipeitem"
                                        RecipeItem {
                                        }

                                    }
                                ]
                                onTriggered: {
                                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
                                    var chosenItem = dataModel.data(indexPath);

                                    if (chosenItem.title == "Registo")
                                        nav.push(registo.createObject());
                                    if (chosenItem.title == "Exercicios")
                                        nav.push(registo.createObject());
                                    if (chosenItem.title == "")
                                        nav.push(registo.createObject());
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
                    attachedObjects: [
                        ImagePaintDefinition {
                            id: background
                            repeatPattern: RepeatPattern.XY
                            imageSource: "asset:///images/login_background.png"
                        }
                    ]                   
                    actions: [
                        ActionItem {
                            title: "Logout"
                            onTriggered: {
                                menu.close();
                            }
                        },
                        ActionItem {
                            title: "Options"
                        },
                        ActionItem {
                            title: "About"
                            onTriggered: {
                                nav.push(about1.createObject())

                            }
                            imageSource: "asset:///images/ic_info.png"
                        }
                    ]

                    // Container
                }

            }
        }

    ]

}
