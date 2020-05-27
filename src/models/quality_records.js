const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // QUALITY RECORD MODELS

  getQualityRecordAll: function (req, res) {
    c.query("SELECT * FROM `quality_records` ORDER BY `created` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          form_id: items[1],
          pic: items[2],
          name: items[3],
          created: items[4],
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
  getQualityRecord: function (req, res) {
    c.query("SELECT * FROM `quality_records` WHERE `id`=? ORDER BY `created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          form_id: items[1],
          pic: items[2],
          name: items[3],
          created: items[4],
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
  getQualityRecordForm: function (req, res) {
    const request = [req.id.toUpperCase()]
    c.query("SELECT * FROM `quality_records` WHERE `form_id`=? ORDER BY `created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          form_id: items[1],
          pic: items[2],
          name: items[3],
          created: items[4],
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
  getQualityRecordFormPIC: function (req, res) {
    const request = [req.id.toUpperCase(), req.id2]
    c.query("SELECT * FROM `quality_records` WHERE `form_id`=? AND `pic`=? ORDER BY `created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          form_id: items[1],
          pic: items[2],
          name: items[3],
          created: items[4],
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
  getQualityRecordPIC: function (req, res) {
    const request = [
      "%" + req.id + "%",
      "%" + req.id + "%"
    ]
    c.query("SELECT DISTINCT p.`id`, p.`form_id`, p.`pic`, p.`name`, p.`created`, p.`file` FROM `quality_records` p INNER JOIN `forms` f ON (f.`name` LIKE ? OR f.`name`='*') AND LEFT(p.`id`,6)=LEFT(f.`id`,6) OR p.`name` LIKE ? AND p.`id` LIKE '%/P%' ORDER BY p.`created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          form_id: items[1],
          pic: items[2],
          name: items[3],
          created: items[4],
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
  newQualityRecord: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      'R' + new Date(waktu).valueOf().toString(32).toUpperCase(),
      req.form_id,
      req.pic,
      req.name,
      req.created,
      req.file
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `quality_records`(`id`, `form_id`, `pic`, `name`, `created`, `file`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Quality Record has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateQualityRecord: function (req, res) {
    var request = [
      req.body.form_id,
      req.body.pic,
      req.body.name,
      req.body.created,
      req.body.file,
      req.params.id
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `quality_records` SET `form_id`=?, `pic`=?, `name`=?, `created`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Quality Record has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteQualityRecord: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `quality_records` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Quality Record has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteQualityRecordAll: function (req, res) {
    c.query("DELETE FROM `quality_records`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Quality Record has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}