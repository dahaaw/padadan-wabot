const { _setting } = require('../../models'); 
exports.save = async (session) => {
    const name = `wa session`;
    const value = JSON.stringify(session);
    const exist = await _setting.findOne({where: {name}});

    if(exist) _setting.update({value}, {where:{name}});
    if(!exist) _setting.create({name, value});
};