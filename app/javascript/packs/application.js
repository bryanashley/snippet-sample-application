// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

// Simple helper method for handling emoji selection
window.SelectEmoji = function(target) {
    document.querySelectorAll(".opt").forEach((el) => { 
        if(el != target){
            el.checked = false
        }
    });
    target.form.submit()
}

Rails.start()
Turbolinks.start()
