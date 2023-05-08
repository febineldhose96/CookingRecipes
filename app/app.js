// Import express.js
const express = require("express");

// Create express app
var app = express();

// Add static files location
app.use(express.static("static"));

// Use the Pug templating engine
app.set("view engine", "pug");
app.set("views", "./app/views");

const { Recipe } = require("./models/recipe");

// Create a route for root - /
// app.get("/", function (req, res) {
//   res.render("index");
// });
// test
app.get("/", function (req, res) {
  res.render("home");
});
app.get("/detail", function (req, res) {
  res.render("detail");
});
// Task 1 JSON formatted listing of students
app.get("/home", async function (req, res) {
  const recipe = new Recipe();
  const recipe_list = await recipe.getHome_recipes();
  res.render("home", { ...recipe_list });
});

// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
