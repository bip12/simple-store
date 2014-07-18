Simple_Store
-status: work in progress

- data model design: 
                    - the given data model for this app was more suitable for NoSQL db than RDBMS
                    - in order to fit the model into RDBMS, the model needs to have at least three tables
                    - this example app only uses two tables (product and availablestore)

- to view the app:
                  - clone the project into your local machine
                  - open up xcode project 
                  - run the app 
                  - currently app includes UI, and data model
                  - app was designed using storyboard and uses tab view, table view, and view controllers
                  - app includes database handler and jsonloader classes
                  - jsonloader loads the JSON file and parses the data
                  - databasehandler is incomplete...only createDatabase method is done.
                  - NSLog is used to display log messages so check your console output window.
- next goal:
            - finish databaseHandler's method
            - complete table view controller 
            - add detail view controller and link with table view controller
            
