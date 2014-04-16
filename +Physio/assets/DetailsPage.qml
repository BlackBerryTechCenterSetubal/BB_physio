/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
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

import bb.cascades 1.0
import bb.data 1.0

Page {
    content: ListView {
        id: myListView
        
        // Associate the list view with the data model that's defined in the
        // attachedObjects list
        dataModel: dataModel
        
        listItemComponents: [
            ListItemComponent {
                type: "item"
                
                // Use a standard list item to display the data in the model
                StandardListItem {
                    title: ListItemData.firstname + " " + ListItemData.lastname
                    imageSource: ListItemData.image
                    description: ListItemData.title
                }
            } // end of ListItemComponent
        ]
        accessibility.name: "TODO: Add property content"
    } // end of ListView
    
    attachedObjects: [
        GroupDataModel {
            id: dataModel
        },
        DataSource {
            id: dataSource
            
            // Load the data from an SQL database, based on a specific query
            source: "http://localhost/phpmyadmin/#PMAURL-5:db_structure.php?db=fisio&table=&server=1&target=&token=07aa2b56716e07fdcac935106a3cfa06"
            query: "select * from users order by id, name"
            
            onDataLoaded: {
                // After the data is loaded, insert it into the data model
                dataModel.insertList(data);
            }
        } // end of DataSource
    ]
    
    onCreationCompleted: {
        // After the root Page is created, direct the data source to start
        // loading data
        dataSource.load();
    }
} // end of Page