// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

// const view_cart = document.getElementById('cart-link')
// const add_to_cart = document.getElementById('add-to-cart')

// add_to_cart.addEventListener('click', function() {
//   console.log("licked")
//   view_cart.classList.remove("d-none")
// });


// $(window.alert("hello"))
