import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> generatePdf(BuildContext context, String name, String email, String phone, String experience, String education) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Name: $name', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.Text('Email: $email', style: pw.TextStyle(fontSize: 16)),
          pw.Text('Phone: $phone', style: pw.TextStyle(fontSize: 16)),
          pw.SizedBox(height: 16),
          pw.Text('Experience:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.Text(experience, style: pw.TextStyle(fontSize: 16)),
          pw.SizedBox(height: 16),
          pw.Text('Education:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.Text(education, style: pw.TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );

  if (await Permission.storage.request().isGranted) {
    final output = await getExternalStorageDirectory();
    final file = File("${output?.path}/resume.pdf");
    await file.writeAsBytes(await pdf.save());

    // Provide a download link or button
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('PDF Generated'),
        content: Text('The PDF has been saved to ${file.path}.'),
        actions: [
          TextButton(
            child: Text('Open'),
            onPressed: () async {
              final pdfUrl = Uri.file(file.path);
              if (await canLaunch(pdfUrl.toString())) {
                await launch(pdfUrl.toString());
              } else {
                throw 'Could not launch $pdfUrl';
              }
            },
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  } else {
    throw 'Storage permission not granted';
  }
}
