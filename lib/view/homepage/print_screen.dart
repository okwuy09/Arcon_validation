import 'dart:typed_data';
import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/controller/user_controller.dart';
import 'package:arcon_app/view/homepage/validation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:pdf/pdf.dart';
// ignore: depend_on_referenced_packages
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class PrintScreen extends StatelessWidget {
  const PrintScreen(this.name, this.status, {Key? key}) : super(key: key);
  final String name;
  final String status;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var provider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 36,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.white, width: 2),
              ),
              child: Center(
                child: Text(
                  'Back',
                  style: style.copyWith(color: AppColor.white),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Text(
            'Viicsoft Solution',
            style: style.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.white,
              fontSize: 20,
            ),
          ),
          Expanded(child: Container()),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
      body: PdfPreview(
        allowSharing: false,
        canChangeOrientation: false,
        maxPageWidth: size.width < 800 ? size.width : size.width / 2.2,
        canChangePageFormat: false,
        canDebug: false,
        scrollViewDecoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.8),
        ),
        onPrinted: (context) => {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (_) => const ValidationScreen(),
            ),
          ),
          provider.updateValidatedUser(context: context),
        },
        build: (format) => _generatePdf(format, name, status, context),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, String name, String status, context) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    final font =
        await PdfGoogleFonts.abhayaLibreSemiBold(); //nunitoExtraLight();
    final image = await imageFromAssetBundle('assets/logo2.png');
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (context) {
          return pw.Column(
            children: [
              pw.Image(
                image,
                width: 80,
                height: 35,
              ),
              pw.SizedBox(height: 5),
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  fit: pw.BoxFit.cover,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisSize: pw.MainAxisSize.min,
                      children: [
                        pw.Text(
                          name,
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 18,
                          ),
                        ),
                        pw.SizedBox(height: 2),
                        pw.Text(
                          status,
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 18,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                      ]),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
