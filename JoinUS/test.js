var {faker} = require('@faker-js/faker');
var mysql = require('mysql2')
var password = require('./personal_info')


var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: password,
    database: 'join_us'
  });



// let q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() as now';
// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(`The solution is: ${results[0].time}\n ${results[0].date}\n ${results[0].now}`);

// });

// ----------------------------------------------------------

// let q = 'SELECT COUNT(*) as total FROM users';

// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);

//   });

// ----------------------------------------------------------

// let q = 'INSERT INTO users SET ?';


// var end_result = connection.query(q, person, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);

//   });


// let person_test = {email: 'Jenny467@gmail.com'};


// ----------------------------------------------------------



person_list = [];

for (let i = 0; i < 500; i++) {

  person_list.push([faker.internet.email(), faker.date.past()]);

}

let q = 'INSERT INTO users (email, created_at) VALUES ?';


var end_result = connection.query(q, [person_list], function (error, results, fields) {
    if (error) throw error;
    console.log(results);

  });

console.log(end_result);

connection.end();


