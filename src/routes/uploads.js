var express = require('express')
var router = express.Router()
const path = require('path')
const fs = require('fs');
const { PDFNet } = require('@pdftron/pdfnet-node');

/////////////////////////////////////////////////////////////////////////////////////////////
// API Get Image

router.use('/', express.static(path.join(__dirname, '../uploads')))

router.post('/watermark/:filename', (req, res) => {
  const filename = req.params.filename;
  const watermark = `Downloaded by: ${req.body.name} / ${req.body.nik}`;
  let ext = path.parse(filename).ext;

  if (ext !== '.pdf') {
    res.statusCode = 500;
    res.end(`File is not a PDF. Please convert it first.`);
  }

  const inputPath = path.resolve(__dirname, '../uploads', filename);
  const outputPath = path.resolve(
    __dirname,
    '../uploads',
    `${filename}_watermarked.pdf`,
  );

  const main = async () => {
    const pdfdoc = await PDFNet.PDFDoc.createFromFilePath(inputPath);
    await pdfdoc.initSecurityHandler();

    const stamper = await PDFNet.Stamper.create(
      PDFNet.Stamper.SizeType.e_relative_scale,
      0.5,
      0.5,
    ); // Stamp size is relative to the size of the crop box of the destination page
    stamper.setAlignment(
      PDFNet.Stamper.HorizontalAlignment.e_horizontal_right,
      PDFNet.Stamper.VerticalAlignment.e_vertical_center,
    );
    const redColorPt = await PDFNet.ColorPt.init(1, 0, 0);
    stamper.setFontColor(redColorPt);
    const pgSet = await PDFNet.PageSet.createRange(
      1,
      await pdfdoc.getPageCount(),
    );
    stamper.setRotation(270);
    stamper.setPosition(30, 0, false)
    stamper.setSize(PDFNet.Stamper.SizeType.e_font_size, 14, 0)
    await stamper.stampText(pdfdoc, watermark, pgSet);

    await pdfdoc.save(outputPath, PDFNet.SDFDoc.SaveOptions.e_linearized);
  };

  PDFNet.runWithCleanup(main) // you can add the key to PDFNet.runWithCleanup(main, process.env.PDFTRONKEY)
    .then(() => {
      PDFNet.shutdown();
      fs.readFile(outputPath, (err, data) => {
        if (err) {
          res.statusCode = 500;
          res.end(err);
        } else {
          res.setHeader('Content-type', 'application/pdf');
          res.end(data);
        }
      });
    })
    .catch(error => {
      res.statusCode = 500;
      res.end(error);
    });
});

module.exports = router
