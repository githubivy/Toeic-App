import 'package:flutter/material.dart';
import 'package:toeicapp/questionlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Toeic Question'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> cardinalnum = ['No 1', 'No 2', 'No 3', 'No 4', 'No 5', 'No 6'];
  static List link = ['https://thachln.github.io/toeic-data/ets/2016/1/p1/1.png',
                      'https://thachln.github.io/toeic-data/ets/2016/1/p1/2.png',
                      'https://thachln.github.io/toeic-data/ets/2016/1/p1/3.png',
                      'https://thachln.github.io/toeic-data/ets/2016/1/p1/4.png',
                      'https://thachln.github.io/toeic-data/ets/2016/1/p1/5.png',
                      'https://thachln.github.io/toeic-data/ets/2016/1/p1/6.png'];
  final List<questionlist> qlist = List.generate(cardinalnum.length, (index) => questionlist('${cardinalnum[index]}', '${link[index]}'));

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
            itemCount: qlist.length,
          itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(qlist[index].cnum),
                  leading: SizedBox(
                     width:  100,
                     height: 100,
                    child: Image.network(qlist[index].imgurl),
                  ),
                    onTap: (){
                    print('Tapped ');

              },
                ),
              );
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
