import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_bike_fit_pdf_gen_v01/models/setup_bike.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GeneratedPDF {
  final List<SetupBike>? setupBike;

  GeneratedPDF({this.setupBike});

  generatedPDFSetupBike({dynamic param1, dynamic param2}) async {
    final pw.Document doc = pw.Document();
    final fundoPdf = await imageAsset('assets/logo.png');
    final image1 = await imageAsset('assets/bikes_images/1.png');
    final image2 = await imageAsset('assets/bikes_images/2.png');
    final image3 = await imageAsset('assets/bikes_images/3.png');
    final image4 = await imageAsset('assets/bikes_images/4.png');
    final image5 = await imageAsset('assets/bikes_images/5.png');
    final image6 = await imageAsset('assets/bikes_images/6.png');
    final image7 = await imageAsset('assets/bikes_images/7.png');
    doc.addPage(
      pw.MultiPage(
        //pageFormat: PdfPageFormat.a4,
        pageTheme: const pw.PageTheme(
          margin: pw.EdgeInsets.zero,
        ),
        build: (pw.Context context) {
          return [
            pw.Container(
              width: 600,
              height: 841,
              color: PdfColors.white,
              child: pw.Stack(
                children: [
                  pw.Container(
                    //color: PdfColors.amber100,
                    height: 100,
                    width: 600,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(right: 20),
                          child: pw.SizedBox(
                            height: 200,
                            width: 200,
                            child: pw.Image(
                              width: 130,
                              height: 70,
                              fit: pw.BoxFit.cover,
                              pw.MemoryImage(
                                fundoPdf,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Image(
                              width: 130,
                              height: 70,
                              fit: pw.BoxFit.cover,
                              pw.MemoryImage(
                                image4,
                              ),
                            ),
                ],
              ),
            )
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      name: "BikeFit Setup",
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }

  Future<Uint8List> imageAsset(String imageAsset) async {
    final ByteData bytes = await rootBundle.load(imageAsset);
    final Uint8List byteList = bytes.buffer.asUint8List();
    return byteList;
  }
}
