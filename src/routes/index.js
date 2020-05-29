var express = require('express')
var router = express.Router()
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const accounts = require('./accounts')
const archives = require('./archives')
const certificates = require('./certificates')
const dide = require('./dide')
const forms = require('./forms')
const history = require('./history')
const infos = require('./infos')
const quality_manuals = require('./quality_manuals')
const quality_records = require('./quality_records')
const roles = require('./roles')
const standard_levels = require('./standard_levels')
const steps = require('./steps')
const test_references = require('./test_references')
const test_reports = require('./test_reports')
const trial_reports = require('./trial_reports')
const uploads = require('./uploads')
const users = require('./users')

/////////////////////////////////////////////////////////////////////////////////////////////
// API Routes

router.use('/accounts', accounts)
router.use('/archives', archives)
router.use('/certificates', certificates)
router.use('/dide', dide)
router.use('/forms', forms)
router.use('/history', history)
router.use('/infos', infos)
router.use('/quality_manuals', quality_manuals)
router.use('/quality_records', quality_records)
router.use('/roles', roles)
router.use('/standard_levels', standard_levels)
router.use('/steps', steps)
router.use('/test_references', test_references)
router.use('/test_reports', test_reports)
router.use('/trial_reports', trial_reports)
router.use('/uploads', uploads)
router.use('/users', users)

router.get('/', jwtMW /* Using the express jwt MW here */, (req, res) => {
  res.send({ message: 'You are authenticated' }); //Sending some response when authenticated
});

module.exports = router