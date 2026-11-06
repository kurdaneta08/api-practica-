import dotenv from 'dotenv';
import { Sequelize } from 'sequelize';
import defineUserModel from './user.model.js';

dotenv.config();

const requiredVariables = ['DB_NAME', 'DB_USER', 'DB_PASSWORD', 'DB_HOST'];
const missingVariables = requiredVariables.filter((name) => !process.env[name]);

if (missingVariables.length > 0) {
  throw new Error(`Faltan variables de entorno para la base de datos: ${missingVariables.join(', ')}`);
}

const port = Number(process.env.DB_PORT || 5432);

if (!Number.isInteger(port) || port < 1 || port > 65535) {
  throw new Error('DB_PORT debe ser un puerto válido entre 1 y 65535.');
}

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    port,
    dialect: process.env.DB_DIALECT || 'postgres',
    logging: false,
  },
);

export const User = defineUserModel(sequelize);
export const models = { User };

export async function testConnection() {
  await sequelize.authenticate();
  console.log('Conexión a PostgreSQL establecida correctamente.');
}

export default sequelize;