# Flutter_listing_assets
Flutter - Listing files in assets dynamically

With this code you will load list of files in assets with Dart code.

First you need to configure your pubspec.yaml file with assets.

For 
  assets:
    - assets/
    - assets/gifs/

You should read de file AssetManifest.json (contains path of all assets files include in pubspec.yaml) 
and filter the text.

    var assetsFile = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);
    
    
For example for filter the .jpg ->

    List<String> listMp3 =
        manifestMap.keys.where((String key) => key.contains('.mp3')).toList();
    
    
The return -> [assets/perfect_squat.jpg, assets/slav_boss.jpg]

