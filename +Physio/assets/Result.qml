import bb.cascades 1.2

Sheet {
    id: result
    Page {
        id: res
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
                    text: "Register - Result"
                    textStyle.color: Color.White
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.XLarge
                }
            }
            TextArea {
                text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                editable: false
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                layout: DockLayout {

                }
                preferredWidth: 800.0
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    imageSource: "asset:///icons/barra-verde.png"
                    translationX: 40.0
                }
                ImageView {
                    imageSource: "asset:///icons/barra-amarela.png"
                    translationX: 260.0

                }
                ImageView {
                    imageSource: "asset:///icons/barra-vermelha.png"
                    translationX: 480.0
                }
            }
            Container {
                preferredWidth: 800.0
                preferredHeight: 100.0
                translationY: -20.0
                layout: DockLayout {

                }
                ImageView {
                    id: verde
                    imageSource: "asset:///icons/seta-verde.png"
                    translationY: 0.0
                    translationX: 110.0
                }
                ImageView {
                    id: amarela
                    imageSource: "asset:///icons/seta-amarela.png"
                    translationY: 0.0
                    translationX: 330.0
                }
                ImageView {
                    id: vermelha
                    imageSource: "asset:///icons/seta-vermelha.png"
                    translationY: 0.0
                    translationX: 550.0
                }
            }
            Container {
                layout: DockLayout {

                }
                preferredWidth: 800.0
                preferredHeight: 100.0
                translationY: -70.0
                Label {
                    id: good
                    text: "GOOD"
                    translationX: 100.0
                }
                Label {
                    id: medium
                    text: "MEDIUM"
                    translationX: 300.0
                }
                Label {
                    id: bad
                    text: "BAD"
                    translationX: 570.0
                }
            }
            TextArea {
                text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                editable: false
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                id: ok
                background: blueButton.imagePaint
                onTouch: {
                    ok.background = Color.create("#ff2925b9")
                    if (event.isUp()) {
                        ok.background = blueButton.imagePaint
                        result.close()
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
            }
            attachedObjects: [
                ImagePaintDefinition {
                    id: blueButton
                    repeatPattern: RepeatPattern.XY
                    imageSource: "asset:///icons/botao-azul.png"
                }
            ]
        }

    }

}
