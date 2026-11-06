import express from 'express';
import dotenv from 'dotenv';
import { testConnection } from './src/models/index.js';

dotenv.config();

const app = express();
const port = process.env.APP_PORT || 3000;

app.get('/test', (_req, res) => {
  res.status(200).json({ message: 'API funcionando' });
});

try {
  await testConnection();
  app.listen(port, () => {
    console.log(`API escuchando en el puerto ${port}`);
  });
} catch (error) {
  console.error('No se pudo iniciar la API por un error de conexión a la base de datos:', error);
  process.exitCode = 1;
}