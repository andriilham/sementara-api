# [API] neo-sidomo - Sistem Dokumen Mutu Online
This project is under development, feel free to contact me for question.

## Installation

#### Clone the repo
``` bash
$ git clone https://github.com/aldiw01/neo-sidomo-api.git
```

#### Go into app's directory
``` bash
$ cd neo-sidomo-api
```

#### Import database neo_sidomo.sql into mySQL server

#### Install node and npm
For windows version, you can get it here -> https://nodejs.org/en/download/ 

#### Install app's dependencies
``` bash
$ npm install
```

## Set Environment Variables

#### Primary
```
APP_CIPHER_ALGORITHM
APP_CIPHER_BASE
APP_CIPHER_SECRET
APP_CIPHER_SALT

APP_DATABASE_DB
APP_DATABASE_HOST
APP_DATABASE_PASSWORD
APP_DATABASE_USER

APP_EMAIL_NAME
APP_EMAIL_PASSWORD
APP_EMAIL_USER

APP_HASH_ALGORITHM
APP_TOKEN_SECRET

APP_URL_LOGIN
APP_URL_RESET_PASSWORD
```

## Deploy API
``` bash
$ node src/index
```
or
``` bash
$ npm start
```
or
``` bash
$ yarn start
```

## Status Info
Info about Status ID, any configuration may change in future update.

#### User status
```
0. Not verified
1. Super Admin
2A1. Quality Manager 
2A2. Document Controller 1
2B. Document Controller 2
2C. Bagian Urel
3A. SM
3B. Lab Manager DEQA
3C. Lab Manager IQA
4B1. Lab Device
4B2. Lab Energy
4C1. Lab Kabel
4C2. Lab Transmisi
4C3. Lab Kalibrasi
5. Guest
6. Reserved
7. Reserved
8. Reserved
9. Deactivated
```