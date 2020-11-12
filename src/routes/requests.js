
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/requests')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageRequests = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, `src/uploads/${req.body.table_id}/`);
  },
  filename: function (req, file, cb) {
    var query = JSON.parse(req.body.query)
    cb(null, query.form_id.replace(new RegExp("[^\\w\\s]", 'g'), "") + '_' + query.name.replace(new RegExp("[^\\w\\s]", 'g'), "") + '_' + new Date().valueOf() + path.extname(file.originalname));
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
// API Requests => /api/requests/

router.get('/', jwtMW, (req, res) => {
  db.getRequestAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getRequest(req.params, res)
})

router.get('/notification/:id/:role', jwtMW, (req, res) => {
  db.getRequestNotification(req.params, res)
})

router.get('/role/:id/:role', jwtMW, (req, res) => {
  db.getRequestbyRole(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageRequests,
    limits: {
      fileSize: 100 * 1024 * 1024
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

    var query = JSON.parse(req.body.query)
    query.file = req.body.file
    req.body.query = JSON.stringify(query)
    db.newRequest(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageRequests,
    limits: {
      fileSize: 100 * 1024 * 1024
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

    var query = JSON.parse(req.body.query)
    query.file = req.body.file
    req.body.query = JSON.stringify(query)
    db.updateRequest(req, res)
  })
})

router.put('/approve/1/:id', jwtMW, (req, res) => {
  db.updateRequestApproval1(req.params, res)
})

router.put('/approve/2/:id', jwtMW, (req, res) => {
  db.updateRequestApproval2(req.params, res)
})

router.put('/reject/1/:id', jwtMW, (req, res) => {
  db.updateRequestReject1(req.params, res)
})

router.put('/reject/2/:id', jwtMW, (req, res) => {
  db.updateRequestReject2(req.params, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteRequest(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteRequestAll(req.params, res)
})

module.exports = router