// const Client = require('mariasql');
// const c = new Client({
//   host: process.env.APP_DATABASE_HOST,
//   user: process.env.APP_DATABASE_USER,
//   password: process.env.APP_DATABASE_PASSWORD,
//   db: process.env.APP_DATABASE_DB
// });

const Client = require('mysql');
const c = Client.createConnection({
	host: process.env.APP_DATABASE_HOST,
	user: process.env.APP_DATABASE_USER,
	password: process.env.APP_DATABASE_PASSWORD,
	database: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CERTIFICATE MODELS

  getCertificateAll: function (req, res) {
    c.query("SELECT c.`id`, c.`test_report_id`, t.`company_name`, t.`device_name`, t.`brand`, t.`model`, c.`effective_date`, c.`due_date`, c.`file` FROM `certificates` c LEFT JOIN `test_reports` t ON c.`test_report_id`=t.`id` ORDER BY c.`effective_date` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      const col = Object.keys(rows.info.metadata)
      var data = [];
      rows.forEach(function (items) {
        data.push({
          [col[0]]: items[0],
          [col[1]]: items[1],
          [col[2]]: items[2],
          [col[3]]: items[3],
          [col[4]]: items[4],
          [col[5]]: items[5],
          [col[6]]: items[6],
          [col[7]]: items[7],
          [col[8]]: items[8]
        })
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getCertificate: function (req, res) {
    c.query("SELECT c.`id`, c.`test_report_id`, t.`company_name`, t.`device_name`, t.`brand`, t.`model`, c.`effective_date`, c.`due_date`, c.`file` FROM `certificates` c LEFT JOIN `test_reports` t ON c.`test_report_id`=t.`id` WHERE c.`id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      const col = Object.keys(rows.info.metadata)
      var data = [];
      rows.forEach(function (items) {
        data.push({
          [col[0]]: items[0],
          [col[1]]: items[1],
          [col[2]]: items[2],
          [col[3]]: items[3],
          [col[4]]: items[4],
          [col[5]]: items[5],
          [col[6]]: items[6],
          [col[7]]: items[7],
          [col[8]]: items[8]
        })
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getCertificateTestReport: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%"]
    c.query("SELECT c.`id`, c.`test_report_id`, t.`company_name`, t.`device_name`, t.`brand`, t.`model`, c.`effective_date`, c.`due_date`, c.`file` FROM `certificates` c LEFT JOIN `test_reports` t ON c.`test_report_id`=t.`id` WHERE c.`test_report_id` LIKE ? ORDER BY c.`effective_date` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      const col = Object.keys(rows.info.metadata)
      var data = [];
      rows.forEach(function (items) {
        data.push({
          [col[0]]: items[0],
          [col[1]]: items[1],
          [col[2]]: items[2],
          [col[3]]: items[3],
          [col[4]]: items[4],
          [col[5]]: items[5],
          [col[6]]: items[6],
          [col[7]]: items[7],
          [col[8]]: items[8]
        })
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getCertificateTestReport2: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", "%" + req.id2.toUpperCase() + "%"]
    c.query("SELECT c.`id`, c.`test_report_id`, t.`company_name`, t.`device_name`, t.`brand`, t.`model`, c.`effective_date`, c.`due_date`, c.`file` FROM `certificates` c LEFT JOIN `test_reports` t ON c.`test_report_id`=t.`id` WHERE c.`test_report_id` LIKE ? OR c.`test_report_id` LIKE ? ORDER BY c.`effective_date` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      const col = Object.keys(rows.info.metadata)
      var data = [];
      rows.forEach(function (items) {
        data.push({
          [col[0]]: items[0],
          [col[1]]: items[1],
          [col[2]]: items[2],
          [col[3]]: items[3],
          [col[4]]: items[4],
          [col[5]]: items[5],
          [col[6]]: items[6],
          [col[7]]: items[7],
          [col[8]]: items[8]
        })
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  newCertificate: function (req, res) {
    var request = [
      req.id,
      req.test_report_id,
      req.effective_date,
      req.due_date,
      req.file
    ];
    console.log(request)
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `certificates`(`id`, `test_report_id`, `effective_date`, `due_date`, `file`) VALUES (?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Certificate has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCertificate: function (req, res) {
    // EDIT ID FOR DEFINITE RANGE OF TIME, SHOULD REMOVE THIS
    var request = [
      req.body.id,
      req.body.test_report_id,
      req.body.effective_date,
      req.body.due_date,
      req.body.file,
      req.params.id
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `certificates` SET `id`=?, `test_report_id`=?, `effective_date`=?, `due_date`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Certificate has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteCertificate: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `certificates` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          err: null,
          message: "Certificate has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteCertificateAll: function (req, res) {
    c.query("DELETE FROM `certificates`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }
      console.log(rows.info)
      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          message: "All Certificate has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}