const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // TEST REFERENCE MODELS

  getTestReferenceAll: function (req, res) {
    c.query("SELECT * FROM `test_references` ORDER BY `id`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          year: items[2],
          version: items[3],
          standard_level_id: items[4],
          file: items[5]
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
  getTestReference: function (req, res) {
    c.query("SELECT * FROM `test_references` WHERE `id`=? ORDER BY `id`", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          year: items[2],
          version: items[3],
          standard_level_id: items[4],
          file: items[5]
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
  getTestReferenceType: function (req, res) {
    const request = [req.id.toUpperCase()]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id`=? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          year: items[2],
          version: items[3],
          standard_level_id: items[4],
          file: items[5]
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
  getTestReferenceSearch: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%"]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id` LIKE ? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          year: items[2],
          version: items[3],
          standard_level_id: items[4],
          file: items[5]
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
  getTestReferenceSearch2: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", "%" + req.id2.toUpperCase() + "%"]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id` LIKE ? OR `standard_level_id` LIKE ? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          year: items[2],
          version: items[3],
          standard_level_id: items[4],
          file: items[5]
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
  newTestReference: function (req, res) {
    var request = [req.id, req.name, req.year, req.version, req.standard_level_id, req.file];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_references`(`id`, `name`, `year`, `version`, `standard_level_id`, `file`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Reference has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateTestReference: function (req, res) {
    var request = [req.body.name, req.body.year, req.body.version, req.body.standard_level_id, req.body.file, req.params.id];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_references` SET `name`=?, `year`=?, `version`=?, `standard_level_id`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Reference has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteTestReference: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `test_references` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Test Reference has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteTestReferenceAll: function (req, res) {
    c.query("DELETE FROM `test_references`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Test Reference has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}