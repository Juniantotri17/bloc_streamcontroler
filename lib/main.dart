import 'package:flutter/material.dart';
import 'package:streamcontroler/colors_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.greenAccent,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_greenAccent);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.yellowAccent,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_yellowAccent);
              },
            )
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: Icon(Icons.home),
          title: Center(
            child: Text("API 20160801250"),
          ),
          actions: <Widget>[Icon(Icons.camera_enhance)],
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.greenAccent,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }
}
