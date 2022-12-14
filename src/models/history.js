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
  // HISTORY MODELS

  getHistoryAll: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` ORDER BY h.`created` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistory: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryNotification: function (req, res) {
    const date = new Date().valueOf() - (req.id * 24 * 60 * 60 * 1000);
    const request = [new Date(date).toISOString()];
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`step_id` LIKE 'QUD%' AND h.`step_id` NOT LIKE '%4%' AND h.`created` > ? ORDER BY h.`created` DESC", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryReference: function (req, res) {
    const request = [req.id.toUpperCase()]
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`reference_id`=? AND h.`step_id` NOT LIKE '%4%' ORDER BY h.`created` DESC LIMIT 10", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryReferenceAdmin: function (req, res) {
    const request = ["%" + req.id.toUpperCase() + "%"]
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`reference_id` LIKE ? ORDER BY h.`created` DESC LIMIT 10", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryUser: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`user_id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryStep: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` LEFT OUTER JOIN `users` e ON h.`user_id`=e.`id` WHERE h.`step_id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryRequestStep: function (req, res) {
    c.query("SELECT s.`step_number`, s.`name` FROM `history` h LEFT OUTER JOIN `steps` s ON h.`step_id`=s.`id` WHERE h.`reference_id`=? ORDER BY h.`created` DESC LIMIT 1", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          step_number: items[0],
          name: items[1]
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
  newHistory: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      'H' + new Date(waktu).valueOf().toString(32).toUpperCase(),
      req.reference_id,
      req.user_id,
      req.step_id,
      req.message,
      waktu
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `history`(`id`, `reference_id`, `user_id`, `step_id`, `message`, `created`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Action has recorded successfully",
        success: true
      });
    });
    c.end();
  },
  updateHistory: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      req.reference_id,
      req.user_id,
      req.step_id,
      req.message,
      waktu,
      req.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `history` SET `reference_id`=?, `user_id`=?, `step_id`=?, `message`=?, `created`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "History has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteHistory: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `history` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "History has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteHistoryAll: function (req, res) {
    c.query("DELETE FROM `history`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All History has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}