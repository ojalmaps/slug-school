const admin = require('./node_modules/firebase-admin');

const serviceAccount = require("./service-key.json");

const data = require("./FILENAME.json");

const collectionKey = "COLECTION_NAME"; //name of the collection

admin.initializeApp({
   credential: admin.credential.cert(serviceAccount),
   databaseURL: "https://slug-meet.firebaseio.com"
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
