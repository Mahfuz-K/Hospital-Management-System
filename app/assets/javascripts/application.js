
//= require jquery3
//= require popper
//= require bootstrap


  // Initialize Bootstrap components
  var alertList = document.querySelectorAll('.alert');
  alertList.forEach(function(alert) {
    new bootstrap.Alert(alert);
  });
  
  
  

