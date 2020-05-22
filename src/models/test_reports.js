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
    c.query("SELECT * FROM `test_reports`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          company_name: items[1],
          device_name: items[2],
          brand: items[3],
          model: items[4],
          test_reference_id: items[5],
          created: items[6],
          file: items[7]
        });
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
    c.query("SELECT * FROM `test_reports` WHERE `id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          company_name: items[1],
          device_name: items[2],
          brand: items[3],
          model: items[4],
          test_reference_id: items[5],
          created: items[6],
          file: items[7]
        });
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
    c.query("SELECT * FROM `test_reports` WHERE `id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          company_name: items[1],
          device_name: items[2],
          brand: items[3],
          model: items[4],
          test_reference_id: items[5],
          created: items[6],
          file: items[7]
        });
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
    c.query("SELECT * FROM `test_reports` WHERE `id` LIKE ? OR `id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          company_name: items[1],
          device_name: items[2],
          brand: items[3],
          model: items[4],
          test_reference_id: items[5],
          created: items[6],
          file: items[7]
        });
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
    c.query("SELECT * FROM `test_reports` WHERE `test_reference_id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          company_name: items[1],
          device_name: items[2],
          brand: items[3],
          model: items[4],
          test_reference_id: items[5],
          created: items[6],
          file: items[7]
        });
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
    var request = [req.id, req.company_name, req.device_name, req.brand, req.model, req.test_reference_id, req.created, req.file];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_reports`(`id`, `company_name`, `device_name`, `brand`, `model`, `test_reference_id`, `created`, `file`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
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
    var request = [req.body.company_name, req.body.device_name, req.body.brand, req.body.model, req.body.test_reference_id, req.body.created, req.body.file, req.params.id];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_reports` SET `company_name`=?, `device_name`=?, `brand`=?, `model`=?, `test_reference_id`=?, `created`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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