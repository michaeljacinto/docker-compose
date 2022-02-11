module.exports = {
  HOST: "REPLACE_HOST",
  USER: "REPLACE_USER",
  PASSWORD: "REPLACE_PASSWORD",
  DB: "REPLACE_DB",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
};
