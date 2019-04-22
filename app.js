var methodOverride = require('method-override')

var bodyParser = require('body-parser')
var express = require('express');
var app = express();
var ejs = require('ejs');
var path = require('path');
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'toycircles_db'
});
 
connection.connect();

//integrate method override with express
// override with POST having ?_method=DELETE
app.use(methodOverride('_method'))
app.set('views', path.join(__dirname, '/public'));
app.set('view engine', 'html');
app.engine('html', ejs.renderFile);

app.get('/', function(req, res) {
	connection.query('SELECT * FROM toy_inventory', function (error, results, fields) {
		res.render('index.html', {
			inventory: results
		});
	  });
});

app.get('/signup.html', function(req, res) {
	connection.query('SELECT * FROM interests', function (error, results, fields) {
		res.render('signup.html', {
			interests: results
		});
	});			
});


app.get('/admin_dashboard.html', function(req, res) {
	res.render('admin_dashboard.html');
});

app.get('/inventory.html', function(req, res) {
	connection.query('SELECT * FROM toy_inventory', function (error, results, fields) {
		res.render('inventory.html', {
			inventory: results
		});
	  });
});

app.get('/login.html', function(req, res) {
	res.render('login.html');
});

app.get('/dashboard.html', function(req, res) {
	res.render('dashboard.html');
});

app.get('/toydetails.html', function(req, res) {
	var id = req.query.id;
	connection.query('SELECT * FROM toy_inventory WHERE id =' + id, function (error, results, fields) {
		res.render('toydetails.html', {
			toy: results[0],
		});
	  });
});

app.get('/delete', function(req, res) {
	var id = req.query.id;
	connection.query('DELETE FROM toy_inventory WHERE id =' + id, function (error, results, fields) {
		res.redirect("/inventory.html");
	  });
});

//app.use(express.static("public"));

//integrate body-parser with express

	// parse application/x-www-form-urlencoded
	app.use(bodyParser.urlencoded({ extended: false }))
	 
	// parse application/json
	app.use(bodyParser.json())


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






