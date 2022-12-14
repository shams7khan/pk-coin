// import 'dart:html';
// import 'dart:html';

import 'package:http/http.dart';
import 'package:pkcoin/slider_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PK Coin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client? httpClient;
  Web3Client? ethClient;
  bool data = false;
  int myAmount = 0;
  final myAddress = "0x9B83F4FeF2f53f2E52D0eFB7feB6c6aC54e4AFb1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ZStack([ //zstack is stack
        VxBox().blue600.size(context.screenWidth, context.percentHeight * 30).make(),
     
        VStack([ //vstack is column
          (context.percentHeight * 10).heightBox,
          "\$PKCOin".text.xl4.white.bold.center.makeCentered().py16(),
          (context.percentHeight * 5).heightBox,
          VxBox(
            child: VStack([
              "Balance".text.gray700.xl2.semiBold.makeCentered(),
              10.heightBox,
              data 
                ? "\$1".text.bold.xl6.makeCentered()
                : CircularProgressIndicator().centered()
            ])
          ).p16.white.size(context.screenWidth, context.percentHeight * 18).rounded.shadowXl.make().p16(),
          30.heightBox, //sizedbox
          SliderWidget(
            min: 0,
            max: 100,
            finalVal: (value){
              myAmount = (value*100).round();
              print(myAmount);
            },
          ).centered(),
          HStack([ //hstack is row
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: Icon(Icons.refresh), 
              
              label: "Refresh".text.white.make()
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: (){}, 
              icon: Icon(Icons.call_made_outlined), 
              
              label: "Deposit".text.white.make()
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (){}, 
              icon: Icon(Icons.call_received_outlined), 
              
              label: "WithDraw".text.white.make()
            )
          ],
          alignment: MainAxisAlignment.spaceAround,
          axisSize: MainAxisSize.max,
          )
        ])
      ])
    );
  }
}


