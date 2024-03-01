import 'dart:math';

import 'package:custom_nav_bar/pdf/view_pdf_page.dart';
import 'package:custom_nav_bar/web_socket/flutter_socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_table/table_sticky_headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool notchBottomAppBar=true;
  late AnimationController _animationController;
  ScrollControllers? scrollController =ScrollControllers();
  int rowIndex=0;
  int columnIndex=0;
  double _scrollOffsetX = 0.0;
  double _scrollOffsetY = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    _animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3))..forward();
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.7),
        title: Text("data"),
      ),
      body: SafeArea(
        child:
        Stack(
          children: [
            // StickyHeadersTable(
            //     columnsLength:10,
            //     rowsLength: 20,
            //     initialScrollOffsetX: _scrollOffsetX,
            //     initialScrollOffsetY: _scrollOffsetY,
            //     onEndScrolling: (scrollOffsetX, scrollOffsetY) {
            //       _scrollOffsetX = scrollOffsetX;
            //       _scrollOffsetY = scrollOffsetY;
            //     },
            //     cellDimensions:CellDimensions.variableColumnWidthAndRowHeight(
            //         columnWidths: List.generate(10, (index) => 100),
            //         rowHeights: List.generate(20, (index) => 100),
            //         stickyLegendWidth: 100,
            //         stickyLegendHeight: 100),
            //     columnsTitleBuilder: (i) => Container(
            //         height: 100,
            //         width: 100,
            //         decoration: BoxDecoration(
            //           // color:rowIndex==vicinity.row &&columnIndex==vicinity.column && vicinity.column!=0 &&vicinity.row!=0? Colors.green.withOpacity(0.4):
            //             color:rowIndex==i?Colors.green.withOpacity(0.5):Colors.transparent,
            //             border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
            //           // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
            //         ),
            //         child: Center(child: Text("Data$i"))),
            //     rowsTitleBuilder: (i) =>Container(
            //         height: 100,
            //         width: 100,
            //         decoration: BoxDecoration(
            //           // color:rowIndex==vicinity.row &&columnIndex==vicinity.column && vicinity.column!=0 &&vicinity.row!=0? Colors.green.withOpacity(0.4):
            //           color:columnIndex==i?Colors.green.withOpacity(0.5):Colors.transparent,
            //           // border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
            //           // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
            //         ),
            //         child: Center(child: Text("Row$i"))),
            //     contentCellBuilder: (i, j) =>Container(
            //         height: 100,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             color:rowIndex==i &&columnIndex==j? Colors.green.withOpacity(0.4): Colors.transparent,
            //             border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
            //           // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
            //         ),
            //         child: Center(child: Text("Cell$i,$j"))),
            //     onContentCellPressed:(i,j){
            //       setState(() {
            //         rowIndex=i;
            //         columnIndex=j;
            //       });
            //     }
            // ),
            // Positioned(
            //   bottom: MediaQuery.of(context).size.height/7,
            //   left: MediaQuery.of(context).size.width/2,
            //   child: Container(
            //     margin:EdgeInsets.only(top:notchBottomAppBar? 0:30),
            //     height: 54,
            //     width: 54,
            //     child: FloatingActionButton(onPressed: (){},
            //       backgroundColor: Colors.white,
            //       mini: true,
            //       elevation: 0,
            //       shape:RoundedRectangleBorder(
            //           borderRadius:const BorderRadius.all(Radius.circular(100)),
            //           side: BorderSide(width: 2,color: Colors.green.withOpacity(0.7))
            //       ),
            //       child:  Icon(Icons.add,color: Colors.green.withOpacity(0.7),),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: MediaQuery.of(context).size.height/14,
            //   left: MediaQuery.of(context).size.width/2-60,
            //   child: Container(
            //     margin:EdgeInsets.only(top:notchBottomAppBar? 0:30),
            //     height: 54,
            //     width: 54,
            //     child: FloatingActionButton(onPressed: (){},
            //       backgroundColor: Colors.white,
            //       mini: true,
            //       elevation: 0,
            //       shape:RoundedRectangleBorder(
            //           borderRadius:const BorderRadius.all(Radius.circular(100)),
            //           side: BorderSide(width: 2,color: Colors.green.withOpacity(0.7))
            //       ),
            //       child:  Icon(Icons.add,color: Colors.green.withOpacity(0.7),),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: MediaQuery.of(context).size.height/14,
              right: MediaQuery.of(context).size.width/2-120,
              child: Container(
                margin:EdgeInsets.only(top:notchBottomAppBar? 0:30),
                height: 54,
                width: 54,
                child: FloatingActionButton(onPressed: (){

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const WebSocketPage()),
                  // );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewPdfPage()),
                  );
                },
                  backgroundColor: Colors.white,
                  mini: true,
                  elevation: 0,
                  shape:RoundedRectangleBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(100)),
                      side: BorderSide(width: 2,color: Colors.green.withOpacity(0.7))
                  ),
                  child:  Icon(Icons.notifications,color: Colors.green.withOpacity(0.7),),
                ),
              ),
            ),
            // Positioned(
            //   bottom: MediaQuery.of(context).size.height/14,
            //   left: MediaQuery.of(context).size.width/1.9,
            //   child: Container(
            //     height: 50,
            //     width:50,
            //     color: Colors.transparent,
            //     child:
            //     CustomPaint(
            //       // size: Size(100, 100), // Set the size to fit your design
            //       painter: CirclePainter(),
            //       child: Container(),
            //     )
            //   ),
            // ),
          ]
        ),
      ),
      // bottomNavigationBar: CustomNavCar(notchBottomAppBar: notchBottomAppBar,),
      // floatingActionButton:
      // Container(
      //   margin:EdgeInsets.only(top:notchBottomAppBar? 0:30),
      //   height: 54,
      //   width: 54,
      //   child: FloatingActionButton(onPressed: (){},
      //     backgroundColor: Colors.white,
      //     mini: true,
      //     elevation: 0,
      //     shape:RoundedRectangleBorder(
      //         borderRadius:const BorderRadius.all(Radius.circular(100)),
      //         side: BorderSide(width: 2,color: Colors.green.withOpacity(0.7))
      //     ),
      //     child:  Icon(Icons.add,color: Colors.green.withOpacity(0.7),),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final startAngle = 0.0;
    final sweepAngle = pi * 1.5; // 270 degrees in radians

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);

    final gapPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.0;

    final gapSweepAngle = pi / 2; // 90 degrees in radians
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), sweepAngle, gapSweepAngle, false, gapPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
