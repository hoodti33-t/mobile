import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _onItemTap();
  }

  void _onItemTap() {
    switch (_selectedIndex) {
      case 0:
        Navigator.of(context).pushNamed("GeneralInfoPage");
        break;
      case 1:
        Navigator.of(context).pushNamed("ClassPage");
    }
  }

  void _onItem1Tapped() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed("GeneralInfoPage");
  }

  void _onItem2Tapped() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed("ClassPage");
  }

  @override
  Widget build(BuildContext context) {
    /**** Custom Colors ****/
    const _homeTextColor = Color(0xFF57150B);
    const _backgroundColor = Color(0xFFFFCC00);

    /**** Divider ****/
    var div = const Divider(height: 20.0, color: Colors.grey);

    var headerText = Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: 20, width: 20, child: Image.asset('assets/OIP1.jpg')),
          const Text('This is a Header'),
          const Text('April 1, 2022'),
        ],
      ),
    );

    var header = DrawerHeader(
      child: headerText,
      decoration: const BoxDecoration(color: _backgroundColor),
    );

    /**** 1st Drawer Item ****/
    var item1Text = const Text('Page1');

    var item1Icon = const Icon(Icons.settings);

    var item1 =
        ListTile(title: item1Text, leading: item1Icon, onTap: _onItem1Tapped);

    /**** 2nd Drawer Item ****/
    var item2Text = const Text('Page2');

    var item2Icon = const Icon(Icons.details);

    var item2 =
        ListTile(title: item2Text, leading: item2Icon, onTap: _onItem2Tapped);

    var children = [header, item1, div, item2];

    var listView = ListView(children: children);

    var drawer = Drawer(child: listView);

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: const Text('Navigation Example'),
      ),
      body: const Center(
        child: Text('Navigation Example'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _backgroundColor,
        selectedItemColor: _homeTextColor,
        unselectedItemColor: _homeTextColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _homeTextColor = Color(0xFF57150B);
    const _backgroundColor = Color(0xFFFFCC00);

    return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(title: const Text("Bottom Navigation")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: _homeTextColor),
                iconSize: 70.0,
                onPressed: null,
              ),
              Text(
                "General Info",
              ),
            ])));
  }
}

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://rucsm.org/cs/faculty/robinson/index.php",
      appBar: AppBar(
        title: const Text("Class Web Page"),
      ),
    );
  }
}
