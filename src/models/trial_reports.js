const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // TRIAL REPORT MODELS

  getTrialReportAll: function (req, res) {
    c.query("SELECT * FROM `trial_reports` ORDER BY `trial_date` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[5]]: items[5]
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
  getTrialReport: function (req, res) {
    c.query("SELECT * FROM `trial_reports` WHERE `id`=? ORDER BY `trial_date` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          [col[5]]: items[5]
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
  newTrialReport: function (req, res) {
    var request = [
      req.id,
      req.name,
      req.trial_date,
      req.num_device,
      req.num_pass,
      req.file
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `trial_reports`(`id`, `name`, `trial_date`, `num_device`, `num_pass`, `file`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Trial Report has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateTrialReport: function (req, res) {
    var request = [req.body.name, req.body.trial_date, req.body.num_device, req.body.num_pass, req.body.file, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `trial_reports` SET `name`=?, `trial_date`=?, `num_device`=?, `num_pass`=?, `file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Trial Report has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteTrialReport: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `trial_reports` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Trial Report has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteTrialReportAll: function (req, res) {
    c.query("DELETE FROM `trial_reports`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Trial Report has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}