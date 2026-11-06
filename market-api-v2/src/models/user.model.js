import bcrypt from 'bcrypt';
import { DataTypes } from 'sequelize';

const SALT_ROUNDS = 10;

export default function defineUserModel(sequelize) {
  const User = sequelize.define(
    'User',
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      fullName: {
        type: DataTypes.STRING,
        allowNull: false,
        field: 'full_name',
      },
      email: {
        type: DataTypes.STRING,
      },
      phoneNumber: {
        type: DataTypes.STRING,
        field: 'phone_number',
      },
      password: {
        type: DataTypes.STRING,
      },
      address: {
        type: DataTypes.STRING,
      },
      isActive: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
        field: 'is_active',
      },
      gender: {
        type: DataTypes.STRING,
      },
    },
    {
      tableName: 'users',
      timestamps: false,
      hooks: {
        beforeCreate: async (user) => {
          if (user.password) {
            user.password = await bcrypt.hash(user.password, SALT_ROUNDS);
          }
        },
        beforeUpdate: async (user) => {
          if (user.changed('password') && user.password) {
            user.password = await bcrypt.hash(user.password, SALT_ROUNDS);
          }
        },
      },
    },
  );

  User.prototype.comparePassword = function comparePassword(candidatePassword) {
    return this.password
      ? bcrypt.compare(candidatePassword, this.password)
      : Promise.resolve(false);
  };

  return User;
}