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

//session stuff
var cookieParser = require('cookie-parser');

var session = require('express-session');

//allow sessions
app.use(session({ secret: 'app'}));
app.use(cookieParser());

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

app.get('/signup', function(req, res) {
	// insert new user into subscribers table
	connection.query('INSERT INTO subscriber (`name`, `email`, `password_hash`, `address`, `num_children`, `ages`) VALUES (?, ?, ?, ?, ?, ?)', [req.query.full_name, req.query.email, req.query.password, req.query.address, req.query.numchildren, req.query.ages],function (error, results, fields) {
		var subscriber_id = results.insertId;
		var delivery_date = "2019-05-01 00:00:00";
		req.session.subscriber_id = subscriber_id;

		req.query.interests.forEach(function(interest_id){
			connection.query('INSERT INTO subscriber_interests (interest_id, subscriber_id) VALUES (?, ?)', [interest_id, subscriber_id],function (error, results, fields) {});

			// Insert toys into the monthly curation that match the interests
			connection.query('INSERT INTO monthly_curations (subscriber_id, toy_inventory_id, delivery_date) VALUES (?, (SELECT id from toy_inventory WHERE interest_id = ? LIMIT 1), ?)', [subscriber_id, interest_id, delivery_date ],function (error, results, fields) {});
		});
		res.redirect('/dashboard.html');
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
// log in url-when you log in with nothing,redirect to log in. when you log in with email,match it to subscriber eamail and password. when you log in with me,take me to admin dboard, else redirect to user dashboard
app.get('/login', function(req, res){
	connection.query('SELECT * FROM subscriber WHERE email = ? AND password_hash = ?', [req.query.email, req.query.password],function (error, results, fields) {
	  if (error) throw error;
	
	  if (results.length == 0){
	  	res.redirect('/login.html');
	  }else {
	  	req.session.subscriber_id = results[0].id;
	  	req.session.email = results[0].email;

		  if (req.query.email == "bayoajisohna@gmail.com"){
			  res.redirect('/admin_dashboard.html');
		  }else {
			res.redirect('/dashboard.html');
		  }
	  	
	  }

	});
});

app.get('/logout', function(req, res){
	req.session.destroy(function(err) {
	   res.redirect('/index.html');
	})
	
});


app.get('/dashboard.html', function(req, res) {
	var id = req.session.subscriber_id;

	connection.query('SELECT DATE_FORMAT(delivery_date, "%W %M %e %Y") as delivery_date, name_of_toy, image1_url FROM monthly_curations LEFT JOIN toy_inventory ON toy_inventory_id =toy_inventory.id WHERE subscriber_id = ? AND delivery_date >= ?' ,[id, "2019-04-01 00:00:00"] , function (error, results, fields) {
		res.render('dashboard.html', {
			toys: results || []
		});
	  });
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

app.get('/history.html', function(req, res) {
	var id = req.session.subscriber_id;
	
	//Got help with SQL- had to join the inventory table with the monthly curation to match subscriber with toys sent and delivery date
	connection.query('SELECT DATE_FORMAT(delivery_date, "%M %Y") as delivery_date, GROUP_CONCAT(name_of_toy) as toys FROM monthly_curations LEFT JOIN toy_inventory ON toy_inventory_id =toy_inventory.id WHERE subscriber_id = ' + id + ' GROUP BY delivery_date', function (error, results, fields) {
		res.render('history.html', {
			history: results || []
		});
	  });
});


//integrate body-parser with express

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
	
// parse application/json
app.use(bodyParser.json())


//so if the user hits a route that does not exist then redirec them to the home page
app.get('*', function(req, res){
	res.redirect('/');
});

app.listen(3001, function(){
	console.log('listening on 3001');
});






