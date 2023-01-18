import 'package:flutter/material.dart';

import '../../Components/spacer.dart';

import '../Widgets/save_btn.dart';
import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String shopName = "Shopon Store & Gallery";
String phoneNo = "01701987948";
String address = "Radhanagor Bazar , Screepur Magura";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25.00),
            child: Column(
              children: [
                Text("Making PDF Flutter",
                    style: TextStyle(
                        fontSize: 25.00, fontWeight: FontWeight.bold)),
                HeightSpacer(myHeight: 10.00),
                Divider(),

                Text("mahmudul hasan"),
                // InvoiceBuilder(),
                HeightSpacer(myHeight: 15.00),
                Text(
                  "Trying to make PDF from Flutter Web App",
                  style: TextStyle(color: Colors.grey, fontSize: 15.00),
                ),

                HeightSpacer(myHeight: 15.00),
                SaveBtnBuilder(),
                HeightSpacer(myHeight: 5.00),
                InkWell(
                  onTap: () {
                    printmyData();
                  },
                  child: Text(
                    "Print Data",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> printmyData() async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return myprintNow();
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  myprintNow() {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(25.00),
      child: pw.Column(children: [
        pw.Text(
          "Mahmudul Store",
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
