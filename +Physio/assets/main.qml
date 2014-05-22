import bb.cascades 1.2
import bb.data 1.0
import "Common"
import "controls"


TabbedPane {
    showTabsOnActionBar: true
    id: mainMenu
    Menu.definition: MenuDefinition {
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: "Logout"
                imageSource: "asset:///icons/ic_cancel.png"
                onTriggered: {
                    login.open()
                }
            },
            ActionItem {
                title: "Info"
                imageSource: "asset:///icons/menu-sobre.png"
                onTriggered: {
                    about.open()
                }
            }
        ] // end of actions list
    }
    attachedObjects: [
        Info {
            id: about
            peekEnabled: false
        },
        Sheet {
            id: login
            Page {
                id: log
                Container {
                    verticalAlignment: VerticalAlignment.Fill
                    layout: StackLayout {
                    }
                    background: Color.create("#3498DB")
                    horizontalAlignment: HorizontalAlignment.Center
                    topPadding: 30.0
                    ScrollView {
                        preferredHeight: 500.0
                        horizontalAlignment: HorizontalAlignment.Center
                        ImageView {
                            imageSource: "asset:///icons/logo-physio-plan.png"
                            horizontalAlignment: HorizontalAlignment.Center
                            preferredWidth: 500.0
                            preferredHeight: 500.0
                        }
                    }
                    Container {
                        topMargin: 40.0
                        horizontalAlignment: HorizontalAlignment.Center
                        layout: StackLayout {
                        }
                        background: background.imagePaint
                        preferredWidth: 700.0
                        preferredHeight: 650.0
                        topPadding: 60.0
                        TextField {
                            id: email
                            maxWidth: 600.0
                            accessibility.name: "email"
                            hintText: "email"
                            validator: Validator {
                                id: validateuser
                                state: ValidationState.Invalid
                                errorMessage: "Invalid user"
                                onValidate: {
                                }
                            }
                            horizontalAlignment: HorizontalAlignment.Center
                            topMargin: 20.0
                        }
                        TextField {
                            id: pass
                            topMargin: 50.0
                            maxWidth: 600.0
                            accessibility.name: "password"
                            hintText: "password"
                            inputMode: TextFieldInputMode.Password
                            validator: Validator {
                                id: validatePass
                                state: ValidationState.Invalid
                                errorMessage: "Invalid user"
                                onValidate: {
                                }
                            }
                            horizontalAlignment: HorizontalAlignment.Center
                        }
                        Container {
                            id: loginButton
                            background: darkBlue.imagePaint
                            onTouch: {
                                loginButton.background = Color.create("#ff2925b9")
                                if (event.isUp()) {
                                    loginButton.background = darkBlue.imagePaint
                                    console.log(_app.jsonReader(10, 10).toString())
                                    dataSource.load();
                                    myListView.itemType();
                                }
                            }
                            Label {
                                text: "Login"
                                horizontalAlignment: HorizontalAlignment.Center
                                textStyle.color: Color.White
                                textStyle.fontSize: FontSize.Large
                            }
                            preferredWidth: 600.0
                            preferredHeight: 100.0
                            topPadding: 20.0
                            horizontalAlignment: HorizontalAlignment.Center
                            topMargin: 50.0
                        }
                        attachedObjects: [
                            ImagePaintDefinition {
                                id: darkBlue
                                repeatPattern: RepeatPattern.XY
                                imageSource: "asset:///icons/botao-azul-escuro.png"
                            }
                        ]
                        Container {
                            ListView {
                                id: myListView
                                // Associate the list view with the data model that's defined in the
                                // attachedObjects list
                                dataModel: dataModel

                                listItemComponents: [
                                    ListItemComponent {
                                        type: "item"
                                        // Use a standard list item to display the data in the modelb
                                        StandardListItem {
                                            title: "Data: " + ListItemData.name
                                        }
                                    }
                                // end of ListItemComponent
                                ]
                                function itemType(data, indexPath) {
                                    if (data.name == email.text && data.password == pass.text) {
                                        //SET LOGIN STATE AND GRAB NAME
                                        _app.setName(email.text)
                                        _app.setLoginState(true)
                                        welcome.setText("Welcome " + email.text)
                                        console.log("LOADING: " + _app.getName().toString())
                                        login.close();
                                    } else {
                                        console.log("-------------LOGIN ERROR-------------" + email.text + data.name)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            onClosed: {
                email.text = ""
                pass.text = ""
            }
            attachedObjects: [
                GroupDataModel {
                    id: dataModel
                    grouping: ItemGrouping.None
                },
                Begin {
                    id: navigation
                    peekEnabled: false
                },
                DataSource {
                    id: dataSource
                    // Load the data from JSON
                    source: "http://ebusinesslab.esce.ips.pt/fisioDB/index.php/user/name/" + email.text
                    onDataLoaded: {
                        // After the data is loaded, clear any existing items in the data
                        // model and populate it with the new data
                        dataModel.clear();
                        dataModel.insertList(data)
                    }
                    type: DataSourceType.Json
                    remote: true
                },
                ImagePaintDefinition {
                    id: background
                    repeatPattern: RepeatPattern.XY
                    imageSource: "asset:///icons/bg-round.png"
                }
            ]
        }
    ]
    Tab {
        imageSource: "asset:///icons/ic_home.png"
        title: qsTr("Home")
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateImmediately
        Page {
            Container {
                background: Color.create("#3498DB")
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    ImageView {
                        id: logo
                        imageSource: "asset:///icons/logo-physio-plan.png"
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                TextArea {
                    id: welcome
                    editable: false
                    textStyle.color: Color.White
                    textStyle.fontWeight: FontWeight.Bold
                    textStyle.fontSize: FontSize.XXLarge
                    horizontalAlignment: HorizontalAlignment.Center
                    translationX: 100.0
                }
            }
            attachedObjects: [
                Loading {
                    id: loading
                    peekEnabled: false
                }
            ]
        }
    }
    Tab {
        title: qsTr("Registo")
        imageSource: "asset:///icons/menu-registro.png"
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateImmediately
        Page {
            Container {
                background: Color.create("#84d0d3d4")
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Center
                preferredHeight: 1280.0

                Container {
                    background: Color.create("#2980B9")
                    preferredWidth: 800.0
                    preferredHeight: 120.0
                    topPadding: 20.0
                    horizontalAlignment: HorizontalAlignment.Center
                    Label {
                        text: "Register"
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.fontSize: FontSize.XLarge
                    }
                }
                Container {
                    background: Color.create("#fff3c812")
                    preferredWidth: 800.0
                    preferredHeight: 100.0
                    horizontalAlignment: HorizontalAlignment.Center
                    Label {
                        text: "Batimento Cardiaco - Pressão Arterial"
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.fontSize: FontSize.Large
                        translationY: 20.0                 
                    }
                }
                ScrollView {
                    translationY: -10.0
                    Container {
                        TextArea {
                            text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                            editable: false
                            horizontalAlignment: HorizontalAlignment.Center
                        }
                        Container {
                            background: textBackground.imagePaint
                            topMargin: 100.0
                            preferredWidth: 600.0
                            preferredHeight: 142.0
                            topPadding: 10.0
                            layout: DockLayout {
                            }
                            translationX: 80.0
                            horizontalAlignment: HorizontalAlignment.Left
                            translationY: -90.0
                            TextField {
                                textFit.minFontSizeValue: 10.0
                                preferredWidth: 400.0
                                translationX: 20.0
                                translationY: 20.0
                                backgroundVisible: true
                                inputMode: TextFieldInputMode.Pin
                            }
                            ImageView {
                                imageSource: "asset:///icons/batimento-cardiaco.png"
                                horizontalAlignment: HorizontalAlignment.Right
                                translationX: -40.0
                            }
                        }
                        Container {
                            background: textBackground.imagePaint
                            topMargin: 40.0
                            preferredWidth: 600.0
                            preferredHeight: 142.0
                            topPadding: 10.0
                            layout: DockLayout {
                            }
                            translationX: 80.0
                            translationY: -90.0
                            TextField {
                                textFit.minFontSizeValue: 10.0
                                preferredWidth: 400.0
                                translationX: 20.0
                                translationY: 20.0
                                inputMode: TextFieldInputMode.Pin
                            }
                            ImageView {
                                imageSource: "asset:///icons/pressao-alta.png"
                                horizontalAlignment: HorizontalAlignment.Right
                                translationX: -40.0

                            }
                        }
                        Container {
                            background: textBackground.imagePaint
                            topMargin: 40.0
                            preferredWidth: 600.0
                            preferredHeight: 142.0
                            topPadding: 10.0
                            layout: DockLayout {
                            }
                            translationX: 80.0
                            translationY: -80.0
                            TextField {
                                textFit.minFontSizeValue: 10.0
                                preferredWidth: 400.0
                                translationX: 20.0
                                translationY: 20.0
                                inputMode: TextFieldInputMode.Pin
                            }
                            ImageView {
                                imageSource: "asset:///icons/pressao-baixa.png"
                                horizontalAlignment: HorizontalAlignment.Right
                                translationX: -40.0

                            }
                        }
                        Container {
                            id: ok
                            background: blueButton.imagePaint
                            onTouch: {
                                ok.background = Color.create("#ff2925b9")
                                if (event.isUp()) {
                                    result.open()
                                    ok.background = blueButton.imagePaint
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
                            translationY: -110.0
                        }
                    }
                }
                attachedObjects: [
                    ImagePaintDefinition {
                        id: textBackground
                        repeatPattern: RepeatPattern.XY
                        imageSource: "asset:///icons/registro-bg-cinza.png"
                    },
                    ImagePaintDefinition {
                        id: blueButton
                        repeatPattern: RepeatPattern.XY
                        imageSource: "asset:///icons/botao-azul.png"
                    },
                    Result {
                        id: result
                        peekEnabled: false
                    }
                ]
            }
        }

    }
    Tab {
        title: qsTr("Exercise")
        imageSource: "asset:///icons/menu-exercicio.png"
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
    }
    Tab {
        title: "Glossary"
        imageSource: "asset:///icons/menu-glossario.png"
    }
    onCreationCompleted: {
        loading.open()
        if (_app.getLoginState() == false)
            login.open()
    }
}
