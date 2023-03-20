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
// app.get("/", function (req, res) {
//   res.render("index");
// });
// test
app.get("/", function (req, res) {
  res.render("home");
});

// Task 1 JSON formatted listing of students
app.get("/home", async function (req, res) {
  var sql = "select * from recipe_details";
  var sql1 =
    "select *,video_type from video_details where video_type='short_video'";
  // As we are not inside an async function we cannot use await
  // So we use .then syntax to ensure that we wait until the
  // promise returned by the async function is resolved before we proceed
  var recipe_details = await db.query(sql).then((res) => res);
  var [short_recipes, long_recipes] = await db
    .query(sql1)
    .then((res) => [
      recipe_details.filter((e) =>
        res.map((m) => m.video_id).includes(e.video_id)
      ),
      recipe_details.filter(
        (e) => !res.map((m) => m.video_id).includes(e.video_id)
      ),
    ]);

  res.render("home", {
    long_recipes,
    short_recipes,
  });
});

// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
