const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // QUALITY MANUAL MODELS

  getQualityManualAll: function (req, res) {
    c.query("SELECT * FROM `quality_manuals`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          effective_date: items[2],
          pic: items[3],
          version: items[4],
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
  getQualityManual: function (req, res) {
    c.query("SELECT * FROM `quality_manuals` WHERE `id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          effective_date: items[2],
          pic: items[3],
          version: items[4],
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
  getQualityManualType: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%"]
    c.query("SELECT * FROM `quality_manuals` WHERE `id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          effective_date: items[2],
          pic: items[3],
          version: items[4],
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
  getQualityManualPIC: function (req, res) {
    const request = ["%" + req.id + "%"]
    c.query("SELECT * FROM `quality_manuals` WHERE `pic` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          effective_date: items[2],
          pic: items[3],
          version: items[4],
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
  newQualityManual: function (req, res) {
    var request = [req.id, req.name, req.effective_date, req.pic, req.version, req.file];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `quality_manuals`(`id`, `name`, `effective_date`, `pic`, `version`, `file`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Document has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateQualityManual: function (req, res) {
    var request = [req.body.name, req.body.effective_date, req.body.pic, req.body.version, req.body.file, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `quality_manuals` SET `name`=?, `effective_date`=?, `pic`=?, `version`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Document has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteQualityManual: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `quality_manuals` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          err: null,
          message: "Document has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteQualityManualAll: function (req, res) {
    c.query("DELETE FROM `quality_manuals`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }
      console.log(rows.info)
      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          message: "All Document has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}