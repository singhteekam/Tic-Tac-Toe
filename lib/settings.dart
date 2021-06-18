import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    //  const url = 'http://privacypolicy-brainquiz.singhteekam.in/';
    print(await canLaunch(url));
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
        ),
        // backgroundColor: Colors.indigo,
      ),
      // backgroundColor: Colors.indigo[100],

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 10, 0),
            child: Text(
              "Developer contact",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text("Developer email"),
            subtitle: Text("teekams10999@gmail.com"),
          ),
          Divider(),
          ListTile(
            title: Text("Copyright"),
            subtitle: Text("Copyright © 2021 Teekam Singh\nAll right reserved"),
          ),
          Divider(),
          GestureDetector(
            onTap: () => _launchURL(
                "http://zerocross.singhteekam.in/termsandconditions"),
            child: Card(
              child: ListTile(
                // leading: Icon(Icons.feedback),
                title: Text("Terms and Conditions"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                _launchURL("http://zerocross.singhteekam.in/privacypolicy"),
            child: Card(
              child: ListTile(
                // leading: Icon(Icons.feedback),
                title: Text("Privacy Policy"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
