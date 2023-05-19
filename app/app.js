// Import express.js
const express = require("express");

// Create express app
var app = express();
app.use(express.urlencoded());
var session = require("express-session");

// Add static files location
app.use(express.static("static"));

// Use the Pug templating engine
app.set("view engine", "pug");
app.set("views", "./app/views");

const { Recipe } = require("./models/recipe");
// Set the sessions
var session = require("express-session");
const { User } = require("./models/user");
const recipe = new Recipe();
app.use(
  session({
    secret: "secretkeysdfjsflyoifasd",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false },
  })
);
app.get("/", function (req, res) {
  console.log(req.session);
  if (req.session.uid) {
    res.send("Welcome back, " + req.session.uid + "!");
  } else {
    res.render("login");
  }
  res.end();
});
app.get("/detail", async function (req, res) {
  const recipe_details = await recipe.getSingleRecipe(req.query.id);
  console.log("recipe_details", recipe_details[0]);
  res.render("detail", { data: recipe_details[0] });
});
app.get("/profile", function (req, res) {
  res.render("profile");
});
app.get("/upload_recipe", function (req, res) {
  res.render("upload_recipe");
});
// Task 1 JSON formatted listing of students
app.get("/home", async function (req, res) {
  const recipe_list = await recipe.getHome_recipes();
  // const recipe_list1 = await recipe.searchRecipe("peruvian");
  res.render("home", { ...recipe_list });
});
// Register
app.get("/register", function (req, res) {
  res.render("register");
});

// Login
app.get("/login", function (req, res) {
  res.render("login");
});
app.post("/set-password", async function (req, res) {
  params = req.body;
  var user = new User(params.email);
  console.log("register", params.password);
  try {
    uId = await user.getIdFromEmail();
    if (uId) {
      // If a valid, existing user is found, set the password and redirect to the users single-student page
      await user.setUserPassword(params.password);
      res.redirect("/home");
    } else {
      // If no existing user is found, add a new one
      newId = await user.addUser(params.email);
      res.redirect("/home");
    }
  } catch (err) {
    console.error(`Error while adding password `, err.message);
  }
});
// Check submitted email and password pair
// Check submitted email and password pair
app.post("/authenticate", async function (req, res) {
  params = req.body;
  var user = new User(params.email);
  try {
    uId = await user.getIdFromEmail();
    if (uId) {
      match = await user.authenticate(params.password);

      if (match) {
        req.session.uid = uId;
        req.session.loggedIn = true;
        console.log(req.session);
        res.redirect("/home");
      } else {
        // TODO improve the user journey here
        res.send("invalid password");
      }
    } else {
      res.send("invalid email");
    }
  } catch (err) {
    console.error(`Error while comparing `, err.message);
  }
});
// Start server on port 3000
app.listen(3000, function () {
  console.log(`Server running at http://127.0.0.1:3000/`);
});
