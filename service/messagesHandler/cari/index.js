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

    let listProduct = [];

    if(q.length > 2){
        // SEARCH TAG PRODUCT LIKE q
        const byTag = await _product_tag.findOne({where: {name: {[Op.like]: `%${q}%`}}});
    
        // IF ANY TAG, SEARCH PRODUCT TAGEED WITH TAG q
        if(byTag){
            const listProductByTag = await _product.findAll({where: {tag: {[Op.contains]: [byTag.id]}}}); // ini masih error querynya
            listProduct = [...listProduct, ...listProductByTag];
        }
    }

    // SEARCH PRODUCT NAME LIKE q
    const listProductLike = await _product.findAll({where: {name: {[Op.like]: `%${q}%`}}});

    // MERGE LIST PRODUCT WITH LIST PRODUCT LIKE
    listProduct = [...listProduct, ...listProductLike];

    // GENERATE DATA
    for(const product of listProduct) hasil.data.push(product.id);

    // GENERATE TEXT
    hasil.text = await TEXT.result(listProduct);

    return hasil;
}