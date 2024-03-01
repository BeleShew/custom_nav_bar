import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ViewPdfPage extends StatefulWidget {
  const ViewPdfPage({super.key});

  @override
  State<ViewPdfPage> createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  bool _isLoading=true;
  late PDFDocument doc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() async{
    doc = await PDFDocument.fromURL('https://etmobileappimages.blob.core.windows.net/other/Ethiopian%20Cutoms%20Regulations.pdf');
    setState((){
      _isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:  Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFViewer(document: doc,
            showPicker:false,
            showIndicator: true,
            showNavigation: false,
            zoomSteps: 1,
            maxScale: 300,
            backgroundColor: Colors.white,
            scrollDirection:Axis.vertical,
          lazyLoad: false,
          )),
    );
  }
}
