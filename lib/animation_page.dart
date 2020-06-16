import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _transitionTween;

  Animation<double> _secondTransitionTween;

  Animation<double> _iconTransitionTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.repeat(reverse: true);

    _transitionTween = Tween<double>(begin: 100, end: 200).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutQuart,
            reverseCurve: Curves.easeInOut));
    _secondTransitionTween = Tween<double>(begin: 200, end: 230).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutQuart,
            reverseCurve: Curves.easeInOut));
    _iconTransitionTween = Tween<double>(begin: 70, end: 50).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutQuart,
            reverseCurve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child){
            return new Center(
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Container(
                    height: _transitionTween.value,
                    width: _transitionTween.value,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(_transitionTween.value/2)),
                    child: new Center(
                      child: Icon(Icons.location_on,color: Colors.white,size: _iconTransitionTween.value,),
                    ),
                  ),
                  new Container(
                    height: _secondTransitionTween.value,
                    width: _secondTransitionTween.value,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(_secondTransitionTween.value/2)),
                  )
                ],
              ),
            );
          },
        ));
  }
}
