import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unity_ads_plugin/unity_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainP(),
    );
  }
}

class MainP extends StatefulWidget {
  const MainP({Key? key}) : super(key: key);

  @override
  _MainPState createState() => _MainPState();
}

class _MainPState extends State<MainP> {
  void initState() {    
    super.initState();
    UnityAds.init(
      gameId: "4286805",
      testMode: true
    );
    myBanner.load();
    // Load ads.
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 20,
            color: Colors.green,
          ),
          SizedBox(height: 50,),
          Container(
            alignment: Alignment.center,
            child: AdWidget(
              ad: myBanner,
            ),
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ),
          SizedBox(height: 50,),
          Center(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: UnityBannerAd(
                      placementId: "Banner_Android",
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

// final AdWidget adWidget = AdWidget(ad: myBanner);
// final Container adContainer = Container(
//   alignment: Alignment.center,
//   child: adWidget,
//   width: myBanner.size.width.toDouble(),
//   height: myBanner.size.height.toDouble(),
// );