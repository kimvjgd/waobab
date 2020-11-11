import 'package:cor_waterstation/screens/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

//import 'package:intro_slider_example/home.dart';

void main() => runApp(new MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

//------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    // 444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
    slides.add(
      new Slide(
        title: "",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        description: "=\n\n\nWATER + BAOBAB",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("WAOBAB\n",
            style: TextStyle(color: Colors.white, fontSize: 50)),
        backgroundImage: "images/mainpage_1.png",
        colorBegin: Colors.white,
        colorEnd: Colors.white,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    // 3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
    slides.add(
      Slide(
        title: "",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        description: "당신의\n와오밥나무에\n물이 가득차면\n열매가 열립니다.",
        backgroundImage: "images/mainpage_1.png",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontStyle: FontStyle.italic,
        ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget:
        Text("", style: TextStyle(color: Colors.black, fontSize: 50)),
        colorBegin: Colors.white,
        colorEnd: Colors.white,
        onCenterItemPress: () {},
      ),
    );
    // 222222222222222222222222222222222222222222222222222222222222222222222222222222222222
    slides.add(
      new Slide(
        title: "바오밥 나무",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "바오밥 나무는 열대 아프리카에서 자생하는 물밤나무과의 활엽교목이며 아플이카에서는 생명의 나무로 신성시 된다."
            "주로 건조한 지역에서 자라는데 몸통에 엄청난 양의 물을 저장할 수 있고 나무가 사는 지역의 수분상태에 따라 스스로 수분의 발산을 조절한다.\n"
            "보통 큰 바오밥 나무는 10만리터 이상의 물을 몸통에 저장하였다가 건기에 조금씩 사용한다",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic),
        backgroundImage: "images/mainpage_1.png",
        heightImage: 250,
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 20,
      ),
    );


  }

  void onDonePress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.blue,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.blue,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Colors.blueGrey,
      colorActiveDot: Colors.blue,
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
