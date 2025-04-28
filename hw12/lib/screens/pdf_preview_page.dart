import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PDFPreviewPage extends StatefulWidget {
  final String pdfPath;

  const PDFPreviewPage({super.key, required this.pdfPath});

  @override
  State<PDFPreviewPage> createState() => _PDFPreviewPageState();
}

class _PDFPreviewPageState extends State<PDFPreviewPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    final bytes = await rootBundle.load(widget.pdfPath);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/temp.pdf');

    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview")),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
        filePath: localPath!,
      ),
    );
  }
}
