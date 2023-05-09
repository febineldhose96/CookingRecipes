const db = require("../services/db");
class Recipe {
  recipe_id;
  name;
  constructor(id) {
    this.recipe_id = id;
  }
  async getRecipe_id(id) {
    return this.recipe_id;
  }
  async getHome_recipes(id) {
    var sql = "SELECT * FROM recipe_details JOIN user_details ON recipe_details.user_id = user_details.user_id JOIN video_details ON user_details.user_id = video_details.user_id WHERE video_details.video_type='short_video'";
    var sql1 ="SELECT * FROM recipe_details JOIN user_details ON recipe_details.user_id = user_details.user_id JOIN video_details ON user_details.user_id = video_details.user_id WHERE video_details.video_type='long_video'";
    
   

    // As we are not inside an async function we cannot use await
    // So we use .then syntax to ensure that we wait until the
    // promise returned by the async function is resolved before we proceed
    var recipe_details = await db.query(sql).then((res) => res);
    var long_recipes = await db
      .query(sql1)
      .then((res) => res);
      var short_recipes = await db
      .query(sql)
      .then((res) => res);
    return { short_recipes:[], long_recipes:[] };
  }
  // async getHome_recipes(id) {
  //   var sql = "select * from recipe_details";
  //   var sql1 =
  //     "select *,video_type from video_details where video_type='short_video'";
  //   // As we are not inside an async function we cannot use await
  //   // So we use .then syntax to ensure that we wait until the
  //   // promise returned by the async function is resolved before we proceed
  //   var recipe_details = await db.query(sql).then((res) => res);
  //   var [short_recipes, long_recipes] = await db
  //     .query(sql1)
  //     .then((res) => [
  //       recipe_details.filter((e) =>
  //         res.map((m) => m.video_id).includes(e.video_id)
  //       ),
  //       recipe_details.filter(
  //         (e) => !res.map((m) => m.video_id).includes(e.video_id)
  //       ),
  //     ]);
  //   return { short_recipes, long_recipes };
  // }
}
module.exports = { Recipe };
