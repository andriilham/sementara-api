var express = require('express')
var router = express.Router()
const path = require('path')
const { degrees, PDFDocument, rgb, StandardFonts } = require('pdf-lib');
const fs = require('fs');
const moment = require('moment')

/////////////////////////////////////////////////////////////////////////////////////////////
// API Get Image

router.use('/', express.static(path.join(__dirname, '../uploads')))

router.post('/watermark/:filename', async (req, res) => {
  const filename = req.params.filename;
  const status = req.body.status === '1' ? 'ACTIVE' : 'OBSOLETE';
  const watermark = `SIDOMO DCS --- Diunduh oleh: ${req.body.name} (${req.body.nik}) pada ${moment().format('DD/MM/YYYY, HH:mm:ss Z')} --- Status dokumen ${status} pada saat diunduh`;
  let ext = path.parse(filename).ext;

  if (ext !== '.pdf') {
    res.statusCode = 500;
    res.end(`File is not a PDF. Please convert it first.`);
  }

  // This should be a Uint8Array or ArrayBuffer
  // This data can be obtained in a number of different ways
  // If your running in a Node environment, you could use fs.readFile()
  // In the browser, you could make a fetch() call and use res.arrayBuffer()
  const existingPdfBytes = fs.readFileSync(path.resolve(__dirname, '../uploads', filename));

  const outputPath = path.resolve(
    __dirname,
    '../uploads',
    `${filename.slice(0, -4)}_watermarked.pdf`,
  );

  // Load a PDFDocument from the existing PDF bytes
  const pdfDoc = await PDFDocument.load(existingPdfBytes)

  // Embed the Helvetica font
  const helveticaFont = await pdfDoc.embedFont(StandardFonts.Helvetica)

  // Get the first page of the document
  const pages = pdfDoc.getPages()
  const firstPage = pages[0]

  // Get the width and height of the first page
  const { width, height } = firstPage.getSize()

  // Draw watermark across the ALL pages
  pages.forEach(function (page) {
    page.drawText(watermark, {
      x: width - 10,
      y: (height - (watermark.length * 5.6)) / 2,
      size: 11,
      font: helveticaFont,
      color: rgb(0.95, 0.1, 0.1),
      rotate: degrees(90),
    })
  });

  // Serialize the PDFDocument to bytes (a Uint8Array)
  const pdfBytes = await pdfDoc.save()

  try {
    fs.writeFileSync(outputPath, pdfBytes);
    console.log("File written successfully");
  } catch (err) {
    console.error(err);
  }
  fs.readFile(outputPath, (err, data) => {
    if (err) {
      res.statusCode = 500;
      res.send(err);
    } else {
      res.setHeader('Content-type', 'application/pdf');
      res.send(data);
    }
  });
});

module.exports = router
