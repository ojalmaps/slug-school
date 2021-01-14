
// Your web app's Firebase configuration
var firebaseConfig = {
    apiKey: "AIzaSyC9XQZOn3e8hl35jeafJGVm1DbkbiRyua8",
    authDomain: "slug-meet.firebaseapp.com",
    databaseURL: "https://slug-meet-default-rtdb.firebaseio.com",
    projectId: "slug-meet",
    storageBucket: "slug-meet.appspot.com",
    messagingSenderId: "271692540579",
    appId: "1:271692540579:web:d4a4135810158b60bd2d16"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

// Reference answers collection
var answersRef = firebase.database().ref('QuickForm Answers')

// Listen for form submit
document.getElementById('quickForm').addEventListener('submit', submitForm);

// Submit form
function submitForm(e) {
    e.preventDefault();

    // Get values
    var overall = getInputVal('overall');
    var enjoyment = getInputVal('enjoyment');
    var workload = getInputVal('workload');
    var prepared = getInputVal('prepared');
    var helpful = getInputVal('helpful');
    var experience = getInputVal('experience');

    // Save message
    saveMessage(overall, enjoyment, workload, prepared, helpful, experience);

    // Show alert
    document.querySelector('.alert').style.display = 'block';

    // Hide alert after 3 seconds
    setTimeout(function(){
        document.querySelector('.alert').style.display = 'none';
    }, 3000);

    // Clear form
    document.getElementById('quickForm').reset();
}

// Function to get form values 
function getInputVal(id){
    return document.getElementById(id).value;
}

// Save message to firebase
function saveMessage(overall, enjoyment, workload, prepared, helpful, experience){
    var newAnswersRef = answersRef.push();
    newAnswersRef.set({
        overall:overall,
        enjoyment:enjoyment,
        workload:workload,
        prepared:prepared,
        helpful:helpful,
        experience:experience
    });
}
