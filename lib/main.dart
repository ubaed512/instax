import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splashscreen/splashscreen.dart';

TextEditingController searchController = new TextEditingController();
TextEditingController camnameholderController = new TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instax',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new MyHomePage(),
      imageBackground: AssetImage('Assets/Splash/SplashScreenFujiFilm.png',),
      useLoader: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> ColorCam = [
    "Mint",
    "Blue",
    "Choral",
    "Pink",
    "Lavender",
  ];

   List<String> filteredList;
   String keyword;

  @override
  void initState() {
    super.initState();
    ColorCam.sort();
    filteredList = new List<String>();
    keyword = "";
  }

  
  CheckColorCam(keyword){
    if(keyword == "Blue"){
      return Color(0xFF77a0c6);
    } else if (keyword == "Mint"){
      return Color(0xFF70b1a1);
    } else if (keyword == "Choral"){
      return Color(0xFFb0463c);
    } else if (keyword == "Lavender"){
      return Color(0xFF855f8c);
    } else if (keyword == "Pink"){
      return Color(0xFFfcf9496);
    }
  }

  CamPrice(keyword){
    if(keyword == "Blue"){
      return "50.90";
    } else if (keyword == "Mint"){
      return "49.90";
    } else if (keyword == "Choral"){
      return "51.90";
    } else if (keyword == "Lavender"){
      return "53.90";
    } else if (keyword == "Pink"){
      return "52.90";
    }
  }

  CheckColorCamPic(keyword){
    if(keyword == "Blue"){
      return AssetImage("Assets/InstaxCam/InstaxBlue.png");
    } else if (keyword == "Mint"){
      return AssetImage("Assets/InstaxCam/InstaxMint.png");
    } else if (keyword == "Choral"){
      return AssetImage("Assets/InstaxCam/InstaxChoral.png");
    } else if (keyword == "Lavender"){
      return AssetImage("Assets/InstaxCam/InstaxLavender.png");
    } else if (keyword == "Pink"){
      return AssetImage("Assets/InstaxCam/InstaxPink.png");
    }
  }

  BeforeSearch(){
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return ListView.separated(
            itemCount: ColorCam.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  camnameholderController.text = ColorCam[index];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailCam()));
                },
                child: SizedBox(
                  width: 100.w,
                  height: 28.h,
                  child: DecoratedBox(
                    decoration:BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 85.w,
                          height: 28.h,
                          child: DecoratedBox(
                            decoration:BoxDecoration(
                              color: CheckColorCam(ColorCam[index]),
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 80.w,
                              height: 5.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Text(
                                            "Limited Edition",
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: 80.w,
                            height: 20.h,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 3.h),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Instax",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.sp
                                                  ),
                                                ),
                                                Text(
                                                  " Mini " + ColorCam[index] + " 7+",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18.sp
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 2.h),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "\$",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.sp
                                                    ),
                                                  ),
                                                  Text(
                                                    CamPrice(ColorCam[index]),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20.sp
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 2.h),
                                              child: SizedBox(
                                                width: 20.w,
                                                child: RaisedButton(
                                                  shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(2.h)),
                                                  color: Colors.white,
                                                  onPressed: (){
                                                    null;
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Buy",
                                                      style: TextStyle(
                                                        color: CheckColorCam(ColorCam[index]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image(
                            image: CheckColorCamPic(ColorCam[index]),
                            height: 20.h,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, int){
              return Divider(
                color: Colors.transparent,
              );
            },
          );
        }
    );
  }

  AfterSearch(){
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return ListView.separated(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    camnameholderController.text = filteredList[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailCam()));
                  },
                  child: SizedBox(
                    width: 100.w,
                    height: 28.h,
                    child: DecoratedBox(
                      decoration:BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 85.w,
                            height: 28.h,
                            child: DecoratedBox(
                              decoration:BoxDecoration(
                                color: CheckColorCam(filteredList[index]),
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 80.w,
                                height: 5.h,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: Text(
                                              "Limited Edition",
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: 80.w,
                              height: 20.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Instax",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.sp
                                                    ),
                                                  ),
                                                  Text(
                                                    " Mini " + filteredList[index] + " 7+",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.sp
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.h),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.sp
                                                      ),
                                                    ),
                                                    Text(
                                                      CamPrice(filteredList[index]),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.sp
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.h),
                                                child: SizedBox(
                                                  width: 20.w,
                                                  child: RaisedButton(
                                                    shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(2.h)),
                                                    color: Colors.white,
                                                    onPressed: (){
                                                      null;
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        "Buy",
                                                        style: TextStyle(
                                                          color: CheckColorCam(filteredList[index]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image(
                              image: CheckColorCamPic(filteredList[index]),
                              height: 20.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, int){
                return Divider(
                  color: Colors.transparent,
                );
              },
            );
        }
    );
  }

  SearchedData(){
    filteredList = new List<String>();
    for (int i = 0; i < ColorCam.length; i++) {
      var item = ColorCam[i];
      if (item.toLowerCase().contains(keyword.toLowerCase())) {
        filteredList.add(item);
      }
    }
    return AfterSearch();
  }

  @override
  Widget build(BuildContext context) {

    searchController.addListener(() {
      setState(() {
        keyword = searchController.text;
      });
    });

    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Image.asset(
                    "Assets/Logo/fujifilm-banner.png",
                    scale: 4
                ),
                leading: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 6.h,
                        height: 6.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFF24F1E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.menu),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  SizedBox(
                    width: 8.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 6.h,
                          height: 6.h,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.shopping_bag_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: SizedBox(
                            width: 100.w,
                            height: 7.h,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: searchController,
                                      decoration: InputDecoration(
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          height: 80.h,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.transparent
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: keyword.isEmpty ? BeforeSearch() : SearchedData(),
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ),
              )
          );
        }
    );
  }
}

class DetailCam extends StatefulWidget {
  const DetailCam({Key key}) : super(key: key);

  @override
  _DetailCamState createState() => _DetailCamState();
}

class _DetailCamState extends State<DetailCam> {

  CheckColorCam(keyword){
    if(keyword == "Blue"){
      return Color(0xFF77a0c6);
    } else if (keyword == "Mint"){
      return Color(0xFF70b1a1);
    } else if (keyword == "Choral"){
      return Color(0xFFb0463c);
    } else if (keyword == "Lavender"){
      return Color(0xFF855f8c);
    } else if (keyword == "Pink"){
      return Color(0xFFfcf9496);
    }
  }

  CamPrice(keyword){
    if(keyword == "Blue"){
      return "50.90";
    } else if (keyword == "Mint"){
      return "49.90";
    } else if (keyword == "Choral"){
      return "51.90";
    } else if (keyword == "Lavender"){
      return "53.90";
    } else if (keyword == "Pink"){
      return "52.90";
    }
  }

  CheckColorCamPic(keyword){
    if(keyword == "Blue"){
      return AssetImage("Assets/InstaxCam/InstaxBlue.png");
    } else if (keyword == "Mint"){
      return AssetImage("Assets/InstaxCam/InstaxMint.png");
    } else if (keyword == "Choral"){
      return AssetImage("Assets/InstaxCam/InstaxChoral.png");
    } else if (keyword == "Lavender"){
      return AssetImage("Assets/InstaxCam/InstaxLavender.png");
    } else if (keyword == "Pink"){
      return AssetImage("Assets/InstaxCam/InstaxPink.png");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 13.h,
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp
                            ),
                          ),
                          Text(
                            CamPrice(camnameholderController.text),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: SizedBox(
                        width: 25.w,
                        height: 8.h,
                        child: DecoratedBox(
                          decoration:BoxDecoration(
                              color: CheckColorCam(camnameholderController.text),
                            borderRadius: BorderRadius.circular(2.h)
                          ),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
            "Assets/Logo/fujifilm-banner.png",
            scale: 4
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Center(
                child: SizedBox(
                  width: 7.h,
                  height: 7.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: CheckColorCam(camnameholderController.text)),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                          Icons.arrow_back_ios_outlined,
                        color:  CheckColorCam(camnameholderController.text),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 9.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Center(
                child: SizedBox(
                  width: 7.h,
                  height: 7.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 110.w,
                  height: 40.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: Center(
                      child: Image(
                        image: CheckColorCamPic(camnameholderController.text),
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 130.h,
                  child: DecoratedBox(
                    decoration:BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Instax",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp
                              ),
                            ),
                            Text(
                              " Mini " + camnameholderController.text + " 7+",
                              style: TextStyle(
                                  color: CheckColorCam(camnameholderController.text),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Be real and fun with the INSTAX MINI 7+. Cool design, colorful and compact, this instant camera is fun andeasy to use.Point and shoot and give your day some fun!",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Point & Shoot",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "The Mini 7+ is easy to use! Simply point and shoot! With its exposure control adjustment and 60mm fixed-focuslens, the Mini 7+ makes it easy for you to be creative and live in the moment.",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Mini But With Full-Size Memories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Pop it in your wallet, stick it to your wall – the INSTAX Mini film brings you instant 2 x 3 sized photos youcan show and tell.",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Using professional high-quality film technology (as you’d expect from Fujifilm), your festival frolicking, sunworshipping, crowd surfing memories that you print will transport you right back into that moment.",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Mini Film",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Mini moments with maximum impact. What’s your next mini moment?",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Plenty of Great Color Choices",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Available in five awesome colors: Lavender, Seafoam Green, Coral, Light Pink & Light Blue",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "The Mini 7+ Has Your Back!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Depending upon the weather conditions, you can easily control brightness to obtain a great picture",
                              textAlign: TextAlign.justify,
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Fun All The Time!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "Live in the moment and enjoy your Mini 7+, and give your day some instant fun!",
                              textAlign: TextAlign.justify,
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
