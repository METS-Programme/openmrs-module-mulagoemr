/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

START TRANSACTION;


-- These concepts have CEIL based UUIDs that cause unique index exceptions
UPDATE concept SET uuid = UUID() WHERE concept_id IN (164981,164982, 164983, 164984);
UPDATE concept_name SET uuid = UUID() WHERE concept_id IN (164981,164982, 164983, 164984);

-- Move the concepts by 1000000
UPDATE concept SET concept_id = concept_id + 1000000 WHERE concept_id IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);
UPDATE concept_answer SET concept_id = concept_id + 1000000 WHERE concept_id IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);
UPDATE concept_answer SET answer_concept = answer_concept + 1000000 WHERE answer_concept IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);
UPDATE concept_answer SET concept_answer_id = concept_answer_id + 1000000 WHERE answer_concept IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994) OR concept_id IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);
UPDATE concept_name SET concept_id = concept_id + 1000000, concept_name_id = concept_name_id + 1000000 WHERE concept_id IN (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);

-- Update the obs with the new data
UPDATE obs SET concept_id = concept_id + 1000000 WHERE concept_id IN  (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);
UPDATE obs SET value_coded = value_coded + 1000000 WHERE value_coded IN (164981,164982, 164983, 164984, 164985, 164986, 164987, 164989, 164990, 164991, 164992, 164993, 164994);

COMMIT;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
