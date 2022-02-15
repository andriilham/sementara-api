require('dotenv/config')

const express = require('express')
const bodyParser = require('body-parser')
const routes = require('./src/routes')
const fs = require('fs')
const https = require('https')

// Define SSL Certificate
const certificate = fs.readFileSync(process.env.APP_SSL_CRT, 'utf8');
const privateKey = fs.readFileSync(process.env.APP_SSL_KEY, 'utf8');

// Instantiating the express app
const app = express();
// See the react auth blog in which cors is required for access
app.use((req, res, next) => {
	res.header("Access-Control-Allow-Origin", "*")
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization")
	res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE")
	next();
});// Setting up bodyParser to use json and set it to req.body
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

/////////////////////////////////////////////////////////////////////////////////////////////
// Use API 

app.use('/api', routes)

/////////////////////////////////////////////////////////////////////////////////////////////
// Error handling 

app.use(function (err, req, res, next) {
	if (err.name === 'UnauthorizedError') { // Send the error rather than to show it on the console
		res.status(401).send(err);
	}
	else {
		next(err);
	}
});

app.get('*', function (req, res) {
	res.status(404).send('Sorry, are you lost m8?');
});

// Starting the app on PORT 8900
const PORT = process.env.PORT || 8900;
// app.listen(PORT, () => {
// 	// eslint-disable-next-line
// 	console.log(`Magic happens on port ${PORT}`);
// });

const httpsServer = https.createServer({ key: privateKey, cert: certificate }, app);
httpsServer.listen(PORT, () => {
	// eslint-disable-next-line
	console.log(`Magic happens on port ${PORT}`);
});