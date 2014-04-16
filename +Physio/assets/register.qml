import bb.cascades 1.2

Page {
    Container {
        WebView {
            
            url: "https://www.google.pt/"
            settings.zoomToFitEnabled: true
            settings.activeTextEnabled: true
            accessibility.labelledBy: todoLabelId

        }

    }
}
