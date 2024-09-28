var express = require('express');
var app = express();
var password = require('../personal_info');
var mysql = require('mysql2');
var bodyParser = require('body-parser');
 

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: password,
    database: 'join_us'
  });


app.get("/", function(req, res) {
    var q = "SELECT COUNT(*) AS count FROM users";
    connection.query(q, function(err, results) {
        if (err) throw err;
        var count = results[0].count;
        // res.send(`We have ${count} users in your database.`);
        res.render("home", {data: count});

    });
});

app.post("/register", function(req, res) {
    var email = req.body.email;
    var person = { email: req.body.email};

    var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
        if (err) throw err;
        res.redirect("/");
    });

});




app.get("/joke", function(req, res) {
    let joke = 'Knock knock...';
    res.send(joke);
});

app.get("/random_num", function(req, res) {
    var randomNumber = Math.floor(Math.random() * 10) + 1;
    res.send(randomNumber.toString()); // Convert number to string
});






app.listen(8080, function(){
    console.log("Server running on 8080!");
});