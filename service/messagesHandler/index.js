const { _chat_history } = require('../../models');
const USER = require('../user');
const CHATHISTORY = require('../chatHistory');
const CONDITIONS = require('./conditions');

module.exports = async (client, message) => {
    // check data user
    const user = await USER.checkAndAdd(message.from);

    // check chat history
    const chatHistory = await CHATHISTORY.getLast(user);
    
    const forReply = await CONDITIONS(user, message, chatHistory);

    client.sendMessage(message.from, forReply.text);
        
    //  add new chat history
    _chat_history.create({ 
        user,
        session: forReply.session,
        data: forReply.data, 
        serverMessage: forReply.message, 
        userMessage: message.body 
    });   
}