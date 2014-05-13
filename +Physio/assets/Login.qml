import bb.cascades 1.2
import bb.data 1.0
Sheet {
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
                background: Color.create("#D0D3D4")
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
                    background: Color.create("#2980B9")
                    onTouch: {
                        if (event.isUp()) {
                          login.close()
                          console.log(_app.jsonReader(10, 10).toString())
                          dataSource.load();
                          myListView.itemType()
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
                                login.close()
                                console.log("OK")
                                return "OK";
                            } else {
                                console.log("-------------LOGIN ERROR-------------" + email.text + data.name)
                                return "FAIL";
                            }
                        }
                    }
                
                }
            }
        }
    }
    attachedObjects: [
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
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
        }
    ]
}