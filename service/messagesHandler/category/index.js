const {_product_tag} = require('../../../models');
const TEXT = require('./text');

exports.home = async () => {
    const hasil = {data: [], text: ``, session: 'category'};
    const data = await _product_tag.findAll();

    // CREAT ARRAY OF ID 
    data.map(v => hasil.data.push(v.id))

    hasil.text = await TEXT.home(data);

    return hasil;
}