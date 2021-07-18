import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackatagro/utils/app_route.dart';
import 'package:hackatagro/utils/firebase_auth_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import './theme/app_theme.dart';
import 'collection_screens/collection_photos_screen.dart';
import 'photos_screen/photos_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final tabs = ['HOME', 'COLLECTIONS'];

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  TabBar _buildTabBar() => TabBar(
        tabs: [
          for (final tab in tabs)
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  tab,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await context.read<FirebaseAuthProvider>().signOut();
                Navigator.pushReplacementNamed(context, AppRoute.routeLogin);
              },
            )
          ],
          title: Center(
            child: Text(
              'Hackatagro',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: GoogleFonts.paytoneOne().fontFamily,
                letterSpacing: 1,
              ),
            ),
          ),
          bottom: _buildTabBar(),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: LatestPhotos(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: CollectionPhotos(),
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
