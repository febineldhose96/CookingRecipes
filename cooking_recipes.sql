-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 14, 2023 at 04:21 PM
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
  `recipe_description` varchar(100) NOT NULL,
  `recipe_ingredients` varchar(50) NOT NULL,
  `recipe_image` varchar(50) NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_details`
--

INSERT INTO `recipe_details` (`recipe_id`, `recipe_name`, `recipe_duration`, `posted_date`, `video_link`, `user_id`, `recipe_description`, `recipe_ingredients`, `recipe_image`, `rating`) VALUES
(201, 'Beef Curry', 5, '2023-03-14', 'https://youtu.be/YW48gEX8rg4', 1, 'test', 'test2', 'alt image', 4),
(202, 'Egg curry', 5, '2023-03-09', 'https://youtu.be/UzjCJV-dvf0', 2, 'Restaurant Style Egg Gravy | Restaurant Style Egg Masala | Egg Masala ', 'test ingredients2', 'alt image', 4);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
