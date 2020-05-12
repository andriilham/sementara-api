
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/test_reports')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageTestReports = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/test_reports/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_' + req.body.company_name.replace(new RegExp(" ", 'g'), "-") + path.extname(file.originalname));
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
// API Test Reports => /api/test_reports/

router.get('/', jwtMW, (req, res) => {
  db.getTestReportAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getTestReport(req.params, res)
})

router.get('/search/:id', jwtMW, (req, res) => {
  db.getTestReportSearch(req.params, res)
})

router.get('/search/:id/:id2', jwtMW, (req, res) => {
  db.getTestReportSearch2(req.params, res)
})

router.get('/test_reference/:id', jwtMW, (req, res) => {
  db.getTestReportTestReference(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTestReports,
    limits: {
      fileSize: 200 * 1024 * 1024
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

    db.newTestReport(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTestReports,
    limits: {
      fileSize: 200 * 1024 * 1024
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

    db.updateTestReport(req, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteTestReport(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteTestReportAll(req.params, res)
})

module.exports = router