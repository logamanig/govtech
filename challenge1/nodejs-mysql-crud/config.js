console.log(`DB_HOSTNAME: ${process.env.DB_HOST}`);
var config = {
	database: {
		host:	  process.env.DB_HOST, // 'localhost', 	// database host
		user: 	  process.env.DB_USER, // 'root', 		// your database username
		password: process.env.DB_PWD, // 'root', 		// your database password
		port: 	  process.env.DB_PORT, //3306, 		// default MySQL port
		db: 	  process.env.DB_NAME, //'test' 		// your database name
	},
	server: {
		host: '127.0.0.1',
		port: '3000'
	}
}

module.exports = config
