import bb.cascades 1.2
Sheet {
    id: loading
    Page {
        Container {
            onCreationCompleted: {
                OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;
            }
            ImageView {
                id: loadingLogo
                horizontalAlignment: HorizontalAlignment.Center
                imageSource: "asset:///icons/logo-physio-plan.png"
                accessibility.name: "TODO: Add property content"
                loadEffect: ImageViewLoadEffect.Subtle
                verticalAlignment: VerticalAlignment.Center
                translationY: 300.0
                onCreationCompleted: {
                    load.play()
                }
            }
        }
        attachedObjects: [
            FadeTransition {
                id: load
                target: loadingLogo
                fromOpacity: 0.0
                duration: 4000
                toOpacity: 1.0
                onEnded: {
                    loading.close()
                }

            }
        ]
    }
}