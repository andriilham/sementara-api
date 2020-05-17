-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2020 at 04:06 PM
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
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `year` int(4) NOT NULL,
  `info` text NOT NULL,
  `standard_level_id` varchar(20) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` varchar(32) NOT NULL,
  `test_report_id` varchar(24) NOT NULL,
  `effective_date` varchar(24) NOT NULL,
  `due_date` varchar(24) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `test_report_id`, `effective_date`, `due_date`, `file`) VALUES
('TEL.342/LB-200/DDS-73/2019', '065/DQA/L/QA/2019', '2019-12-19', '2022-12-19', 'TEL.342LB-200DDS-732019_065DQALQA2019.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `dide`
--

CREATE TABLE `dide` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `edition` text NOT NULL,
  `publisher` text NOT NULL,
  `doc_location` text NOT NULL,
  `standard_level_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` varchar(20) NOT NULL,
  `name` text,
  `effective_date` varchar(24) NOT NULL,
  `pic` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL,
  `file_pdf` text,
  `file_doc` text,
  `file_xls` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `name`, `effective_date`, `pic`, `version`, `file_pdf`, `file_doc`, `file_xls`) VALUES
('TLKM01/F/001', 'Form Pengendalian Dokumen SMM (PDS) - Panduan Mutu dan Prosedur', '2019-05-06', 'ias', '1', '', '', ''),
('TLKM01/F/002', 'Form Pengendalian Dokumen SMM (PDS) - Dokumen Pendukung', '2019-05-07', 'ias', '1', '', '', ''),
('TLKM01/F/003', 'Log Pengendalian Dokumen SMM', '2019-05-08', 'ias', '1', '', '', ''),
('TLKM01/F/004', 'Daftar Induk Dokumen SMM (DIDS)', '2019-05-09', 'ias', '1', '', '', ''),
('TLKM01/F/005', 'Daftar Induk Dokumen Eksternal (DIDE)', '2019-05-10', 'ias', '1', '', '', ''),
('TLKM01/F/006', 'Daftar Dokumen Usang (DDU)', '2019-05-11', 'ias', '1', '', '', ''),
('TLKM01/F/007', 'Form Pemusnahan Dokumen Usang (PDU)', '2019-05-12', 'ias', '1', '', '', ''),
('TLKM01/F/008', 'Form Notifikasi Dokumen SMM (NDS)', '2019-05-13', 'ias', '1', '', '', ''),
('TLKM01/F/009', 'Form Program Kaji Ulang Dokumen SMM', '2019-05-14', 'ias', '1', '', '', ''),
('TLKM01/F/010', 'Form Kaji Ulang Dokumen SMM', '2019-05-15', 'ias', '1', '', '', ''),
('TLKM01/F/011', 'Daftar Induk Dokumen Internal (DIDI)', '2019-05-16', 'ias', '1', '', '', ''),
('TLKM02/F/001', 'Form Permohonan Uji Mutu - Quality Assurance (QA)', '2019-05-17', 'urel', '1', '', '', ''),
('TLKM02/F/002', 'Form Permohonan Uji Tipe - Type Approval (TA)', '2019-05-18', 'urel', '1', '', '', ''),
('TLKM02/F/003', 'Form Permohonan Uji Pesan - Voluntary Test (VT)', '2019-05-19', 'urel', '1', '', '', ''),
('TLKM02/F/004', 'Form Permohonan Uji Kalibrasi', '2019-05-20', 'urel', '1', '', '', ''),
('TLKM02/F/005', 'Form Laporan Uji Fungsi', '2019-05-21', 'urel', '1', '', '', ''),
('TLKM02/F/006', 'Form Kontrak Pengujian', '2019-05-22', 'urel', '1', '', '', ''),
('TLKM02/F/007', 'Form Kontrak Uji Lokasi Dalam Negeri  ', '2019-05-23', 'urel', '1', '', '', ''),
('TLKM02/F/008', 'Form Technical Meeting Uji Lokasi Dalam Negeri', '2019-05-24', 'urel', '1', '', '', ''),
('TLKM03/F/001', 'Daftar Subkontrak Laboratorium (DSKL)', '2019-05-25', 'urel', '1', '', '', ''),
('TLKM03/F/002', 'Form Evaluasi Penyedia Produk dan Layanan Eksternal\'', '2019-05-26', 'urel', '1', '', '', ''),
('TLKM03/F/003', 'Surat Pengantar Pengujian Perangkat (SP3) kepada Laboratorium Subkontrak', '2019-05-27', 'urel', '1', '', '', ''),
('TLKM04/F/001', 'Form Penanganan Keluhan Pelanggan', '2019-05-28', 'urel', '1', '', '', ''),
('TLKM04/F/002', 'Form Daftar Keluhan Pelanggan', '2019-05-29', 'urel', '1', '', '', ''),
('TLKM05/F/001', 'Form Survei Kepuasan Pelanggan Internal', '2019-05-30', 'urel', '1', '', '', ''),
('TLKM05/F/002', 'Form Survei Kepuasan Pelanggan Eksternal', '2019-05-31', 'urel', '1', '', '', ''),
('TLKM06/F/001', 'Form Data Hasil Uji', '2019-06-01', 'dev,ene,kab,tra', '1', '', '', ''),
('TLKM06/F/002', 'Form Data Hasil Pengukuran Kalibrasi', '2019-06-02', 'kal', '1', '', '', ''),
('TLKM06/F/003', 'QA Laboratory Test Report - Quality Assurance (QA)', '2019-06-03', 'dev,ene,kab,tra', '1', '', '', ''),
('TLKM06/F/004', 'QA Laboratory Test Report - Type Approval (TA)', '2019-06-04', 'dev,ene,kab,tra', '1', '', '', ''),
('TLKM06/F/005', 'QA Laboratory Test Report - Voluntary Test (VT)', '2019-06-05', 'dev,ene,kab,tra', '1', '', '', ''),
('TLKM06/F/006', 'Form Sertifikat Uji Quality Assurance', '2019-06-06', 'dev,ene,kab,tra', '1', '', '', ''),
('TLKM06/F/007', 'Form Sertifikat Kalibrasi', '2019-06-07', 'kal', '1', '', '', ''),
('TLKM06/F/008', 'Form Daftar Alat Ukur', '2019-06-08', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM06/F/009', 'Form Staff Confidentiality Declaration', '2019-06-09', '*', '1', '', '', ''),
('TLKM06/F/010', 'Form Environment Data Record', '2019-06-10', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM06/F/011', 'Form Surat Keterangan Membawa Barang', '2019-06-11', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM06/F/012', 'Form Hasil Pemeriksaan Alat Ukur', '2019-06-12', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM06/F/013', 'Form Test Software Record', '2019-06-13', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM06/F/014', 'Form Laporan EMC', '2019-06-14', 'tra,dev', '1', '', '', ''),
('TLKM07/F/001', 'Laporan Ketidaksesuaian/Potensi Ketidaksesuaian (LKPK)', '2019-06-15', '*', '1', '', '', ''),
('TLKM07/F/002', 'Log Laporan Ketidaksesuaian/Potensi Ketidaksesuaian (Log LKPK)', '2019-06-16', '*', '1', '', '', ''),
('TLKM08/F/001', 'Form Rencana dan Realisasi Uji Profisiensi/Uji Bandung Antar Laboratorium', '2019-06-17', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM09/F/001', 'Form Program Audit Internal', '2019-06-18', '*', '1', '', '', ''),
('TLKM09/F/002', 'Daftar Periksa Audit Internal', '2019-06-19', '*', '1', '', '', ''),
('TLKM09/F/003', 'Daftar Auditor Internal', '2019-06-20', '*', '1', '', '', ''),
('TLKM09/F/004', 'Laporan Audit Internal', '2019-06-21', '*', '1', '', '', ''),
('TLKM10/F/001', 'Form Program Tinjauan Manajemen', '2019-06-22', 'ias', '1', '', '', ''),
('TLKM10/F/002', 'Form Tinjauan Manajemen', '2019-06-23', 'ias', '1', '', '', ''),
('TLKM11/F/001', 'Matrix of Test Engineer Capability and Standard Relating WI', '2019-06-24', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM11/F/002', 'Form Staff-Equipment Autorized Matrix Form', '2019-06-25', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM11/F/003', 'Form Training Record', '2019-06-26', '*', '1', '', '', ''),
('TLKM12/F/001', 'Form ID Tag', '2019-06-27', 'urel', '1', '', '', ''),
('TLKM12/F/002', 'Form Bukti Penerimaan & Pengeluaran Perangkat Uji', '2019-06-28', 'urel', '1', '', '', ''),
('TLKM13/F/001', 'Form Pengecekan Antara', '2019-06-29', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM13/F/002', 'Jadwal Pengecekan Antara', '2019-06-30', 'dev,ene,kab,tra,kal', '1', '', '', ''),
('TLKM19/F/001', 'Form Analisis Risiko', '2019-07-06', 'ias', '1', '', '', ''),
('TLKM20/F/001', 'Form Matriks Penilaian Kompetensi', '2019-07-07', '*', '1', '', '', ''),
('TLKM20/F/002', 'Form Pemberian Otoritas Personel', '2019-07-08', '*', '1', '', '', ''),
('TLKM20/F/003', 'Form Evaluasi dan Penilaian Kinerja Personel', '2019-07-09', '*', '1', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` varchar(20) NOT NULL,
  `reference_id` text NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `step_id` varchar(24) NOT NULL,
  `message` varchar(24) NOT NULL,
  `created` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quality_manuals`
--

CREATE TABLE `quality_manuals` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `effective_date` varchar(24) NOT NULL,
  `pic` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quality_manuals`
--

INSERT INTO `quality_manuals` (`id`, `name`, `effective_date`, `pic`, `version`, `file`) VALUES
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
('TLKM01/P', 'Pengendalian Dokumen Sistem Manajemen', '2018-09-18', 'SM-IAS', '1', 'TLKM01P_v01_Pengendalian-Dokumen-Sistem-Manajemen.pdf'),
('TLKM02/P', 'Prosedur Tinjauan Permintaan, Tender, dan Kontrak', '2019-10-03', 'Mgr-UREL', '3', 'TLKM02P-v03--Tinjauan-Permintaan-Tender-dan-Kontrak.pdf'),
('TLKM03/P', 'Prosedur Sub-Kontrak Pengujian', '2018-10-22', 'Mgr-UREL', '1', 'TLKM03P_v01_Prosedur-Sub-Kontrak-Pengujian.pdf'),
('TLKM04/P', 'Prosedur Keluhan Pelanggann', '2018-10-22', 'Mgr-UREL', '1', 'TLKM04P_v01_Prosedur-Keluhan-Pelanggan.pdf'),
('TLKM05/P', 'Prosedur Survei Kepuasan Pelanggan', '2018-10-22', 'Mgr-UREL', '1', 'TLKM05P_v01_Prosedur-Survei-Kepuasan-Pelanggan.pdf'),
('TLKM06/P', 'Prosedur Umum dan Pelaporan Hasil Laboratorium', '2019-04-11', 'SM-IAS', '3', 'TLKM06P-v03--Prosedur-Umum-dan-Pelaporan-Hasil-Laboratorium.pdf'),
('TLKM07/P', 'Prosedur Tindakan Koreksi, Perbaikan, dan Pencegahan', '2018-10-22', 'SM-IAS', '1', 'TLKM07P_v01_Prosedur-Tindakan-Koreksi-Perbaikan-dan-Pencegahan.pdf'),
('TLKM08/P', 'Prosedur Validitas Hasil Uji dan Kalibrasi', '2019-04-17', 'SM-IAS', '2', 'TLKM08P-v02--Prosedur-Validitas-Hasil-Uji-dan-Kalibrasi.pdf'),
('TLKM09/P', 'Prosedur Audit Internal', '2018-10-22', 'SM-IAS', '1', 'TLKM09P_v01_Prosedur-Audit-Internal.pdf'),
('TLKM10/P', 'Prosedur Tinjauan Manajemen', '2018-10-22', 'SM-IAS', '1', 'TLKM10P_v01_Prosedur-Tinjauan-Manajemen.pdf'),
('TLKM11/P', 'Prosedur Pengembangan Kompetensi', '2018-10-22', 'SM-IAS', '1', 'TLKM11P_v01_Prosedur-Pengembangan-Kompetensi.pdf'),
('TLKM12/P', 'Prosedur Penanganan Barang Pengujian dan Kalibrasi', '2019-10-03', 'Mgr-UREL', '3', 'TLKM12P-v03--Penanganan-Barang-Pengujian-dan-Kalibrasi.pdf'),
('TLKM13/P', 'Prosedur Penanganan Peralatan dan Pengecekan Antara', '2018-10-22', 'SM-IAS', '1', 'TLKM13P-v01--Prosedur-Penanganan-Peralatan-dan-Pengecekan-Antara.pdf'),
('TLKM14/P', 'Prosedur Evaluasi Ketidakpastian Pengukuran', '2018-10-22', 'SM-IAS', '1', 'TLKM14P-v01--Prosedur-Evaluasi-Ketidakpastian-Pengukuran.pdf'),
('TLKM15/P', 'Prosedur Seleksi, Verifikasi, dan Metode Validasi', '2018-10-22', 'SM-IAS', '1', 'TLKM15P-v01--Prosedur-Seleksi-Verifikasi-dan-Validasi-Metode.pdf'),
('TLKM16/P', 'Prosedur Peta Kendali', '2018-10-22', 'SM-IAS', '1', 'TLKM16P-v01--Prosedur-Peta-Kendali.pdf'),
('TLKM17/P', 'Pengendalian Pekerjaan Pengujian dan Kalibrasi yang Tidak Sesuai', '2018-10-22', 'SM-IAS', '1', 'TLKM17P-v01--Prosedur-Pekerjaan-Pengujian-dan-Kalibrasi-Yang-Tidak-Sesuai.pdf'),
('TLKM18/P', 'Prosedur Ketertelusuran Pengukuran (Metrologi)', '2018-10-22', 'SM-IAS', '1', 'TLKM18P_v01_Prosedur-Ketertelusuran-Pengukuran-Metrologi.pdf'),
('TLKM19/P', 'Prosedur Tindakan Mengatasi Risiko dan Peluang', '2018-10-22', 'SM-IAS', '1', 'TLKM19P_v01_Prosedur-Tindakan-Mengatasi-Risiko-dan-Peluang.pdf'),
('TLKM20/P', 'Prosedur Rekrutmen dan Pengembangan Personel Alih Daya', '2019-12-20', 'SM-IAS', '2', 'TLKM20P-v02--Prosedur-Pengelolaan-Personel.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `quality_records`
--

CREATE TABLE `quality_records` (
  `id` varchar(20) NOT NULL,
  `form_id` varchar(20) NOT NULL,
  `pic` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quality_records`
--

INSERT INTO `quality_records` (`id`, `form_id`, `pic`, `name`, `created`, `file`) VALUES
('R1E8GM55M5', 'TLKM06/F/009', 'KAB', 'Aldi W_SCD', '2020-03-12', 'TLKM06F009_Aldi_SCD_1589698008761.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` varchar(20) NOT NULL,
  `document_id` varchar(20) NOT NULL,
  `approval1_id` varchar(20) NOT NULL,
  `approval1_status` int(1) DEFAULT NULL,
  `approval2_id` varchar(20) NOT NULL,
  `approval2_status` int(1) DEFAULT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
('1', 'Super Admin'),
('2A1', 'Quality Manager'),
('2A2', 'Document Controller 1'),
('2B', 'Document Controller 2'),
('2C', 'Bagian UREL'),
('3A', 'SM IAS'),
('3B', 'Lab Manager DEQA'),
('3C', 'Lab Manager IQA'),
('4B1', 'Lab Device'),
('4B2', 'Lab Energy'),
('4C1', 'Lab Kabel dan Aksesoris FTTH'),
('4C2', 'Lab Transmisi'),
('4C3', 'Lab Kalibrasi'),
('5', 'Guest'),
('9', 'Deactivated');

-- --------------------------------------------------------

--
-- Table structure for table `standard_levels`
--

CREATE TABLE `standard_levels` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_levels`
--

INSERT INTO `standard_levels` (`id`, `name`) VALUES
('I1', 'Internasional'),
('N1', 'Permenkominfo'),
('N2', 'Perdirjen'),
('N3', 'SNI'),
('T1', 'Lab Device'),
('T2', 'Lab Energy'),
('T3', 'Lab Kabel dan Aksesoris FTTH'),
('T4', 'Lab Transmisi');

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `step_number` int(5) NOT NULL,
  `info` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`id`, `name`, `step_number`, `info`, `created`, `updated`) VALUES
('ARV1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ARV2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ARV3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DDE1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DDE2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DDE3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('QUM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('QUM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('QUM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REC1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REC2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REC3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REF1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REF2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REF3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REP1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REP2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REP3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQS1', 'Approval 1', 1, 'has change the request status to APPROVAL 1', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQS2', 'Approval 2', 2, 'has change the request status to APPROVAL 2', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQS3', 'Published', 3, 'has change the request status to PUBLISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TRI1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TRI2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TRI3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('USR1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('USR2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('USR3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z');

-- --------------------------------------------------------

--
-- Table structure for table `test_references`
--

CREATE TABLE `test_references` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `year` text NOT NULL,
  `version` varchar(10) NOT NULL,
  `standard_level_id` varchar(2) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_references`
--

INSERT INTO `test_references` (`id`, `name`, `year`, `version`, `standard_level_id`, `file`) VALUES
('STEL D-005-2001', 'Spesifikasi Telekomunikasi Router', '2001', '1.0', 'T1', ''),
('STEL D-006-2011', 'Spesifikasi Telekomunikasi Switch Ethernet (L2 Switch)', '2011', '2.0', 'T1', ''),
('STEL D-007-2004', 'Spesifikasi Telekomunikasi Core Router (IP)', '2004', '1.0', 'T1', ''),
('STEL D-010-2005', 'Telecomunication Specification Broadband Remote Access Server (BRAS)', '2005', '1.0', 'T1', ''),
('STEL D-012-2016', 'Spesifikasi Telekomunikasi Metro Ethernet Device', '2016', '2.0', 'T4', ''),
('STEL D-014-2008', 'Telecommunication Specification Technical Tera Router', '2008', '1.0', 'T4', ''),
('STEL D-017-2008', 'Spesifikasi Telekomunikasi Perangkat Managed L3 Switch', '2008', '1.0', 'T1', ''),
('STEL D-019-2016', 'Telecommunication Specification Small Metro Ethernet Device', '2016', '1.1', 'T4', ''),
('STEL D-020-2018', 'Spesifikasi Telekomunikasi Provider Edge Router', '2018', '1.0', 'T4', ''),
('STEL D-068-2006', 'Spesifikasi Telekomunikasi Soft Switch', '2006', '1.0', 'T4', ''),
('STEL F-001-2017', 'Spesifikasi Telekomunikasi Fiber Monitoring System (FMS)', '2017', '1.0', 'T3', ''),
('STEL K-001-2003', 'Spesifikasi Telekomunikasi Kabel Telepon Udara Berselubung dan Polietilen Berpenguat sendiri', '2003', '2.1', 'T3', ''),
('STEL K-002-2001', 'Spesifikasi Telekomunikasi Kabel Saluran Rumah', '2001', '2.0', 'T3', ''),
('STEL K-003-2001', 'Spesifikasi Telekomunikasi Saluran Penanggal Bawah Tanah', '2001', '2.0', 'T3', ''),
('STEL K-004-2002', 'Spesifikasi Telekomunikasi Saluran Penanggal Atas Tanah  (U-ES)', '2002', '2.0', 'T3', ''),
('STEL K-006-2003', 'Spesifikasi Telekomunikasi Kawat Sambung ', '2003', '2.0', 'T3', ''),
('STEL K-007-2003', 'Spesifikasi Telekomunikasi Kabel Tanah Berperisai dan Berselubung Polietilen Berisi Petrojeli', '2003', '2.0', 'T3', ''),
('STEL K-008-2003', 'Spesifikasi Telekomunikasi Kabel Tanah Tanpa Perisai dan Berselubung Polietilen Berisi Petrojeli', '2003', '2.0', 'T3', ''),
('STEL K-009-2003', 'Spesifikasi Telekomunikasi Kabel Tanah Tanpa Perisai dan Berselubung Polietilen ', '2003', '2.0', 'T3', ''),
('STEL K-010-2000', 'Spesifikasi Telekomunikasi Kabel Telepon Rumah dengan Pelindung Elektris', '2000', '1.0', 'T3', ''),
('STEL K-011-2000', 'Spesifikasi Telekomunikasi Kabel Telepon Rumah Tanpa Pelindung Elektris', '2000', '1.0', 'T3', ''),
('STEL K-013-2002', 'Spesifikasi Telekomunikasi Saluran Penanggal Atas Tanah Berpenguat Ganda Tipe U-ES2', '2002', '2.0', 'T3', ''),
('STEL K-015-2013', 'Spesifikasi Telekomunikasi Perangkat Kabel Serat Optik Single Mode Berkonstruksi Loose Tube untuk Aplikasi Duct', '2013', '3.0', 'T3', ''),
('STEL K-016-2013', 'Spesifikasi Telekomunikasi Perangkat Kabel Serat Optik Single Mode berkonstruksi Loose Tube untuk Aplikasi  Tanam Langsung (KSO Direct Buried)', '2013', '3.0', 'T3', ''),
('STEL K-017-2014', 'Spesifikasi Telekomunikasi Perangkat Kabel Serat Optik Single Mode berkonstruksi Loose Tube untuk Aplikasi  Kabel Udara (KSO Aerial)', '2014', '3.0', 'T3', ''),
('STEL K-018-1996', 'Telecommunication Specification Single Mode Tight Buffered Optical Fiber Cable for Indoor Applications', '1996', '1.2', 'T3', ''),
('STEL K-019-2002', 'Spesifikasi Telekomunikasi Kabel Telepon Tanah Tanpa Perisai Berisolasi Polietilen Busa Berkulit dan Berselubung Polietilen Tipe Tp-Ebk (Pe) E', '2002', '2.0', 'T3', ''),
('STEL K-020-1996', 'Spesifikasi Telekomunikasi Kabel Telepon Tanah Berperisai Berisolasi Polietilen Busa Berkulit dan Berselubung Polietilen Berisi Petrojelly Tipe Tp-Ebk J (Pem) E', '1996', '1.0', 'T3', ''),
('STEL K-021-1996', 'Spesifikasi Telekomunikasi Kabel Telepon Tanah Tanpa Perisai Berisolasi Polietilen Busa Berkulit dan Berselubung Polietilen Berisi Petrojelly Tipe Tp-Ebk (Pe) E', '1996', '1.0', 'T3', ''),
('STEL K-029-1999', 'Spesifikasi Telekomunikasi Kabel 100 Ohm UTP 4 Pair untuk Aplikasi Horisontal', '1999', '1.0', 'T3', ''),
('STEL K-030-2003', 'Spesifikasi Telekomunikasi Kabel Koaksial Feeder dan Trunk untuk Jaringan HFC', '2003', '1.0', 'T3', ''),
('STEL K-031-2003', 'Spesifikasi Telekomunikasi Kabel Koaksial Drop untuk Jaringan HFC', '2003', '1.0', 'T3', ''),
('STEL K-033-2013', 'Spesifikasi Telekomunikasi Kabel Serat Optik Penanggal dengan Kawat Penggantung', '2013', '1.2', 'T3', ''),
('STEL K-034-2013', 'Spesifikasi Telekomunikasi Kabel Serat Optik Penanggal Untuk Instalasi Dalam Pipa', '2013', '2.0', 'T3', ''),
('STEL K-035-2010', 'Spesifikasi Telekomunikasi Kabel Telepon Tanah Berperisai Berisolasi dan Berselubung Polietilen. Berisi Petrojeli Untuk layanan Broadband', '2010', '1.0', 'T3', ''),
('STEL K-036-2012', 'Spesifikasi Telekomunikasi Perangkat Kabel Serat Optik Single Mode G652D Bertipe Kering dan Berkonstruksi Single Core per Loose Tube untuk Aplikasi Kabel Udara (KSO SCPT Aerial)', '2012', '1.0', 'T3', ''),
('STEL K-037-2012', 'Spesifikasi Telekomunikasi Kabel Serat Optik G652D Tipe Kering Berkonstruksi Single Core per Loose Tube untuk Aplikasi Duct (KSO SCPT Duct)', '2012', '1.0', 'T3', ''),
('STEL K-038-2014', 'Spesifikasi Telekomunikasi Kabel Serat Optik Ribbon Single Mode Berkonstruksi Loose Tube Untuk Aplikasi Duc 4 s.d. 96 Core', '2014', '1.0', 'T3', ''),
('STEL K-039-2015', 'Spesifikasi Telekomunikasi Kabel Serat Optik Indoor Terekspose beserta kelengkapannya', '2015', '1.0', 'T3', ''),
('STEL K-040-2019', 'Spesifikasi Telekomunikasi Pre-Connectorized Drop Cable', '2019', '2.1', 'T3', ''),
('STEL L-001.A-2002', 'Spesifikasi Telekomunikasi Sarana Sambung Kabel dengan Proses Pemanasan', '2002', '3.0', 'T3', ''),
('STEL L-001.B-2002', 'Spesifikasi Telekomunikasi Sarana Sambung Kabel Tanpa Proses Pemanasan', '2002', '3.0', 'T3', ''),
('STEL L-003-2016', 'Spesifikasi Telekomunikasi Tiang Telepon Besi dengan Sambungan', '2016', '3.0', 'T3', ''),
('STEL L-004.B-2001', 'Spesifikasi Telekomunikasi Kotak Pembagi Logam tanpa Blok Terminal', '2001', '2.0', 'T3', ''),
('STEL L-004.C-2001', 'Spesifikasi Telekomunikasi Kotak Pembagi Plastik Dengan Blok Terminal', '2001', '2.0', 'T3', ''),
('STEL L-004/R.2.A-200', 'Spesifikasi Telekomunikasi Kotak Pembagi Plastik Tanpa Blok Terminal', '2001', '2.0', 'T3', ''),
('STEL L-005.A-1999', 'Spesifikasi Telekomunikasi Rumah Kabel Plastik Lengkap dengan Blok Terminal', '1999', '2.0', 'T3', ''),
('STEL L-008-2001', 'Spesifikasi Telekomunikasi Pipa Duct dari Bahan PVC Keras', '2001', '2.0', 'T3', ''),
('STEL L-014-2001', 'Spesifikasi Telekomunikasi Blok Terminal Rangka Pembagi Utama (BTRPU) Sisi Jaringan Kabel', '2001', '2.0', 'T3', ''),
('STEL L-015-2001', 'Spesifikasi Telekomunikasi Blok Terminal Kotak Pembagi (BTKP)', '2001', '2.0', 'T3', ''),
('STEL L-016-2002', 'Spesifikasi Telekomunikasi Digital Distribution Frame untuk Twisted Pair Cable (DDF- Pair Cable)', '2002', '1.0', 'T3', ''),
('STEL L-022-2001', 'Spesifikasi Telekomunikasi Tiang Telepon Beton Pratekan Penampang Bulat 7 Meter', '2001', '2.0', 'T3', ''),
('STEL L-023-2001', 'Spesifikasi Telekomunikasi Tiang Telepon Beton Pratekan Penampang Bulat 8 Meter', '2001', '2.0', 'T3', ''),
('STEL L-024-2001', 'Spesifikasi Telekomunikasi Tiang Telepon Beton Pratekan Penampang Bulat 9 Meter', '2001', '1.0', 'T3', ''),
('STEL L-028-2002', 'Spesifikasi Telekomunikasi Kelengkapan Tiang Telepon Beton Pratekan Penampang Bulat', '2002', '2.0', 'T3', ''),
('STEL L-030-1995', 'Spesifikasi Telekomunikasi Perangkat Soket dan Konektor RJ-11', '1995', '1.0', 'T3', ''),
('STEL L-031-1996', 'Spesifikasi Telekomunikasi Perangkat Kotak Terminal Batas (KTB)', '1996', '2.0', 'T3', ''),
('STEL L-032-2002', 'Spesifikasi Telekomunikasi Blok Terminal Intermediate Distribution Frame', '2002', '1.0', 'T3', ''),
('STEL L-033-1996', 'Spesifikasi Telekomunikasi Blok Terminal Rangka Pembagi Utama (BTRPU) Sisi Horisontal', '1996', '1.0', 'T3', ''),
('STEL L-034-2004', 'Spesifikasi Telekomunikasi Konektor urat Kabel Telepon', '2004', '1.1', 'T3', ''),
('STEL L-036-1996', 'Spesifikasi Telekomunikasi Tiang Telepon Tanpa Sambungan Bentuk Taper Segi Delapan Tahan Korosi Cuaca', '1996', '1.0', 'T3', ''),
('STEL L-037-2001', 'Telecommunication Specification Optical Fiber Cable Closure', '2001', '2.0', 'T3', ''),
('STEL L-038-2002', 'Spesifikasi Telekomunikasi Pipa Duct Tanam Langsung dari Bahan HDPE untuk Kabel Fiber Optik', '2002', '1.0', 'T3', ''),
('STEL L-039-2008', 'Spesifikasi Telekomunikasi Pipa HDPE untuk Kabel Serat Optik', '2008', '2.2', 'T3', ''),
('STEL L-040-1998', 'Spesifikasi Telekomunikasi Kotak pembagi Permukaan Tanah Tanpa Blok Terminal', '1998', '1.0', 'T3', ''),
('STEL L-041-2006', 'Spesifikasi Telekomunikasi Kabinet Luar untuk Perangkat Aktif', '2006', '2.0', 'T3', ''),
('STEL L-042-1999', 'Spesifikasi Telekomunikasi Perangkat Kotak Terminal Batas (KTB) dengan Arester dan Lampu Indikator', '1999', '1.0', 'T3', ''),
('STEL L-043-2002', 'Spesifikasi Telekomunikasi Konektor Serat Optical Single Mode', '2002', '1.0', 'T3', ''),
('STEL L-044-2003', 'Spesifikasi Telekomunikasi Tiang telepon Besi Bentuk Taper Segi Delapan- 9 M ', '2003', '1.0', 'T3', ''),
('STEL L-045-2003', 'Spesifikasi Telekomunikasi Tiang telepon Besi Bentuk Taper Segi Delapan- 7 M ', '2003', '1.0', 'T3', ''),
('STEL L-046-2004', 'Spesifikasi Telekomunikasi  Rumah Kabel Plastik  Lengkap dengan Blok terminal', '2004', '3.0', 'T3', ''),
('STEL L-047-2008', 'Spesifikasi Telekomunikasi Single Mode Passive Optical Splitter', '2008', '1.0', 'T3', ''),
('STEL L-048-2008', 'Spesifikasi Telekomunikasi Optical Distribution Frame', '2008', '1.0', 'T3', ''),
('STEL L-049-2008', 'Spesifikasi Telekomunikasi Optical Distribution Cabinet', '2008', '1.0', 'T3', ''),
('STEL L-050-2008', 'Spesifikasi Telekomunikasi Optical Termination Box', '2008', '1.0', 'T3', ''),
('STEL L-051-2008', 'Spesifikasi Telekomunikasi Perangkat Insertion Terminal Block', '2008', '1.0', 'T3', ''),
('STEL L-052-2009', 'Spesifikasi Telekomunikasi Kabinet dan Sarana Penunjang BTS Outdoor CDMA 2000', '2009', '1.0', 'T3', ''),
('STEL L-053-2011', 'Spesifikasi Telekomunikasi  Optical Rossette (OR) sebagai Terminasi Fiber Optik pada Dinding sesuai BS-4662', '2011', '1.0', 'T3', ''),
('STEL L-054-2012', 'Spesifikasi Telekomunikasi Perangkat Blok Terminal Rumah Kabel untuk Layanan Broadband', '2012', '2.0', 'T3', ''),
('STEL L-055-2012', 'Spesifikasi Telekomunikasi Optical Distribution Frame untuk Fiber Termination Management (FTM)', '2012', '2.0', 'T3', ''),
('STEL L-056-2017', 'Spesifikasi Telekomunikasi Perangkat Optical Distribution Cabinet (ODC) dengan Splitter', '2017', '3.0', 'T3', ''),
('STEL L-057-2012', 'Spesifikasi Telekomunikasi Perangkat Optical Distribution Point (ODP) Pole', '2012', '1.1', 'T3', ''),
('STEL L-058-2012', 'Spesifikasi Telekomunikasi Perangkat Optical Distribution Point (ODP) Wall Mounted', '2012', '1.1', 'T3', ''),
('STEL L-059-2012', 'Spesifikasi Telekomunikasi Perangkat Optical Distribution Point (ODP) Pendestal', '2012', '1.1', 'T3', ''),
('STEL L-060-2017', 'Spesifikasi Telekomunikasi Optical Patch Cord untuk FTTH', '2017', '2.0', 'T3', ''),
('STEL L-062-2013', 'Spesifikasi Telekomunikasi Tiang Telepon Besi Galvanis dengan Sambungan untuk Implementasi Perangkat WiFi/Access Point', '2013', '1.0', 'T3', ''),
('STEL L-064-2014', 'Spesifikasi Telekomunikasi Box Panel Outdoor untuk ONT dan POE pada FTTA', '2014', '1.0', 'T3', ''),
('STEL L-065-2014', 'Spesifikasi Telekomunikasi Microduct', '2014', '1.0', 'T3', ''),
('STEL L-066-2015', 'Spesifikasi Telekomunikasi Perangkat Splice on Connector (SOC)', '2015', '1.0', 'T3', ''),
('STEL L-068-2015', 'Spesifikasi Telekomunikasi Kabinet Luar untuk Perangkat Aktif (KLPA) untuk Multi Dwelling Unit (MDU)', '2015', '1.0', 'T3', ''),
('STEL L-069-2015', 'Spesifikasi Telekomunikasi Kabinet Luar Perangkat Aktif untuk Mini OLT', '2015', '1.0', 'T3', ''),
('STEL L-070-2016', 'Spesifikasi Telekomunikasi Box ONT Bridge', '2016', '1.0', 'T3', ''),
('STEL L-071-2017', 'Spesifikasi Telekomunikasi Optical Distribution Point (ODP) dengan Solid Splitter', '2017', '1.0', 'T3', ''),
('STEL L-072-2017', 'Spesifikasi Telekomunikasi Portable Handhole', '2017', '1.0', 'T3', ''),
('STEL L-073-2018', 'Spesifikasi Telekomunikasi ODC Tiang', '2018', '1.0', 'T3', ''),
('STEL L-074-2019', 'Spesifikasi Telekomunikasi Optical Cord Bundle', '2019', '1.2', 'T3', ''),
('STEL L-075-2020', 'Spesifikasi Telekomunikasi Optical Distribution Point Closure Aerial dengan Solid Splitter (ODP CA Solid)', '2020', '2.1', 'T3', ''),
('STEL L-076-2019', 'Spesifikasi Telekomunikasi Perangkat  Aksesoris Tiang', '2019', '2.1', 'T3', ''),
('STEL L-077-2019', 'Spesifikasi Telekomunikasi Tiang Kabel Kayu Bentuk Segi Empat 7m', '2019', '1.0', 'T3', ''),
('STEL L-078-2019', 'Spesifikasi Telekomunikasi Optical Termination Premises (OTP) FTTH', '2019', '1.1', 'T3', ''),
('STEL L-079-2020', 'Spesifikasi Telekomunikasi Tiang Galvanis 6M Tanpa Sambungan', '2020', '1.0', 'T3', ''),
('STEL L-080-2020', 'Spesifikasi Telekomunikasi Pre-Connectorized KSO Indoor Transparan dengan Roset', '2020', '1.0', 'T3', ''),
('STEL L-081-2020', 'Spesifikasi Telekomunikasi OTP Indihome Lite', '2020', '1.0', 'T3', ''),
('STEL M-001-2011', 'Telecommunication Specification CPE WAN MANAGEMENT', '2011', '1.2', 'T1', ''),
('STEL Q-070-2011', 'Spesifikasi Telekomunikasi Perangkat Set Top Box IPTV (STB)', '2011', '2.4', 'T1', ''),
('STEL Q-072-2013', 'Spesifikasi Telekomunikasi Home Gateway DSL Tipe Single Port Ethernet', '2013', '3.1', 'T1', ''),
('STEL Q-073-2016', 'Spesifikasi Telekomunikasi Home Gateway DSL Tipe Empat Port Ethernet', '2016', '3.0', 'T1', ''),
('STEL Q-077-2018', 'Spesifikasi Telekomunikasi  ONT RETAIL', '2018', '4.0', 'T1', ''),
('STEL Q-078-2016', 'Spesifikasi Telekomunikasi Media Gateway (STB + WIFI ROUTER)', '2016', '1.2', 'T1', ''),
('STEL Q-079-2016', 'Telecommunication Specification ONT Bridge For Single Family Unit ', '2016', '1.1', 'T1', ''),
('STEL Q-080-2019', 'Telecommunication Specification HYBRID STB DEVICE', '2019', '1.2', 'T1', ''),
('STEL Q-081-2018', 'Telecommunication Specification ONT MOBILE BACKHAUL FOR GPON', '2018', '2.0', 'T1', ''),
('STEL Q-082-2019', 'Telecommunication Specification ONT ENTERPRISE FOR GPON', '2019', '2.1', 'T1', ''),
('STEL Q-083-2019', 'Telecommunication Specification OPEN ONT ( Optical Network Terminal ) RETAIL', '2019', '2.1', 'T1', ''),
('STEL Q-084-2019', 'Telecommunication Specification ONT PREMIUM FOR GPON', '2019', '1.3', 'T1', ''),
('STEL Q-085-2018', 'Spesifikasi Telekomunikasi ONT MOBILE BACKHAUL FOR XGS-PON', '2018', '1.0', 'T1', ''),
('STEL Q-086-2018', 'Telecommunication Specification ONT ENTERPRISE FOR XGS-PON', '2018', '1.1', 'T1', ''),
('STEL Q-088-2019', 'Telecommunication Specification OTT BOX DEVICE', '2019', '1.0', 'T1', ''),
('STEL Q-089-2020', 'ONT Retail Premium for XGS-PON', '2020', '1.0', 'T1', ''),
('STEL T-011-2002', 'Spesifikasi Telekomunikasi Perangkat Multiplex PCM 30 Kanal untuk Junction dan Trunk (Telecommunication specification of PCM 30 channel  multiplex equipment for junction and trunk)', '2002', '2.0', 'T4', ''),
('STEL T-012-1996', 'Spesifikasi Telekomunikasi Perangkat High Order Multiplex', '1996', '2.0', 'T4', ''),
('STEL T-021-2001', 'Spesifikasi Telekomunikasi Perangkat Digital Cross Connect', '2001', '1.1', 'T4', ''),
('STEL T-022-1999', 'Spesifikasi Telekomunikasi Perangkat Flexible Multiplex 2 Mbps', '1999', '2.0', 'T4', ''),
('STEL T-023-2001', 'Spesifikasi Telekomunikasi Pengganda Aluran Transmisi Digital', '2001', '1.1', 'T4', ''),
('STEL T-024-1996', 'Spesifikasi Telekomunikasi Perangkat Radio Terminal Jarlokar DECT', '1996', '1.0', 'T4', ''),
('STEL T-025-1996', 'Spesifikasi Telekomunikasi Terminal STB Analog', '1996', '1.0', 'T4', ''),
('STEL T-026-1996', 'Spesifikasi Telekomunikasi Perangkat Optical Network Unit', '1996', '1.0', 'T4', ''),
('STEL T-027-1996', 'Spesifikasi Telekomunikasi Perangkat High Bit Rate Data Subscriber Line', '1996', '1.0', 'T4', ''),
('STEL T-028-1997', 'Spesifikasi Telekomunikasi Perangkat Radio Jarlokar CDMA', '1997', '1.0', 'T4', ''),
('STEL T-029-2005', 'Spesifikasi Telekomunikasi Perangkat Multiplex SDH', '2005', '3.0', 'T4', ''),
('STEL T-030-1998', 'Spesifikasi Telekomunikasi Perangkat Radio Digital VHF/UHF 30 MHz ~ 1500 MHz', '1998', '1.0', 'T4', ''),
('STEL T-033-1997', 'Spesifikasi Telekomunikasi Perangkat Terminal STB GSM', '1997', '1.0', 'T4', ''),
('STEL T-035-1999', 'Spesifikasi Telekomunikasi Perangkat Terminal STB CDMA IS-95', '1999', '1.0', 'T4', ''),
('STEL T-036-1998', 'Spesifikasi Telekomunikasi Perangkat Sistem Telekomunikasi Lintas Radio IS-95 (STLR IS-95)', '1998', '1.0', 'T4', ''),
('STEL T-037-1998', 'Spesifikasi Telekomunikasi Perangkat ADSL', '1998', '1.0', 'T4', ''),
('STEL T-038-1998', 'Spesifikasi Telekomunikasi Perangkat Jaringan Akses Berbasis Antarmuka V5.X', '1998', '1.0', 'T4', ''),
('STEL T-040-1998', 'Spesifikasi Telekomunikasi Perangkat Customer Interface Unit HFC', '1998', '1.0', 'T4', ''),
('STEL T-041-1998', 'Spesifikasi Telekomunikasi Perangkat Set Top Box HFC', '1998', '1.0', 'T4', ''),
('STEL T-042-1998', 'Spesifikasi Telekomunikasi Perangkat Kabel Modem HFC', '1998', '1.0', 'T4', ''),
('STEL T-043-1998', 'Spesifikasi Telekomunikasi Kabel Koaksial HFC', '1998', '1.0', 'T4', ''),
('STEL T-044-1998', 'Spesifikasi Telekomunikasi Komponen Pasif HFC', '1998', '1.0', 'T4', ''),
('STEL T-045-1998', 'Spesifikasi Telekomunikasi Perangkat Amplifier HFC', '1998', '1.0', 'T4', ''),
('STEL T-046-1998', 'Spesifikasi Telekomunikasi Perangkat Fiber Node HFC', '1998', '1.0', 'T4', ''),
('STEL T-047-1998', 'Spesifikasi Telekomunikasi Perangkat Headend HFC', '1998', '1.0', 'T4', ''),
('STEL T-048-1998', 'Spesifikasi Telekomunikasi Perangkat Cable Telephony Headend HFC', '1998', '1.0', 'T4', ''),
('STEL T-049-1998', 'Spesifikasi Telekomunikasi Perangkat Cable Router HFC', '1998', '1.0', 'T4', ''),
('STEL T-050-2005', 'Spesifikasi Telekomunikasi Perangkat VSAT', '2005', '3.0', 'T4', ''),
('STEL T-051-1999', 'Spesifikasi Telekomunikasi Perangkat Repeater Seluler Full Duplex', '1999', '1.0', 'T4', ''),
('STEL T-052-2000', 'Spesifikasi Telekomunikasi Perangkat Gateway/Gatekeeper VoIP ', '2000', '2.0', 'T4', ''),
('STEL T-053-2000', 'Spesifikasi Telekomunikasi Perangkat ADSL-Lite', '2000', '1.0', 'T4', ''),
('STEL T-054-2000', 'Spesifikasi Telekomunikasi Perangkat SDSL (Symmetric Digital Subscriber Line)', '2000', '1.0', 'T4', ''),
('STEL T-056-2000', 'Spesifikasi Telekomunikasi Perangkat GPRS', '2000', '1.0', 'T4', ''),
('STEL T-057-2000', 'Telecommunication Specification Bluetooth', '2000', '1.0', 'T4', ''),
('STEL T-058-2001', 'Spesifikasi Telekomunikasi Perangkat Wireless LAN', '2001', '1.0', 'T4', ''),
('STEL T-059-2002', 'Spesifikasi Telekomunikasi Dense Wavelength Division Multiplexing (DWDM)/ Telecommunication Specification of Dense Wavelength Division Multiplexing(DWDM)', '2002', '1.0', 'T4', ''),
('STEL T-060-2001', 'Spesifikasi Telekomunikasi Perangkat Radio Point To Multipoint untuk Layanan Broadband dengan Metode Akses TDMA', '2001', '1.0', 'T4', ''),
('STEL T-061-2001', 'Spesifikasi Telekomunikasi Perangkat Radio Point To Multipoint Metode Akses DS-CDMA', '2001', '1.0', 'T4', ''),
('STEL T-062-2001', 'Spesifikasi Telekomunikasi Perangkat Radio Point To Multipoint Metode Akses FH-CDMA', '2001', '1.0', 'T4', ''),
('STEL T-063-2002', 'Spesifikasi Telekomunikasi Antar Muka Optik Untuk Channel STM-4 / Telecommunication Specification of Optical Interface for Single Channel STM-64', '2002', '1.0', 'T4', ''),
('STEL T-066-2007', 'Spesifikasi Telekomunikasi Trunk Gateway untuk Sistem Softswitch', '2007', '2.0', 'T4', ''),
('STEL T-067-2007', 'Spesifikasi Telekomunikasi Perangkat Access Gateway untuk Sistem Softswitch', '2007', '2.0', 'T4', ''),
('STEL T-068-2007', 'Spesifikasi Telekomunikasi Perangkat Softswitch.', '2007', '2.0', 'T4', ''),
('STEL T-071-2006', 'Telecommunication Specification Up Converter C Band', '2006', '1.0', 'T4', ''),
('STEL T-076-2006', 'Spesifikasi Telekomunikasi perangkat Block Up Converter Stasiun Bumi Sistem Komunikasi Satelit', '2006', '1.0', 'T4', ''),
('STEL T-077-2006', 'Spesifikasi Telekomunikasi perangkat Hight Power Amplifier Stasiun Bumi Sistem Komunikasi Satelit', '2006', '1.0', 'T4', ''),
('STEL T-078-2006', 'Spesifikasi Telekomunikasi perangkat Antena Stasiun Bumi Sistem Komunikasi Satelit', '2006', '1.0', 'T4', ''),
('STEL T-079-2007', 'Spesifikasi Telekomunikasi Active Digital Distribution Frame (DDF)', '2007', '1.0', 'T4', ''),
('STEL T-083-2012', 'Spesifikasi Telekomunikasi Perangkat MSAN', '2012', '1.1', 'T4', ''),
('STEL T-085-2008', 'Spesifikasi Telekomunikasi Dense Wavelength Division Multiplexing (DWDM) (Untuk Terresterial & Submarine)', '2008', '1.0', 'T4', ''),
('STEL T-087-2008', 'Spesifikasi Telekomunikasi Perangkat Broadband Wireless Access 3,3 GHz', '2008', '1.0', 'T4', ''),
('STEL T-088-2008', 'Telecommunication Specification Gigabit-Capable Passive Optical Network (GPON)', '2008', '1.0', 'T4', ''),
('STEL T-089-2008', 'Telecommunication Specification Optical Terminal Multiplexer', '2008', '1.0', 'T4', ''),
('STEL T-090-2008', 'Telecommunication Specification Sub System of Reconfigurable Optical Add-drop Multiplexer (ROADM)', '2008', '1.0', 'T4', ''),
('STEL T-091-2008', 'Telecommunication Specification Tunable Optical Transponder', '2008', '1.0', 'T4', ''),
('STEL T-092-2009', 'Spesifikasi Telekomunikasi Perangkat G.SHDSL.bis Line Extender (GLE)', '2009', '1.0', 'T4', ''),
('STEL T-093-2009', 'Spesifikasi Telekomunikasi Perangkat BTS Outdoor CDMA2000 1x', '2009', '1.0', 'T4', ''),
('STEL T-094-2009', 'Spesifikasi Telekomunikasi Perangkat Digital Fixed Radio System Point to Point (Radio IP)', '2009', '1.0', 'T4', ''),
('STEL T-095-2010', 'Spesifikasi Telekomunikasi Perangkat Fixed/Nomadic Broadband Wireless Access 2,3 GHz', '2010', '1.0', 'T4', ''),
('STEL T-096-2020', 'Telecommunication Specification VSAT IP', '2020', '2.0', 'T4', ''),
('STEL T-097-2014', 'Telecommunication Specification Tuneable 100G-Coherent Optical Transponder', '2014', '1.1', 'T4', ''),
('STEL T-098-2013', 'Telecommunication Specification 10 Gigabit-Capable Passive Optical Network (XG-PON)', '2013', '1.0', 'T4', ''),
('STEL T-099-2014', 'Telecommunication Specification Optical Transport Network (OTN)', '2014', '1.0', 'T4', ''),
('STEL T-100-2015', 'Telecommunication Specification Radio System-PTP for Long Haul Application', '2015', '1.0', 'T4', ''),
('STEL T-101-2015', 'Telecommunication Specification Multi Dwelling Unit (MDU)', '2015', '1.0', 'T4', ''),
('STEL T-102-2015', 'Spesifikasi Telekomunikasi Mini OLT for XG-PON/ GPON System (ONT Enterprise)', '2015', '1.0', 'T4', ''),
('STEL T-103-2018', 'Spesifikasi Telekomunikasi Open Optical Line Termination (Open OLT)', '2018', '2.0', 'T4', ''),
('STEL T-104-2018', 'Spesifikasi Telekomunikasi MS OTN', '2018', '1.0', 'T4', ''),
('STEL T-105-2018', 'Spesifikasi Telekomunikasi Open OLT for XGSPON', '2018', '1.0', 'T4', ''),
('STEL T-106-2019', 'AP (Access Point) WAC (Wireless Access Controller) for WiFi Managed System', '2019', '1.0', 'T4', ''),
('STEL T-107-2019', 'Telecommunication Specification Access Point - Wireless Access Controller for WIFI Managed System', '2019', '1.0', 'T4', ''),
('STEL U-003-2006', 'Spesifikasi Telekomunikasi Batere Asam Timbal Berventilasi untuk Sistem Floating (Vented Lead Acid)', '2006', '3.0', 'T2', ''),
('STEL U-007-2012', 'Spesifikasi Telekomunikasi Rectifier Indoor', '2012', '3.1', 'T2', ''),
('STEL U-015-2012', 'Spesifikasi Telekomunikasi Batere Asam Timbal Tertutup untuk Sistem Floating', '2012', '4.2', 'T2', ''),
('STEL U-021-2001', 'Spesifikasi Telekomunikasi Diesel Genset Stasioner Kapasitas 500kVA s.d. 1000kVA untuk Catuan Perangkat Telekomunikasi', '2001', '2.0', 'T2', ''),
('STEL U-024-2001', 'Spesifikasi Telekomunikasi Perangkat Diesel Genset Mobile', '2001', '1.0', 'T2', ''),
('STEL U-025-2001', 'Spesifikasi Telekomunikasi Diesel Genset Stasioner di Bawah 500kVA untuk Catuan Perangkat Telekomunikasi', '2001', '1.0', 'T2', ''),
('STEL U-030-2008', 'Spesifikasi Telekomunikasi Diesel Genset Dibawah 50kVA Untuk Catuan Perangkat Telekomunikasi', '2008', '1.0', 'T2', ''),
('STEL U-033-2012', 'Spesifikasi Telekomunikasi Rectifier Outdoor', '2012', '1.1', 'T2', ''),
('STEL U-034-2013', 'Spesifikasi Telekomunikasi Lithium Iron Phosphate (LiFePO4) Ion Battery (Batere Lithium) Untuk Implementasi Charge Discharge', '2013', '1.0', 'T2', '');

-- --------------------------------------------------------

--
-- Table structure for table `test_reports`
--

CREATE TABLE `test_reports` (
  `id` varchar(24) NOT NULL,
  `company_name` text NOT NULL,
  `device_name` text NOT NULL,
  `brand` text NOT NULL,
  `model` text NOT NULL,
  `test_reference_id` varchar(32) NOT NULL,
  `created` varchar(24) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_reports`
--

INSERT INTO `test_reports` (`id`, `company_name`, `device_name`, `brand`, `model`, `test_reference_id`, `created`, `file`) VALUES
('002/KAB/TL/QA/2019', 'TAKDIR LIMA SEKAWAN', 'Optical Distribution Point (ODP) dengan Solid Splitter', 'SUKAi', '16 Port Adaptor', 'STEL L-071-2017', '2019-03-22', '002KABTLQA2019_TAKDIR-LIMA-SEKAWAN.pdf'),
('065/DQA/L/QA/2019', 'ZTE INDONESIA', 'ONT Premium for GPON', 'ZTE', 'F670 V2.0', 'STEL Q-084-2019', '2019-12-19', '065DQALQA2019_ZTE-INDONESIA.pdf'),
('208/KAB/VT/2018', 'BUANA SELARAS GLOBALINDO', 'FABRIC INNER DUCT', 'OPTICELL', '6428-3', '', '2019-04-10', '208KABVT2018_BUANA-SELARAS-GLOBALINDO.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `trial_reports`
--

CREATE TABLE `trial_reports` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `trial_date` varchar(24) NOT NULL,
  `num_device` int(11) NOT NULL,
  `num_pass` int(11) DEFAULT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `role` varchar(5) NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `email` text,
  `photo` text,
  `registered` varchar(24) DEFAULT NULL,
  `updated` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `role`, `telp`, `email`, `photo`, `registered`, `updated`) VALUES
('012020', 'Auditor 1', 'T63BtTiIBlilJYWzavEWC/ILcH6SIpoHoEqb132mQio=', '5', NULL, 'test@mail.com', NULL, '2020-05-10T12:01:39.524Z', '2020-05-10T12:01:39.524Z'),
('970037', 'Aldi Wiranata', '44sTXVnKJJsC0ZgNLlJmUOJb+8QcJ6ZrI19WrfDFlAA=', '1', '081388098842', 'aldiw01@gmail.com', 'profile_photo_970037', '2020-05-07T04:51:54.211Z', '2020-05-07T04:51:54.211Z');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `standard_level_id` (`standard_level_id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`test_report_id`);

--
-- Indexes for table `dide`
--
ALTER TABLE `dide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `standard_level_id` (`standard_level_id`);

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
  ADD KEY `FK` (`user_id`,`step_id`),
  ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `quality_manuals`
--
ALTER TABLE `quality_manuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quality_records`
--
ALTER TABLE `quality_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`document_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_levels`
--
ALTER TABLE `standard_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_references`
--
ALTER TABLE `test_references`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`standard_level_id`);

--
-- Indexes for table `test_reports`
--
ALTER TABLE `test_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trial_reports`
--
ALTER TABLE `trial_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`role`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archives`
--
ALTER TABLE `archives`
  ADD CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`standard_level_id`) REFERENCES `standard_levels` (`id`);

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`test_report_id`) REFERENCES `test_reports` (`id`);

--
-- Constraints for table `dide`
--
ALTER TABLE `dide`
  ADD CONSTRAINT `dide_ibfk_1` FOREIGN KEY (`standard_level_id`) REFERENCES `standard_levels` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `steps` (`id`);

--
-- Constraints for table `quality_records`
--
ALTER TABLE `quality_records`
  ADD CONSTRAINT `quality_records_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`);

--
-- Constraints for table `test_references`
--
ALTER TABLE `test_references`
  ADD CONSTRAINT `test_references_ibfk_1` FOREIGN KEY (`standard_level_id`) REFERENCES `standard_levels` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
