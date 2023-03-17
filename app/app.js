// Import express.js
const express = require("express");

// Create express app
var app = express();

// Add static files location
app.use(express.static("static"));

// Use the Pug templating engine
app.set("view engine", "pug");
app.set("views", "./app/views");

// Get the functions in the db.js file to use
const db = require("./services/db");

// Create a route for root - /
app.get("/", function (req, res) {
  res.render("index");
});

// Task 1 JSON formatted listing of students
app.get("/all-students", function (req, res) {
  var sql = "select * from user_details";
  // As we are not inside an async function we cannot use await
  // So we use .then syntax to ensure that we wait until the
  // promise returned by the async function is resolved before we proceed
  db.query(sql).then((results) => {
    console.log(results);
    res.render("all-students", { data: results });
  });
});

// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
