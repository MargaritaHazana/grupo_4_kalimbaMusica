module.exports = {
  "development": {
    "username": "root",
    "password": "",
    "database": "kalimba_musica",
    "host": "127.0.0.1",
    "dialect": "mysql",
    "port": 3306,
    "define": {
      "paranoid":true,
    }
  },
  "test": {
    "username": "root",
    "password": null,
    "database": "database_test",
    "host": "127.0.0.1",
    "dialect": "mysql"
  },
  "production": {
    "username": "root",
    "password": null,
    "database": "database_production",
    "host": "127.0.0.1",
    "dialect": "mysql"
  }
}
