import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import 'binance_model.dart';
class WebSocketPage extends StatefulWidget {
  const WebSocketPage({super.key});

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  // final  webSocketUrl = IOWebSocketChannel.connect(Uri.parse('wss://gotify.chegebeya.kifiya.et/stream:80',), headers: {
  //     'token': 'Avu8S9uGyRcA2Oa'
  //   });
  // final  webSocketUrl = IOWebSocketChannel.connect(Uri.parse('wss://fstream.binance.com/ws/bnbusdt@aggTrade'));
  String tempText="0";
  String title="Binance";
  List<BinanceResponse> binanceList=[];
  StreamController<List<BinanceResponse>> streamController = StreamController<List<BinanceResponse>>();
@override
  void initState() {
    super.initState();
    intn();
  }
  intn()async{
    //region Socket
    String auth = base64Encode(utf8.encode('chegebeya:tLDcubrY3fH6cKjq'));
    var headers = {'Authorization': 'Basic $auth'};
    final  webSocketUrl = IOWebSocketChannel.connect(Uri.parse('wss://gotify.chegebeya.kifiya.et/stream',), headers:headers);
    webSocketUrl.stream.listen((event) {
      if (!mounted) return;
      if (kDebugMode) {
        print(event);
      }
      Map getData=jsonDecode(event);
      var result= binanceResponseFromJson(event);
      setState(() {
        tempText=getData["p"];
        title=getData["s"];
        binanceList.add(result);
        streamController.add(binanceList);
      });
    });
    //endregion
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.7),
        title: const Text("Web socket"),
      ),
      body: binanceList.isEmpty?
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(title,style:const TextStyle( fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 10,),
            Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(tempText,style:const TextStyle( fontSize: 20,fontWeight: FontWeight.w600),),
              ),
            ),
          ],
        ),
      ):
      StreamBuilder<List<BinanceResponse>>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              BinanceResponse binanceResponse = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Price : ${binanceResponse.p ?? ""}")),
                            Flexible(child: Text("Quantity : ${binanceResponse.q ?? ""}")),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("First trade ID : ${binanceResponse.f ?? ""}")),
                            Flexible(child: Text("Aggregate trade ID : ${binanceResponse.a ?? ""}")),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Trade time : ${binanceResponse.l ?? ""}")),
                            Flexible(child: Text("Event time : ${binanceResponse.e ?? ""}")),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Is the buyer the market maker? : ${binanceResponse.m ?? ""}")),
                            Flexible(child: Text("Symbol : ${binanceResponse.s ?? ""}")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      )
      // ListView.builder(itemBuilder: (context,index){
          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text("Price : ${binanceList[index].p??""}"),
          //               Text("Quantity : ${binanceList[index].q??""}"),
          //             ],
          //           ),
          //           const Divider(),
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(" First trade ID : ${binanceList[index].f??""}"),
          //               Text(" Aggregate trade ID : ${binanceList[index].a??""}"),
          //             ],
          //           ),
          //           const Divider(),
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(" Trade time : ${binanceList[index].l??""}"),
          //               Text("Event time : ${binanceList[index].e??""}"),
          //             ],
          //           ),
          //           const Divider(),
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(" Is the buyer the market maker? : ${binanceList[index].m??""}"),
          //               Text("Symbol : ${binanceList[index].s??""}"),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
          // })
      ,
    );
  }
}
