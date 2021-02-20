const admin = require('./node_modules/firebase-admin');

// service-key.json is the encryption key you get from firestore through a separate process
const serviceAccount = require("./SERVICE_KEY_NAME.json");

// FILENAME is the name of the file you converted from csv to json.
const data = require("./FILENAME.json");

// COLLECTION_NAME is the name you give the collection in Firestore. Examples are Winter2010, Spring2010, and Fall2011
const collectionKey = "COLECTION_NAME"; //name of the collection

admin.initializeApp({
   credential: admin.credential.cert(serviceAccount),
   // DATABASE_NAME is the name of the firebase project. Ours is currently called slug-meet
   databaseURL: "https://DATABASE_NAME.firebaseio.com"
});
const firestore = admin.firestore();

const settings = { timestampsInSnapshots: true };

firestore.settings(settings);

if (data && (typeof data === "object")) {

   Object.keys(data).forEach(docKey => {
      admin.firestore().collection(collectionKey).doc(docKey).set(data[docKey]).then((res) => {
         console.log("Document " + docKey + " successfully written!");

      }).catch((error) => {
         console.error("Error writing document: ", error);
      });

   });
}
