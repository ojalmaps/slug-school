Use this tutorial: https://medium.com/@devesu/how-to-upload-data-to-firebase-firestore-cloud-database-63543d7b34c5

For grade distribution data logging:
Export the .xls or .xlsx file to csv 
Use a csv to json converter to convert the csv file to json
Index.js is the JavaScript program to export a JSON file to Cloud Firestore
Index.js helps us export the grade distribution data to Firestore for easy access

In Index.js:
In terminal run:

npm init

// and

npm install firebase-admin
