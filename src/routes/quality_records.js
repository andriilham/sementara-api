
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/quality_records')
var db_req = require('../models/requests')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageQualityRecords = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/quality_records/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.form_id.replace(new RegExp("[^\\w\\s]", 'g'), "") + '_' + req.body.name.replace(new RegExp("[^\\w\\s]", 'g'), "") + '_' + new Date().valueOf() + path.extname(file.originalname));
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
// API Quality Manuals => /api/quality_records/

router.get('/', jwtMW, (req, res) => {
  db.getQualityRecordAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getQualityRecord(req.params, res)
})

router.get('/form/:id', (req, res) => {
  db.getQualityRecordForm(req.params, res)
})

router.get('/form/:id/pic/:id2', (req, res) => {
  db.getQualityRecordFormPIC(req.params, res)
})

router.get('/pic/:id', jwtMW, (req, res) => {
  db.getQualityRecordPIC(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityRecords,
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
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.file ? req.file.filename : req.body.file

    if (req.body.role !== undefined && req.body.role > '2B') {
      var query = JSON.parse(req.body.query)
      query.file = req.body.file
      req.body.query = JSON.stringify(query)
      db_req.newRequest(req.body, res)
    } else {
      db.newQualityRecord(req.body, res)
    }
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityRecords,
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

    if (req.body.role !== undefined && req.body.role > '2B') {
      var query = JSON.parse(req.body.query)
      query.file = req.body.file
      req.body.query = JSON.stringify(query)
      db_req.newRequest(req.body, res)
    } else {
      db.updateQualityRecord(req, res)
    }
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteQualityRecord(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteQualityRecordAll(req.params, res)
})

module.exports = router