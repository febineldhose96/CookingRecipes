-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 08, 2023 at 07:52 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cooking_recipes`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_details`
--

CREATE TABLE `category_details` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_details`
--

INSERT INTO `category_details` (`category_id`, `category_name`) VALUES
(101, 'veg'),
(102, 'non-veg');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `recipecategory_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_category`
--

INSERT INTO `recipe_category` (`recipecategory_id`, `recipe_id`, `category_id`) VALUES
(301, 201, 101),
(302, 202, 102);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_details`
--

CREATE TABLE `recipe_details` (
  `recipe_id` int NOT NULL,
  `recipe_name` varchar(50) NOT NULL,
  `recipe_duration` int NOT NULL,
  `posted_date` date NOT NULL,
  `video_link` text NOT NULL,
  `user_id` int NOT NULL,
  `video_id` int NOT NULL,
  `recipe_description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recipe_ingredients` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recipe_image` varchar(50) NOT NULL,
  `rating` int NOT NULL,
  `thumbnail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_details`
--

INSERT INTO `recipe_details` (`recipe_id`, `recipe_name`, `recipe_duration`, `posted_date`, `video_link`, `user_id`, `video_id`, `recipe_description`, `recipe_ingredients`, `recipe_image`, `rating`, `thumbnail`) VALUES
(201, 'Beef Curry', 5, '2023-03-14', 'https://youtu.be/YW48gEX8rg4', 1, 401, 'test', 'test2', 'alt image', 4, 'https://food-images.files.bbci.co.uk/food/recipes/slow_cooker_beef_curry_13533_16x9.jpg'),
(202, 'Egg curry', 5, '2023-03-09', 'https://youtu.be/UzjCJV-dvf0', 2, 402, 'Restaurant Style Egg Gravy | Restaurant Style Egg Masala | Egg Masala ', 'test ingredients2', 'alt image', 4, 'https://www.funfoodfrolic.com/wp-content/uploads/2021/02/Egg-Curry-Thumbnail.jpg'),
(203, 'Dinner omlet', 4, '2023-03-08', 'https://youtu.be/E2nHfbzHDmY', 1, 402, 'Omelets are an easy and nutritious choice for a quick meal, especially on a weeknight. ', '4 large eggs 1/4 cup milk 1/8 teaspoon', 'test', 4, 'https://www.thespruceeats.com/thmb/jE-PesfSjhsGS3CFBXIQNu_1tqo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/dinner-omelet-480277-hero-01-84a5af20b08440598a2b5b662f2e5cbe.jpg'),
(204, 'Peruvian-Style Roast Chicken ', 2, '2023-03-05', 'https://youtu.be/xBc7nM9sulc', 1, 402, 'This cumin- and paprika-spiced Peruvian-inspired chicken gets added punch from a tangy green sauce ', '3 garlic cloves, whole chicken', 'test', 3, 'https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/master/pass/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg'),
(205, 'Chicken Pasta Recipe', 10, '2023-02-05', 'https://youtu.be/ZOJk9isCS6w', 1, 401, 'Garlic Chicken Pasta with garlic butter pasta sauce is the best quick and easy comfort food that\'s ready in less than 20 minutes!', '1 pound boneless skinless chicken breasts (about 2 large breasts)\r\n2 Tablespoons olive oil\r\n1 1/2 teaspoons dried parsley flakes\r\n1 1/2 teaspoons garlic powder\r\n1 teaspoon fine sea salt\r\n1/2 teaspoon ground black pepper', 'test', 2, 'https://keytomylime.com/wp-content/uploads/2021/08/Best-Garlic-Chicken-Pasta-Recipe-720x720.jpg'),
(206, 'Lemon Butter Sauce for Fish', 5, '2022-11-01', 'https://youtu.be/o8M8aq8QVRc', 1, 401, 'The Lemon Butter Sauce is just made with butter and lemon. But it’s not “just” butter and lemon.\r\n\r\nIt’s brown butter and lemon.', 'Melt butter;\r\n\r\nLeave until the butter turns brown and the smell suddenly changes and becomes nutty – about 3 minutes;\r\n\r\nStir through lemon juice.', 'test', 5, 'https://www.recipetineats.com/wp-content/uploads/2018/04/Fish-with-Lemon-Butter-Sauce.jpg'),
(207, 'Chinese Vegetable Stir-Fry', 10, '2022-08-03', 'https://youtu.be/l0i2eQQ9UeA', 1, 401, 'Filled with meaty shiitakes, crunchy broccoli, and sweet bell peppers, this Chinese vegetable stir-fry always satisfies.', '⅓ cup soy sauce (use gluten-free if needed)\r\n3 tablespoons water\r\n2 tablespoons dry sherry or Chinese rice wine\r\n1 teaspoon Asian/toasted sesame oil\r\n2 teaspoons sugar\r\n1 tablespoon cornstarch\r\n¼ teaspoon red pepper flakes\r\n', 'test', 4, 'https://www.onceuponachef.com/images/2017/02/Asian-Vegetable-Stir-Fry-3-1200x863.jpg'),
(208, 'Chicken Tikka Biriyani', 9, '2022-11-08', 'https://youtu.be/zpgQwStYUWI', 1, 401, 'Chicken Tikka Biryani is a delicious biryani that is cooked and layered with chicken Tikka. It is perfect for any special occasions.', 'Boneless chicken (thighs preferred) – 600 – 750 gm, cut into medium-large pieces\r\n\r\nGinger-garlic paste – 2 tbsp\r\n\r\nTurmeric powder – 1/2 tsp\r\n\r\nKashmiri chilly powder – 1.5 tbsp\r\n\r\nCumin powder – 3/4 tsp\r\n\r\n', 'test', 3, 'https://www.yummyoyummy.com/wp-content/uploads/2021/09/IMG_0446-scaled.jpg'),
(209, 'ITALIAN PIZZA ', 12, '2023-03-09', 'https://youtu.be/FBbBWifAdCg', 1, 401, 'Pizza is a globally adored dish, with several variations to the classic recipe being incorporated to reflect different cultures and countries of origin. Although pizza is seen by far to be the most popular Italian dish.', '600ml of warm water\r\n1kg of flour, the authentic Italian pizzas \r\n6 tablespoons of extra virgin olive oil\r\n25g of fresh yeast, or around 8g of dried yeast\r\n5 teaspoons of salt\r\n2 teaspoons of sugar', 'test', 2, 'https://giovannis-knutsford.co.uk/wp-content/uploads/2017/09/How-To-Make-An-Authentic-Italian-Pizza-At-Home.jpg'),
(210, 'Thalassery Chicken Biriyani ', 8, '2023-03-08', 'https://youtu.be/FBbBWifAdCg', 1, 401, 'Thalassery Chicken Biriyani - Dum Biryani, ®This is a RAS signature Recipe©, One of the best ...', '1 kg Chicken, skin removed - cut to medium large pieces\r\n3 - 4 Tbsp Dalda / vanaspati / vegetable shortening\r\n2 cups Onion, sliced\r\n½ cup Garlic ( I recommend using the Indian ', 'test', 4, 'https://recipesaresimple.com/wp-content/uploads/2014/08/thalassery-dum-biriyani-recipe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `email`, `password`) VALUES
(1, 'kevin@kevin.com', ''),
(2, 'lisa@lisa.com', ''),
(3, 'arturo@arturo.com', ''),
(4, 'Sobham@sobhan.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `username`, `first_name`, `last_name`, `email`, `profile_img`) VALUES
(1, 'Mehdi143', 'Mehdi', 'Kumar', 'mehdi@gmail.com', 'alt img'),
(2, 'paru143', 'parvathy', 'prajapathi', 'paru@gmail.com', 'alt img');

-- --------------------------------------------------------

--
-- Table structure for table `video_details`
--

CREATE TABLE `video_details` (
  `video_id` int NOT NULL,
  `video_duration` int NOT NULL,
  `video_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `video_details`
--

INSERT INTO `video_details` (`video_id`, `video_duration`, `video_type`) VALUES
(401, 5, 'long_video'),
(402, 1, 'short_video');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_details`
--
ALTER TABLE `category_details`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `recipe_details`
--
ALTER TABLE `recipe_details`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
