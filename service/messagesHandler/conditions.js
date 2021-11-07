module.exports = (user, message, chatHistory) => {

let hasil = {message:'', data: [], session: 'home'};

// DEFAULT MESSAGE
hasil.message = `Selamat datang di ${process.env.NAME}
1. Lihat daftar kategori
2. Lihat keranjang belanja
3. Ubah profil
`;

console.log({chatHistory})
if(chatHistory.session === 'home'){
    console.log("MASUK HOME");
    if(message.body === "1" || message.body.split(" ").includes("1")){
        console.log("MASUK SATU");
        console.log({a:'huhuh'})
        hasil.message = `Isi keranjang`;
    }
}

return hasil;
    
}