const {_user} = require('../../models');

exports.checkAndAdd = async (whatsapp) => {
    let exist = await _user.findOne({where: {whatsapp}});
    if(!exist) exist = _user.create({whatsapp});
    return exist.id;
}