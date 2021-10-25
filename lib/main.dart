import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom sheet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            var sheetController = scaffoldKey.currentState!
                .showBottomSheet((context) => BottomSheetWidget());
            sheetController.closed.then((value) {
              print("closed");
            });
            sheetController.closed.then((value) {});
          },
          child: Text(
            'Click me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 3)
          ]),
      child: Column(
        children: [
          ListTile(
            title: Text('One'),
            subtitle: Text('This is one'),
            trailing: Icon(Icons.access_alarm),
          ),
          ListTile(
            title: Text('Two'),
            subtitle: Text('This is Two'),
            trailing: Icon(Icons.access_alarm),
          ),
          ListTile(
            title: Text('Three'),
            subtitle: Text('This is Three'),
            trailing: Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
  }
}
