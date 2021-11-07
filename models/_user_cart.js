const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('_user_cart', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    user: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: '_user',
        key: 'id'
      }
    },
    product: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: '_product',
        key: 'id'
      }
    },
    product_variant: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: '_product_variant',
        key: 'id'
      }
    },
    qty: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: '_user_cart',
    timestamps: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "user",
        using: "BTREE",
        fields: [
          { name: "user" },
        ]
      },
      {
        name: "product",
        using: "BTREE",
        fields: [
          { name: "product" },
        ]
      },
      {
        name: "product_variant",
        using: "BTREE",
        fields: [
          { name: "product_variant" },
        ]
      },
    ]
  });
};
