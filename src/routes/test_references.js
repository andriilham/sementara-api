
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/test_references')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageTestReferences = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/test_references/');
  },
  filename: function (req, file, cb) {
    const version = req.body.version ? req.body.version : req.body.year;
    const fieldname = file.fieldname === "file_wm" ? "_WM" : "";
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_v' + version + '_' + req.body.name.replace(new RegExp("[^\\w\\s]", 'g'), "") + fieldname + path.extname(file.originalname));
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
// API Test Reference => /api/test_references/

router.get('/', jwtMW, (req, res) => {
  db.getTestReferenceAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getTestReference(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getTestReferenceType(req.params, res)
})

router.get('/search/:id', jwtMW, (req, res) => {
  db.getTestReferenceSearch(req.params, res)
})

router.get('/search/:id/:id2', jwtMW, (req, res) => {
  db.getTestReferenceSearch2(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTestReferences,
    limits: {
      fileSize: 20 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).fields([{ name: 'file', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }, { name: 'file_wm', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file === undefined || req.body.file_doc === undefined || req.body.file_wm === undefined)) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.files.file ? req.files.file[0].filename : req.body.file
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc
    req.body.file_wm = req.files.file_wm ? req.files.file_wm[0].filename : req.body.file_wm

    db.newTestReference(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTestReferences,
    limits: {
      fileSize: 20 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).fields([{ name: 'file', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }, { name: 'file_wm', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file === undefined || req.body.file_doc === undefined || req.body.file_wm === undefined)) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.files.file ? req.files.file[0].filename : req.body.file
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc
    req.body.file_wm = req.files.file_wm ? req.files.file_wm[0].filename : req.body.file_wm

    db.updateTestReference(req, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteTestReference(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteTestReferenceAll(req.params, res)
})

module.exports = router