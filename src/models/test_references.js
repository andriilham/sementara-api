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
          [col[9]]: items[9]
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
  getTestReference: function (req, res) {
    c.query("SELECT * FROM `test_references` WHERE `id`=? ORDER BY `id`", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          [col[9]]: items[9]
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
  getTestReferenceType: function (req, res) {
    const request = [req.id.toUpperCase()]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id`=? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[9]]: items[9]
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
  getTestReferenceSearch: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", req.status]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id` LIKE ? AND `active`=? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[9]]: items[9]
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
  getTestReferenceSearch2: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", "%" + req.id2.toUpperCase() + "%", req.status]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id` LIKE ? OR `standard_level_id` LIKE ? AND `active`=? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[9]]: items[9]
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
  getTestReferenceSearchStatus: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%", req.status]
    c.query("SELECT * FROM `test_references` WHERE `standard_level_id` LIKE ? AND `active`=? ORDER BY `id`", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[9]]: items[9]
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
  newTestReference: function (req, res) {
    var request = [
      req.id,
      req.document_id,
      req.name,
      req.year,
      req.version,
      req.standard_level_id,
      req.active,
      req.file,
      req.file_doc,
      req.file_wm
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_references`(`id`, `document_id`, `name`, `year`, `version`, `standard_level_id`, `active`, `file`, `file_doc`, `file_wm`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
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
    var request = [
      req.body.name,
      req.body.year,
      req.body.version,
      req.body.standard_level_id,
      req.body.active,
      req.body.file,
      req.body.file_doc,
      req.body.file_wm,
      req.params.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_references` SET `name`=?, `year`=?, `version`=?, `standard_level_id`=?, `active`=?, `file`=?, `file_doc`=?, `file_wm`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  updateTestReferenceObsolete: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_references` SET `active`='0' WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Reference has set as obsolete",
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