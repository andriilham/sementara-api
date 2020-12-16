
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/quality_documents')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageQualityDocuments = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/quality_documents/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.document_id.replace(new RegExp("/", 'g'), "") + '_v' + req.body.version + '_' + req.body.name.replace(new RegExp("[^\\w\\s]", 'g'), "") + path.extname(file.originalname));
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
    cb({ message: 'Only for documents (pdf, doc, docx, xls, xlsx).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Quality Documents => /api/quality_documents/

router.get('/', jwtMW, (req, res) => {
  db.getQualityDocumentAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getQualityDocument(req.params, res)
})

router.get('/active/:id', jwtMW, (req, res) => {
  db.getQualityDocumentActive(req.params, res)
})

router.get('/type/:status/:id', (req, res) => {
  db.getQualityDocumentType(req.params, res)
})

router.get('/procedure/:user/:status', jwtMW, (req, res) => {
  db.getQualityDocumentProcedureUser(req.params, res)
})

router.get('/form/:id/user/:user/:status', jwtMW, (req, res) => {
  db.getQualityDocumentFormUser(req.params, res)
})

router.get('/search/:id/:status', (req, res) => {
  db.getQualityDocumentSearch(req.params, res)
})

router.get('/search/:id/:status/:type', (req, res) => {
  db.getQualityDocumentSearchType(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityDocuments,
    limits: {
      fileSize: 50 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).fields([{ name: 'file_pdf', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }, { name: 'file_xls', maxCount: 1 }, { name: 'file_pds', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file_pdf === undefined || req.body.file_doc === undefined || req.body.file_xls === undefined || req.body.file_pds === undefined)) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file_pdf = req.files.file_pdf ? req.files.file_pdf[0].filename : req.body.file_pdf
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc
    req.body.file_xls = req.files.file_xls ? req.files.file_xls[0].filename : req.body.file_xls
    req.body.file_pds = req.files.file_pds ? req.files.file_pds[0].filename : req.body.file_pds

    db.newQualityDocument(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageQualityDocuments,
    limits: {
      fileSize: 50 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).fields([{ name: 'file_pdf', maxCount: 1 }, { name: 'file_doc', maxCount: 1 }, { name: 'file_xls', maxCount: 1 }, { name: 'file_pds', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined && (req.body.file_pdf === undefined || req.body.file_doc === undefined || req.body.file_xls === undefined || req.body.file_pds === undefined)) {
      res.send('index', { message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file_pdf = req.files.file_pdf ? req.files.file_pdf[0].filename : req.body.file_pdf
    req.body.file_doc = req.files.file_doc ? req.files.file_doc[0].filename : req.body.file_doc
    req.body.file_xls = req.files.file_xls ? req.files.file_xls[0].filename : req.body.file_xls
    req.body.file_pds = req.files.file_pds ? req.files.file_pds[0].filename : req.body.file_pds

    db.updateQualityDocument(req, res)
  })
})

router.put('/obsolete/:id', jwtMW, (req, res) => {
  db.updateQualityDocumentObsolete(req.params, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteQualityDocument(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteQualityDocumentAll(req.params, res)
})

module.exports = router