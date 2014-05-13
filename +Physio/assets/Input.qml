/* Copyright (c) 2012 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bb.cascades 1.2
import "Common"

Page {

    ScrollView {

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

                ImageView {
                    imageSource: "asset:///icons/seta-vermelha.png"
                    preferredHeight: 80.0
                    preferredWidth: 80.0
                    translationX: 190.0
                }

                Label {
                    text: "Batimento Cardiaco - Pressão Arterial"
                    textStyle.color: Color.White
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.Large
                    translationY: -20.0

                }

            }

            TextArea {
                text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                editable: false
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                background: Color.create("#D0D3D4")
                topMargin: 100.0
                preferredWidth: 680.0
                preferredHeight: 142.0
                topPadding: 10.0
                layout: DockLayout {
                }
                translationX: 50.0
                horizontalAlignment: HorizontalAlignment.Left
                TextField {
                    textFit.minFontSizeValue: 10.0
                    preferredWidth: 500.0
                    translationX: 20.0
                    translationY: 20.0
                }
                ImageView {
                    imageSource: "asset:///icons/batimento-cardiaco.png"
                    horizontalAlignment: HorizontalAlignment.Right
                    translationX: -20.0

                }
            }
            Container {
                background: Color.create("#D0D3D4")
                topMargin: 40.0
                preferredWidth: 680.0
                preferredHeight: 142.0
                topPadding: 10.0
                layout: DockLayout {
                }
                translationX: 50.0
                TextField {
                    textFit.minFontSizeValue: 10.0
                    preferredWidth: 500.0
                    translationX: 20.0
                    translationY: 20.0
                }
                ImageView {
                    imageSource: "asset:///icons/pressao-alta.png"
                    horizontalAlignment: HorizontalAlignment.Right
                    translationX: -20.0

                }
            }
            Container {
                background: Color.create("#D0D3D4")
                topMargin: 40.0
                preferredWidth: 680.0
                preferredHeight: 142.0
                topPadding: 10.0
                layout: DockLayout {
                }
                translationX: 50.0
                TextField {
                    textFit.minFontSizeValue: 10.0
                    preferredWidth: 500.0
                    translationX: 20.0
                    translationY: 20.0
                }
                ImageView {
                    imageSource: "asset:///icons/pressao-baixa.png"
                    horizontalAlignment: HorizontalAlignment.Right
                    translationX: -20.0

                }
            }
            Container {
                background: Color.create("#2980B9")
                onTouch: {
                    if (event.isUp()) {

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

        }

    }
}
