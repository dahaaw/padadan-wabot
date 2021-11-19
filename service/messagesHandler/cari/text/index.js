exports.home = () => `Silahkan ketikkan nama barang atau kategori barang yang kamu cari`;

exports.result = (listProduct) => {
    let text = ``;

    if(!listProduct.length) return `mohon maaf produk yang kamu cari tidak ditemukan`;

    for(const [i, product] of listProduct.entries()){
        text += `${i+1}. ${product.name}
`
    }
    return text;
}