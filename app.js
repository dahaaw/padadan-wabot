require('dotenv').config();
const { Client } = require('whatsapp-web.js');
const {_setting} = require('./models');
const waSession = require('./service/session/waSession');
const messageHandler = require('./service/messagesHandler');

_setting.findOne({where: {name: 'wa session'}})
.then(d => {
  console.log(d.value)
    const client = new Client({ 
        restartOnAuthFail: true,
        puppeteer: {
          headless: true,
          args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage',
            '--disable-accelerated-2d-canvas',
            '--no-first-run',
            '--no-zygote',
            '--single-process', // <- this one doesn't works in Windows
            '--disable-gpu'
          ],
        },
        session: JSON.parse(d.value)
      });
    
    client.on('qr', (qr) => {
        console.log('QR RECEIVED', qr);
    });
    
    client.on('ready', () => {
        console.log('Client is ready!');
    });
    
    client.on('authenticated', (session) => waSession.save(session));

    client.on('message', message => {
        messageHandler(client, message);
    });
    
    client.initialize();

})
.catch(e => console.log(e));