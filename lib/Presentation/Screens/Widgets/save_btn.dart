import 'package:flutter/material.dart';
import 'printable_data.dart';
import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SaveBtnBuilder extends StatelessWidget {
  const SaveBtnBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.indigo,
        primary: Colors.indigo,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () => printDoc(),
      child: const Text(
        "Save as PDF",
        style: TextStyle(color: Colors.white, fontSize: 20.00),
      ),
    );
  }

  Future<void> printDoc() async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return myprintAbledata();
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  myprintAbledata() {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(25.00),
      child: pw.Column(children: [
        pw.Text(
          "Mahmudul hasan Store",
          style: pw.TextStyle(
            fontSize: 25.00,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 10.00),
        pw.Divider(),
        pw.Column(children: [
          pw.Container(
            width: double.infinity,
            child: pw.Column(children: [
              pw.Text(
                "Name of Store",
              ),
              pw.Padding(
                padding: pw.EdgeInsets.all(10),
                child: pw.Row(children: [
                  pw.Text(
                    "Phone No",
                  ),
                  pw.Spacer(),
                  pw.Text(
                    "01983837474",
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}
