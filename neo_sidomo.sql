-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 05:07 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neo_sidomo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cal_certificates`
--

CREATE TABLE `cal_certificates` (
  `id` varchar(24) NOT NULL,
  `device_id` varchar(24) NOT NULL,
  `calibration_date` varchar(24) NOT NULL,
  `due_date` varchar(24) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `certificate_file` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_certificates`
--

INSERT INTO `cal_certificates` (`id`, `device_id`, `calibration_date`, `due_date`, `test_engineer_id`, `certificate_file`) VALUES
('001-KAL-19', '137/CAL', '2019-09-24', '2021-09-24', '970037', 'test.pdf'),
('001-KAL-20', '006/CAL', '2020-02-03', '2021-02-03', '970037', 'certificate_file_1580665068554_DKI Jakarta.pdf'),
('002-KAL-19', '194/CAL', '2019-09-25', '2021-09-25', '970037', 'test.pdf'),
('003-KAL-19', '103/CAL', '2019-09-26', '2021-09-26', '970037', 'test.pdf'),
('004-KAL-19', '101/CAL', '2019-09-27', '2021-09-27', '970037', 'test.pdf'),
('005-KAL-19', '100/CAL', '2019-09-28', '2021-09-28', '970037', 'test.pdf'),
('006-KAL-19', '097/CAL', '2019-09-29', '2021-09-29', '970037', 'test.pdf'),
('007-KAL-19', '096/CAL', '2019-09-30', '2021-09-30', '970037', 'test.pdf'),
('008-KAL-19', '091/CAL', '2019-10-03', '2021-10-03', '970037', 'test.pdf'),
('009-KAL-19', '136/TRA', '2019-10-01', '2021-10-01', '970037', 'test.pdf'),
('011-KAL-19', '095/CAL', '2019-10-04', '2021-10-04', '970037', 'test.pdf'),
('048-KAL-19', '086/CAL', '2019-11-10', '2021-11-10', '970037', 'test.pdf'),
('049-KAL-19', '129/CAL', '2019-11-11', '2021-11-11', '970037', 'test.pdf'),
('050-KAL-19', '130/CAL', '2019-11-12', '2021-11-12', '970037', 'test.pdf'),
('051-KAL-19', '109/CAL', '2019-11-13', '2021-11-13', '970037', 'test.pdf'),
('052-KAL-19', '121/CAL', '2019-11-14', '2021-11-14', '970037', 'test.pdf'),
('053-KAL-19', '119/CAL', '2019-11-15', '2021-11-15', '970037', 'test.pdf'),
('054-KAL-19', '037/CAL', '2019-11-16', '2021-11-16', '970037', 'test.pdf'),
('055-KAL-19', '099/ENE', '2019-11-17', '2021-11-17', '970037', 'test.pdf'),
('056-KAL-19', '018/ENE', '2019-11-18', '2021-11-18', '970037', 'test.pdf'),
('057-KAL-19', '180/CAL', '2019-11-19', '2021-11-19', '970037', 'test.pdf'),
('058-KAL-19', '006/CAL', '2019-11-20', '2021-11-20', '970037', 'test.pdf'),
('059-KAL-19', '133/CAL', '2019-11-21', '2021-11-21', '970037', 'test.pdf'),
('060-KAL-19', '062/CAB', '2019-11-22', '2021-11-22', '970037', 'test.pdf'),
('061-KAL-19', '092/CAB', '2019-11-23', '2021-11-23', '970037', 'test.pdf'),
('062-KAL-19', '093/CAB', '2019-11-24', '2021-11-24', '970037', 'test.pdf'),
('063-KAL-19', '069/CAB', '2019-11-25', '2021-11-25', '970037', 'test.pdf'),
('064-KAL-19', '023/CAB', '2019-11-26', '2021-11-26', '970037', 'test.pdf'),
('132/KAB/L/QA/2020', '022/132/QA/2020', '2019-08-21', '2019-09-13', '970037', 'certificate_file_1584900013909_KSO DIRECT BURIED 4 - 96 CORE G.655.C English final.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `cal_requests`
--

CREATE TABLE `cal_requests` (
  `id` varchar(15) NOT NULL,
  `lab` varchar(3) NOT NULL,
  `request_type` varchar(3) NOT NULL,
  `device_name` text NOT NULL,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `serial_number` text NOT NULL,
  `capacity` text NOT NULL,
  `made_in` varchar(24) NOT NULL,
  `test_reference` text NOT NULL,
  `company_name` text NOT NULL,
  `company_address` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `start_target` varchar(24) NOT NULL,
  `finished_target` varchar(24) NOT NULL,
  `actual_start` varchar(24) NOT NULL,
  `actual_finished` varchar(24) NOT NULL,
  `engineer_1` varchar(11) NOT NULL,
  `engineer_2` varchar(11) NOT NULL,
  `engineer_3` varchar(11) NOT NULL,
  `documentation` text NOT NULL,
  `status` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_requests`
--

INSERT INTO `cal_requests` (`id`, `lab`, `request_type`, `device_name`, `manufacturer`, `model`, `serial_number`, `capacity`, `made_in`, `test_reference`, `company_name`, `company_address`, `created`, `start_target`, `finished_target`, `actual_start`, `actual_finished`, `engineer_1`, `engineer_2`, `engineer_3`, `documentation`, `status`) VALUES
('022/132/QA/2020', 'CAB', 'QA', 'KABEL SERAT OPTIK SINGLE MODE BERKONSTRUKSI LOOSE TUBE UNTUK APLIKASI TANAM LANGSUNG (KSO DIRECT BURIED)', 'VOKSEL', 'NZDS C LF B WG LT ( G 655 C ) ', '', '4 to 96 CORE', 'Indonesia', 'STEL K-016-2013 Ver. 3.0', 'VOKSEL ELECTRIC, Tbk. PT.', 'JL. RAYA NAROGONG KM.16, CILEUNGSI, BOGOR\r\n', '2020-03-18', '2020-03-18', '2020-04-08', '2020-03-20', '2020-04-10', '970037', '970000', '201902060', 'test.jpg', '1'),
('a', '', '', 'ab', 'a', 'a', '', '', '', '', 'a', 'a', '2020-03-26', '2020-03-26', '2020-04-02', '2020-03-27', '', '970037', '', '', 'test.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cal_steps`
--

CREATE TABLE `cal_steps` (
  `id` varchar(11) NOT NULL,
  `step_name` text NOT NULL,
  `step_number` int(5) NOT NULL,
  `info` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_steps`
--

INSERT INTO `cal_steps` (`id`, `step_name`, `step_number`, `info`, `created`, `updated`) VALUES
('CER1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV4', 'Documentation', 0, 'has add a device documentation', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV5', 'Manual', 0, 'has add a device manual', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV6', 'Specification', 0, 'has add a device specification', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ1', 'Add', 1, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ4', 'Documentation', 0, 'has add a device documentation', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL3', 'Calibrating', 3, 'has change the request status to CALIBRATING', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA3', 'QA Test', 3, 'has change the request status to QA TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA3', 'TA Test', 3, 'has change the request status to TA TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT3', 'VT Test', 3, 'has change the request status to VT TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` varchar(11) NOT NULL,
  `form_name` text NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` varchar(11) NOT NULL,
  `reference_id` varchar(24) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `cal_step_id` varchar(11) NOT NULL,
  `message` text,
  `created` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `reference_id`, `test_engineer_id`, `cal_step_id`, `message`, `created`) VALUES
('H1E69KFPCO', '012/CAB', '970037', 'DEV2', '', '2020-04-19T16:31:34.808Z'),
('H1E69KJEJN', '022/132/QA/2020', '970037', 'REQ1', '', '2020-04-19T16:33:34.839Z'),
('H1E6H6EF3G', '022/132/QA/2020', '970037', 'REQQA2', 'oke', '2020-04-22T15:00:06.896Z');

-- --------------------------------------------------------

--
-- Table structure for table `procedures`
--

CREATE TABLE `procedures` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `effective_date` varchar(24) NOT NULL,
  `pic` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `procedures`
--

INSERT INTO `procedures` (`id`, `name`, `effective_date`, `pic`, `version`, `file`) VALUES
('PM/TLKM Bag-B', 'Panduan Mutu Laboratorium Quality Assurance ( B. Daftar Penerima Notifikasi, D. Daftar Isi)', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-BagBD-v02--Panduan-Mutu-Lab-QA-Penerima-Notifikasi-dan-Daftar-Isi.pdf'),
('PM/TLKM Bag-C', 'Panduan Mutu Laboratorium Quality Assurance ( C. Rekaman Riwayat Dokumen )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-BagC-v03--Panduan-Mutu-Lab-QA-Rekaman-Riwayat-Dokumen.pdf'),
('PM/TLKM Ch-1', 'Panduan Mutu Laboratorium Quality Assurance ( 1. Lingkup dan Kebijakan )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt1-v02--Lingkup-dan-Kebijakan.pdf'),
('PM/TLKM Ch-2', 'Panduan Mutu Laboratorium Quality Assurance ( 2. Acuan Normatif )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt2-v02--Acuan-Normatif.pdf'),
('PM/TLKM Ch-3', 'Panduan Mutu Laboratorium Quality Assurance ( 3. Singkatan, Istilah, dan Definisi )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt3-v02--Singkatan-Istilah-dan-Definisi.pdf'),
('PM/TLKM Ch-4', 'Panduan Mutu Laboratorium Quality Assurance ( 4. Persyaratan Umum )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt4-v02--Persyaratan-Umum.pdf'),
('PM/TLKM Ch-5', 'Panduan Mutu Laboratorium Quality Assurance ( 5. Persyaratan Struktural )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt5-v02--Persyaratan-Struktural.pdf'),
('PM/TLKM Ch-6', 'Panduan Mutu Laboratorium Quality Assurance ( 6. Persyaratan Sumber Daya )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-Chapt6-v03--Persyaratan-Sumber-Daya.pdf'),
('PM/TLKM Ch-7', 'Panduan Mutu Laboratorium Quality Assurance ( 7. Persyaratan Proses )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt7-v02--Persyaratan-Proses.pdf'),
('PM/TLKM Ch-8', 'Panduan Mutu Laboratorium Quality Assurance ( 8. Persyaratan Sistem Manajemen )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt8-v02--Persyaratan-Sistem-Manajemen.pdf'),
('PM/TLKM Lp-1', 'Panduan Mutu Laboratorium Quality Assurance ( L1. Dokumen Terkait )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-Lamp1-v03--Dokumen-Terkait.pdf'),
('PM/TLKM Lp-2', 'Panduan Mutu Laboratorium Quality Assurance ( L2. Penandatanganan Laporan )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp2-v02--Penandatanganan-Laporan.pdf'),
('PM/TLKM Lp-3', 'Panduan Mutu Laboratorium Quality Assurance ( L3. Layout Ruangan Lab QA )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp3-v02--Layout-Ruangan-Lab-QA.pdf'),
('PM/TLKM Lp-4', 'Panduan Mutu Laboratorium Quality Assurance ( L4. Persyaratan Umum )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp4-v02--Struktur-Organisasi-DDS.pdf'),
('PM/TLKM Lp-5', 'Panduan Mutu Laboratorium Quality Assurance ( L5. Akreditasi Lab Kalibrasi LK-002-IDN )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp7-v02--Akreditasi-SDPPI-IDN-002-2019.pdf'),
('PM/TLKM Lp-6', 'Panduan Mutu Laboratorium Quality Assurance ( L6. Akreditasi Lab Pengujian LP-490-IDN )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp6-v02--Akreditasi-Lab-Pengujian-LP-490-IDN-2566.pdf'),
('PM/TLKM Lp-7', 'Panduan Mutu Laboratorium Quality Assurance ( L7. Akreditasi SDPPI ( IDN-002/2019 )', '2019-11-06', 'EGM-DDS', '1', 'PMTLKM-Lamp5-v02--Akreditasi-Lab-Kalibrasi-LK-002-IDN.pdf'),
('TLKM/I/DEV/001', 'Panduan Umum Pengujian', '2018-10-23', 'Mgr-DEQA', '1', 'TLKMIDEV001-v01--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/DEV/002', 'Modem (2 wires), S/N Ratio, Transmit, and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/003', 'Modem (4 wires), S/N Ratio, Transmit, dan Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/004', 'Modem, Availability Test Against DC Line Supply', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/005', 'Modem Leased Line, Impedance dan Return Loss Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/006', 'Facsimile, Transmit, and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/007', 'Uji Pemeriksaan Label Perangkat Terminal dan Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/008', 'Uji Operasi Perangkat Facsimile', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/009', 'Pengukuran Sinyal CNG Perangkat Facsimile', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/010', 'Pemeriksaan Fasilitas Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/011', 'Wrist Strap Check', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/012', 'Pengujian Kebocoran Tegangan Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/013', 'Uji Operasi Perangkat Modem Data', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/014', 'Validasi Software Data Line Analyzer Siemens K1190', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/015', 'Validasi-Software-Oscilloscope-HP-54520A', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/016', 'Validasi Software Consultronics TCS-500', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/017', 'Validasi Software Telephone Test Set Microtronix Model 60', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/018', 'Validasi Software Telephone Set Tester HE-212', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/019', 'Validasi Software PCM Test Set Siemens P2112', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/020', 'Pemeriksaan-Fraud-Fungsi-PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/021', 'Pengujian Catu Operasi Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/022', 'Pengujian Unit Pilih DP Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/023', 'Pengujian Unit Pilih DTMF Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/024', 'Pengujian Impedansi Keadaan Off-Hook Arus Searah Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/025', 'Pengujian Impedansi Keadaan Off-Hook Frek 1000Hz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/026', 'Pengujian Impedansi Keadaan Bebas (On-Hook) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/027', 'Pengujian Return Loss Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/028', 'Pengujian Tahanan Isolasi (Kebocoran) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/029', 'Pengujian Noise Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/030', 'Pengujian Deteksi Sinyal Panggil (Bel) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/031', 'Pengujian Elektro Akustik Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/032', 'Pengujian Deteksi Cashing Signal 16kHz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/033', 'Pengujian Deteksi Cashing Signal Reverse Polarity Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/034', 'Pengujian Deteksi Cashing Signal 50Hz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/035', 'Pengujian Interferensi Gelombang Radio ke Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/036', 'Uji Operasi Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/037', 'Terminal Equipment Transmit and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/038', 'Pengujian Pendeteksian DTMF', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/039', 'Pengujian Catu Operasi Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/040', 'Pengujian Unit Pilih DP Perangkat Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/041', 'Pengujian Unit Pilih DTMF Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/042', 'Pengujian Impedansi Off-Hook Utk Arus Searah Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/043', 'Pengujian Impedansi Off-Hook untuk Frekuensi 1000Hz Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/044', 'Pengujian Redaman Eksternal Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/045', 'Pengujian Return Loss Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/046', 'Pengujian Redaman Bicara Silang Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/047', 'Pengujian Kemampuan Sistem Switching terhadap Kondisi Saluran', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/048', 'Pengujian Pembangkit Sinyal Bel Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/049', 'Pengujian Dial Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/050', 'Pengujian Ring Back Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/051', 'Pengujian Busy Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/052', 'Pengujian Tahanan Isolasi (Kebocoran) Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/053', 'Pengujian Kebocoran Tegangan Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/054', 'Pengujian Impedansi Keadaan On-Hook Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/055', 'Pengujian Kemampuan Sistem Switching Terhadap Sinyal Panggil', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/056', 'Pengujian Elektro Akustik Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/057', 'Pengujian Noise Ripple Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/058', 'Pengujian Kepekaan Sensitivitas Switching thd Kondisi Saluran Pokok', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/059', 'Pengujian Pencatatan Data Pembicaraan Per PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/060', 'Pengujian Fungsi Pensinyalan Panggilan Keluar Per PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/061', 'Pengujian Noise Riple Unit Catu Daya Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/062', 'Pengujian Unit Catu Daya Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/063', 'Panduan Umum Opini Dalam Pengujian', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/064', 'Pemeriksaan Alat Ukur di Laboratorium', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/065', 'Pengujian Bit Error Rate (BER)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/066', 'Pengujian Perangkat Modem 2B1Q', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/067', 'Pengujian Chamber', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/068', 'Pengujian Interface Analog Menggunakan PSTN 21', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/069', 'Pengujian Arus DC Selama Pengebelan', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/070', 'Regular Check Telephone Test Set Microtronix M-60', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/071', 'Regular Check Data Line Analyzer Siemens K-1190', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/072', 'Regular Check PCM Test SetSiemens P2112', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/073', 'Regular Check Telephone SetTester HE-212', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/074', 'Regular Check DTMF Generator HE-305', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/075', 'Regular Check Attenuator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/076', 'Regular Check Multimeter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/077', 'Regular Check Oscilloscope', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/078', 'Regular Check Testel-510', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/079', 'Regular Check Insulation Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/080', 'Regular Check Signal Sequence Relay', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/081', 'Regular Check 16kHz Payphone Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/082', 'Regular Check Level Measurement Set Selective Level Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/083', 'Regular Check Modem and Fax Test System Consultronics', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/084', 'Regular Check Test Feed Coil HE-215', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/085', 'Regular Check Power Supply', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/086', 'Regular Check Spectrum Analyzer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/087', 'Regular Check Balancing Transformer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/088', 'Regular Check 600Ohm Terminator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/089', 'Regular Check Decade Resistor', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/090', 'Regular Check Transmission Test Set', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/091', 'Regular Check Level Generator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/092', 'Regular Check Selective Level Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/093', 'Regular Check Data Line Analyzer WG DLA-9D', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/094', 'Regular Check DC Loop Holding Circuit', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/095', 'Regular Check Signal Generator AM dan FM', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/096', 'Pengujian Code Delay Time Perangkat Gateway VoIP Gatekeeper', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/097', 'Pengujian Round Trip Latency', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/098', 'Regular Check Noise Generator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/099', 'Pengujian Jitter VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/100', 'Pengujian Audio Compression Gateway VoIP Gatekeeper', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/101', 'Pengujian Loss Packet VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/102', 'PrismLite RadCom Conf dan OPU Fast LAN Line Interface Module (LIM) for VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/103', 'Panduan Verifikasi Antarmuka Ethernet (10/100/1000Mbps) IXIA Optixia XM2', '2019-03-28', 'Mgr-DEQA', '2', ''),
('TLKM/I/DEV/104', 'Pengujian Link Aggregation (LAG) Perangkat Switch Ethernet', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/105', 'Pengujian Sistem Akses - IP Address Filtering, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/106', 'Pengujian Sistem Akses - MAC Address Filtering, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/107', 'Pengujian Spanning Tree Protocol (STP), PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/108', 'Pengujian Switching Engine, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/109', 'Pengujian Temperatur Kerja, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/110', 'Pengujian Total Kebisingan Suara (Audible Noise), PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/111', 'Pengujian VLAN 802.1Q Tagging, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/112', 'Pengujian VLAN Priority 802.1P, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/113', 'Panduan Umum Pengoperasian IXIA Optixia XM2', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/114', 'Pengujian Performansi Port Ethernet (RFC2544) Perangkat ONT (Optical Network Termination) Retail', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/115', 'Pengujian Performansi Port Ethernet (RFC2544) Perangkat Switch Ethernet', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/001', 'Panduan Umum Pengujian', '2018-10-23', 'Mgr-DEQA', '1', 'TLKMIENE001-v01--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/ENE/002', 'Pengujian Ketahanan Bentur', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/003', 'Pengujian Kapasitas Batere', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/004', 'Pengujian Efisiensi Batere', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/005', 'Pengujian Tegangan dan Arus Floating', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/006', 'Pengujian Tegangan Tembus', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/007', 'Pengujian Tegangan Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/008', 'Pengujian Pengosongan Cepat', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/009', 'Pengujian Operasi Charge Discharge', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/010', 'Pengujian Charge Discharge Batere Starting Engine', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/011', 'Pengaturan Arus Kejut', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/012', 'Pengaturan Tegangan Floating dan Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/013', 'Pengujian Regulasi Beban', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/014', 'Pengujian Harmonisa', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/015', 'Pengujian Fungsi dan Operasi Manual Otomatis Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/016', 'Pengujian Daya Guna Rectifier dan UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/017', 'Pengujian Power Factor', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/018', 'Pengujian Pembatas Tegangan Rendah', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/019', 'Pengujian Pembatas Arus Keluaran', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/020', 'Pengujian Power Walk In', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/021', 'Pengujian Kapasitas Rectifier dan UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/022', 'Pengujian Regulasi Catuan Input', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/023', 'Pengujian Tegangan Ripple dan Noise', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/024', 'Pengujian Pembatas Tegangan Tinggi', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/025', 'Pengujian Load Sharing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/026', 'Pengujian LVD (Low Voltage Disconnection)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/027', 'Pengaturan Tegangan Keluaran dan Regulasi Beban UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/028', 'Pengujian Beban Lebih Pada UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/029', 'Pengujian Sistem Operasi UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/030', 'Pengujian Manual dan Automatic Bypass Switch', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/031', 'Pengujian Beban Tidak Seimbang Pada UPS 3-Phase', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/032', 'Pengujian Pengontrol Phase', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/033', 'Pengujian Alat Ukur Panel', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/034', 'Pengujian Kebisingan (Audible Noise)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/035', 'Pembuatan Elektrolit (H2SO4)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/036', 'Validasi Software Life Cycle Battery Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/037', 'Pemeriksaan Konstruksi Rectifier', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/038', 'Pemeriksaan Konstruksi UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/039', 'Pembuatan Program Bitrode', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/040', 'Panduan Penanganan Aluk untuk Pengujian di Luar Lab DEQA', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/041', 'Jaminan Umum Hasil Pengujian', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/042', 'Pedoman Umum Regular Check', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/043', 'Pemeriksaan Alat Ukur yang Akan Digunakan di Luar Lab DEQA', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/044', 'Regular Check Digital Multimeter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/045', 'Regular Check LCN Bitrode', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/046', 'Regular Check Current Shunt', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/047', 'Regular Check Power Harmonic Analyzer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/048', 'Regular Check Reserve Capacity Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/049', 'Regular Check Stop Watch', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/050', 'Regular Check High Port Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/051', 'Regular Check Psophometer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/KAB/001', 'Pengujian Ketahanan terhadap Beban Statis', '2018-10-23', 'Mgr-IQA', '1', 'TLKMIKAB001_v01_Pengujian-Ketahanan-thd-Beban-Statis.pdf'),
('TLKM/I/KAB/002', 'Pengujian Bursting Strength', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/003', 'Pengujian Celup Air', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/004', 'Pengujian Ketahanan terhadap Arus Surja', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/005', 'Pengujian Bahan Perekat', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/006', 'Pengujian Dimensi Kabel dan Accesories', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/007', 'Pengujian Ketahanan terhadap Panas', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/008', 'Pengujian Jatuh Tiang Telepon Besi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/009', 'Pengujian Kapasitansi Bersama', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/010', 'Pengujian Kadar Jelaga dalam PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/011', 'Pengujian Pengerutan PE pada 100dC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/012', 'Pengujian Bocor Lembab', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/013', 'Pengujian Lengkung Tiang Telepon Besi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/014', 'Pengujian Konstanta Dielektrikum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/015', 'Pengujian Kemampuan Pakai Ulang Blok Terminal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/016', 'Pengujian Ketahanan Terhadap Panas Kering', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/017', 'Pengujian Ketahanan Terhadap Puntiran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/018', 'Pengujian Redaman Saluran Kabel PCM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/019', 'Pengujian Ketahanan Terhadap Hablur Garam', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/020', 'Pengujian Ketahanan terhadap Perubahan Suhu', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/021', 'Pengujian Ketahanan terhadap Siklus Suhu Lembab untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/022', 'Pengujian Ketahanan Terhadap Siklus Suhu Untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/023', 'Pengujian Tahanan Isolasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/024', 'Pengujian Tahanan Arus Searah', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/025', 'Pengujian Tahanan Kontak Blok Terminal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/026', 'Pengujian Ketidakseimbangan Kapasitansi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/027', 'Ketidakseimbangan Tahanan Arus Searah Pasangan Penghantar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/028', 'Pengujian Tegangan Tembus terhadap Sarana Sambung Kabel', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/029', 'Pengujian Tegangan Tembus Kabel', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/030', 'Pengujian Ketahanan Terhadap Tekanan Udara', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/031', 'Pengujian Ketahanan Terhadap Tekukan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/032', 'Pengujian Tembus Air Untuk Kabel Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/033', 'Pengujian Kejut Termis untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/034', 'Pengujian Ketahanan terhadap Arus Bolak Balik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/035', 'Pengujian Kuat Tarik PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/036', 'Pengujian Kuat Tarik Pipa PVC PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/037', 'Pengujian Ketahanan terhadap Arus Beban', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/038', 'Pengujian Getar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/039', 'Ketahanan terhadap Benturan untuk KP, RK, SSK, atau KTB', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/040', 'Pengujian Kedap Air', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/041', 'Pengujian Tarik Logam', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/042', 'Pengujian Ketahanan Terhadap Tegangan Bolak-Balik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/043', 'Pengujian Kuat Lentur Tiang Telepon Beton', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/044', 'Pengujian Pipih (Flatening)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/045', 'Pengujian Ketahanan terhadap Tegangan Surja', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/046', 'Pengujian Tembus Kerucut untuk Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/047', 'Pengujian Kekentalan Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/048', 'Pengujian Titik Tetes Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/049', 'Pengujian Titik Nyala Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/050', 'Pengujian Density Jelly dan PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/051', 'Pengujian Ketahanan terhadap Kelembaban', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/052', 'Pengujian Kuat Dielektrikum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/053', 'Pengujian Titik Lunak PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/054', 'Pengujian Ketahanan Terhadap Tekanan Udara Untuk Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/055', 'Pengujian Bending Sub Duct', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/056', 'Pengujian Penuaan Termis SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/057', 'Pengujian Daya Serap Air untuk SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/058', 'Pengujian Ketahanan terhadap Larutan Kimia untuk SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/059', 'Ketentuan Global Suhu, Humidity, dan Jumlah Sample', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/060', 'Pengujian Wrist Strap', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/061', 'Pengukuran Tahanan Jenis PE dan Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/062', 'Pengukuran Geometri Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/063', 'Pengukuran Spectral Attenuation Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/064', 'Pengukuran Attenuation Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/065', 'Pengukuran Chromatic Dispersion Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/066', 'Pengujian Mekanik Kabel Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/067', 'Panduan Umum Opini', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/068', 'Pengujian Koefisien Friksi Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/069', 'Pengujian Ketahanan Tumbukan Pipa HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/070', 'Pengujian Tarikan dan Pemuluran Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/071', 'Panduan Umum Pengujian Sistem Komputerisasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/072', 'Menentukan Braid Coverage Kabel Koaksial Drop', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/073', 'Pengujian Pengerutan Longitudinal Selubung PE Kabel Koaksial HFC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/074', 'Pengujian Ketahanan Korosi Kabel Koaksial HFC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/075', 'Pengujian Polarization Mode Dispersion (PMD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/076', 'Pengukuran Redaman dan Panjang FO dengan Mini OTDR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/077', 'Pengukuran Panjang Kabel Metal dengan MTDR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/078', 'Pengukuran Geometry FO Menggunakan OFGS 2400 Photon Kinetics', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/079', 'Pengukuran Insertion Loss Splitter dengan OIL Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/080', 'Pengukuran Return Loss Splitter dengan Optical Return Loss Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/081', 'Pengukuran Attenuation dengan OTDR PK-8000', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/001', 'Kalibrasi Generator', '2019-10-10', 'Mgr-IQA', '2', 'TLKMIKAL001-v02--Kalibrasi-Generator.pdf'),
('TLKM/I/KAL/002', 'Kalibrasi Power Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/003', 'Kalibrasi Spectrum Analyzer', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/004', 'Kalibrasi Multimeter', '2019-10-10', 'Mgr-IQA', '2', ''),
('TLKM/I/KAL/005', 'Kalibrasi Power Supply', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/006', 'Kalibrasi Oscilloscope', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/007', 'Kalibrasi Generator Pulsa', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/008', 'Kalibrasi Frequency Counter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/009', 'Kalibrasi Resistor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/010', 'Kalibrasi Capacitor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/011', 'Panduan Persiapan dan Proses Kalibrasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/012', 'Kalibrasi Induktor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/013', 'Spesifikasi Generik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/014', 'Pengukuran Frekuensi Error', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/015', 'Prosedur Pemeriksaan Berkala', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/016', 'Kalibrasi Arus AC/DC', '2019-10-10', 'Mgr-IQA', '2', ''),
('TLKM/I/KAL/017', 'Kalibrasi LCR Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/018', 'Kalibrasi Earth Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/019', 'Kalibrasi Wheatstone Bridge', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/020', 'Kalibrasi Insulation Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/021', 'Kalibrasi Directional Coupler', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/022', 'Kalibrasi Matching Impedance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/023', 'Kalibrasi Attenuator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/024', 'Kalibrasi Terminator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/025', 'Kalibrasi Range Calibrator HP 11683A', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/026', 'Kalibrasi Subscriber Line Measuring Set (Sulim X200 400) STDI EWSD', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/027', 'Kalibrasi Tegangan DC AC Arus DC AC Tahanan DC dgn Multimeter HP3458A', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/028', 'Kalibrasi Tegangan AC dgn Standar Transfer ACDC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/029', 'Kalibrasi Clamp Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/030', 'Panduan Persiapan dan Proses Kalibrasi di Lokasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/031', 'Kalibrasi AC Resistor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/032', 'Peta Kendali', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/033', 'Instruksi Kerja Kalibrasi dan Perbaikan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/034', 'Instruksi Kerja Penyiapan Sertifikat Kalibrasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/001', 'Panduan Umum Pengujian', '2019-12-19', 'Mgr-IQA', '2', 'TLKMITRA001-v02--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/TRA/002', 'Pengukuran Return Loss RF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/003', 'Pengukuran VSWR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/004', 'Pengukuran Frekuensi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/005', 'Pengukuran Daya Pancar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/006', 'Pengukuran Spurious Emission', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/007', 'Noise Spectrum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/008', 'Pulse Mask/Kode/Tegangan/Lebar Pulsa', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/009', 'Jitter Product', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/010', 'Jitter Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/011', 'Jitter Transfer', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/012', 'Toleransi Redaman', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/013', 'Toleransi Bit Rate', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/014', 'Channel Net Loss', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/015', 'Audio Frekuensi Response', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/016', 'Impedansi Suara', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/017', 'Return Loss', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/018', 'Longitudinal Balance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/019', 'Idle Channel Noise', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/020', 'Diskriminasi Terhadap Sinyal Input di Luar Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/021', 'Sinyal Spurious di Luar Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/022', 'Distorsi Kuantisasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/023', 'Sinyal Spurious di Dalam Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/024', 'Variasi Gain Terhadap Input Level', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/025', 'Cakap Silang Antar Kanal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/026', 'Loop Resistance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/027', 'Kepekaan Terhadap Saluran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/028', 'Kepekaan Terhadap Arus', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/029', 'Tegangan dan Frekuensi Ring Generator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/030', 'Sensitivitas (Digital)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/031', 'Group Delay', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/032', 'Bit Rate', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/033', 'Wrist Strap Check', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/034', 'Impedansi RF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/035', 'Jenis Sinyal Optik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/036', 'Transmit Output Power', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/037', 'Receiver Sensitivity', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/038', 'Panjang Gelombang Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/039', 'Return Loss 2Mbps', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/040', 'Jitter Generation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/041', '16kHz Cashing Signal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/042', 'Terminal STB GSM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/043', 'Terminal STB CDMA', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/044', 'Chamber', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/045', 'Kemampuan Terhadap Kondisi Saluran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/046', 'Antar Muka Data n x 64kbit/s', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/047', 'Automatic Laser Shutdown (ALS)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/048', 'Jitter Kombinasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/049', 'Bandwidth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/050', 'Panduan Umum Opini', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/051', 'Round-Trip Delay', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/052', 'Adaptive Modulation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/053', 'Frequency Diversity (FD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/054', 'Frequency Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/055', 'Hot Standby (HSB)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/056', 'Signal Mask', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/057', 'Modulation Selectable by Software', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/058', 'Automatic Power Control', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/059', 'Power Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/060', 'Rx Sensitivity', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/061', 'Space Diversity (SD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/062', 'Selectable Channel Bandwidth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/063', 'IP Throughput Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/064', 'IP Latency Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/065', 'IP Packet Loss Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/066', 'IP Back to Back Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/067', 'Ketentuan Pencatatan Suhu, Kelembaban, dan Tegangan Catuan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/068', 'Instruksi Kerja Pemilihan Sample Uji', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/069', 'Eye Diagram', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/070', 'Side Mode Suppression Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/071', 'Extinction Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/072', 'Insertion Loss MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/073', 'Cross Talk MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/074', 'Center Wavelength Offset MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/075', 'Channel Uniformity MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/076', 'Gain Optical Amplifier', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/077', 'Automatic Protection Switch SDH', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/078', 'ATM Bit Error Rate Test (BERT)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/079', 'ATM Latency Test without Background Traffic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/080', 'ATM Latency Test with Background Traffic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/081', 'ATM Test – Loss of Cell Delineation (LCD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/082', 'ATM Test – Traffic Management PVC Connection', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/083', 'ATM Test – Traffic Management SVC Connection', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/084', 'ATM Reliability Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/085', 'Optical Spectral Width', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/086', 'Optical Signal to Noise Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/087', 'Minimum Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/088', 'Minimum Rate Output Power', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/089', 'Variation Power Supply', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/090', 'Total Audible Noise Level (dBA)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/091', 'Gain Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/092', 'Gain Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/093', 'Gain Slope Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/094', 'Gain Slope Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/095', 'Intermodulasi Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/096', 'Intermodulasi Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/097', 'Ripple Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/098', 'Ripple Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/099', 'Stabilitas Gain Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/100', 'Stabilitas Gain Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/101', 'Flatness Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/102', 'Abnormal Frame', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/103', 'Auto Negotiation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/104', 'Jumbo Frame', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/105', 'MAC Address Static Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/106', 'MAC Address Dynamic Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/107', 'Untagged VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/108', 'Tagged VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/109', 'Equivalent Isotropically Radiated Power (EIRP)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/110', 'Gain Antenna', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/111', 'Impulse Noise', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/112', 'Jumlah Kanal Radio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/113', 'Sistem MIMO (Multi Level Multi Output)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/114', 'Maximum MAC Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/115', 'Auto Sense', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/116', 'Uni-cast, Multi-cast, Broad-cast', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/117', 'Multi SSID Based On VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/118', 'Minimum Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/119', 'Traffic Priority 802.1p', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/120', 'Synchronization Clock Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/121', 'Perangkat DWDM With ROADM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/122', 'Small Metro Ethernet', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/123', 'IOT (Interoperablity) Small Metro Ethernet', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/124', 'Pengukuran WLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/125', 'Pengukuran Bluetooth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/126', 'Pengukuran Perangkat HF, VHF, dan UHF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/127', 'Pengukuran Antarmuka PON dari OLT', '2019-01-09', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/128', 'Self Verification Alat Ukur Berbasis IP', '2019-04-12', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/129', 'Pengukuran Loss Kabel/Aksesories RF', '2020-01-10', 'Mgr-IQA', '1', ''),
('TLKM/I/USE/001', 'Instruksi Kerja Penerimaan Perangkat Uji Dari Pelanggan', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE001-v01--IK-Penerimaan-Perangkat-Uji-Dari-Pelanggan.pdf'),
('TLKM/I/USE/002', 'Instruksi Kerja Penerbitan Surat Perintah Kerja (SPK)', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE002-v01--IK-Penerbitan-Surat-Perintah-Kerja-SPK.pdf'),
('TLKM/I/USE/003', 'Instruksi Kerja Pengambilan dan Pengembalian Perangkat Uji Oleh Laboratorium', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE003-v01--IK-Pengambilan-dan-Pengembalian-Perangkat-Uji-.pdf'),
('TLKM/I/USE/004', 'Instruksi Kerja Penyerahan Perangkat Uji Kepada Pelanggan', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE004-v01--IK-Penyerahan-Perangkat-Uji-Kepada-Pelanggan.pdf'),
('TLKM/I/USE/005', 'Instruksi Kerja Permohonan Uji Lokasi', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE005-v01--IK-Permohonan-Uji-Lokasi.pdf'),
('TLKM/TP/DEV/001', 'Optical Network Termination (ONT) Premium', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/002', 'Optical Network Termination (ONT) Retail', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/003', 'Optical Network Termination (ONT) Backhaul GPON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/004', 'Optical Network Termination (ONT) Enterprise', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/005', 'Optical Network Termination (ONT) Enterprise XGS-PON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/006', 'Open ONT (Optical Network Termination) Retail', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/007', 'Optical Network Termination (ONT) Bridge for Single Family Unit (SFU)', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/008', 'Optical Network Termination (ONT) Backhaul for XGS-PON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/TRA/001', 'Open OLT XGS PON', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/002', 'Pengukuran Radiated Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/003', 'Pengukuran Conducted Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/004', 'Pengukuran Radiated Immunity EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/005', 'Pengukuran Conducted Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM01/P ', 'Pengendalian Dokumen Sistem Manajemen', '2018-09-18', 'SM-PIA', '1', 'TLKM01P_v01_Pengendalian-Dokumen-Sistem-Manajemen.pdf'),
('TLKM02/P ', 'Prosedur Tinjauan Permintaan, Tender, dan Kontrak', '2019-10-03', 'Mgr-UREL', '3', 'TLKM02P-v03--Tinjauan-Permintaan-Tender-dan-Kontrak.pdf'),
('TLKM03/P ', 'Prosedur Sub-Kontrak Pengujian', '2018-10-22', 'Mgr-UREL', '1', 'TLKM03P_v01_Prosedur-Sub-Kontrak-Pengujian.pdf'),
('TLKM04/P ', 'Prosedur Keluhan Pelanggann', '2018-10-22', 'Mgr-UREL', '1', 'TLKM04P_v01_Prosedur-Keluhan-Pelanggan.pdf'),
('TLKM05/P ', 'Prosedur Survei Kepuasan Pelanggan', '2018-10-22', 'Mgr-UREL', '1', 'TLKM05P_v01_Prosedur-Survei-Kepuasan-Pelanggan.pdf'),
('TLKM06/P ', 'Prosedur Umum dan Pelaporan Hasil Laboratorium', '2019-04-11', 'SM-PIA', '3', 'TLKM06P-v03--Prosedur-Umum-dan-Pelaporan-Hasil-Laboratorium.pdf'),
('TLKM07/P ', 'Prosedur Tindakan Koreksi, Perbaikan, dan Pencegahan', '2018-10-22', 'SM-PIA', '1', 'TLKM07P_v01_Prosedur-Tindakan-Koreksi-Perbaikan-dan-Pencegahan.pdf'),
('TLKM08/P ', 'Prosedur Validitas Hasil Uji dan Kalibrasi', '2019-04-17', 'SM-PIA', '2', 'TLKM08P-v02--Prosedur-Validitas-Hasil-Uji-dan-Kalibrasi.pdf'),
('TLKM09/P ', 'Prosedur Audit Internal', '2018-10-22', 'SM-PIA', '1', 'TLKM09P_v01_Prosedur-Audit-Internal.pdf'),
('TLKM10/P ', 'Prosedur Tinjauan Manajemen', '2018-10-22', 'SM-PIA', '1', 'TLKM10P_v01_Prosedur-Tinjauan-Manajemen.pdf'),
('TLKM11/P ', 'Prosedur Pengembangan Kompetensi', '2018-10-22', 'SM-PIA', '1', 'TLKM11P_v01_Prosedur-Pengembangan-Kompetensi.pdf'),
('TLKM12/P ', 'Prosedur Penanganan Barang Pengujian dan Kalibrasi', '2019-10-03', 'Mgr-UREL', '3', 'TLKM12P-v03--Penanganan-Barang-Pengujian-dan-Kalibrasi.pdf'),
('TLKM13/P ', 'Prosedur Penanganan Peralatan dan Pengecekan Antara', '2018-10-22', 'SM-PIA', '1', 'TLKM13P-v01--Prosedur-Penanganan-Peralatan-dan-Pengecekan-Antara.pdf'),
('TLKM14/P ', 'Prosedur Evaluasi Ketidakpastian Pengukuran', '2018-10-22', 'SM-PIA', '1', 'TLKM14P-v01--Prosedur-Evaluasi-Ketidakpastian-Pengukuran.pdf'),
('TLKM15/P ', 'Prosedur Seleksi, Verifikasi, dan Metode Validasi', '2018-10-22', 'SM-PIA', '1', 'TLKM15P-v01--Prosedur-Seleksi-Verifikasi-dan-Validasi-Metode.pdf'),
('TLKM16/P ', 'Prosedur Peta Kendali', '2018-10-22', 'SM-PIA', '1', 'TLKM16P-v01--Prosedur-Peta-Kendali.pdf'),
('TLKM17/P ', 'Pengendalian Pekerjaan Pengujian dan Kalibrasi yang Tidak Sesuai', '2018-10-22', 'SM-PIA', '1', 'TLKM17P-v01--Prosedur-Pekerjaan-Pengujian-dan-Kalibrasi-Yang-Tidak-Sesuai.pdf'),
('TLKM18/P ', 'Prosedur Ketertelusuran Pengukuran (Metrologi)', '2018-10-22', 'SM-PIA', '1', 'TLKM18P_v01_Prosedur-Ketertelusuran-Pengukuran-Metrologi.pdf'),
('TLKM19/P ', 'Prosedur Tindakan Mengatasi Risiko dan Peluang', '2018-10-22', 'SM-PIA', '1', 'TLKM19P_v01_Prosedur-Tindakan-Mengatasi-Risiko-dan-Peluang.pdf'),
('TLKM20/P ', 'Prosedur Rekrutmen dan Pengembangan Personel Alih Daya', '2019-12-20', 'SM-PIA', '2', 'TLKM20P-v02--Prosedur-Pengelolaan-Personel.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `test_engineers`
--

CREATE TABLE `test_engineers` (
  `id` varchar(11) NOT NULL,
  `name` text NOT NULL,
  `lab` char(3) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` char(1) NOT NULL,
  `photo` text,
  `registered` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_engineers`
--

INSERT INTO `test_engineers` (`id`, `name`, `lab`, `password`, `email`, `role`, `photo`, `registered`, `updated`) VALUES
('970000', 'Test User', 'TRA', 'J7laj1k08Nzj6KZWDXhITm6V5xCMXrDykaQtuDb2Iks=', 'aldiw@gmail.com', '1', 'test.jpg', '2020-02-17T17:31:11.300Z', '2020-02-17T17:31:11.300Z'),
('970037', 'Aldi Wiranata', 'CAB', '44sTXVnKJJsC0ZgNLlJmUOJb+8QcJ6ZrI19WrfDFlAA=', 'aldiw01@gmail.com', '2', 'profile_photo_970037', '2020-01-15T04:51:54.211Z', '2020-02-19T01:49:47.616Z');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cal_certificates`
--
ALTER TABLE `cal_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`device_id`,`test_engineer_id`),
  ADD KEY `test_engineer_id` (`test_engineer_id`);

--
-- Indexes for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`engineer_1`,`engineer_2`,`engineer_3`),
  ADD KEY `engineer_2` (`engineer_2`),
  ADD KEY `engineer_3` (`engineer_3`);

--
-- Indexes for table `cal_steps`
--
ALTER TABLE `cal_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_engineer_id` (`test_engineer_id`),
  ADD KEY `cal_step_id` (`cal_step_id`);

--
-- Indexes for table `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_engineers`
--
ALTER TABLE `test_engineers`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cal_certificates`
--
ALTER TABLE `cal_certificates`
  ADD CONSTRAINT `cal_certificates_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`);

--
-- Constraints for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD CONSTRAINT `cal_requests_ibfk_1` FOREIGN KEY (`engineer_1`) REFERENCES `test_engineers` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`cal_step_id`) REFERENCES `cal_steps` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
