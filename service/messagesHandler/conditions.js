const CARI = require('./cari');
const CART = require('./cart');
const CATEGORY = require('./category');
const TEXT = require('./text');

module.exports = async (user, message, chatHistory) => {

    let hasil = {text:'', data: null, session: ''};

    // DEFAULT MESSAGE
    hasil.text = TEXT.home();

    // DEFAULT SESSION
    hasil.session = 'home';
    
    // HOME
    if(chatHistory.session === 'home'){
        // HOME -> CARI
        if(message.body === "1" || message.body.split(" ").includes("1")) hasil = {...hasil, ...await CARI.home()};

        // HOME -> CATEGORY
        if(message.body === "2" || message.body.split(" ").includes("2")) hasil = {...hasil, ...await CATEGORY.home()};

        // HOME -> KERANJANG
        if(message.body === "3" || message.body.split(" ").includes("3")) hasil = {...hasil, ...await CART.get(user)};

    }



    return hasil;
    
}