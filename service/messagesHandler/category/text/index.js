exports.home = (data) => {
let init = `Berikut list kategory produk yang tersedia`;
data.map((v, i) => init += `
${i+1} ${v.name[0].toUpperCase() + v.name.slice(1)}`)
return init;
}