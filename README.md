# Flutter_listing_assets
<h1>Flutter - Listing files in assets dynamically</h1>

With this code you will get list of files in assets with Dart code for Flutter.

First you need to configure your pubspec.yaml file with assets.

For this resources ->

<img width="289px" height="143px"  src="https://github.com/DiMiTriFrog/Flutter_listing_assets/blob/master/res/capt.png?raw=true"/>

The configure ->

<img width="218px" height="71px"  src="https://raw.githubusercontent.com/DiMiTriFrog/Flutter_listing_assets/master/res/pub.png"/>

You should read de file AssetManifest.json (contains path of all assets files include in pubspec.yaml) 
and filter the text.

    var assetsFile = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);
    
    
For example for filter the .jpg ->

    List<String> listMp3 =
        manifestMap.keys.where((String key) => key.contains('.mp3')).toList();
    
    
The return -> [assets/perfect_squat.jpg, assets/slav_boss.jpg]


This repository has an example of how load from assets the list files and load the
existing images.
You have the code in main.dart and the resources in assets/.

Android example:

<img width="316px" height="672px" src="https://raw.githubusercontent.com/DiMiTriFrog/Flutter_listing_assets/master/res/screenshot.png"/>

Using in apps I make for strattonapps.com
