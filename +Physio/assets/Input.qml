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
        Container {
            topMargin: 200.0
            horizontalAlignment: HorizontalAlignment.Center

            minHeight: 900.0
            maxHeight: 900.0
            Label {

                text: "Tensão MAX"
                textFit.minFontSizeValue: 12.0
                textStyle.color: Color.White
            }
            TextField {

                topMargin: 40.0
                maxWidth: 700.0
                accessibility.name: "email"
                hintText: "Tensão max"

            }
            Label {

                text: "Tensão MIN"
                textFit.minFontSizeValue: 12.0
                textStyle.color: Color.White
            }
            TextField {
                topMargin: 40.0
                maxWidth: 700.0
                accessibility.name: "password"
                hintText: ""

            }
        }

    }
}