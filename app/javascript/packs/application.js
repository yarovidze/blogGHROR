
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "jquery"
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;
import "@rails/actiontext"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "../js/reply_to_comment"

require("@rails/actiontext")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// $('.reply').click(function(){
//     $(this).parent('.comment').find('> .form-reply-hide').removeClass('form-reply-hide');
//     $(this).addClass('form-reply-hide')
// });


