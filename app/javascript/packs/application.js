// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import 'bootstrap/dist/js/bootstrap'



Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function () {
    const alerts = document.querySelectorAll('.custom-alert');
  
    alerts.forEach(function (alert) {
      setTimeout(function () {
        alert.style.display = 'none';
      }, 2000);
    });
  });
  