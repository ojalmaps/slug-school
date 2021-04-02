
// Your web app's Firebase configuration
var firebaseConfig = {
  // Can be found in the Project Console
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

// Reference answers collection
var answersRef = firebase.database().ref('QuickForm Answers')//folder 

// Listen for form submit
document.getElementById('quickForm').addEventListener('submit', submitForm);

// Error if Input is empty
function IsEmpty() {
if (document.forms['frm'].question.value === "") {
  alert("empty");
  return false;
}
return true;
}


// Submit form
function submitForm(e) {
  e.preventDefault();

  // Get values
  var overall = getInputVal('overall1');
  var enjoyment = getInputVal('enjoyment1');
  var workload = getInputVal('workload1');
  var prepared = getInputVal('prepared1');
  var helpful = getInputVal('helpful1');
  var experience = getInputVal('experience1');

  // Save message to firebase
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



