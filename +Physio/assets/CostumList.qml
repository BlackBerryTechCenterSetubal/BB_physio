
import bb.cascades 1.2

// Item component for the item list presenting available recipes
Container {
    id: listItem
    layout: DockLayout {
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        layout: DockLayout {
        }
        Container {
            id: highlightContainer
            background: Color.create("#75b5d3")
            opacity: 0.0
            preferredWidth: 760
            preferredHeight: 250
            horizontalAlignment: HorizontalAlignment.Center
        }
        // The Item content an image and a text
        Container {
            id: itemCont
            leftPadding: 3
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            topPadding: 5.0
            rightPadding: 3.0
            ImageView {
                preferredWidth: 200
                preferredHeight: 250
                // The image is bound to the data in models/recipemodel.xml image attribute.
                imageSource: ListItemData.image
            }
            Label {
                // The title is bound to the data in models/recipemodel.xml title attribute.
                text: ListItemData.title
                leftMargin: 100
                verticalAlignment: VerticalAlignment.Center
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.Black
            } // Label
        } // Container
    } // Container
    // Highlight function for the highlight Container
    function setHighlight(highlighted) {
        if (highlighted) {
            itemCont.background = Color.create("#3498DB");
        } else {
            itemCont.background = Color.White;
        }
    }
    // Connect the onActivedChanged signal to the highlight function
    ListItem.onActivationChanged: {
        setHighlight(ListItem.active);
    }
    // Connect the onSelectedChanged signal to the highlight function
    ListItem.onSelectionChanged: {
        setHighlight(ListItem.selected);
    }
    topMargin: 2.0
    background: Color.White
}
