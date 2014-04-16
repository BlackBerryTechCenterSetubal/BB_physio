import bb.cascades 1.2
import "Common"

// The menu is created in the onCreationCompleted signal handler
// This is not necessary (you can add it directly), we do it like this
// since it has a SystemToast that will make the QML preview stop previewing.

Page {
    id: home1
    Container {
        background: Color.create("#b9000000")
        layout: StackLayout {

        }

        Label {
            text: "PhisioPlus"
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
                    source: "models/recipemodel.xml"
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
                    recipePage.source = chosenItem.file;
            
                    
                    if (chosenItem.title == "Registo") {
                        registo.open();
                    }
                }

            }
        } // ListView
    } // Container
    attachedObjects: [
        ComponentDefinition {
            id: recipePage
            source: "Intro.qml"
        },
        Sheet {
            id: registo
            content: Page {
                Button {
                    text: "Close Sheet"
                    onClicked: registo.close()
                }
            }
        },
        ComponentDefinition {
            id: cookbookMenu
            source: "CookbookMenu.qml"
        }
    ] // Container
}
