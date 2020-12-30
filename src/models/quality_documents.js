const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // QUALITY DOCUMENT MODELS

  getQualityDocumentAll: function (req, res) {
    c.query("SELECT * FROM `quality_documents` ORDER BY `document_id` ASC", null, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocument: function (req, res) {
    c.query("SELECT * FROM `quality_documents` WHERE `id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentActive: function (req, res) {
    const request = [req.id]
    c.query("SELECT * FROM `quality_documents` WHERE `active`=? ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentType: function (req, res) {
    const request = [req.status, "%" + req.id + "%"]
    c.query("SELECT * FROM `quality_documents` WHERE `active`=? AND `standard_level_id` LIKE ? ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentProcedureUser: function (req, res) {
    const request = ["%" + req.user + "%", req.status]
    c.query("SELECT DISTINCT p.`id`, p.`document_id`, p.`name`, p.`effective_date`, p.`pic`, p.`users`, p.`version`, p.`standard_level_id`, p.`active`, p.`file_pdf`, p.`file_doc`, p.`file_xls`, p.`file_pds` FROM `quality_documents` p INNER JOIN `quality_documents` f ON LEFT(p.`id`,6)=LEFT(f.`id`,6) AND f.`standard_level_id`='D22' AND p.`standard_level_id`='D21' AND (f.`users` LIKE ? OR f.`users`='*') AND p.`active`=? ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentFormUser: function (req, res) {
    const request = ["%" + req.id + "%", "%" + req.user + "%"]
    c.query("SELECT * FROM `quality_documents` WHERE `document_id` LIKE ? AND `users` LIKE ? AND `standard_level_id`='D22' AND active='1' ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentSearch: function (req, res) {
    const request = [req.status, "%" + req.id + "%"]
    c.query("SELECT * FROM `quality_documents` WHERE `active`=? AND `document_id` LIKE ? ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  getQualityDocumentSearchType: function (req, res) {
    const request = [req.status, "%" + req.id + "%", req.type]
    c.query("SELECT * FROM `quality_documents` WHERE `active`=? AND `document_id` LIKE ? AND `standard_level_id`=? ORDER BY `document_id` ASC", request, { metadata: true, useArray: true }, function (err, rows) {
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
          [col[10]]: items[10],
          [col[11]]: items[11],
          [col[12]]: items[12]
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
  newQualityDocument: function (req, res) {
    const id = req.document_id + req.version;
    var request = [
      id.replace(new RegExp("[^\\w]", 'g'), ""),
      req.document_id,
      req.name,
      req.effective_date,
      req.pic,
      req.users,
      req.version,
      req.standard_level_id,
      req.active,
      req.file_pdf,
      req.file_doc,
      req.file_xls,
      req.file_pds
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `quality_documents`(`id`, `document_id`, `name`, `effective_date`, `pic`, `users`, `version`, `standard_level_id`, `active`, `file_pdf`, `file_doc`, `file_xls`, `file_pds`) VALUES (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
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
  updateQualityDocument: function (req, res) {
    var request = [
      req.body.name,
      req.body.effective_date,
      req.body.pic,
      req.body.users,
      req.body.version,
      req.body.standard_level_id,
      req.body.active,
      req.body.file_pdf,
      req.body.file_doc,
      req.body.file_xls,
      req.body.file_pds,
      req.params.id
    ];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `quality_documents` SET `name`=?, `effective_date`=?, `pic`=?, `users`=?, `version`=?, `standard_level_id`=?, `active`=?, `file_pdf`=?, `file_doc`=?, `file_xls`=?, `file_pds`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  updateQualityDocumentObsolete: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `quality_documents` SET `active`='0' WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.send({ message: err.message });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Document has set as obsolete",
        success: true
      });
    });
    c.end();
  },
  deleteQualityDocument: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `quality_documents` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  deleteQualityDocumentAll: function (req, res) {
    c.query("DELETE FROM `quality_documents`", null, { metadata: true, useArray: true }, function (err, rows) {
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