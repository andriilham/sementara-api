
const express = require('express')
var router = express.Router()
var db = require('../models/history')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API History => /api/history/

router.get('/', jwtMW, (req, res) => {
  db.getHistoryAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getHistory(req.params, res)
})

router.get('/notification/:id', (req, res) => {
  db.getHistoryNotification(req.params, res)
})

router.get('/reference/:id', jwtMW, (req, res) => {
  db.getHistoryReference(req.params, res)
})

router.get('/reference-admin/:id', jwtMW, (req, res) => {
  db.getHistoryReferenceAdmin(req.params, res)
})

router.get('/user/:id', jwtMW, (req, res) => {
  db.getHistoryUser(req.params, res)
})

router.get('/step/:id', jwtMW, (req, res) => {
  db.getHistoryStep(req.params, res)
})

router.get('/request-step/:id', (req, res) => {
  db.getHistoryRequestStep(req.params, res)
})

router.post('/', (req, res) => {
  db.newHistory(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// NO UPDATE FEATURE IN HISTORY

// router.put('/:id', jwtMW, (req, res) => {
//   db.updateHistory(req.body, res)
// })

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteHistory(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteHistoryAll(req.params, res)
})

module.exports = router