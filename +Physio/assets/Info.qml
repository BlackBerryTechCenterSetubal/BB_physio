import bb.cascades 1.2
Sheet {
    id: about
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
                    text: "About"
                    textStyle.color: Color.White
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.XLarge
                    translationY: 20.0
                }
            }
            ImageView {
                imageSource: "asset:///icons/logo-physio-plan.png"
                horizontalAlignment: HorizontalAlignment.Center
            }
            TextArea {
                text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                editable: false
            }
        }
        actions: [
            ActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "Close"
                onTriggered: {
                    about.close();
                }
                imageSource: "asset:///icons/ic_cancel.png"
            }
        ]
    }

}
