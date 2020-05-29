
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
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
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
  }).fields([{ name: 'file', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file === undefined || req.body.file_doc === undefined)) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.files.file ? req.files.file[0].filename : req.body.file
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc

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
  }).fields([{ name: 'file', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file === undefined || req.body.file_doc === undefined)) {
      res.send('index', { message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.files.file ? req.files.file[0].filename : req.body.file
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc

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