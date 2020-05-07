
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/forms')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageForms = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/forms/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_v' + req.body.version + '_' + req.body.name.replace(new RegExp(" ", 'g'), "-") + path.extname(file.originalname));
  }
})

function fileFilter(req, file, cb) {
  const AVAILABLE_MIMETYPE = [
    "application/pdf",
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/vnd.ms-excel",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  ]
  if (AVAILABLE_MIMETYPE.includes(file.mimetype)) {
    cb(null, true)
  } else {
    cb({ message: 'Only for documents (pdf/doc/docx/xls/xlsx).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Quality Manuals => /api/forms/

router.get('/', jwtMW, (req, res) => {
  db.getFormAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getForm(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getFormType(req.params, res)
})

router.get('/pic/:id', jwtMW, (req, res) => {
  db.getFormPIC(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageForms,
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

    db.newForm(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateForm(req, res)
})

router.put('/file_pdf/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageForms,
    limits: {
      fileSize: 10 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file_pdf')
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

    db.updateFormPDF(req, res)
  })
})

router.put('/file_doc/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageForms,
    limits: {
      fileSize: 10 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file_doc')
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

    db.updateFormDOC(req, res)
  })
})

router.put('/file_xls/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageForms,
    limits: {
      fileSize: 10 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file_xls')
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

    db.updateFormXLS(req, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteForm(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteFormAll(req.params, res)
})

module.exports = router