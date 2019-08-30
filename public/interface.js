function validateForm() {
  var x = document.forms["sign_up"]["username"].value;

  $.get( '/validate/new', { username: username }).done(
    function(data) { console.log(data);
      if (data == 'true') {
        alert("Username Taken. Please try again.");
        return false;
      } else {
        return true
      };

    } );


};
