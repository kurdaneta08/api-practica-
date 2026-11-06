import sequelize from './src/models/index.js';

export async function syncModels() {
  await sequelize.sync({ alter: true });
}

try {
  await syncModels();
  console.log('Modelos sincronizados correctamente con la base de datos.');
} catch (error) {
  console.error('No se pudieron sincronizar los modelos con la base de datos:', error);
  process.exitCode = 1;
} finally {
  try {
    await sequelize.close();
  } catch (error) {
    console.error('No se pudo cerrar la conexión a la base de datos:', error);
    process.exitCode = 1;
  }
}