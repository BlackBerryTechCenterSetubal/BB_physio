
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
            opacity: 0.0
            preferredWidth: 760
            preferredHeight: 130
            horizontalAlignment: HorizontalAlignment.Center
        }
        // The Item content an image and a text
        Container {
            id: listCont
            background: Color.White
            leftPadding: 3
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            topPadding: 5.0
            translationX: 10.0
            ImageView {
                preferredWidth: 150
                preferredHeight: 150
                // The image is bound to the data in models/recipemodel.xml image attribute.
                imageSource: ListItemData.image
            }
            Label {
                id: title
                // The title is bound to the data in models/recipemodel.xml title attribute.
                text: ListItemData.title
                leftMargin: 20
                verticalAlignment: VerticalAlignment.Center
                textStyle.base: SystemDefaults.TextStyles.TitleText
                textStyle.color: Color.Black
            } // Label
        } // Container
    } // Container

    // Highlight function for the highlight Container
    function setHighlight(highlighted) {
        if (highlighted) {
            {
                if (title.text == "Not Tired At All")
                    listCont.background = Color.create("#3498DB")
                if (title.text == "A Litle Tired")
                    listCont.background = Color.create("#27AE60")
                if (title.text == "Tired")
                    listCont.background = Color.create("#F1C40F")
                if (title.text == "Realy Tired")
                    listCont.background = Color.create("#E67E22")
                if (title.text == "So Tired I Can't Go Anymore")
                    listCont.background = Color.create("#E74C3C")
            }
        } else {
            highlightContainer.opacity = 0.0;
            listCont.background = Color.White

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

}
