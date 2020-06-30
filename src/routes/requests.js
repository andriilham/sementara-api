
const express = require('express')
var router = express.Router()
var db = require('../models/requests')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Requests => /api/requests/

router.get('/', jwtMW, (req, res) => {
  db.getRequestAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getRequest(req.params, res)
})

router.get('/notification/:id', jwtMW, (req, res) => {
  db.getRequestNotification(req.params, res)
})

router.get('/role/:id', jwtMW, (req, res) => {
  db.getRequestbyRole(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newRequest(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateRequest(req, res)
})

router.put('/approve/1/:id', jwtMW, (req, res) => {
  db.updateRequestApproval1(req.params, res)
})

router.put('/approve/2/:id', jwtMW, (req, res) => {
  db.updateRequestApproval2(req.params, res)
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