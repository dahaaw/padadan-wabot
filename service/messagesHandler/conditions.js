const CARI = require('./cari');
const CART = require('./cart');
const TEXT = require('./text');

module.exports = async (user, message, chatHistory) => {

let hasil = {text:'', data: [], session: 'home'};

// DEFAULT MESSAGE
hasil.text = TEXT.home();

console.log({chatHistory})
if(chatHistory.session === 'home'){
    // HOME -> CARI
    if(message.body === "1" || message.body.split(" ").includes("1")) hasil = {...hasil, ...await CARI.home()};

    // HOME -> KERANJANG
    if(message.body === "3" || message.body.split(" ").includes("3")) hasil = {...hasil, ...await CART.get(user)};

}

return hasil;
    
}