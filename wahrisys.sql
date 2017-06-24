-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2017 at 06:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wahrisys`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bankcode` int(11) NOT NULL,
  `bankname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bankcode`, `bankname`) VALUES
(123, 'asdads'),
(2134, 'sdfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `bankcode` int(11) DEFAULT NULL,
  `bankname` varchar(50) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `contactperson` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `telno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `ID` int(11) DEFAULT NULL,
  `soa_number` varchar(50) DEFAULT NULL,
  `soa_date` datetime DEFAULT NULL,
  `soa_amount` double DEFAULT NULL,
  `or_number` varchar(50) DEFAULT NULL,
  `or_date` datetime DEFAULT NULL,
  `or_amount` double DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `check_no` varchar(50) DEFAULT NULL,
  `cash` bit(1) DEFAULT NULL,
  `check` bit(1) DEFAULT NULL,
  `payrollperiod` varchar(50) DEFAULT NULL,
  `monthyear` datetime DEFAULT NULL,
  `supplies` double DEFAULT NULL,
  `depreciation` double DEFAULT NULL,
  `othercharges` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `vatexempted` bit(1) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `civilstatus`
--

CREATE TABLE `civilstatus` (
  `CSCode` int(11) DEFAULT NULL,
  `CivilStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `companyid` int(11) DEFAULT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `contactperson` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `telno` varchar(50) DEFAULT NULL,
  `faxno` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `allocation` double DEFAULT NULL,
  `supplier` bit(1) DEFAULT NULL,
  `client` bit(1) DEFAULT NULL,
  `vatexempted` bit(1) DEFAULT NULL,
  `agency` int(11) DEFAULT NULL,
  `excluded` bit(1) DEFAULT NULL,
  `provincial` bit(1) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `TIN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversion errors`
--

CREATE TABLE `conversion errors` (
  `Object Type` varchar(255) DEFAULT NULL,
  `Object Name` varchar(255) DEFAULT NULL,
  `Error Description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DeptCode` int(11) DEFAULT NULL,
  `DeptDescription` varchar(50) DEFAULT NULL,
  `DeptHead` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPNO` varchar(50) NOT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `CITYADDRESS` varchar(100) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `ZIPCODE1` varchar(50) DEFAULT NULL,
  `PROVADDRESS` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `ZIPCODE2` varchar(50) DEFAULT NULL,
  `TELNO` varchar(50) DEFAULT NULL,
  `BDATE` datetime DEFAULT NULL,
  `BPLACE` varchar(50) DEFAULT NULL,
  `MALE` bit(1) DEFAULT NULL,
  `FEMALE` bit(1) DEFAULT NULL,
  `HEIGHT` varchar(50) DEFAULT NULL,
  `WEIGHT` varchar(50) DEFAULT NULL,
  `FILIPINO` bit(1) DEFAULT NULL,
  `NATIONALITY` varchar(50) DEFAULT NULL,
  `RELCODE` int(11) DEFAULT NULL,
  `CSCODE` int(11) DEFAULT NULL,
  `SPOUSE` varchar(50) DEFAULT NULL,
  `SOCCUPATION` varchar(50) DEFAULT NULL,
  `DEPENDENT1` varchar(50) DEFAULT NULL,
  `bdate1` datetime DEFAULT NULL,
  `DEPENDENT2` varchar(50) DEFAULT NULL,
  `bdate2` datetime DEFAULT NULL,
  `DEPENDENT3` varchar(50) DEFAULT NULL,
  `bdate3` datetime DEFAULT NULL,
  `DEPENDENT4` varchar(50) DEFAULT NULL,
  `bdate4` datetime DEFAULT NULL,
  `SSNO` varchar(50) DEFAULT NULL,
  `TIN` varchar(50) DEFAULT NULL,
  `NBI` varchar(50) DEFAULT NULL,
  `TERTIARY` varchar(100) DEFAULT NULL,
  `VOCATIONAL` varchar(100) DEFAULT NULL,
  `SECONDARY` varchar(100) DEFAULT NULL,
  `PRIMARY` varchar(100) DEFAULT NULL,
  `GRADUATED1` varchar(50) DEFAULT NULL,
  `GRADUATED2` varchar(50) DEFAULT NULL,
  `GRADUATED3` varchar(50) DEFAULT NULL,
  `GRADUATED4` varchar(50) DEFAULT NULL,
  `COURSE1` varchar(100) DEFAULT NULL,
  `COURSE2` varchar(100) DEFAULT NULL,
  `SKILLS` varchar(100) DEFAULT NULL,
  `INCLUSIVE1` varchar(50) DEFAULT NULL,
  `INCLUSIVE2` varchar(50) DEFAULT NULL,
  `INCLUSIVE3` varchar(50) DEFAULT NULL,
  `POSITION1` varchar(50) DEFAULT NULL,
  `POSITION2` varchar(50) DEFAULT NULL,
  `POSITION3` varchar(50) DEFAULT NULL,
  `COMPANY1` varchar(50) DEFAULT NULL,
  `COMPANY2` varchar(50) DEFAULT NULL,
  `COMPANY3` varchar(50) DEFAULT NULL,
  `NAME1` varchar(50) DEFAULT NULL,
  `NAME2` varchar(50) DEFAULT NULL,
  `NAME3` varchar(50) DEFAULT NULL,
  `TITLE1` varchar(50) DEFAULT NULL,
  `TITLE2` varchar(50) DEFAULT NULL,
  `TITLE3` varchar(50) DEFAULT NULL,
  `CCOMPANY1` varchar(50) DEFAULT NULL,
  `CCOMPANY2` varchar(50) DEFAULT NULL,
  `CCOMPANY3` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `deptcode` int(11) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `contractrate` double DEFAULT NULL,
  `salaryrate` double DEFAULT NULL,
  `datehired` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `TAXSTATUS` varchar(50) DEFAULT NULL,
  `WORKHISTORYNO` int(11) DEFAULT NULL,
  `allowance` double DEFAULT NULL,
  `pagibigcomputed` bit(1) DEFAULT NULL,
  `withbonddeposit` bit(1) DEFAULT NULL,
  `bonddeposit` double DEFAULT NULL,
  `supervisor` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `EMPLOYER` int(11) DEFAULT NULL,
  `initialbond` double DEFAULT NULL,
  `totalbond` double DEFAULT NULL,
  `bondclaimed` bit(1) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `father` varchar(50) DEFAULT NULL,
  `foccupation` varchar(50) DEFAULT NULL,
  `mother` varchar(50) DEFAULT NULL,
  `moccupation` varchar(50) DEFAULT NULL,
  `atmaccountno` varchar(50) DEFAULT NULL,
  `BANKCODE` int(11) DEFAULT NULL,
  `withtax` bit(1) DEFAULT NULL,
  `monthly` bit(1) DEFAULT NULL,
  `PAGIBIGNO` varchar(50) DEFAULT NULL,
  `PHICNo` varchar(50) DEFAULT NULL,
  `colaexcluded` bit(1) DEFAULT NULL,
  `WORKINGDAYS` int(11) DEFAULT NULL,
  `minimumwageearner` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EMPNO`, `LNAME`, `FNAME`, `MNAME`, `CITYADDRESS`, `CITY`, `ZIPCODE1`, `PROVADDRESS`, `PROVINCE`, `ZIPCODE2`, `TELNO`, `BDATE`, `BPLACE`, `MALE`, `FEMALE`, `HEIGHT`, `WEIGHT`, `FILIPINO`, `NATIONALITY`, `RELCODE`, `CSCODE`, `SPOUSE`, `SOCCUPATION`, `DEPENDENT1`, `bdate1`, `DEPENDENT2`, `bdate2`, `DEPENDENT3`, `bdate3`, `DEPENDENT4`, `bdate4`, `SSNO`, `TIN`, `NBI`, `TERTIARY`, `VOCATIONAL`, `SECONDARY`, `PRIMARY`, `GRADUATED1`, `GRADUATED2`, `GRADUATED3`, `GRADUATED4`, `COURSE1`, `COURSE2`, `SKILLS`, `INCLUSIVE1`, `INCLUSIVE2`, `INCLUSIVE3`, `POSITION1`, `POSITION2`, `POSITION3`, `COMPANY1`, `COMPANY2`, `COMPANY3`, `NAME1`, `NAME2`, `NAME3`, `TITLE1`, `TITLE2`, `TITLE3`, `CCOMPANY1`, `CCOMPANY2`, `CCOMPANY3`, `companyid`, `deptcode`, `poscode`, `from`, `to`, `contractrate`, `salaryrate`, `datehired`, `dateend`, `TAXSTATUS`, `WORKHISTORYNO`, `allowance`, `pagibigcomputed`, `withbonddeposit`, `bonddeposit`, `supervisor`, `title`, `EMPLOYER`, `initialbond`, `totalbond`, `bondclaimed`, `lastupdated`, `updatedby`, `gender`, `father`, `foccupation`, `mother`, `moccupation`, `atmaccountno`, `BANKCODE`, `withtax`, `monthly`, `PAGIBIGNO`, `PHICNo`, `colaexcluded`, `WORKINGDAYS`, `minimumwageearner`) VALUES
('1', 'iuouo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_test`
--

CREATE TABLE `employee_test` (
  `EMPNO` int(50) NOT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `CITYADDRESS` varchar(100) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `ZIPCODE1` varchar(50) DEFAULT NULL,
  `PROVADDRESS` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `ZIPCODE2` varchar(50) DEFAULT NULL,
  `TELNO` varchar(50) DEFAULT NULL,
  `BDATE` datetime DEFAULT NULL,
  `BPLACE` varchar(50) DEFAULT NULL,
  `MALE` bit(1) DEFAULT NULL,
  `FEMALE` bit(1) DEFAULT NULL,
  `HEIGHT` varchar(50) DEFAULT NULL,
  `WEIGHT` varchar(50) DEFAULT NULL,
  `FILIPINO` bit(1) DEFAULT NULL,
  `NATIONALITY` varchar(50) DEFAULT NULL,
  `RELCODE` int(11) DEFAULT NULL,
  `CSCODE` int(11) DEFAULT NULL,
  `SPOUSE` varchar(50) DEFAULT NULL,
  `SOCCUPATION` varchar(50) DEFAULT NULL,
  `DEPENDENT1` varchar(50) DEFAULT NULL,
  `bdate1` datetime DEFAULT NULL,
  `DEPENDENT2` varchar(50) DEFAULT NULL,
  `bdate2` datetime DEFAULT NULL,
  `DEPENDENT3` varchar(50) DEFAULT NULL,
  `bdate3` datetime DEFAULT NULL,
  `DEPENDENT4` varchar(50) DEFAULT NULL,
  `bdate4` datetime DEFAULT NULL,
  `SSNO` varchar(50) DEFAULT NULL,
  `TIN` varchar(50) DEFAULT NULL,
  `NBI` varchar(50) DEFAULT NULL,
  `TERTIARY` varchar(100) DEFAULT NULL,
  `VOCATIONAL` varchar(100) DEFAULT NULL,
  `SECONDARY` varchar(100) DEFAULT NULL,
  `PRIMARY` varchar(100) DEFAULT NULL,
  `GRADUATED1` varchar(50) DEFAULT NULL,
  `GRADUATED2` varchar(50) DEFAULT NULL,
  `GRADUATED3` varchar(50) DEFAULT NULL,
  `GRADUATED4` varchar(50) DEFAULT NULL,
  `COURSE1` varchar(100) DEFAULT NULL,
  `COURSE2` varchar(100) DEFAULT NULL,
  `SKILLS` varchar(100) DEFAULT NULL,
  `INCLUSIVE1` varchar(50) DEFAULT NULL,
  `INCLUSIVE2` varchar(50) DEFAULT NULL,
  `INCLUSIVE3` varchar(50) DEFAULT NULL,
  `POSITION1` varchar(50) DEFAULT NULL,
  `POSITION2` varchar(50) DEFAULT NULL,
  `POSITION3` varchar(50) DEFAULT NULL,
  `COMPANY1` varchar(50) DEFAULT NULL,
  `COMPANY2` varchar(50) DEFAULT NULL,
  `COMPANY3` varchar(50) DEFAULT NULL,
  `NAME1` varchar(50) DEFAULT NULL,
  `NAME2` varchar(50) DEFAULT NULL,
  `NAME3` varchar(50) DEFAULT NULL,
  `TITLE1` varchar(50) DEFAULT NULL,
  `TITLE2` varchar(50) DEFAULT NULL,
  `TITLE3` varchar(50) DEFAULT NULL,
  `CCOMPANY1` varchar(50) DEFAULT NULL,
  `CCOMPANY2` varchar(50) DEFAULT NULL,
  `CCOMPANY3` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `deptcode` int(11) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `contractrate` double DEFAULT NULL,
  `salaryrate` double DEFAULT NULL,
  `datehired` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `TAXSTATUS` varchar(50) DEFAULT NULL,
  `WORKHISTORYNO` int(11) DEFAULT NULL,
  `allowance` double DEFAULT NULL,
  `pagibigcomputed` bit(1) DEFAULT NULL,
  `withbonddeposit` bit(1) DEFAULT NULL,
  `bonddeposit` double DEFAULT NULL,
  `supervisor` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `EMPLOYER` int(11) DEFAULT NULL,
  `initialbond` double DEFAULT NULL,
  `totalbond` double DEFAULT NULL,
  `bondclaimed` bit(1) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `father` varchar(50) DEFAULT NULL,
  `foccupation` varchar(50) DEFAULT NULL,
  `mother` varchar(50) DEFAULT NULL,
  `moccupation` varchar(50) DEFAULT NULL,
  `atmaccountno` varchar(50) DEFAULT NULL,
  `BANKCODE` int(11) DEFAULT NULL,
  `withtax` bit(1) DEFAULT NULL,
  `monthly` bit(1) DEFAULT NULL,
  `PAGIBIGNO` varchar(50) DEFAULT NULL,
  `PHICNo` varchar(50) DEFAULT NULL,
  `colaexcluded` bit(1) DEFAULT NULL,
  `WORKINGDAYS` int(11) DEFAULT NULL,
  `minimumwageearner` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_test`
--

INSERT INTO `employee_test` (`EMPNO`, `LNAME`, `FNAME`, `MNAME`, `CITYADDRESS`, `CITY`, `ZIPCODE1`, `PROVADDRESS`, `PROVINCE`, `ZIPCODE2`, `TELNO`, `BDATE`, `BPLACE`, `MALE`, `FEMALE`, `HEIGHT`, `WEIGHT`, `FILIPINO`, `NATIONALITY`, `RELCODE`, `CSCODE`, `SPOUSE`, `SOCCUPATION`, `DEPENDENT1`, `bdate1`, `DEPENDENT2`, `bdate2`, `DEPENDENT3`, `bdate3`, `DEPENDENT4`, `bdate4`, `SSNO`, `TIN`, `NBI`, `TERTIARY`, `VOCATIONAL`, `SECONDARY`, `PRIMARY`, `GRADUATED1`, `GRADUATED2`, `GRADUATED3`, `GRADUATED4`, `COURSE1`, `COURSE2`, `SKILLS`, `INCLUSIVE1`, `INCLUSIVE2`, `INCLUSIVE3`, `POSITION1`, `POSITION2`, `POSITION3`, `COMPANY1`, `COMPANY2`, `COMPANY3`, `NAME1`, `NAME2`, `NAME3`, `TITLE1`, `TITLE2`, `TITLE3`, `CCOMPANY1`, `CCOMPANY2`, `CCOMPANY3`, `companyid`, `deptcode`, `poscode`, `from`, `to`, `contractrate`, `salaryrate`, `datehired`, `dateend`, `TAXSTATUS`, `WORKHISTORYNO`, `allowance`, `pagibigcomputed`, `withbonddeposit`, `bonddeposit`, `supervisor`, `title`, `EMPLOYER`, `initialbond`, `totalbond`, `bondclaimed`, `lastupdated`, `updatedby`, `gender`, `father`, `foccupation`, `mother`, `moccupation`, `atmaccountno`, `BANKCODE`, `withtax`, `monthly`, `PAGIBIGNO`, `PHICNo`, `colaexcluded`, `WORKINGDAYS`, `minimumwageearner`) VALUES
(1, 'ghfghfghfgh', 'ghfghf', 'hgfghf', 'hgfgh', 'fghfgh', '', '', '', '', '', '0000-00-00 00:00:00', '', b'0', b'0', '', '', b'0', '', 0, 0, '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, b'0', b'0', 0, '', '', 0, 0, 0, b'0', '0000-00-00 00:00:00', '', '', '', '', '', '', '', 0, b'0', b'0', '', '', b'0', 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `employerid` int(11) DEFAULT NULL,
  `employername` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `telno` varchar(50) DEFAULT NULL,
  `faxno` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ssnumber` varchar(50) DEFAULT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `signatory1` varchar(50) DEFAULT NULL,
  `designation1` varchar(50) DEFAULT NULL,
  `signatory2` varchar(50) DEFAULT NULL,
  `designation2` varchar(50) DEFAULT NULL,
  `signatory3` varchar(50) DEFAULT NULL,
  `designation3` varchar(50) DEFAULT NULL,
  `signatory4` varchar(50) DEFAULT NULL,
  `designation4` varchar(50) DEFAULT NULL,
  `signatory5` varchar(50) DEFAULT NULL,
  `designation5` varchar(50) DEFAULT NULL,
  `atmacctno` varchar(50) DEFAULT NULL,
  `hdmfid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empno`
--

CREATE TABLE `empno` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `ID` int(11) DEFAULT NULL,
  `empno` varchar(50) DEFAULT NULL,
  `ssnumber` varchar(50) DEFAULT NULL,
  `loantype` int(11) DEFAULT NULL,
  `amount_of_loan` double DEFAULT NULL,
  `date_granted` datetime DEFAULT NULL,
  `monthly_amortization` double DEFAULT NULL,
  `amortization_month` int(11) DEFAULT NULL,
  `amortization_year` int(11) DEFAULT NULL,
  `paid` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan types`
--

CREATE TABLE `loan types` (
  `loan_code` int(11) DEFAULT NULL,
  `loan_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `monthcode` int(11) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagibig contribution payments`
--

CREATE TABLE `pagibig contribution payments` (
  `month` smallint(6) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `pfrno` varchar(50) DEFAULT NULL,
  `pfrdate` datetime DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagibig loan payments`
--

CREATE TABLE `pagibig loan payments` (
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `pfrno` varchar(50) DEFAULT NULL,
  `pfrdate` datetime DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

CREATE TABLE `parameters` (
  `ID` int(11) DEFAULT NULL,
  `RegOTRate` double DEFAULT NULL,
  `SpclOTRate` double DEFAULT NULL,
  `NDRate` double DEFAULT NULL,
  `PagIbigRate` double DEFAULT NULL,
  `PagIbigRate2` double DEFAULT NULL,
  `BondDeposit` double DEFAULT NULL,
  `EmployerSharePagIbig` double DEFAULT NULL,
  `VAT` double DEFAULT NULL,
  `cmonths` int(11) DEFAULT NULL,
  `cdays` int(11) DEFAULT NULL,
  `cyears` int(11) DEFAULT NULL,
  `shrdrate` double DEFAULT NULL,
  `rhrdrate` double DEFAULT NULL,
  `rdshotrate` double DEFAULT NULL,
  `regotndrate` double DEFAULT NULL,
  `rdshndrate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paste errors`
--

CREATE TABLE `paste errors` (
  `withtax` bit(1) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `paycode` varchar(255) DEFAULT NULL,
  `payrollperiod` varchar(255) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `empno` varchar(255) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `companycode` int(11) DEFAULT NULL,
  `salrate` double DEFAULT NULL,
  `conrate` double DEFAULT NULL,
  `daysworked` double DEFAULT NULL,
  `defaultdays` double DEFAULT NULL,
  `excessdays` double DEFAULT NULL,
  `regotrate` double DEFAULT NULL,
  `regothrs` double DEFAULT NULL,
  `spclotrate` double DEFAULT NULL,
  `spclothrs` double DEFAULT NULL,
  `legalotrate` double DEFAULT NULL,
  `legalothrs` double DEFAULT NULL,
  `ndrate` double DEFAULT NULL,
  `ndhrs` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `allowance` double DEFAULT NULL,
  `sickleave` double DEFAULT NULL,
  `vacationleave` double DEFAULT NULL,
  `maternityleave` double DEFAULT NULL,
  `paternityleave` double DEFAULT NULL,
  `otherearnings` double DEFAULT NULL,
  `wtax` double DEFAULT NULL,
  `sss` double DEFAULT NULL,
  `medicare` double DEFAULT NULL,
  `pagibigcont` double DEFAULT NULL,
  `bond` double DEFAULT NULL,
  `cashadvance` double DEFAULT NULL,
  `salaryloan` double DEFAULT NULL,
  `calamityloan` double DEFAULT NULL,
  `pagibigloan` double DEFAULT NULL,
  `uniform` double DEFAULT NULL,
  `otherdeductions` double DEFAULT NULL,
  `taxstatus` varchar(255) DEFAULT NULL,
  `pagibigcomputed` bit(1) DEFAULT NULL,
  `extraduty` bit(1) DEFAULT NULL,
  `cregotrate` double DEFAULT NULL,
  `csunholrate` double DEFAULT NULL,
  `cndrate` double DEFAULT NULL,
  `employerss1` double DEFAULT NULL,
  `employerss2` double DEFAULT NULL,
  `employerec` double DEFAULT NULL,
  `employersharepagibig` double DEFAULT NULL,
  `employeess1` double DEFAULT NULL,
  `employeess2` double DEFAULT NULL,
  `monthyear` varchar(255) DEFAULT NULL,
  `entrydate` varchar(255) DEFAULT NULL,
  `codedby` varchar(255) DEFAULT NULL,
  `atm` bit(1) DEFAULT NULL,
  `withatm` bit(1) DEFAULT NULL,
  `monthly` bit(1) DEFAULT NULL,
  `sssremittance` double DEFAULT NULL,
  `legaldays` double DEFAULT NULL,
  `sloanid` int(11) DEFAULT NULL,
  `sloandategranted` datetime DEFAULT NULL,
  `sloanamount` double DEFAULT NULL,
  `cloanid` int(11) DEFAULT NULL,
  `cloandategranted` datetime DEFAULT NULL,
  `cloanamount` double DEFAULT NULL,
  `shrdrate` double DEFAULT NULL,
  `shrdhrs` double DEFAULT NULL,
  `rhrdrate` double DEFAULT NULL,
  `rhrdhrs` double DEFAULT NULL,
  `rdshotrate` double DEFAULT NULL,
  `rdshothrs` double DEFAULT NULL,
  `regotndrate` double DEFAULT NULL,
  `regotndhrs` double DEFAULT NULL,
  `rdshndrate` double DEFAULT NULL,
  `rdshndhrs` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `workingdays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payrolltransaction`
--

CREATE TABLE `payrolltransaction` (
  `withtax` bit(1) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `paycode` varchar(50) DEFAULT NULL,
  `payrollperiod` varchar(50) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `empno` varchar(50) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `companycode` int(11) DEFAULT NULL,
  `salrate` double DEFAULT NULL,
  `conrate` double DEFAULT NULL,
  `daysworked` double DEFAULT NULL,
  `defaultdays` double DEFAULT NULL,
  `excessdays` double DEFAULT NULL,
  `regotrate` double DEFAULT NULL,
  `regothrs` double DEFAULT NULL,
  `spclotrate` double DEFAULT NULL,
  `spclothrs` double DEFAULT NULL,
  `legalotrate` double DEFAULT NULL,
  `legalothrs` double DEFAULT NULL,
  `ndrate` double DEFAULT NULL,
  `ndhrs` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `allowance` double DEFAULT NULL,
  `sickleave` double DEFAULT NULL,
  `vacationleave` double DEFAULT NULL,
  `maternityleave` double DEFAULT NULL,
  `paternityleave` double DEFAULT NULL,
  `otherearnings` double DEFAULT NULL,
  `wtax` double DEFAULT NULL,
  `sss` double DEFAULT NULL,
  `medicare` double DEFAULT NULL,
  `pagibigcont` double DEFAULT NULL,
  `bond` double DEFAULT NULL,
  `cashadvance` double DEFAULT NULL,
  `salaryloan` double DEFAULT NULL,
  `calamityloan` double DEFAULT NULL,
  `pagibigloan` double DEFAULT NULL,
  `uniform` double DEFAULT NULL,
  `otherdeductions` double DEFAULT NULL,
  `taxstatus` varchar(50) DEFAULT NULL,
  `pagibigcomputed` bit(1) DEFAULT NULL,
  `extraduty` bit(1) DEFAULT NULL,
  `cregotrate` double DEFAULT NULL,
  `csunholrate` double DEFAULT NULL,
  `cndrate` double DEFAULT NULL,
  `employerss1` double DEFAULT NULL,
  `employerss2` double DEFAULT NULL,
  `employerec` double DEFAULT NULL,
  `employersharepagibig` double DEFAULT NULL,
  `employeess1` double DEFAULT NULL,
  `employeess2` double DEFAULT NULL,
  `monthyear` varchar(50) DEFAULT NULL,
  `entrydate` varchar(50) DEFAULT NULL,
  `codedby` varchar(50) DEFAULT NULL,
  `atm` bit(1) DEFAULT NULL,
  `withatm` bit(1) DEFAULT NULL,
  `monthly` bit(1) DEFAULT NULL,
  `sssremittance` double DEFAULT NULL,
  `legaldays` double DEFAULT NULL,
  `sloanid` int(11) DEFAULT NULL,
  `sloandategranted` datetime DEFAULT NULL,
  `sloanamount` double DEFAULT NULL,
  `cloanid` int(11) DEFAULT NULL,
  `cloandategranted` datetime DEFAULT NULL,
  `cloanamount` double DEFAULT NULL,
  `shrdrate` double DEFAULT NULL,
  `shrdhrs` double DEFAULT NULL,
  `rhrdrate` double DEFAULT NULL,
  `rhrdhrs` double DEFAULT NULL,
  `rdshotrate` double DEFAULT NULL,
  `rdshothrs` double DEFAULT NULL,
  `regotndrate` double DEFAULT NULL,
  `regotndhrs` double DEFAULT NULL,
  `rdshndrate` double DEFAULT NULL,
  `rdshndhrs` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `workingdays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payrolltypes`
--

CREATE TABLE `payrolltypes` (
  `payrolltype` int(11) DEFAULT NULL,
  `payrolldescription` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `year` int(11) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `pfrno` varchar(50) DEFAULT NULL,
  `pfrdate` datetime DEFAULT NULL,
  `EMPNO` varchar(50) DEFAULT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `SumOfPAGIBIG` double DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `employer` double DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ph`
--

CREATE TABLE `ph` (
  `year` int(11) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `reconciliation_no` varchar(50) DEFAULT NULL,
  `reconciliation_date` datetime DEFAULT NULL,
  `EMPNO` varchar(50) DEFAULT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `SumOfMEDICARE` double DEFAULT NULL,
  `banks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `philhealth`
--

CREATE TABLE `philhealth` (
  `ID` int(11) DEFAULT NULL,
  `from` double DEFAULT NULL,
  `to` double DEFAULT NULL,
  `salarybase` double DEFAULT NULL,
  `monthlycontribution` double DEFAULT NULL,
  `employershare` double DEFAULT NULL,
  `employeeshare` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `philhealth2003`
--

CREATE TABLE `philhealth2003` (
  `ID` int(11) DEFAULT NULL,
  `from` double DEFAULT NULL,
  `to` double DEFAULT NULL,
  `salarybase` double DEFAULT NULL,
  `monthlycontribution` double DEFAULT NULL,
  `employershare` double DEFAULT NULL,
  `employeeshare` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `philhealth contribution payments`
--

CREATE TABLE `philhealth contribution payments` (
  `month` smallint(6) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `reconciliation_no` varchar(50) DEFAULT NULL,
  `reconciliation_date` datetime DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pl`
--

CREATE TABLE `pl` (
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `pfrno` varchar(50) DEFAULT NULL,
  `pfrdate` datetime DEFAULT NULL,
  `empno` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `SumOfPL` double DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `sdate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `poscode` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `posno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `CompanyID` varchar(50) DEFAULT NULL,
  `PosCode` varchar(50) DEFAULT NULL,
  `ContractRate` double DEFAULT NULL,
  `SalaryRate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `RelCode` int(11) DEFAULT NULL,
  `Religion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sss contribution table`
--

CREATE TABLE `sss contribution table` (
  `SAL BRACKET` float DEFAULT NULL,
  `RANGE OF COMPEN1` double DEFAULT NULL,
  `RANGE OF COMPEN2` double DEFAULT NULL,
  `MONTHLY SAL CRED` double DEFAULT NULL,
  `EMPLOYER SS` double DEFAULT NULL,
  `EMPLOYER EC` double DEFAULT NULL,
  `EMPLOYEE SS` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sss payment`
--

CREATE TABLE `sss payment` (
  `monthyear` varchar(50) DEFAULT NULL,
  `sss_or` varchar(50) DEFAULT NULL,
  `sss_or_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sss_r1a`
--

CREATE TABLE `sss_r1a` (
  `ID` int(11) DEFAULT NULL,
  `IDNUMBER` varchar(50) DEFAULT NULL,
  `SSSNUMBER` varchar(50) DEFAULT NULL,
  `FULLNAME` varchar(50) DEFAULT NULL,
  `ENTRYDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taxstatus`
--

CREATE TABLE `taxstatus` (
  `taxstatus` varchar(50) DEFAULT NULL,
  `personal exemption` double DEFAULT NULL,
  `additional exemption` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax table`
--

CREATE TABLE `tax table` (
  `ID` int(11) DEFAULT NULL,
  `lwrlimit` double DEFAULT NULL,
  `uprlimit` double DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `additional` double DEFAULT NULL,
  `less` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `withtax` bit(1) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  `paycode` varchar(50) DEFAULT NULL,
  `payrollperiod` varchar(50) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `empno` varchar(50) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `companycode` int(11) DEFAULT NULL,
  `salrate` double DEFAULT NULL,
  `conrate` double DEFAULT NULL,
  `daysworked` double DEFAULT NULL,
  `defaultdays` double DEFAULT NULL,
  `excessdays` double DEFAULT NULL,
  `regotrate` double DEFAULT NULL,
  `regothrs` double DEFAULT NULL,
  `spclotrate` double DEFAULT NULL,
  `spclothrs` double DEFAULT NULL,
  `legalotrate` double DEFAULT NULL,
  `legalothrs` double DEFAULT NULL,
  `ndrate` double DEFAULT NULL,
  `ndhrs` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `allowance` double DEFAULT NULL,
  `sickleave` double DEFAULT NULL,
  `vacationleave` double DEFAULT NULL,
  `maternityleave` double DEFAULT NULL,
  `paternityleave` double DEFAULT NULL,
  `otherearnings` double DEFAULT NULL,
  `wtax` double DEFAULT NULL,
  `sss` double DEFAULT NULL,
  `medicare` double DEFAULT NULL,
  `pagibigcont` double DEFAULT NULL,
  `bond` double DEFAULT NULL,
  `cashadvance` double DEFAULT NULL,
  `salaryloan` double DEFAULT NULL,
  `calamityloan` double DEFAULT NULL,
  `pagibigloan` double DEFAULT NULL,
  `uniform` double DEFAULT NULL,
  `otherdeductions` double DEFAULT NULL,
  `taxstatus` varchar(50) DEFAULT NULL,
  `pagibigcomputed` bit(1) DEFAULT NULL,
  `extraduty` bit(1) DEFAULT NULL,
  `cregotrate` double DEFAULT NULL,
  `csunholrate` double DEFAULT NULL,
  `cndrate` double DEFAULT NULL,
  `employerss1` double DEFAULT NULL,
  `employerss2` double DEFAULT NULL,
  `employerec` double DEFAULT NULL,
  `employersharepagibig` double DEFAULT NULL,
  `employeess1` double DEFAULT NULL,
  `employeess2` double DEFAULT NULL,
  `monthyear` varchar(50) DEFAULT NULL,
  `entrydate` varchar(50) DEFAULT NULL,
  `codedby` varchar(50) DEFAULT NULL,
  `atm` bit(1) DEFAULT NULL,
  `withatm` bit(1) DEFAULT NULL,
  `monthly` bit(1) DEFAULT NULL,
  `sssremittance` double DEFAULT NULL,
  `legaldays` double DEFAULT NULL,
  `sloanid` int(11) DEFAULT NULL,
  `sloandategranted` datetime DEFAULT NULL,
  `sloanamount` double DEFAULT NULL,
  `cloanid` int(11) DEFAULT NULL,
  `cloandategranted` datetime DEFAULT NULL,
  `cloanamount` double DEFAULT NULL,
  `shrdrate` double DEFAULT NULL,
  `shrdhrs` double DEFAULT NULL,
  `rhrdrate` double DEFAULT NULL,
  `rhrdhrs` double DEFAULT NULL,
  `rdshotrate` double DEFAULT NULL,
  `rdshothrs` double DEFAULT NULL,
  `regotndrate` double DEFAULT NULL,
  `regotndhrs` double DEFAULT NULL,
  `rdshndrate` double DEFAULT NULL,
  `rdshndhrs` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `workingdays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userlevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `userlevel`) VALUES
(1, 'Developer', 'asdf', 1),
(234, 'rodave', 'asdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `withholdingtax`
--

CREATE TABLE `withholdingtax` (
  `taxstatus` varchar(20) DEFAULT NULL,
  `1` double DEFAULT NULL,
  `2` double DEFAULT NULL,
  `3` double DEFAULT NULL,
  `4` double DEFAULT NULL,
  `5` double DEFAULT NULL,
  `6` double DEFAULT NULL,
  `7` double DEFAULT NULL,
  `8` double DEFAULT NULL,
  `excluded` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withholdingtaxrates`
--

CREATE TABLE `withholdingtaxrates` (
  `COLCODE` varchar(50) DEFAULT NULL,
  `PERCENTAGE` double DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workhistory`
--

CREATE TABLE `workhistory` (
  `workhistoryno` int(11) DEFAULT NULL,
  `empid` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `deptcode` int(11) DEFAULT NULL,
  `poscode` int(11) DEFAULT NULL,
  `supervisor` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `contractrate` double DEFAULT NULL,
  `salaryrate` double DEFAULT NULL,
  `allowance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bankcode`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPNO`);

--
-- Indexes for table `employee_test`
--
ALTER TABLE `employee_test`
  ADD PRIMARY KEY (`EMPNO`),
  ADD UNIQUE KEY `EMPNO` (`EMPNO`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_test`
--
ALTER TABLE `employee_test`
  MODIFY `EMPNO` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
