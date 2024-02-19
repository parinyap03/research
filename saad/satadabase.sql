-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 03:02 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `satadabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `Authors_Id` varchar(5) NOT NULL,
  `AuthorShortName` varchar(45) DEFAULT NULL,
  `ScopusAuthorID` varchar(10) DEFAULT NULL,
  `Publication_Authors_PublicationAuthorsId` varchar(5) NOT NULL,
  `Research_Group_Authors_Research_Group_Authors_id` varchar(5) NOT NULL,
  `Research_Group_Authors_Research_Group_GroupID` varchar(5) NOT NULL,
  `Research_Group_Authors_University_UniversityId` varchar(5) NOT NULL,
  `EducationHistory_EducationHistoryId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`Authors_Id`, `AuthorShortName`, `ScopusAuthorID`, `Publication_Authors_PublicationAuthorsId`, `Research_Group_Authors_Research_Group_Authors_id`, `Research_Group_Authors_Research_Group_GroupID`, `Research_Group_Authors_University_UniversityId`, `EducationHistory_EducationHistoryId`) VALUES
('A0001', 'Smith Sater', '6506092179', 'PA001', 'RA001', 'G0001', 'U0001', 'E0001'),
('A0002', 'Diana Withat', '6506519783', 'PA002', 'RA002', 'G0005', 'U0001', 'E0002'),
('A0003', 'John Wang', '548951648', 'PA003', 'RA003', 'G0005', 'U0001', 'E0003'),
('A0004', 'Kanteera Thiyakorn', '3602442120', 'PA004', 'RA004', 'G0005', 'U0001', 'E0004'),
('A0005', 'Milin Donthon', '5602846730', 'PA005', 'RA005', 'G0005', 'U0001', 'E0005');

-- --------------------------------------------------------

--
-- Table structure for table `author_mapping`
--

CREATE TABLE `author_mapping` (
  `Author_Mapping_Id` varchar(5) NOT NULL,
  `Users_UserID` varchar(5) NOT NULL,
  `Authors_Authors_Id` varchar(5) NOT NULL,
  `Authors_Publication_Authors_PublicationAuthorsId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `author_mapping`
--

INSERT INTO `author_mapping` (`Author_Mapping_Id`, `Users_UserID`, `Authors_Authors_Id`, `Authors_Publication_Authors_PublicationAuthorsId`) VALUES
('AM001', '00001', 'A0001', 'PA001');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `BookmarkID` varchar(5) NOT NULL,
  `BookmarkDate` datetime DEFAULT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`BookmarkID`, `BookmarkDate`, `Users_UserID`) VALUES
('B0001', '2023-02-02 00:00:00', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CommentID` varchar(5) NOT NULL,
  `Comment` varchar(200) DEFAULT NULL,
  `CommentDate` datetime DEFAULT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CommentID`, `Comment`, `CommentDate`, `Users_UserID`) VALUES
('C0001', 'ดีมากๆ', '2023-02-08 00:00:00', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryId` varchar(5) NOT NULL,
  `CountryName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`CountryId`, `CountryName`) VALUES
('C0001', 'ไทย'),
('C0002', 'แคนาดา'),
('C0003', 'ญี่ปุ่น'),
('C0004', 'ฝรั่งเศส'),
('C0005', 'สหรัฐอเมริกา'),
('C0006', 'สวิตเซอร์แลนด์');

-- --------------------------------------------------------

--
-- Table structure for table `countrypublicationrankings`
--

CREATE TABLE `countrypublicationrankings` (
  `CountryPublicationRankingsId` varchar(6) NOT NULL,
  `Country_CountryId` varchar(5) NOT NULL,
  `Year_YearId` varchar(5) NOT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `countrypublicationrankings`
--

INSERT INTO `countrypublicationrankings` (`CountryPublicationRankingsId`, `Country_CountryId`, `Year_YearId`, `Ranking`) VALUES
('CPR001', 'C0001', 'Y2020', 1),
('CPR001', 'C0001', 'Y2021', 3),
('CPR001', 'C0001', 'Y2022', 2),
('CPR001', 'C0001', 'Y2023', 1),
('CPR002', 'C0002', 'Y2020', 3),
('CPR002', 'C0002', 'Y2021', 1),
('CPR002', 'C0002', 'Y2022', 1),
('CPR002', 'C0002', 'Y2023', 2),
('CPR003', 'C0003', 'Y2020', 2),
('CPR003', 'C0003', 'Y2021', 2),
('CPR003', 'C0003', 'Y2022', 3),
('CPR003', 'C0003', 'Y2023', 3);

-- --------------------------------------------------------

--
-- Table structure for table `educationhistory`
--

CREATE TABLE `educationhistory` (
  `EducationHistoryId` varchar(5) NOT NULL,
  `BachelorDegree` varchar(255) DEFAULT NULL,
  `MasterDegree` varchar(255) DEFAULT NULL,
  `DoctoralDegree` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `educationhistory`
--

INSERT INTO `educationhistory` (`EducationHistoryId`, `BachelorDegree`, `MasterDegree`, `DoctoralDegree`) VALUES
('E0001', 'Bachelor of Science in Computer Science,University,Country 1990', 'Master of Science in Computer Science,University,Country 1990Bachelor of Science in Computer Science,University,Country 1990', 'Doctoral of Science in Computer Science,University,Country 1990'),
('E0002', 'Bachelor of Science in Computer Science,University,Country 2002', 'Master of Science in Computer Science,University,Country 2002Bachelor of Science in Computer Science,University,Country 2002', 'Doctoral of Science in Computer Science,University,Country 2002'),
('E0003', 'Bachelor of Science in Computer Science,University,Country 2004', 'Master of Science in Computer Science,University,Country 2004Bachelor of Science in Computer Science,University,Country 2004', 'Doctoral of Science in Computer Science,University,Country 2004'),
('E0004', 'Bachelor of Science in Computer Science,University,Country 2006', 'Master of Science in Computer Science,University,Country 2006Bachelor of Science in Computer Science,University,Country 2006', 'Doctoral of Science in Computer Science,University,Country 2006'),
('E0005', 'Bachelor of Science in Computer Science,University,Country 2008', 'Master of Science in Computer Science,University,Country 2008Bachelor of Science in Computer Science,University,Country 2008', 'Doctoral of Science in Computer Science,University,Country 2008');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyId` varchar(5) NOT NULL,
  `FacultyName` varchar(45) DEFAULT NULL,
  `University_UniversityId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyId`, `FacultyName`, `University_UniversityId`) VALUES
('FC001', 'คณะวิทยาศาสตร์', 'U0001'),
('FC002', 'คณะวิศวกรรมศาสตร์', 'U0001'),
('FC003', 'คณะเทคโนโลยี', 'U0001'),
('FC004', 'คณะสถาปัตยกรรมศาสตร์', 'U0001'),
('FC005', 'คณะแพทยศาสตร์', 'U0001'),
('FC006', 'วิทยาลัยการคอมพิวเตอร์', 'U0001'),
('FC007', 'คณะบริหารธุรกิจและการบัญชี', 'U0001');

-- --------------------------------------------------------

--
-- Table structure for table `facultypublicationrankings`
--

CREATE TABLE `facultypublicationrankings` (
  `FacultyPublicationRankings_Id` varchar(5) NOT NULL,
  `Faculty_FacultyId` varchar(5) NOT NULL,
  `Year_YearId` varchar(5) NOT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `facultypublicationrankings`
--

INSERT INTO `facultypublicationrankings` (`FacultyPublicationRankings_Id`, `Faculty_FacultyId`, `Year_YearId`, `Ranking`) VALUES
('FPR01', 'FC001', 'Y2023', 1),
('FPR02', 'FC002', 'Y2023', 2),
('FPR03', 'FC003', 'Y2023', 3),
('FPR04', 'FC004', 'Y2023', 4);

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `FieldId` varchar(5) NOT NULL,
  `FieldName` varchar(45) DEFAULT NULL,
  `FieldDescription` varchar(300) DEFAULT NULL,
  `Faculty_FacultyId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`FieldId`, `FieldName`, `FieldDescription`, `Faculty_FacultyId`) VALUES
('FI001', 'สาขาวิทยาการคอมพิวเตอร์', 'เป็นสาขาที่เรียนเกี่ยวกับทฤษฎีการคำนวณสำหรับคอมพิวเตอร์ ทฤษฎีการประมวลผลสารสนเทศ ทั้งด้านซอฟต์แวร์ ฮาร์ดแวร์ และเครือข่าย', 'FC006'),
('FI002', 'สาขาปัญญาประดิษฐ์', 'เป็นสาขาที่เรียนเกี่ยวกับความรู้ความสามารถในการประยุกต์ใช้ ปรับเปลี่ยน และออกแบบปัญญาประดิษฐ์ให้เหมาะสม รวมทั้งมีทักษะและประสบการณ์การเรียนรู้และการฝึกปฏิบัติเพื่อบูรณาการศาสตร์ที่ตนเองเชี่ยวชาญกับศาสตร์อื่นได้อย่างมีประสิทธิภาพ', 'FC006'),
('FI003', 'สาขาภูมิสารสนเทศศาสตร์', 'ศึกษาทางด้านการสำรวจพื้นที่ทางภูมิศาสตร์ การเก็บรวบรวมข้อมูล วิเคราะห์ และออกแบบฐานข้อมูลเชิงพื้นที่ การวิเคราะห์วิจัยด้านภูมิสารสนเทศทางด้านทรัพยากรธรรมชาติและสิ่งแวดล้อม การศึกษาและพัฒนาโปรแกรมประยุกต์ด้านภูมิสารสนเทศ', 'FC006'),
('FI004', 'สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'หลักสูตรวิศวกรรมคอมพิวเตอร์ ศึกษาพื้นฐานวิศวกรรมศาสตร์ และวิทยาการคอมพิวเตอร์ของระบบคอมพิวเตอร์ โดยเน้นการออกแบบระบบสมองกลฝังตัว (Embedded System) ทั้งส่วนฮาร์ดแวร์ (Hardware) และส่วนชุดคำสั่ง (Software) ชุดคำสั่งประยุกต์ใช้งาน เทคโนโลยี VLSI และระบบเครือข่าย', 'FC002'),
('FI005', 'สาขาวิชาคณิตศาสตร์', ' เป็นศาสตร์ที่มุ่งค้นคว้าเกี่ยวกับ โครงสร้างนามธรรมที่ถูกกำหนดขึ้นผ่านทางกลุ่มของสัจพจน์ซึ่งมีการให้เหตุผลที่แน่นอนโดยใช้ตรรกศาสตร์สัญลักษณ์ และสัญกรณ์คณิตศาสตร์', 'FC001');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `FollowerID` varchar(5) NOT NULL,
  `NumberOfFollower` int(11) DEFAULT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`FollowerID`, `NumberOfFollower`, `Users_UserID`) VALUES
('F0001', 10000, '00001');

-- --------------------------------------------------------

--
-- Table structure for table `paperstatistics`
--

CREATE TABLE `paperstatistics` (
  `StatID` varchar(5) NOT NULL,
  `NumberOfViews` int(11) DEFAULT NULL,
  `NumberOfCitations` int(11) DEFAULT NULL,
  `Year_YearId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paperstatistics`
--

INSERT INTO `paperstatistics` (`StatID`, `NumberOfViews`, `NumberOfCitations`, `Year_YearId`) VALUES
('S0001', 152, 68, 'Y2020'),
('S0001', 112, 140, 'Y2021'),
('S0001', 50, 30, 'Y2022'),
('S0001', 100, 100, 'Y2023'),
('S0002', 39, 4, 'Y2020'),
('S0002', 41, 6, 'Y2021'),
('S0002', 64, 14, 'Y2022'),
('S0002', 100, 54, 'Y2023');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `PaperID` varchar(5) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Abstract` varchar(5000) DEFAULT NULL,
  `PublishYear` int(11) DEFAULT NULL,
  `ISSN` varchar(20) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `DOI` varchar(100) DEFAULT NULL,
  `ORCID` varchar(100) DEFAULT NULL,
  `University` varchar(100) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `Quatile_SJR_QuatileSJRId` varchar(5) NOT NULL,
  `Quatile_SJR_Year_YearId` varchar(5) NOT NULL,
  `FacultyPublicationRankings_FacultyPublicationRankings_Id` varchar(5) NOT NULL,
  `FacultyPublicationRankings_Faculty_FacultyId` varchar(5) NOT NULL,
  `FacultyPublicationRankings_Year_YearId` varchar(5) NOT NULL,
  `PaperStatistics_StatID` varchar(5) NOT NULL,
  `PaperStatistics_Year_YearId` varchar(5) NOT NULL,
  `PublicationrRanking_PublicationrRankingId` varchar(6) NOT NULL,
  `PublicationrRanking_Year_YearId` varchar(5) NOT NULL,
  `Publication_Authors_PublicationAuthorsId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`PaperID`, `Title`, `Abstract`, `PublishYear`, `ISSN`, `ISBN`, `DOI`, `ORCID`, `University`, `Publisher`, `Quatile_SJR_QuatileSJRId`, `Quatile_SJR_Year_YearId`, `FacultyPublicationRankings_FacultyPublicationRankings_Id`, `FacultyPublicationRankings_Faculty_FacultyId`, `FacultyPublicationRankings_Year_YearId`, `PaperStatistics_StatID`, `PaperStatistics_Year_YearId`, `PublicationrRanking_PublicationrRankingId`, `PublicationrRanking_Year_YearId`, `Publication_Authors_PublicationAuthorsId`) VALUES
('P0001', 'Design and analysis of anti-poaching alert system for red sandalwood safety', 'In this modern world smuggling goods has become a common thing especially of important trees in forests, such as red sandalwood. This represents a huge threat to forest resources, inflicts enormous economic harm, and has a disastrous impact on the ecosystem around the world. This work offers a WSN-based microcontroller-based anti-poaching system capable of detecting theft and protecting forests from natural disasters by monitoring vibrations, location, smoke, and temperature produced by various sensors attached to trees/branches. A three-axis MEMS acceler-ometer is used as a tilt sensor to monitor the position of the tree, a sound sensor to detect the vibrations from the tree, and also a temperature to detect the wildfires and alert the user immediately and tell the exact location with the help of GPS module. A microcontroller is used along with PC so that the information can be uploaded. The main application of temperature and smoke sensors is not only alerting the system but also pumping the water with the help of water motor in the forest to tackle the fire immediately, which reduces the damage effectively.', 2022, '0125-1996', '978-111991039-8', '10.1000/182', '	https://orcid.org/0000-0002-1825-0097', 'มหาวิทยาลัยขอนแก่น', 'IET', 'Q0002', 'Y2023', 'FPR02', 'FC002', 'Y2023', 'S0002', 'Y2023', 'PR0001', 'Y2023', 'PA004');

-- --------------------------------------------------------

--
-- Table structure for table `publicationrranking`
--

CREATE TABLE `publicationrranking` (
  `PublicationrRankingId` varchar(6) NOT NULL,
  `Year_YearId` varchar(5) NOT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `publicationrranking`
--

INSERT INTO `publicationrranking` (`PublicationrRankingId`, `Year_YearId`, `Ranking`) VALUES
('PR0001', 'Y2023', 1),
('PR0002', 'Y2022', 2),
('PR0003', 'Y2021', 3),
('PR0004', 'Y2020', 4);

-- --------------------------------------------------------

--
-- Table structure for table `publication_area`
--

CREATE TABLE `publication_area` (
  `PublicationAreaID` varchar(6) NOT NULL,
  `SubjectArea` varchar(100) NOT NULL,
  `Publication_PaperID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publication_authors`
--

CREATE TABLE `publication_authors` (
  `PublicationAuthorsId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `publication_authors`
--

INSERT INTO `publication_authors` (`PublicationAuthorsId`) VALUES
('PA001'),
('PA002'),
('PA003'),
('PA004'),
('PA005'),
('PA006'),
('PA007'),
('PA008'),
('PA009'),
('PA010');

-- --------------------------------------------------------

--
-- Table structure for table `publication_corr_authors`
--

CREATE TABLE `publication_corr_authors` (
  `Publication_Corr_Authors_Id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quatile_sjr`
--

CREATE TABLE `quatile_sjr` (
  `QuatileSJRId` varchar(5) NOT NULL,
  `Quatile` varchar(2) DEFAULT NULL,
  `Year_YearId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quatile_sjr`
--

INSERT INTO `quatile_sjr` (`QuatileSJRId`, `Quatile`, `Year_YearId`) VALUES
('Q0001', 'Q1', 'Y2020'),
('Q0001', 'Q1', 'Y2021'),
('Q0001', 'Q1', 'Y2022'),
('Q0001', 'Q1', 'Y2023'),
('Q0002', 'Q2', 'Y2020'),
('Q0002', 'Q2', 'Y2021'),
('Q0002', 'Q2', 'Y2022'),
('Q0002', 'Q2', 'Y2023'),
('Q0003', 'Q3', 'Y2020'),
('Q0003', 'Q3', 'Y2021'),
('Q0003', 'Q3', 'Y2022'),
('Q0003', 'Q3', 'Y2023'),
('Q0004', 'Q4', 'Y2020'),
('Q0004', 'Q4', 'Y2021'),
('Q0004', 'Q4', 'Y2022'),
('Q0004', 'Q4', 'Y2023');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `RecommendationID` varchar(5) NOT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`RecommendationID`, `Users_UserID`) VALUES
('RC001', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `research_group`
--

CREATE TABLE `research_group` (
  `GroupID` varchar(5) NOT NULL,
  `GroupName` varchar(45) DEFAULT NULL,
  `University_UniversityId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `research_group`
--

INSERT INTO `research_group` (`GroupID`, `GroupName`, `University_UniversityId`) VALUES
('G0001', 'กลุ่มปัญญาประยุกต์และการวิเคราะห์ข้อมูล', 'U0001'),
('G0002', 'กลุ่มวิทยาศาสตร์เกษตรและชีววิทยา', 'U0001'),
('G0003', 'กลุ่มวิทยาศาสตร์สุขภาพ', 'U0001'),
('G0004', 'กลุ่มวิศวกรรมศาสตร์', 'U0001'),
('G0005', 'กลุ่มวิทยาการคอมพิวเตอร์', 'U0001');

-- --------------------------------------------------------

--
-- Table structure for table `research_group_authors`
--

CREATE TABLE `research_group_authors` (
  `Research_Group_Authors_id` varchar(5) NOT NULL,
  `ScopusAuthorID` varchar(10) DEFAULT NULL,
  `Research_Group_GroupID` varchar(5) NOT NULL,
  `University_UniversityId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `research_group_authors`
--

INSERT INTO `research_group_authors` (`Research_Group_Authors_id`, `ScopusAuthorID`, `Research_Group_GroupID`, `University_UniversityId`) VALUES
('RA001', '6506092179', 'G0001', 'U0001'),
('RA002', '6506519783', 'G0005', 'U0001'),
('RA003', '5489516480', 'G0005', 'U0001'),
('RA004', '3602442120', 'G0005', 'U0001'),
('RA005', '5602846730', 'G0005', 'U0001');

-- --------------------------------------------------------

--
-- Table structure for table `searchhistory`
--

CREATE TABLE `searchhistory` (
  `SearchID` varchar(5) NOT NULL,
  `SearchQuery` varchar(200) DEFAULT NULL,
  `SearchDate` datetime DEFAULT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `searchhistory`
--

INSERT INTO `searchhistory` (`SearchID`, `SearchQuery`, `SearchDate`, `Users_UserID`) VALUES
('SH001', 'โรคมะเร็ง', '2023-09-02 00:00:00', '00001');

-- --------------------------------------------------------

--
-- Table structure for table `the_research_area`
--

CREATE TABLE `the_research_area` (
  `The_Research_Area_Id` varchar(5) NOT NULL,
  `The_Research_Area_Name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `the_research_area`
--

INSERT INTO `the_research_area` (`The_Research_Area_Id`, `The_Research_Area_Name`) VALUES
('RA001', 'Medicine'),
('RA002', 'Chemisty'),
('RA003', 'Engineering'),
('RA004', 'Computer Science'),
('RA005', 'Physics and Astronomy'),
('RA006', 'Mathematics'),
('RA007', 'Social Sciences'),
('RA008', 'Arts and Humanitis'),
('RA009', 'Veterinary'),
('RA010', 'Psychology');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `UniversityId` varchar(5) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Country_CountryId` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`UniversityId`, `Name`, `Country_CountryId`) VALUES
('U0001', 'มหาวิทยาลัยขอนแก่น', 'C0001'),
('U0002', 'จุฬาลงกรณ์มหาวิทยาลัย', 'C0001'),
('U0003', 'มหาวิทยาลัยเกษตรศาสตร์', 'C0001'),
('U0004', 'มหาวิทยาลัยเชียงใหม่', 'C0001'),
('U0005', 'มหาวิทยาลัยธรรมศาสตร์', 'C0001');

-- --------------------------------------------------------

--
-- Table structure for table `universitypublicationrankings`
--

CREATE TABLE `universitypublicationrankings` (
  `UniversityPublicationRankingsId` varchar(6) NOT NULL,
  `University_UniversityId` varchar(5) NOT NULL,
  `Year_YearId` varchar(5) NOT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `universitypublicationrankings`
--

INSERT INTO `universitypublicationrankings` (`UniversityPublicationRankingsId`, `University_UniversityId`, `Year_YearId`, `Ranking`) VALUES
('UPR001', 'U0001', 'Y2020', 2),
('UPR001', 'U0001', 'Y2021', 3),
('UPR001', 'U0001', 'Y2022', 1),
('UPR001', 'U0001', 'Y2023', 1),
('UPR002', 'U0002', 'Y2020', 1),
('UPR002', 'U0002', 'Y2021', 2),
('UPR002', 'U0002', 'Y2022', 2),
('UPR002', 'U0002', 'Y2023', 2),
('UPR003', 'U0003', 'Y2020', 3),
('UPR003', 'U0003', 'Y2021', 2),
('UPR003', 'U0003', 'Y2022', 3),
('UPR003', 'U0003', 'Y2023', 3);

-- --------------------------------------------------------

--
-- Table structure for table `universityrankings`
--

CREATE TABLE `universityrankings` (
  `UniversityRankingsId` varchar(5) NOT NULL,
  `University_UniversityId` varchar(5) NOT NULL,
  `Year_YearId` varchar(5) NOT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `universityrankings`
--

INSERT INTO `universityrankings` (`UniversityRankingsId`, `University_UniversityId`, `Year_YearId`, `Ranking`) VALUES
('UR001', 'U0001', 'Y2020', 1),
('UR001', 'U0001', 'Y2021', 3),
('UR001', 'U0001', 'Y2022', 2),
('UR001', 'U0001', 'Y2023', 1),
('UR002', 'U0002', 'Y2020', 2),
('UR002', 'U0002', 'Y2021', 2),
('UR002', 'U0002', 'Y2022', 1),
('UR002', 'U0002', 'Y2023', 2),
('UR003', 'U0003', 'Y2020', 4),
('UR003', 'U0003', 'Y2021', 1),
('UR003', 'U0003', 'Y2022', 3),
('UR003', 'U0003', 'Y2023', 3),
('UR004', 'U0004', 'Y2020', 3),
('UR004', 'U0004', 'Y2021', 5),
('UR004', 'U0004', 'Y2022', 4),
('UR004', 'U0004', 'Y2023', 4),
('UR005', 'U0005', 'Y2020', 5),
('UR005', 'U0005', 'Y2021', 4),
('UR005', 'U0005', 'Y2022', 5),
('UR005', 'U0005', 'Y2023', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` varchar(5) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `CreatedAt`) VALUES
('00001', 'John', '12345678', 'User@gmail.com', 'Mr.John Walker', '2023-02-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userstatistics`
--

CREATE TABLE `userstatistics` (
  `StatID` varchar(6) NOT NULL,
  `NumberOfSearches` int(11) DEFAULT NULL,
  `NumberOfBookmarks` int(11) DEFAULT NULL,
  `Users_UserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userstatistics`
--

INSERT INTO `userstatistics` (`StatID`, `NumberOfSearches`, `NumberOfBookmarks`, `Users_UserID`) VALUES
('US0001', 100, 20, '00001');

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `YearId` varchar(5) NOT NULL,
  `Year` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`YearId`, `Year`) VALUES
('Y2020', '2020'),
('Y2021', '2021'),
('Y2022', '2022'),
('Y2023', '2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`Authors_Id`,`Publication_Authors_PublicationAuthorsId`,`Research_Group_Authors_Research_Group_Authors_id`,`Research_Group_Authors_Research_Group_GroupID`,`Research_Group_Authors_University_UniversityId`,`EducationHistory_EducationHistoryId`),
  ADD KEY `fk_Authors_Publication_Authors1_idx` (`Publication_Authors_PublicationAuthorsId`),
  ADD KEY `fk_Authors_Research_Group_Authors1_idx` (`Research_Group_Authors_Research_Group_Authors_id`,`Research_Group_Authors_Research_Group_GroupID`,`Research_Group_Authors_University_UniversityId`),
  ADD KEY `fk_Authors_EducationHistory1_idx` (`EducationHistory_EducationHistoryId`);

--
-- Indexes for table `author_mapping`
--
ALTER TABLE `author_mapping`
  ADD PRIMARY KEY (`Author_Mapping_Id`,`Users_UserID`,`Authors_Authors_Id`,`Authors_Publication_Authors_PublicationAuthorsId`),
  ADD KEY `fk_Author_Mapping_Users1_idx` (`Users_UserID`),
  ADD KEY `fk_Author_Mapping_Authors1_idx` (`Authors_Authors_Id`,`Authors_Publication_Authors_PublicationAuthorsId`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`BookmarkID`,`Users_UserID`),
  ADD KEY `fk_Bookmarks_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentID`,`Users_UserID`),
  ADD KEY `fk_Comments_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryId`);

--
-- Indexes for table `countrypublicationrankings`
--
ALTER TABLE `countrypublicationrankings`
  ADD PRIMARY KEY (`CountryPublicationRankingsId`,`Country_CountryId`,`Year_YearId`),
  ADD KEY `fk_CountryPublicationRankings_Country1_idx` (`Country_CountryId`),
  ADD KEY `fk_CountryPublicationRankings_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `educationhistory`
--
ALTER TABLE `educationhistory`
  ADD PRIMARY KEY (`EducationHistoryId`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyId`),
  ADD KEY `fk_Faculty_University1_idx` (`University_UniversityId`);

--
-- Indexes for table `facultypublicationrankings`
--
ALTER TABLE `facultypublicationrankings`
  ADD PRIMARY KEY (`FacultyPublicationRankings_Id`,`Faculty_FacultyId`,`Year_YearId`),
  ADD KEY `fk_FacultyPublicationRankings_Faculty1_idx` (`Faculty_FacultyId`),
  ADD KEY `fk_FacultyPublicationRankings_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`FieldId`),
  ADD KEY `fk_Field_Faculty1_idx` (`Faculty_FacultyId`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`FollowerID`,`Users_UserID`),
  ADD KEY `fk_Followers_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `paperstatistics`
--
ALTER TABLE `paperstatistics`
  ADD PRIMARY KEY (`StatID`,`Year_YearId`),
  ADD KEY `fk_PaperStatistics_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`PaperID`,`Quatile_SJR_QuatileSJRId`,`Quatile_SJR_Year_YearId`,`FacultyPublicationRankings_FacultyPublicationRankings_Id`,`FacultyPublicationRankings_Faculty_FacultyId`,`FacultyPublicationRankings_Year_YearId`,`PaperStatistics_StatID`,`PublicationrRanking_PublicationrRankingId`,`PublicationrRanking_Year_YearId`,`Publication_Authors_PublicationAuthorsId`,`PaperStatistics_Year_YearId`),
  ADD KEY `fk_Publication_Quatile_SJR1_idx` (`Quatile_SJR_QuatileSJRId`,`Quatile_SJR_Year_YearId`),
  ADD KEY `fk_Publication_FacultyPublicationRankings1_idx` (`FacultyPublicationRankings_FacultyPublicationRankings_Id`,`FacultyPublicationRankings_Faculty_FacultyId`,`FacultyPublicationRankings_Year_YearId`),
  ADD KEY `fk_Publication_PaperStatistics1_idx` (`PaperStatistics_StatID`,`PaperStatistics_Year_YearId`),
  ADD KEY `fk_Publication_PublicationrRanking1_idx` (`PublicationrRanking_PublicationrRankingId`,`PublicationrRanking_Year_YearId`),
  ADD KEY `fk_Publication_Publication_Authors1_idx` (`Publication_Authors_PublicationAuthorsId`);

--
-- Indexes for table `publicationrranking`
--
ALTER TABLE `publicationrranking`
  ADD PRIMARY KEY (`PublicationrRankingId`,`Year_YearId`),
  ADD KEY `fk_PublicationrRanking_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `publication_area`
--
ALTER TABLE `publication_area`
  ADD PRIMARY KEY (`PublicationAreaID`,`Publication_PaperID`),
  ADD KEY `fk_Publication_Area_Publication1_idx` (`Publication_PaperID`);

--
-- Indexes for table `publication_authors`
--
ALTER TABLE `publication_authors`
  ADD PRIMARY KEY (`PublicationAuthorsId`);

--
-- Indexes for table `publication_corr_authors`
--
ALTER TABLE `publication_corr_authors`
  ADD PRIMARY KEY (`Publication_Corr_Authors_Id`);

--
-- Indexes for table `quatile_sjr`
--
ALTER TABLE `quatile_sjr`
  ADD PRIMARY KEY (`QuatileSJRId`,`Year_YearId`),
  ADD KEY `fk_Quatile_SJR_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`RecommendationID`,`Users_UserID`),
  ADD KEY `fk_Recommendations_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `research_group`
--
ALTER TABLE `research_group`
  ADD PRIMARY KEY (`GroupID`,`University_UniversityId`),
  ADD KEY `fk_Research_Group_University1_idx` (`University_UniversityId`);

--
-- Indexes for table `research_group_authors`
--
ALTER TABLE `research_group_authors`
  ADD PRIMARY KEY (`Research_Group_Authors_id`,`Research_Group_GroupID`,`University_UniversityId`),
  ADD KEY `fk_Research_Group_Authors_Research_Group1_idx` (`Research_Group_GroupID`,`University_UniversityId`);

--
-- Indexes for table `searchhistory`
--
ALTER TABLE `searchhistory`
  ADD PRIMARY KEY (`SearchID`,`Users_UserID`),
  ADD KEY `fk_SearchHistory_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `the_research_area`
--
ALTER TABLE `the_research_area`
  ADD PRIMARY KEY (`The_Research_Area_Id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`UniversityId`),
  ADD KEY `fk_University_Country_idx` (`Country_CountryId`);

--
-- Indexes for table `universitypublicationrankings`
--
ALTER TABLE `universitypublicationrankings`
  ADD PRIMARY KEY (`UniversityPublicationRankingsId`,`University_UniversityId`,`Year_YearId`),
  ADD KEY `fk_UniversityPublicationRankings_University1_idx` (`University_UniversityId`),
  ADD KEY `fk_UniversityPublicationRankings_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `universityrankings`
--
ALTER TABLE `universityrankings`
  ADD PRIMARY KEY (`UniversityRankingsId`,`University_UniversityId`,`Year_YearId`),
  ADD KEY `fk_UniversityRankings_University1_idx` (`University_UniversityId`),
  ADD KEY `fk_UniversityRankings_Year1_idx` (`Year_YearId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD UNIQUE KEY `UserID_UNIQUE` (`UserID`);

--
-- Indexes for table `userstatistics`
--
ALTER TABLE `userstatistics`
  ADD PRIMARY KEY (`StatID`,`Users_UserID`),
  ADD KEY `fk_UserStatistics_Users1_idx` (`Users_UserID`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`YearId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `fk_Authors_EducationHistory1` FOREIGN KEY (`EducationHistory_EducationHistoryId`) REFERENCES `educationhistory` (`EducationHistoryId`),
  ADD CONSTRAINT `fk_Authors_Publication_Authors1` FOREIGN KEY (`Publication_Authors_PublicationAuthorsId`) REFERENCES `publication_authors` (`PublicationAuthorsId`),
  ADD CONSTRAINT `fk_Authors_Research_Group_Authors1` FOREIGN KEY (`Research_Group_Authors_Research_Group_Authors_id`,`Research_Group_Authors_Research_Group_GroupID`,`Research_Group_Authors_University_UniversityId`) REFERENCES `research_group_authors` (`Research_Group_Authors_id`, `Research_Group_GroupID`, `University_UniversityId`);

--
-- Constraints for table `author_mapping`
--
ALTER TABLE `author_mapping`
  ADD CONSTRAINT `fk_Author_Mapping_Authors1` FOREIGN KEY (`Authors_Authors_Id`,`Authors_Publication_Authors_PublicationAuthorsId`) REFERENCES `authors` (`Authors_Id`, `Publication_Authors_PublicationAuthorsId`),
  ADD CONSTRAINT `fk_Author_Mapping_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `fk_Bookmarks_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_Comments_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `countrypublicationrankings`
--
ALTER TABLE `countrypublicationrankings`
  ADD CONSTRAINT `fk_CountryPublicationRankings_Country1` FOREIGN KEY (`Country_CountryId`) REFERENCES `country` (`CountryId`),
  ADD CONSTRAINT `fk_CountryPublicationRankings_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `fk_Faculty_University1` FOREIGN KEY (`University_UniversityId`) REFERENCES `university` (`UniversityId`);

--
-- Constraints for table `facultypublicationrankings`
--
ALTER TABLE `facultypublicationrankings`
  ADD CONSTRAINT `fk_FacultyPublicationRankings_Faculty1` FOREIGN KEY (`Faculty_FacultyId`) REFERENCES `faculty` (`FacultyId`),
  ADD CONSTRAINT `fk_FacultyPublicationRankings_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `fk_Field_Faculty1` FOREIGN KEY (`Faculty_FacultyId`) REFERENCES `faculty` (`FacultyId`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `fk_Followers_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `paperstatistics`
--
ALTER TABLE `paperstatistics`
  ADD CONSTRAINT `fk_PaperStatistics_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `fk_Publication_FacultyPublicationRankings1` FOREIGN KEY (`FacultyPublicationRankings_FacultyPublicationRankings_Id`,`FacultyPublicationRankings_Faculty_FacultyId`,`FacultyPublicationRankings_Year_YearId`) REFERENCES `facultypublicationrankings` (`FacultyPublicationRankings_Id`, `Faculty_FacultyId`, `Year_YearId`),
  ADD CONSTRAINT `fk_Publication_PaperStatistics1` FOREIGN KEY (`PaperStatistics_StatID`,`PaperStatistics_Year_YearId`) REFERENCES `paperstatistics` (`StatID`, `Year_YearId`),
  ADD CONSTRAINT `fk_Publication_Publication_Authors1` FOREIGN KEY (`Publication_Authors_PublicationAuthorsId`) REFERENCES `publication_authors` (`PublicationAuthorsId`),
  ADD CONSTRAINT `fk_Publication_PublicationrRanking1` FOREIGN KEY (`PublicationrRanking_PublicationrRankingId`,`PublicationrRanking_Year_YearId`) REFERENCES `publicationrranking` (`PublicationrRankingId`, `Year_YearId`),
  ADD CONSTRAINT `fk_Publication_Quatile_SJR1` FOREIGN KEY (`Quatile_SJR_QuatileSJRId`,`Quatile_SJR_Year_YearId`) REFERENCES `quatile_sjr` (`QuatileSJRId`, `Year_YearId`);

--
-- Constraints for table `publicationrranking`
--
ALTER TABLE `publicationrranking`
  ADD CONSTRAINT `fk_PublicationrRanking_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `publication_area`
--
ALTER TABLE `publication_area`
  ADD CONSTRAINT `fk_Publication_Area_Publication1` FOREIGN KEY (`Publication_PaperID`) REFERENCES `publication` (`PaperID`);

--
-- Constraints for table `quatile_sjr`
--
ALTER TABLE `quatile_sjr`
  ADD CONSTRAINT `fk_Quatile_SJR_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `fk_Recommendations_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `research_group`
--
ALTER TABLE `research_group`
  ADD CONSTRAINT `fk_Research_Group_University1` FOREIGN KEY (`University_UniversityId`) REFERENCES `university` (`UniversityId`);

--
-- Constraints for table `research_group_authors`
--
ALTER TABLE `research_group_authors`
  ADD CONSTRAINT `fk_Research_Group_Authors_Research_Group1` FOREIGN KEY (`Research_Group_GroupID`,`University_UniversityId`) REFERENCES `research_group` (`GroupID`, `University_UniversityId`);

--
-- Constraints for table `searchhistory`
--
ALTER TABLE `searchhistory`
  ADD CONSTRAINT `fk_SearchHistory_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `fk_University_Country` FOREIGN KEY (`Country_CountryId`) REFERENCES `country` (`CountryId`);

--
-- Constraints for table `universitypublicationrankings`
--
ALTER TABLE `universitypublicationrankings`
  ADD CONSTRAINT `fk_UniversityPublicationRankings_University1` FOREIGN KEY (`University_UniversityId`) REFERENCES `university` (`UniversityId`),
  ADD CONSTRAINT `fk_UniversityPublicationRankings_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `universityrankings`
--
ALTER TABLE `universityrankings`
  ADD CONSTRAINT `fk_UniversityRankings_University1` FOREIGN KEY (`University_UniversityId`) REFERENCES `university` (`UniversityId`),
  ADD CONSTRAINT `fk_UniversityRankings_Year1` FOREIGN KEY (`Year_YearId`) REFERENCES `year` (`YearId`);

--
-- Constraints for table `userstatistics`
--
ALTER TABLE `userstatistics`
  ADD CONSTRAINT `fk_UserStatistics_Users1` FOREIGN KEY (`Users_UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
