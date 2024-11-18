import 'package:audioplayers/audioplayers.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SPICE SOFT アプリページ'),
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
  int _counter = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 80, color: Colors.black45, height: 200),
        ),
        toolbarHeight: 100,
      ),
      body: Column(children: [
        // 追加したい要素（テキストや区切り線など）
        Container(
          width: double.infinity,
          color: Colors.blueGrey,
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // 右詰にする
              children: [
                TextButton(
                  onPressed: () {
                    print('Spice Spft');
                  },
                  child: Text(
                    'Spice Spft',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20), // ここで間隔を指定
                TextButton(
                  onPressed: () {
                    print('アプリ一覧');
                  },
                  child: Text(
                    'アプリ一覧',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ),
        Divider(
          color: Colors.white,
          thickness: 0.0,
          height: 0.0,
        ),
        // メインコンテンツ（Stackなど）
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/IMG_2787_2-scaled.jpg"), // 画像のパス
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 30), // 右側に20ピクセルのスペース
                      child: Text(
                        "shinji.oosaki@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/013.BMP",
                          height: 300,
                        ),
                        Positioned(
                          left: 0,
                          top: 00,
                          child: TextButton(
                            onPressed: () async {
                              print('Button 1 pressed');
                              await _audioPlayer.play(AssetSource('pipi.mp3'));
                            },
                            child: Container(
                              width: 300,
                              height: 300,
                              color: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
