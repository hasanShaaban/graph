
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class CVPDF extends StatefulWidget {
  const CVPDF({super.key});
  static const name = 'CVPDF';
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
    document = await PDFDocument.fromAsset('assets/temp/13769.pdf');
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
