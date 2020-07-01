const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // REQUEST MODELS

  getRequestAll: function (req, res) {
    c.query("SELECT r.`id`, u1.`name`, r.`requester_id`, r.`table_id`, r.`document_id`, r.`type`, u2.`name`, r.`approval1_id`, r.`approval1_status`, u3.`name`, r.`approval2_id`, r.`approval2_status`, r.`query` FROM `requests` r LEFT OUTER JOIN `users` u1 ON r.`requester_id`=u1.`id` LEFT OUTER JOIN `roles` u2 ON r.`approval1_id`=u2.`id` LEFT OUTER JOIN `roles` u3 ON r.`approval2_id`=u3.`id`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          requester: items[1],
          requester_id: items[2],
          table_id: items[3],
          document_id: items[4],
          type: items[5],
          approval1: items[6],
          approval1_id: items[7],
          approval1_status: items[8],
          approval2: items[9],
          approval2_id: items[10],
          approval2_status: items[11],
          query: items[12]
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
  getRequest: function (req, res) {
    c.query("SELECT * FROM `requests` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          requester: items[1],
          table_id: items[2],
          document_id: items[3],
          type: items[4],
          approval1: items[5],
          approval1_status: items[6],
          approval2: items[7],
          approval2_status: items[8],
          query: items[9]
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
  getRequestNotification: function (req, res) {
    var request = [
      req.role,
      req.role,
      req.id,
    ];
    var data = {
      total: '',
      add: '',
      edit: '',
      delete: '',
      myRequests: ''
    }
    c.query("SELECT * FROM `requests` WHERE (`approval1_id`=? AND `approval1_status`='0') OR (`approval2_id`=? AND `approval2_status`='0' AND `approval1_status`='1')", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }
      data.total = rows.info.numRows;

      c.query("SELECT * FROM `requests` WHERE ((`approval1_id`=? AND `approval1_status`='0') OR (`approval2_id`=? AND `approval2_status`='0' AND `approval1_status`='1')) AND `type`='1'", request, { metadata: true, useArray: true }, function (err, rows) {
        if (err) {
          res.send({ message: err.message });
          console.log(err);
          return
        }
        data.add = rows.info.numRows;
      });

      c.query("SELECT * FROM `requests` WHERE ((`approval1_id`=? AND `approval1_status`='0') OR (`approval2_id`=? AND `approval2_status`='0' AND `approval1_status`='1')) AND `type`='2'", request, { metadata: true, useArray: true }, function (err, rows) {
        if (err) {
          res.send({ message: err.message });
          console.log(err);
          return
        }
        data.edit = rows.info.numRows;
      });

      c.query("SELECT * FROM `requests` WHERE ((`approval1_id`=? AND `approval1_status`='0') OR (`approval2_id`=? AND `approval2_status`='0' AND `approval1_status`='1')) AND `requester_id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
        if (err) {
          res.send({ message: err.message });
          console.log(err);
          return
        }
        data.myRequests = rows.info.numRows;
      });

      c.query("SELECT * FROM `requests` WHERE ((`approval1_id`=? AND `approval1_status`='0') OR (`approval2_id`=? AND `approval2_status`='0' AND `approval1_status`='1')) AND `type`='3'", request, { metadata: true, useArray: true }, function (err, rows) {
        if (err) {
          res.send({ message: err.message });
          console.log(err);
          return
        }
        data.delete = rows.info.numRows;
        if (data.length < 1) {
          res.status(404).send({ message: 'Data not found.' });
        } else {
          res.json(data);
        }
      });

    });
    c.end();
  },
  getRequestbyRole: function (req, res) {
    var request = [
      req.role,
      req.role,
      req.id,
    ];
    c.query("SELECT r.`id`, u1.`name`, r.`requester_id`, r.`table_id`, r.`document_id`, r.`type`, u2.`name`, r.`approval1_id`, r.`approval1_status`, u3.`name`, r.`approval2_id`, r.`approval2_status`, r.`query` FROM `requests` r LEFT OUTER JOIN `users` u1 ON r.`requester_id`=u1.`id` LEFT OUTER JOIN `roles` u2 ON r.`approval1_id`=u2.`id` LEFT OUTER JOIN `roles` u3 ON r.`approval2_id`=u3.`id` WHERE r.`approval1_id`=? OR (r.`approval2_id`=? AND r.`approval1_status`='1') OR r.`requester_id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          requester: items[1],
          requester_id: items[2],
          table_id: items[3],
          document_id: items[4],
          type: items[5],
          approval1: items[6],
          approval1_id: items[7],
          approval1_status: items[8],
          approval2: items[9],
          approval2_id: items[10],
          approval2_status: items[11],
          query: items[12]
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
  newRequest: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      req.req_id,
      req.requester_id,
      req.table_id,
      req.document_id,
      req.type,
      req.approval1_id,
      req.approval1_status,
      req.approval2_id,
      req.approval2_status,
      req.query
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `requests` (`id`, `requester_id`, `table_id`, `document_id`, `type`, `approval1_id`, `approval1_status`, `approval2_id`, `approval2_status`, `query`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Your request has registered successfully. Please wait for document controller and Lab Manager approval",
        success: true
      });
    });
    c.end();
  },
  updateRequest: function (req, res) {
    var request = [
      req.body.requester_id,
      req.body.table_id,
      req.body.document_id,
      req.body.type,
      req.body.approval1_id,
      req.body.approval1_status,
      req.body.approval2_id,
      req.body.approval2_status,
      req.body.query,
      req.params.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `requests` SET `requester_id`=?, `table_id`=?, `document_id`=?, `type`=?, `approval1_id`=?, `approval1_status`=?, `approval2_id`=?, `approval2_status`=?, `query`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Request has updated successfully",
        success: true
      });
    });
    c.end();
  },
  updateRequestApproval1: function (req, res) {
    var request = [
      req.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `requests` SET `approval1_status`='1' WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Request has been approved",
        success: true
      });
    });
    c.end();
  },
  updateRequestApproval2: function (req, res) {
    var request = [
      req.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `requests` SET `approval2_status`='1' WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Request has been approved",
        success: true
      });
    });
    c.end();
  },
  deleteRequest: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `requests` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Request has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteRequestAll: function (req, res) {
    c.query("DELETE FROM `requests`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Request has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}