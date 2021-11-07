const {_chat_history} = require('../../models');

exports.getLast = (user) => _chat_history.findOne({where: {user}, order: [['id', 'DESC']]});