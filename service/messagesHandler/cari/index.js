const TEXT = require('./text');

exports.home = () => {
    const hasil = {data: [], text: ``, session: 'cari'};
    hasil.text = TEXT.home();
    return hasil;
};

exports.get = () => {
    
}