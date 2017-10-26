-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2017 at 03:37 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(2) NOT NULL DEFAULT '1',
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`id`, `name`, `gender`, `active`) VALUES
(1, 'Ao khoac gio nam', 1, 1),
(2, 'Ao vet nam', 0, 1),
(3, 'Ao Thun Nam', 1, 1),
(4, 'Ao So Mi Nam', 1, 1),
(5, 'Ao khoac jean nam', 1, 1),
(6, 'Ao len nam', 1, 1),
(7, 'Ao So Mi Nu', 0, 1),
(8, 'Ao Thun Nu', 0, 1),
(10, 'Ao Khoac Gio Nu', 0, 1),
(11, 'Ao Len Nu', 0, 1),
(12, 'Quan khoac jean Nu', 0, 1),
(13, 'Quần sort nam', 1, 1),
(14, 'Quan Jean Nu', 0, 1),
(15, 'Quan Jean Nam', 1, 1),
(16, 'Quan Kaky Nam', 1, 1),
(17, 'Quan Kaky Nu', 0, 1),
(18, 'Vay', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(255) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`) VALUES
(1, 'Blue'),
(2, 'Red'),
(3, 'White'),
(4, 'Black'),
(5, 'Yellow'),
(6, 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `date_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` int(255) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `paid` int(2) NOT NULL,
  `shipped` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_order`, `payment_id`, `note`, `status`, `paid`, `shipped`) VALUES
(1, 1, '2017-10-02 10:00:00', 1, 'abc', 0, 0, 1),
(2, 1, '2017-10-17 10:00:00', 1, 'abc', 1, 1, 1),
(3, 1007, '2017-10-23 17:00:00', 2, 'ok', 0, 0, 1),
(4, 1008, '2017-10-24 04:10:34', 2, 'ưedtrgytruj', 1, 0, 0),
(5, 1009, '2017-10-24 04:10:07', 2, 'rtryutu', 2, 1, 0),
(6, 1010, '2017-10-24 04:10:01', 2, 'ấadsđ', 1, 1, 0),
(16, 1020, '2017-10-24 08:10:06', 3, 'ok', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`) VALUES
(3, 5, 1),
(4, 5, 8),
(5, 5, 3),
(6, 5, 3),
(16, 7, 10),
(16, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`) VALUES
(1, 'Visa'),
(2, 'ATM'),
(3, 'When received product');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(255) NOT NULL,
  `product_info_id` int(255) NOT NULL,
  `color_id` int(255) NOT NULL,
  `size_id` int(255) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_info_id`, `color_id`, `size_id`, `quantity`) VALUES
(4, 85, 1, 2, 10),
(5, 85, 1, 1, 10),
(6, 85, 1, 3, 10),
(7, 86, 1, 5, 10),
(8, 86, 6, 3, 10),
(9, 87, 2, 1, 10),
(10, 87, 2, 5, 10),
(11, 87, 3, 3, 10),
(15, 90, 3, 2, 10),
(16, 90, 3, 5, 10),
(17, 92, 1, 3, 10),
(18, 92, 5, 5, 10),
(19, 93, 1, 2, 10),
(20, 93, 3, 3, 10),
(21, 92, 6, 1, 10),
(22, 93, 6, 1, 10),
(23, 97, 6, 3, 10),
(24, 97, 5, 2, 10),
(25, 97, 1, 2, 10),
(26, 95, 1, 1, 10),
(27, 95, 6, 3, 10),
(28, 95, 3, 5, 10),
(29, 98, 2, 3, 10),
(30, 98, 4, 1, 10),
(31, 98, 1, 5, 10),
(32, 19, 1, 3, 10),
(33, 19, 1, 3, 10),
(34, 19, 1, 3, 10),
(35, 19, 1, 3, 10),
(36, 19, 1, 3, 10),
(37, 19, 1, 3, 10),
(38, 19, 1, 3, 10),
(39, 19, 1, 3, 10),
(40, 19, 1, 3, 10),
(41, 19, 1, 3, 10),
(42, 19, 1, 3, 10),
(43, 19, 1, 3, 10),
(44, 19, 1, 3, 10),
(45, 19, 1, 3, 10),
(46, 19, 1, 3, 10),
(47, 19, 1, 3, 10),
(48, 19, 1, 3, 10),
(49, 19, 1, 3, 10),
(50, 19, 1, 3, 10),
(51, 19, 1, 3, 10),
(52, 19, 1, 2, 10),
(53, 27, 1, 1, 10),
(54, 29, 1, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `products_info`
--

CREATE TABLE `products_info` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(255) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(20) NOT NULL,
  `view` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_info`
--

INSERT INTO `products_info` (`id`, `name`, `cat_id`, `active`, `preview_text`, `detail_text`, `image`, `price`, `view`) VALUES
(85, 'Ao thun A', 1, 1, 'Ao thun A dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo thun A-1508293174.jpg', 200000, 103),
(86, 'Ao thun B', 3, 1, 'Ao thun B  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo thun B-1508293218.jpg', 250000, 4545),
(87, 'Ao thun C', 3, 1, 'Ao thun C  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo thun C-1508293258.jpg', 300000, 302),
(88, 'Ao thun D', 3, 1, 'Ao thun D  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo thun D-1508293313.jpg', 400000, 100),
(90, 'Ao sơ mi nam B', 4, 1, 'Ao sơ mi nam B   dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo sơ mi nam B-1508293442.jpg', 400000, 10000),
(91, 'Ao sơ mi nam C', 4, 1, 'Ao sơ mi nam C  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo sơ mi nam C-1508293482.jpg', 600000, 23453342),
(92, 'Ao sơ mi A', 7, 1, 'Ao so mu A  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-sd-1508293572.jpg', 100000, 5424645),
(93, 'Áo sơ mi nữ B', 1, 1, 'Ao so mi nu B  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-f-1508293601.jpg', 500000, 500),
(94, 'Áo sơ mi nữ C', 7, 1, 'Ao so mi nu C cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Áo sơ mi nữ C-1508293724.jpg', 300000, 100),
(95, 'Áo sơ mi nữ D', 7, 1, 'Ao so mi nu D  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-d-1508293762.jpg', 456000, 452300),
(96, 'Áo sơ mi nữ E', 7, 1, 'Ao so mi nu E sanh dieu', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-d-1508293868.jpg', 147820, 852855),
(97, 'Ao thun nu A', 8, 1, 'Ao thun nu A  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thun nu A-1508317540.jpg', 250000, 0),
(98, 'Ao thun nu B', 8, 1, 'Ao thun nu B  dep cao cap', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thun nu B-1508317684.jpg', 500000, 0),
(99, 'Ao thu nu C', 8, 1, 'Ao thu nu C', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thu nu C-1508317736.jpg', 560000, 0),
(100, 'Ao thun nu D', 8, 1, 'Ao thun nu D', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thun nu D-1508317771.jpg', 200000, 0),
(101, 'Ao thu nu E', 8, 1, 'dfgkl', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thu nu E-1508317841.jpg', 600000, 0),
(102, 'Ao thun nu F', 8, 1, 'Ao thun nu F', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thun nu F-1508317897.jpg', 50000, 0),
(103, 'Ao thun nu G', 8, 1, 'Ao thun nu G', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Ao thun nu G-1508317950.jpg', 8520741, 0),
(104, 'Vay A', 18, 1, 'Vay A', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay A-1508318057.jpg', 852741, 0),
(105, 'Vay B', 18, 1, 'Vay B', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay B-1508318097.jpg', 741852, 0),
(106, 'Vay C', 18, 1, 'Vay C', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay C-1508318136.jpg', 741852, 0),
(107, 'Vay D', 18, 1, 'Vay D', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay D-1508318160.jpg', 345678, 0),
(108, 'Vay E', 18, 1, 'Vay E', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay E-1508318207.jpg', 123467, 0),
(109, 'Vay F', 18, 1, 'Vay F', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay F-1508318238.jpg', 2345678, 0),
(110, 'Vay G', 18, 1, 'Vay G', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay G-1508318265.jpg', 34567855, 0),
(111, 'Vay H', 18, 1, 'Vay H', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay H-1508318338.jpg', 45678, 0),
(112, 'Vay T', 18, 1, 'Vay T', 'Thank you very much for your letter which arrived a few days ago. It was lovely to hear from you. I am sorry, I haven’t written for you such along time because I studied hard to pass the final exam. However, I had agreat weekend more than every when I went to live concerts last night with my friends. Now, I am writing to tell you how the wonderful concert is.\r\nIt is the beautiful concert I have ever taken part in with many people and the miracle of sound of piano. As you know, my pianist is Yiruma and in last concert I couldn’t believe that he appeared in my eyes and gave me a big hug after his performance. I also listen a soothing music which is played by him and other professional musicians. Only when I heard his song from the stage I feel anythings around me seem to disappear and I can fly with many stars on the sky to forget all my fears which I suffered before.', 'product_info-Vay T-1508318359.jpg', 4567895, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `discount` int(3) NOT NULL,
  `started_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(255) NOT NULL,
  `size` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 'XXXL'),
(2, 'M'),
(3, 'XL'),
(5, 'XXL'),
(6, 'XXXL');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  `level` int(2) NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `email`, `phone`, `address`, `active`, `level`, `avatar`) VALUES
(4, 'esyfax3', 'hK7wrtyi', 'Esra Syfax', 'esyfax3@wordpress.org', '284-306-2621', '228 Mariners Cove Trail', 1, 2, NULL),
(5, 'dderrico4', 'uv8IHGwgiTF', 'Dorian D\'Errico', 'dderrico4@cpanel.net', '924-853-9476', '5 Del Mar Avenue', 1, 0, NULL),
(6, 'jgiacoboni5', 'rFcXZAYiL', 'Jerome Giacoboni', 'jgiacoboni5@elpais.com', '407-178-6547', '20 International Center', 1, 0, NULL),
(7, 'emacsporran6', 'fl7bZRkTRAbI', 'Elladine MacSporran', 'emacsporran6@reference.com', '164-218-2291', '22 Blaine Hill', 1, 0, NULL),
(8, 'mkubista7', 'mxUJhiS', 'Maxwell Kubista', 'mkubista7@addthis.com', '403-974-6443', '2715 Sullivan Terrace', 0, 2, NULL),
(9, 'fneale8', 'AnF4vX', 'Frants Neale', 'fneale8@e-recht24.de', '446-645-8241', '70 Pierstorff Avenue', 0, 0, NULL),
(10, 'jmatiashvili9', '0MMuDWCR3', 'Jarid Matiashvili', 'jmatiashvili9@imageshack.us', '691-571-8423', '23367 Bluejay Avenue', 1, 0, NULL),
(11, 'qmcadama', 'k7KD7qsf1b2T', 'Quentin McAdam', 'qmcadama@deviantart.com', '208-655-8422', '6968 Superior Plaza', 0, 0, NULL),
(12, 'siannuzzellib', 'negEOcurmM', 'Sarena Iannuzzelli', 'siannuzzellib@noaa.gov', '247-811-6264', '232 New Castle Point', 1, 0, NULL),
(13, 'vbrandhamc', 'KxXcDH', 'Verile Brandham', 'vbrandhamc@harvard.edu', '839-666-2902', '92455 Oriole Lane', 1, 1, NULL),
(14, 'moxendend', 'ysLwGXoXj', 'Max Oxenden', 'moxendend@tuttocitta.it', '761-547-4244', '146 Monterey Place', 1, 1, NULL),
(15, 'oshirtliffe', 'JrbwJFZoARd', 'Oswald Shirtliff', 'oshirtliffe@icio.us', '459-490-3365', '414 Mallory Parkway', 1, 2, NULL),
(16, 'kkeatingf', 'Erx9iZLlJi', 'Kass Keating', 'kkeatingf@google.com.au', '563-679-7546', '78927 Dorton Alley', 0, 0, NULL),
(17, 'cfeathersbyg', 'pHn3fysY', 'Cinda Feathersby', 'cfeathersbyg@mail.ru', '180-242-1302', '03 Debra Place', 0, 0, NULL),
(18, 'kpeppetth', 'yCZfyrQHRj', 'Karol Peppett', 'kpeppetth@hao123.com', '498-962-0653', '44 Ridgeview Plaza', 0, 2, NULL),
(19, 'tscarglei', 'pmsXgOajK', 'Tiphany Scargle', 'tscarglei@tmall.com', '382-138-1814', '052 Bartillon Terrace', 1, 0, NULL),
(20, 'lcreanej', 'kQImwlq', 'Lebbie Creane', 'lcreanej@mac.com', '869-314-5427', '5375 Sundown Center', 1, 1, NULL),
(21, 'xsmogurk', 'y6LMGoyQ7zNs', 'Ximenes Smogur', 'xsmogurk@samsung.com', '580-295-1012', '034 Annamark Circle', 1, 0, NULL),
(22, 'bjurickl', 'Y3abeX', 'Brana Jurick', 'bjurickl@xing.com', '304-300-8177', '82968 Claremont Lane', 0, 0, NULL),
(23, 'cwhitehallm', '3hgiNBnjL', 'Clevey Whitehall', 'cwhitehallm@google.cn', '831-561-2131', '990 Springs Circle', 1, 2, NULL),
(24, 'bvanshinn', 'AlTNV6N0vSu', 'Barrie Vanshin', 'bvanshinn@dyndns.org', '265-728-0467', '36557 Kinsman Parkway', 0, 2, NULL),
(25, 'ggrieswoodo', 'wJM0qX1JiG', 'Gianna Grieswood', 'ggrieswoodo@alibaba.com', '947-643-3446', '3906 Butterfield Point', 0, 2, NULL),
(26, 'rheavyp', 'vVv7tqrCif', 'Richmound Heavy', 'rheavyp@histats.com', '821-517-5262', '72 Green Ridge Park', 0, 1, NULL),
(27, 'mreapeq', 'bR9lWQa', 'Madalyn Reape', 'mreapeq@dot.gov', '732-395-3900', '098 Iowa Place', 0, 1, NULL),
(28, 'kdrooganr', 'ORUs0T1', 'Keelby Droogan', 'kdrooganr@adobe.com', '245-529-8405', '3342 Nancy Avenue', 0, 1, NULL),
(29, 'jchoffins', '90HcIjap0P', 'Jeri Choffin', 'jchoffins@sakura.ne.jp', '735-616-8478', '44 Anderson Circle', 0, 2, NULL),
(30, 'cburnest', 'jKUgWknr5', 'Coop Burnes', 'cburnest@latimes.com', '570-384-8027', '3143 Russell Junction', 1, 1, NULL),
(31, 'hdilksu', '5aBB1zaYWD9a', 'Haily Dilks', 'hdilksu@spotify.com', '263-234-9903', '69 Clove Trail', 0, 2, NULL),
(32, 'acausonv', '7WAmbo', 'Anthiathia Causon', 'acausonv@dagondesign.com', '562-953-3028', '5673 Luster Circle', 1, 0, NULL),
(33, 'sgobolosw', 'rBLForHYi4', 'Susannah Gobolos', 'sgobolosw@booking.com', '878-830-8227', '03263 Maple Wood Avenue', 0, 1, NULL),
(34, 'epringuerx', 'tLaI1Zts', 'Eileen Pringuer', 'epringuerx@elegantthemes.com', '210-552-3776', '018 Iowa Park', 0, 2, NULL),
(35, 'ahobbemay', '5D9kEws6EI', 'Auroora Hobbema', 'ahobbemay@pbs.org', '383-473-1140', '39 Bonner Road', 1, 0, NULL),
(36, 'sdederickz', '72Qpo5vgJ', 'Sherline Dederick', 'sdederickz@businessinsider.com', '898-600-8959', '068 Vernon Road', 1, 2, NULL),
(37, 'gdavenell10', 'QTvgaNgqSU2', 'Gris Davenell', 'gdavenell10@ask.com', '458-487-6192', '1 Lien Point', 0, 0, NULL),
(38, 'asimony11', 'ng5iKiufn', 'Alric Simony', 'asimony11@aboutads.info', '185-405-6805', '07909 Johnson Street', 1, 2, NULL),
(39, 'ksevier12', 'Wu04UmpX5r', 'Karin Sevier', 'ksevier12@geocities.com', '116-369-0607', '52595 Bayside Place', 0, 0, NULL),
(40, 'tcoade13', 'xARLQT', 'Tadeas Coade', 'tcoade13@cdbaby.com', '257-223-4092', '47 Arrowood Lane', 1, 2, NULL),
(41, 'rvarndell14', 'QvoAg0AI2n', 'Rowland Varndell', 'rvarndell14@hao123.com', '816-813-9246', '14168 Meadow Ridge Plaza', 1, 2, NULL),
(42, 'ocavet15', 'mWSAvMjEZ', 'Opal Cavet', 'ocavet15@buzzfeed.com', '956-329-7008', '45905 John Wall Lane', 0, 0, NULL),
(43, 'hnorheny16', 'FlHZyOwHs', 'Hersh Norheny', 'hnorheny16@studiopress.com', '743-920-6236', '69966 Fallview Court', 1, 0, NULL),
(44, 'ddee17', 'L07OWzwLn0', 'Dee dee Osbiston', 'ddee17@ftc.gov', '996-295-5895', '7 Service Road', 1, 2, NULL),
(45, 'hdallin18', 'EZVbENGN2G', 'Helge Dallin', 'hdallin18@symantec.com', '730-228-9308', '856 Lindbergh Point', 0, 2, NULL),
(46, 'smason19', '30hYqwlz', 'Sol Mason', 'smason19@tmall.com', '435-769-3733', '69 Mitchell Alley', 1, 0, NULL),
(47, 'gbarrowcliffe1a', 'Tcn7gjaP', 'George Barrowcliffe', 'gbarrowcliffe1a@ifeng.com', '104-643-9774', '2 Northport Pass', 1, 1, NULL),
(48, 'braraty1b', 'lfa1sB', 'Britt Raraty', 'braraty1b@addtoany.com', '444-389-2490', '3403 Badeau Drive', 1, 1, NULL),
(49, 'aayrton1c', 'wStGUlPrT', 'Alleen Ayrton', 'aayrton1c@canalblog.com', '328-736-3872', '1 Novick Way', 0, 0, NULL),
(50, 'astearley1d', 'PAgazsNLGhVd', 'Artur Stearley', 'astearley1d@delicious.com', '631-222-3059', '888 Everett Drive', 0, 1, NULL),
(51, 'einger1e', 'VYjlLvNJx', 'Edna Inger', 'einger1e@furl.net', '402-453-4653', '985 Swallow Crossing', 0, 1, NULL),
(52, '', '', '', '', '', '', 1, 2, ''),
(54, '', '', '', '', '', '', 0, 2, ''),
(55, '', '', '', '', '', '', 1, 2, ''),
(56, '', '', '', '', '', '', 1, 2, ''),
(57, '', '', '', '', '', '', 1, 2, ''),
(58, '', '', '', '', '', '', 1, 2, ''),
(59, '', '', '', '', '', '', 1, 2, ''),
(60, '', '', '', '', '', '', 1, 2, ''),
(61, '', '', '', '', '', '', 1, 2, ''),
(62, '', '', '', '', '', '', 1, 2, ''),
(63, '', '', '', '', '', '', 1, 2, ''),
(64, '', '', '', '', '', '', 1, 2, ''),
(65, 'trantrunghieu', '123456', 'tráº§n trung hiáº¿u', 'trantrunghieu@gmail.com', '256', 'Quáº¿ SÆ¡n', 1, 3, ''),
(66, 'trantrunghieu', '', 'tráº§n trung hiáº¿u', 'trantrunghieu@gmail.com', '256', 'Quáº¿ SÆ¡n', 1, 3, ''),
(67, 'trantrunghieu', '', 'tráº§n trung hiáº¿u', 'trantrunghieu@gmail.com', '256', 'Quáº¿ SÆ¡n', 1, 3, '123'),
(68, 'vovanmai', '', 'vo van mải', 'vovanmai.dt3@gmail.com', '123456789', 'Quang nam', 1, 3, ''),
(69, 'vovanmai', '', 'vo van máº£i', 'vovanmai.dt3@gmail.com', '123456789', 'Quang nam', 1, 3, ''),
(70, 'vovanmai', '', 'vo van máº£i', 'vovanmai.dt3@gmail.com', '123456789', 'Quang nam', 1, 3, ''),
(71, 'hieu luong', '123456', 'lÆ°Æ¡ng thá»‹ thu hiáº¿u', 'hieu.ltt@neo-lab.vn', '0979241562', 'Quáº£ng Nam', 1, 2, 'avatar-hieu luong-1507515873.jpg'),
(1002, 'hieu', 'e10adc3949ba59abbe56e057f20f883e', 'thu hieu', 'luonghieu.t3@gmail.com', '09792415621', 'Qu?ng Nam', 1, 2, NULL),
(1004, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'thu hi', 'isdfghj@gmfgfg.com', '4657687943', 'sadegtry', 1, 1, NULL),
(1005, 'hieu1', 'fd23e84e981bfda166f095ed2ac65aa1', '1sdsd', 'luonghieu163@yahoo.com.vn', '0979241561', 'Quáº£ng Nam', 1, 2, ''),
(1006, '', '', 'abc', 'luonghieu.t3@gmail.com', '0123456789', 'qn', 1, 3, NULL),
(1007, '', '', 'abc', 'luonghieu.t3@gmail.com', '0123456789', 'qn', 1, 3, NULL),
(1008, '', '', 'sdfefg', 'luonghieu.t3@gmail.com', '0123456789', 'ưedt', 1, 3, NULL),
(1009, '', '', 'sdsg', 'luonghieu163@yahoo.com.vn', '0123456789', 'adewtr', 1, 3, NULL),
(1010, '', '', 'sdsdfd', 'luonghieu.t3@gmail.com', '0123456789', 'ấ', 1, 3, NULL),
(1011, '', '', 'đsd', 'luonghieu.t3@gmail.com', '0123456789', 'ưdewr', 1, 3, NULL),
(1012, '', '', 'sdfgf', 'luonghieu.t3@gmail.com', '0123456789', 'ád', 1, 3, NULL),
(1013, '', '', 'sadf', 'luonghieu.t3@gmail.com', '0123456789', 'dewrf', 1, 3, NULL),
(1014, '', '', 'sads', 'luonghieu163@yahoo.com.vn', '0123456789', 'á', 1, 3, NULL),
(1015, '', '', 'sddfd', 'luonghieu163@yahoo.com.vn', '0123456789', 'ưewt', 1, 3, NULL),
(1016, '', '', 'sdfs', 'luonghieu.t3@gmail.com', '0123456789', 'sdsfd', 1, 3, NULL),
(1017, '', '', 'sdsf', 'luonghieu.t3@gmail.com', '0123456789', 'ấds', 1, 3, NULL),
(1018, '', '', 'dfd', 'luonghieu163@yahoo.com.vn', '0123456789', 'az', 1, 3, NULL),
(1019, '', '', 'dfdg', 'luonghieu163@yahoo.com.vn', '0123456789', 'sadsfdf', 1, 3, NULL),
(1020, '', '', 'hieu', 'luonghieu163@yahoo.com.vn', '0123456789', 'qn', 1, 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_info`
--
ALTER TABLE `products_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `products_info`
--
ALTER TABLE `products_info`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
