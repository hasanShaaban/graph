
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class CVPDF extends StatefulWidget {
  const CVPDF({super.key, required this.cv});
  static const name = 'CVPDF';
  final String cv;
  @override
  State<CVPDF> createState() => _CVPDFState();
}

class _CVPDFState extends State<CVPDF> {
  bool _isLoading = true;
  late PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL('http://127.0.0.1:8000${widget.cv}');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _isLoading
                ? CircularProgressIndicator()
                : PDFViewer(
                  document: document,
                  lazyLoad: false,
                  zoomSteps: 1,
                  numberPickerConfirmWidget: const Text("Confirm"),
                ),
      ),
    );
  }
}
