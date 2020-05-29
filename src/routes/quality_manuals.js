
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/quality_manuals')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageQualityManuals = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/quality_manuals/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_v' + req.body.version + '_' + req.body.name + path.extname(file.originalname));
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
// API Quality Manuals => /api/quality_manuals/

router.get('/', jwtMW, (req, res) => {
  db.getQualityManualAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getQualityManual(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getQualityManualType(req.params, res)
})

router.get('/pic/:id', jwtMW, (req, res) => {
  db.getQualityManualPIC(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityManuals,
    limits: {
      fileSize: 20 * 1024 * 1024
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

    db.newQualityManual(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityManuals,
    limits: {
      fileSize: 20 * 1024 * 1024
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

    db.updateQualityManual(req, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteQualityManual(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteQualityManualAll(req.params, res)
})

module.exports = router