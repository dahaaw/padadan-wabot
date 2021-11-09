const { 
    _user_cart 
} = require('../../../models');
const TEXT = require('./text');

exports.get = async (user) => {
    const hasil = {data: [], text: ``, session: 'cart'};
    
    // getting cart by user id 
    hasil.data = await _user_cart.findAll({where:{user}});

    if(!hasil.data.length){
        hasil.text = TEXT.kosong();
        hasil.session = 'cart kosong';
        return hasil;
    };

    hasil.text = `Isi keranjang`;
    hasil.data.forEach((v, i) => hasil.text += `
${v.product}`);

    return hasil;

}