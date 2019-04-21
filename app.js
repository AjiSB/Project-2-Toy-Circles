var methodOverride = require('method-override')

// https://www.npmjs.com/package/body-parser
var bodyParser = require('body-parser')
var express = require('express');
var app = express();

//integrate method override with express
// override with POST having ?_method=DELETE
	app.use(methodOverride('_method'))

app.use(express.static("public"));

//integrate body-parser with express

	// parse application/x-www-form-urlencoded
	app.use(bodyParser.urlencoded({ extended: false }))
	 
	// parse application/json
	app.use(bodyParser.json())


var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'toycircles_db'
});
 
connection.connect();


// curl -X GET http://localhost:3001/animals

app.get('/animals', function(req, res){
	connection.query('SELECT * FROM animals', function (error, results, fields) {
	  if (error) res.send(error)
	  else res.json(results);
	});
});

//you can't access a post from the browser
	/*
		the only way to access a post route is by using one of the following

			ajax

			a form

			a curl call

				curl -d "animal_name=bengal+tiger" -X POST http://localhost:3001/animals

			chrome extension named post man 
	*/
app.post('/animals', function(req, res){

	connection.query('INSERT INTO animals (animal_name) VALUES (?)', [req.body.animal_name],function (error, results, fields) {
	  if (error) res.send(error);
	  else res.redirect('/');
	});
});

//so if the user hits a route that does not exist then redirec them to the home page
app.get('*', function(req, res){
	res.redirect('/');
});

app.listen(3001, function(){
	console.log('listening on 3001');
});






