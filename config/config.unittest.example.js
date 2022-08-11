'use strict';

module.exports = appInfo => {

  return {
    knex: {
      client: {
        dialect: 'mysql',
        connection: {
          host: '127.0.0.1',
          port: '3306',
          user: 'root',
          password: '123456',
          database: 'jianghujs_jsoneditor'
        },
        pool: { min: 0, max: 10 },
        acquireConnectionTimeout: 30000,
      },
      app: true,
    },
  };

};
