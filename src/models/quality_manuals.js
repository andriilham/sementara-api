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
    c.query("SELECT * FROM `quality_manuals` ORDER BY `id`", null, { metadata: true, useArray: true }, function (err, rows) {
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
  getQualityManual: function (req, res) {
    c.query("SELECT * FROM `quality_manuals` WHERE `id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
  getQualityManualActive: function (req, res) {
    const request = [req.id]
    c.query("SELECT * FROM `quality_manuals` WHERE `active`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  getQualityManualType: function (req, res) {
    const request = [req.status, "%" + req.id.toUpperCase() + "%"]
    c.query("SELECT * FROM `quality_manuals` WHERE `active`=? AND `id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  getQualityManualPIC: function (req, res) {
    const request = ["%" + req.id + "%", "%" + req.id + "%", req.status]
    c.query("SELECT DISTINCT p.`id`, p.`name`, p.`effective_date`, p.`pic`, p.`version`, p.`standard_level_id`, p.`active`, p.`file`, p.`file_doc` FROM `quality_manuals` p INNER JOIN `forms` f ON (f.`pic` LIKE ? OR f.`pic`='*') AND LEFT(p.`id`,6)=LEFT(f.`id`,6) OR p.`pic` LIKE ? AND p.`id` LIKE '%/P%' AND `active`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  newQualityManual: function (req, res) {
    var request = [
      req.id,
      req.name,
      req.effective_date,
      req.pic,
      req.version,
      req.standard_level_id,
      req.active,
      req.file,
      req.file_doc
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `quality_manuals`(`id`, `name`, `effective_date`, `pic`, `version`, `standard_level_id`, `active`, `file`, `file_doc`) VALUES (? ,?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
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
    var request = [
      req.body.name,
      req.body.effective_date,
      req.body.pic,
      req.body.version,
      req.body.standard_level_id,
      req.body.active,
      req.body.file,
      req.body.file_doc,
      req.params.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `quality_manuals` SET `name`=?, `effective_date`=?, `pic`=?, `version`=?, `standard_level_id`=?, `active`=?, `file`=?, `file_doc`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
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
        res.send({ message: err.message });
        console.log(err);
        return
      }

      if (rows.info.affectedRows < 1) {
        res.send({ message: 'Data not found.' });
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
        res.send({ message: err.message });
        console.log(err);
        return
      }
      console.log(rows.info)
      if (rows.info.affectedRows < 1) {
        res.send({ message: 'Data not found.' });
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