import bb.cascades 1.2
Page {
    Container {
        background: Color.create("#3498DB")
        layout: DockLayout {
        }
        
        ImageView {
            id: mImageViewIcon
            imageSource: "asset:///icons/logo-physio-plan.png"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            translationY: -90.0
        }
        ProgressIndicator {
            id: progressbar
            fromValue: 0
            toValue: 100
            value: splashScreen.state
            verticalAlignment: VerticalAlignment.Center
            onValueChanged: {
                if (value == 100) {
                    login.open()
                }
                splashScreen.play()
            }
            translationY: 460.0
            translationX: 20.0
        }
        Label {
            text: "LOADING..."
            textStyle.color: Color.White
            verticalAlignment: VerticalAlignment.Bottom
            translationY: -240.0
            horizontalAlignment: HorizontalAlignment.Center
        
        }
        attachedObjects: [
            ProgressIndicator {
                id: loading
            },
            TranslateTransition {
                id: splashScreen
                duration: 90000 //wait in milliseconds
                onEnded: {
                    progressbar.value = progressbar.value + 1
                }
            },
            Login {
                id: login
                peekEnabled: false
            }
        ]
    }
    onCreationCompleted: {
        splashScreen.play();
    }
}


