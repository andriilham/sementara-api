const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // TEST REPORT MODELS

  getTestReportAll: function (req, res) {
    c.query("SELECT * FROM `test_reports` ORDER BY `created` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[8]]: items[8],
          [col[9]]: items[9],
          [col[10]]: items[10]
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
  getTestReport: function (req, res) {
    c.query("SELECT * FROM `test_reports` WHERE `id`=? ORDER BY `created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          [col[8]]: items[8],
          [col[9]]: items[9],
          [col[10]]: items[10]
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
  getTestReportSearch: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%"]
    c.query("SELECT * FROM `test_reports` WHERE `standard_level_id` LIKE ? ORDER BY `created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[8]]: items[8],
          [col[9]]: items[9],
          [col[10]]: items[10]
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
  getTestReportSearch2: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", "%" + req.id2.toUpperCase() + "%"]
    c.query("SELECT * FROM `test_reports` WHERE `standard_level_id` LIKE ? OR `standard_level_id` LIKE ? ORDER BY `created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[8]]: items[8],
          [col[9]]: items[9],
          [col[10]]: items[10]
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
  getTestReportTestReference: function (req, res) {
    const request = ["%" + req.id + "%"]
    c.query("SELECT * FROM `test_reports` WHERE `test_reference_id` LIKE ? ORDER BY `created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[8]]: items[8],
          [col[9]]: items[9],
          [col[10]]: items[10]
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
  newTestReport: function (req, res) {
    var request = [
      req.id,
      req.version,
      req.standard_level_id,
      req.company_name,
      req.device_name,
      req.brand,
      req.model,
      req.test_reference_id,
      req.created,
      req.file
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_reports`(`id`, `version`, `standard_level_id`, `company_name`, `device_name`, `brand`, `model`, `test_reference_id`, `created`, `file`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Report has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateTestReport: function (req, res) {
    // EDIT ID FOR DEFINITE RANGE OF TIME, SHOULD REMOVE THIS
    var request = [
      req.body.id,
      req.body.version,
      req.body.standard_level_id,
      req.body.company_name,
      req.body.device_name,
      req.body.brand,
      req.body.model,
      req.body.test_reference_id,
      req.body.created,
      req.body.file,
      req.params.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_reports` SET `id`=?, `version`=?, `standard_level_id`=?, `company_name`=?, `device_name`=?, `brand`=?, `model`=?, `test_reference_id`=?, `created`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Report has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteTestReport: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `test_reports` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Test Report has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteTestReportAll: function (req, res) {
    c.query("DELETE FROM `test_reports`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Test Report has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}