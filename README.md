# Flutter_listing_assets
Flutter - Listing files in assets dynamically

With this code you will get list of files in assets with Dart code for Flutter.

First you need to configure your pubspec.yaml file with assets.

For this image ->

<img width="289px" height="143px"  src="https://github.com/DiMiTriFrog/Flutter_listing_assets/blob/master/res/capt.png?raw=true"/>

The configure ->

<img width="289px" height="143px"  src="https://raw.githubusercontent.com/DiMiTriFrog/Flutter_listing_assets/master/res/pub.png"/>

You should read de file AssetManifest.json (contains path of all assets files include in pubspec.yaml) 
and filter the text.

    var assetsFile = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);
    
    
For example for filter the .jpg ->

    List<String> listMp3 =
        manifestMap.keys.where((String key) => key.contains('.mp3')).toList();
    
    
The return -> [assets/perfect_squat.jpg, assets/slav_boss.jpg]

