
const express = require('express')
var router = express.Router()
var db = require('../models/accounts')
const jwt = require('jsonwebtoken')
const exjwt = require('express-jwt')
const crypto = require("crypto")
const axios = require("axios")

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const SECRET = process.env.APP_TOKEN_SECRET

/////////////////////////////////////////////////////////////////////////////////////////////
// CONSTANT LIST

const CIPHER_SECRET = process.env.APP_CIPHER_SECRET
const CIPHER_BASE = process.env.APP_CIPHER_BASE
const HASH_ALGORITHM = process.env.APP_HASH_ALGORITHM

/////////////////////////////////////////////////////////////////////////////////////////////
// API Accounts => /api/accounts/

router.post('/login', (req, res) => {
  const { id } = req.body;
  const password = crypto.createHmac(HASH_ALGORITHM, CIPHER_SECRET).update(req.body.password).digest(CIPHER_BASE);
  const request = {
    username: req.body.id,
    password: req.body.password
  }

  axios.post(process.env.APP_LDAP_ENDPOINT, request,
    {
      headers: {
        'Content-Type': 'application/json',
        'AppsName': process.env.APP_LDAP_NAME,
        'AppsToken': process.env.APP_LDAP_TOKEN
      }
    })
    .then(response => {
      if (response.data.login === 1) {
        db.getUser(req.body, function (data) {
          if (data.length === 1 && data[0].role !== "9") {
            //If all credentials are correct do this
            let token = jwt.sign({
              id: data[0].id,
              name: data[0].name,
              role: data[0].role,
              telp: data[0].telp,
              email: data[0].email,
              photo: data[0].photo,
              registered: data[0].registered,
              updated: data[0].updated
            }, SECRET, { expiresIn: 43210 }); // Sigining the token
            res.json({
              success: true,
              err: null,
              token
            });
          }
          else if (data.length === 1 && data[0].role === "9") {
            res.json({
              success: false,
              token: null,
              err: "User is deactivated. Please contact web admin if something isn't right."
            });
          }
          else {
            res.json({
              success: false,
              token: null,
              err: 'Your account is not registered, please contact web admin for further information'
            });
          }
        })
      }
      else {
        // res.json({
        //   success: false,
        //   token: null,
        //   err: `LDAP - ${response.data.note}`
        // });

        db.cekLogin(id, password, function (data) {
          if (data.length === 1 && (data[0].role !== "9")) {
            //If all credentials are correct do this
            let token = jwt.sign({
              id: data[0].id,
              name: data[0].name,
              role: data[0].role,
              telp: data[0].telp,
              email: data[0].email,
              photo: data[0].photo,
              registered: data[0].registered,
              updated: data[0].updated
            }, SECRET, { expiresIn: 43210 }); // Sigining the token
            res.json({
              success: true,
              err: null,
              token
            });
          }
          else if (data.length === 1 && data[0].role === "9") {
            res.json({
              success: false,
              token: null,
              err: "User is deactivated. Please contact web admin if something isn't right."
            });
          }
          else {
            res.json({
              success: false,
              token: null,
              err: 'Username or password is incorrect'
            });
          }
        });
      }
    })
    .catch((err) => {
      // res.send({ err: err.message });
      console.log(err.message);
      // return

      db.cekLogin(id, password, function (data) {
        if (data.length === 1 && (data[0].role !== "9")) {
          //If all credentials are correct do this
          let token = jwt.sign({
            id: data[0].id,
            name: data[0].name,
            role: data[0].role,
            telp: data[0].telp,
            email: data[0].email,
            photo: data[0].photo,
            registered: data[0].registered,
            updated: data[0].updated
          }, SECRET, { expiresIn: 43210 }); // Sigining the token
          res.json({
            success: true,
            err: null,
            token
          });
        }
        else if (data.length === 1 && data[0].role === "9") {
          res.json({
            success: false,
            token: null,
            err: "User is deactivated. Please contact web admin if something isn't right."
          });
        }
        else {
          res.json({
            success: false,
            token: null,
            err: 'Username or password is incorrect'
          });
        }
      });
    });
});

/////////////////////////////////////////////////////////////////////////////////////////////
// Forgot and Reset Password

router.post('/forgot-password', (req, res) => {
  const token = crypto.randomBytes(16).toString('hex');
  db.forgotPassword(req.body, res, token);
})

router.get('/forgot-password/get-token/:token', (req, res) => {
  db.forgotPassword_getToken(req.params, res);
})

router.put('/forgot-password/edit-password', (req, res) => {
  const password = crypto.createHmac(HASH_ALGORITHM, CIPHER_SECRET).update(req.body.password).digest(CIPHER_BASE);
  db.forgotPassword_editPassword(req.body, password, res);
})

/////////////////////////////////////////////////////////////////////////////////////////////
// API List

router.post('/check-user-registered', (req, res) => {
  db.checkUserRegistered(req.body, res);
})

router.get('/user/verify/:id', (req, res) => {
  db.checkVerified(req.params, res);
})

router.put('/user/verify/:id', jwtMW, (req, res) => {
  db.verifyUser(req.params, res);
})

router.post('/user/verify-token', (req, res) => {
  db.verifyToken(req.body, res);
})

router.delete('/token/verification/all', (req, res) => {
  db.deleteVerificationToken(req.params, res);
})

router.delete('/token/reset-password/all', (req, res) => {
  db.deleteResetPasswordToken(req.params, res);
})

router.delete('/token/inactive/all', (req, res) => {
  db.deleteInactiveToken(req.params, res);
})

module.exports = router