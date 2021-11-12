const {Op} = require('sequelize');
const {
    _product,
    _product_tag, 
} = require('../../../models');
const TEXT = require('./text');

exports.home = () => {
    const hasil = {data: [], text: ``, session: 'search'};
    hasil.text = TEXT.home();
    return hasil;
};

exports.result = async (q) => {
    const hasil = {data: [], text: ``, session: 'searchResult'};

    const listProduct;
    const byTag = await _product_tag.findOne({where: {name: {[Op.like]: `%${q}%`}}});
    if(byTag){
        const listProductByTag = _product.findAll({where: {tag: {[Op.contains]: [byTag.id]}}});
        listProduct = [...listProductByTag]
    }

}