import 'package:custom_nav_bar/nav_bar.dart';
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
      body: SafeArea(
        child:
        StickyHeadersTable(
          columnsLength:10,
          rowsLength: 20,
            initialScrollOffsetX: _scrollOffsetX,
            initialScrollOffsetY: _scrollOffsetY,
            onEndScrolling: (scrollOffsetX, scrollOffsetY) {
              _scrollOffsetX = scrollOffsetX;
              _scrollOffsetY = scrollOffsetY;
            },
          cellDimensions:CellDimensions.variableColumnWidthAndRowHeight(
              columnWidths: List.generate(10, (index) => 100),
              rowHeights: List.generate(20, (index) => 100),
              stickyLegendWidth: 100,
              stickyLegendHeight: 100),
          columnsTitleBuilder: (i) => Container(
            height: 100,
              width: 100,
              decoration: BoxDecoration(
                // color:rowIndex==vicinity.row &&columnIndex==vicinity.column && vicinity.column!=0 &&vicinity.row!=0? Colors.green.withOpacity(0.4):
                  color:rowIndex==i?Colors.green.withOpacity(0.5):Colors.transparent,
                  border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
                // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
              ),
              child: Center(child: Text("Data$i"))),
          rowsTitleBuilder: (i) =>Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                // color:rowIndex==vicinity.row &&columnIndex==vicinity.column && vicinity.column!=0 &&vicinity.row!=0? Colors.green.withOpacity(0.4):
                  color:columnIndex==i?Colors.green.withOpacity(0.5):Colors.transparent,
                  // border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
                // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
              ),
              child: Center(child: Text("Row$i"))),
          contentCellBuilder: (i, j) =>Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color:rowIndex==i &&columnIndex==j? Colors.green.withOpacity(0.4): Colors.transparent,
                  border: Border.all(width:0.2,color:Colors.black.withOpacity(0.3))
                // border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
              ),
              child: Center(child: Text("Cell$i,$j"))),
          onContentCellPressed:(i,j){
                setState(() {
                  rowIndex=i;
                  columnIndex=j;
                });
            }
        ),
      ),
      bottomNavigationBar: CustomNavCar(notchBottomAppBar: notchBottomAppBar,),
      floatingActionButton:
      Container(
        margin:EdgeInsets.only(top:notchBottomAppBar? 0:30),
        height: 54,
        width: 54,
        child: FloatingActionButton(onPressed: (){},
          backgroundColor: Colors.white,
          mini: true,
          elevation: 0,
          shape:RoundedRectangleBorder(
              borderRadius:const BorderRadius.all(Radius.circular(100)),
              side: BorderSide(width: 2,color: Colors.green.withOpacity(0.7))
          ),
          child:  Icon(Icons.add,color: Colors.green.withOpacity(0.7),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  // TableSpan _buildColumnSpan(int index){
  //   const TableSpanDecoration decoration = TableSpanDecoration(
  //     // border: TableSpanBorder(
  //     //   trailing: BorderSide(),
  //     // ),
  //   );
  //   return  TableSpan(
  //     foregroundDecoration: decoration,
  //     extent: const FractionalTableSpanExtent(0.25),
  //     onEnter: (_) => print('Entered column $index'),
  //     cursor: SystemMouseCursors.contextMenu,
  //     recognizerFactories: <Type, GestureRecognizerFactory>{
  //       TapGestureRecognizer:
  //       GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
  //             () => TapGestureRecognizer(),
  //             (TapGestureRecognizer t) =>
  //         t.onTap = () => print('Tap Column $index'),
  //       ),
  //     },
  //   );
  // }
  // TableSpan _buildRowSpan(int index){
  //   const TableSpanDecoration decoration = TableSpanDecoration(
  //     // color: index.isEven ? Colors.purple[100] : null,
  //     border: TableSpanBorder(
  //       // trailing: BorderSide(
  //       //   width: 1,
  //       // ),
  //     ),
  //   );
  //   return TableSpan(
  //     backgroundDecoration: decoration,
  //     extent: const FixedTableSpanExtent(90),
  //     recognizerFactories: <Type, GestureRecognizerFactory>{
  //       TapGestureRecognizer:
  //       GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
  //             () => TapGestureRecognizer(),
  //             (TapGestureRecognizer t) =>
  //         t.onTap = () => print('Tap row $index'),
  //       ),
  //     },
  //   );
  // }
  // TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
  //   if(vicinity.xIndex==0 && vicinity.yIndex==0)
  //     {
  //       return TableViewCell(child: Container(),
  //       );
  //     }
  //   return TableViewCell(
  //     child: Center(
  //       child: InkWell(
  //         onTap: (){
  //           print("Belachew Shewankiden ${vicinity.xIndex} ===> ${vicinity.yIndex}");
  //           setState(() {
  //             rowIndex=vicinity.xIndex;
  //             columnIndex=vicinity.yIndex;
  //           });
  //         },
  //         child:
  //         columnIndex!=0&& rowIndex!=0 &&rowIndex==vicinity.xIndex&& vicinity.yIndex==0?Container(
  //           height: 200,
  //           width:200,
  //           decoration: BoxDecoration(
  //               color:Colors.indigo,
  //               border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
  //             // border: Border.all(width: vicinity.xIndex==0?0.001:0.5)
  //           ),
  //           child: Center(child: Text('Tile c: ${vicinity.column}, r: ${vicinity.row}')),
  //         ):
  //         rowIndex!=0&&columnIndex!=0 &&columnIndex==vicinity.yIndex&& vicinity.xIndex==0?Container(
  //           height: 200,
  //           width:200,
  //           decoration: BoxDecoration(
  //               color:Colors.indigo,
  //               border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
  //             // border: Border.all(width: vicinity.xIndex==0?0.001:0.5)
  //           ),
  //           child: Center(child: Text('Tile c: ${vicinity.column}, r: ${vicinity.row}')),
  //         ):
  //         Container(
  //           height: 200,
  //           width:200,
  //           decoration: BoxDecoration(
  //             color:rowIndex==vicinity.xIndex &&columnIndex==vicinity.yIndex && vicinity.yIndex!=0 &&vicinity.xIndex!=0? Colors.green.withOpacity(0.4):
  //             Colors.transparent,
  //             border: Border.all(width:0.2,color:vicinity.xIndex==0?Colors.transparent: Colors.black.withOpacity(0.3))
  //             // border: Border.all(width: vicinity.xIndex==0?0.001:0.5)
  //           ),
  //             child: Center(child: Text('Tile c: ${vicinity.column}, r: ${vicinity.row}')),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
