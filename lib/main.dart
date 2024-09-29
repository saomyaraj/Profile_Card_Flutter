import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile Card',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'images/WhatsApp Image 2024-01-26 at 22.41.07_602840b9.jpg'),
              ),
              const Text(
                'Saomyaraj Jha',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontFamily: 'Source Sans',
                    fontSize: 20.0,
                    color: Colors.white,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '(+91) 123 456 7890',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final Uri phoneUri = Uri(
                      scheme: 'tel',
                      path: '1234567890',
                    );
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      throw 'Could not launch $phoneUri';
                    }
                  },
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'jhaamrit630@gmail.com',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'jhaamrit630@gmail.com',
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    } else {
                      throw 'Could not launch $emailUri';
                    }
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Useful Links:',
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Source Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ), // Add some space between the cards and the icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.globe),
                    color: Colors.white,
                    onPressed: () async {
                      const url = 'https://saomyaraj.github.io/';
                      await _launchURL(url);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    color: Colors.white,
                    onPressed: () async {
                      const url = 'https://github.com/saomyaraj/';
                      await _launchURL(url);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                    color: Colors.white,
                    onPressed: () async {
                      const url = 'https://linkedin.com/in/saomyaraj812/';
                      await _launchURL(url);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    color: Colors.white,
                    onPressed: () async {
                      const url = 'https://instagram.com/saomyaraj_';
                      await _launchURL(url);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.hashnode),
                    color: Colors.white,
                    onPressed: () async {
                      const url = 'https://saomyaraj.hashnode.dev';
                      await _launchURL(url);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
