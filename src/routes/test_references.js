
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
    const version = req.body.version || req.body.year;
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_v' + version + '_' + req.body.name + path.extname(file.originalname));
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

    db.newTestReference(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageTestReferences,
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