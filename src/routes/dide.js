
const express = require('express')
var router = express.Router()
var db = require('../models/dide')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API DIDE => /api/dide/

router.get('/', jwtMW, (req, res) => {
  db.getDIDEAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getDIDE(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getDIDEType(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  console.log(req.body)
  db.newDIDE(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateDIDE(req, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteDIDE(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteDIDEAll(req.params, res)
})

module.exports = router