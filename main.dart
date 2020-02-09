import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listing Assets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Listing assets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> alone = List();
  @override
  initState() {
    loadPathSounds(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: alone.length,
          itemBuilder: (context, index) {
            return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 25, 10.0, 25),
                    child: Center(
                      child:
                          alone[index].contains(".mp3")?
                        Text(alone[index])
                              :Image.asset(alone[index]),
                    ),
                  ));
          }),
    );
  } // build()

  loadPathSounds(BuildContext context) async {
    // >> To get paths you need these 2 lines
    List<String> listaAssetsFiltered = List();
    var assetsFile = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);

    //Filter .mp3
    List<String> listMp3 =
        manifestMap.keys.where((String key) => key.contains('.mp3')).toList();

    //Filter .gif
    List<String> listGif =
        manifestMap.keys.where((String key) => key.contains('.gif')).toList();

    //Filter.jpg
    List<String> listJpg =
        manifestMap.keys.where((String key) => key.contains('.jpg')).toList();
    for (String mp3 in listMp3) {
      listaAssetsFiltered.add(mp3);
    }
    for (String gif in listGif) {
      listaAssetsFiltered.add(gif);
    }
    for (String jpg in listJpg) {
      listaAssetsFiltered.add(jpg);
    }

    setState(() {
      alone = listaAssetsFiltered;
    });
  } //loadPathSounds()

} // _MyHomePageState()