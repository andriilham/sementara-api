
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/trial_reports')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageTrialReports = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/trial_reports/');
  },
  filename: function (req, file, cb) {
    const id = req.id || req.body.id
    cb(null, req.body.trial_date + '_' + req.body.name.replace(new RegExp("[^\\w\\s]", 'g'), "") + '_' + id + path.extname(file.originalname));
  }
})

function fileFilter(req, file, cb) {
  const AVAILABLE_MIMETYPE = [
    "application/pdf",
  ]
  if (AVAILABLE_MIMETYPE.includes(file.mimetype)) {
    cb(null, true)
  } else {
    cb({ message: 'Only for documents (pdf).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Trial Reports => /api/trial_reports/

router.get('/', jwtMW, (req, res) => {
  db.getTrialReportAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getTrialReport(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  const waktu = new Date().toISOString();
  req.id = 'T' + new Date(waktu).valueOf().toString(32).toUpperCase();
  var upload = multer({
    storage: storageTrialReports,
    limits: {
      fileSize: 10 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file')
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.file == undefined) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.file.filename
    req.body.id = req.id

    db.newTrialReport(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTrialReports,
    limits: {
      fileSize: 10 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file')
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.file == undefined && req.body.file === undefined) {
      res.send('index', { message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.file ? req.file.filename : req.body.file

    db.updateTrialReport(req, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteTrialReport(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteTrialReportAll(req.params, res)
})

module.exports = router