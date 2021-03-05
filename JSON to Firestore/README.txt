TUTORIAL:
https://medium.com/@devesu/how-to-upload-data-to-firebase-firestore-cloud-database-63543d7b34c5


Convert the initial file:
  1. Export the .xls or .xlsx file to csv 
  2. Use a csv to json converter to convert the csv file to json
    a. I used https://csvjson.com/csv2json


Description:
  1. Index.js = the JavaScript program to export a JSON file to Cloud Firestore (located inside your project folder)
  2. Index.js helps us export the grade distribution json to Firestore for easy access


In terminal run:
  1. npm init
    a. Just hit the "Enter" button a few times until you can input in the regular terminal again
  2. npm install firebase-admin
    a. This gives the tool needed to use Firebase Admin SDK


IMPORTANT:
Instead of running the code:
  1. Open a terminal in VSC/whatever IDE you use
  2. Change directory to one level before the folder that contains everything
    a. Ex: If the path to the project is "/User/Programming/FOLDER_NAME"
    b. Navigate to "/User/Programming"
  3. Type in the command "node FOLDER_NAME"
    a. Because there is no html file, simply running the code will just produce a "localhost refused to connect" error
    b. This is why we need to do node FOLDER_NAME
