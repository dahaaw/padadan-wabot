var DataTypes = require("sequelize").DataTypes;
var __chat_history = require("./_chat_history");
var __product = require("./_product");
var __product_tag = require("./_product_tag");
var __product_variant = require("./_product_variant");
var __setting = require("./_setting");
var __user = require("./_user");
var __user_cart = require("./_user_cart");

function initModels(sequelize) {
  var _chat_history = __chat_history(sequelize, DataTypes);
  var _product = __product(sequelize, DataTypes);
  var _product_tag = __product_tag(sequelize, DataTypes);
  var _product_variant = __product_variant(sequelize, DataTypes);
  var _setting = __setting(sequelize, DataTypes);
  var _user = __user(sequelize, DataTypes);
  var _user_cart = __user_cart(sequelize, DataTypes);

  _product_variant.belongsTo(_product, { as: "product__product", foreignKey: "product"});
  _product.hasMany(_product_variant, { as: "_product_variants", foreignKey: "product"});
  _user_cart.belongsTo(_product, { as: "product__product", foreignKey: "product"});
  _product.hasMany(_user_cart, { as: "_user_carts", foreignKey: "product"});
  _user_cart.belongsTo(_product_variant, { as: "product_variant__product_variant", foreignKey: "product_variant"});
  _product_variant.hasMany(_user_cart, { as: "_user_carts", foreignKey: "product_variant"});
  _chat_history.belongsTo(_user, { as: "user__user", foreignKey: "user"});
  _user.hasMany(_chat_history, { as: "_chat_histories", foreignKey: "user"});
  _user_cart.belongsTo(_user, { as: "user__user", foreignKey: "user"});
  _user.hasMany(_user_cart, { as: "_user_carts", foreignKey: "user"});

  return {
    _chat_history,
    _product,
    _product_tag,
    _product_variant,
    _setting,
    _user,
    _user_cart,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
