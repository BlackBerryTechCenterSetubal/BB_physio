import bb.cascades 1.2
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
                    title: "Name: " + ListItemData.name 
                    description:"Password: " +  ListItemData.password
                }
            } // end of ListItemComponent
        ]
    } // end of ListView
    
    attachedObjects: [
        GroupDataModel {
            id: dataModel
        },
        DataSource {
            id: dataSource
            
            // Load the data from JSON
            source: "http://ebusinesslab.esce.ips.pt/fisioDB/index.php/user/"  
      
            onDataLoaded: {
                // After the data is loaded, clear any existing items in the data
                // model and populate it with the new data
                dataModel.clear();
                dataModel.insertList(data)
            }
            type: DataSourceType.Json
            remote: true
        } // end of DataSource
    ]
    
    onCreationCompleted: {
        // After the root Page is created, direct the data source to start
        // loading data
        dataSource.load();
    }
} // end of Page
