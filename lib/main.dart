import 'package:flutter/material.dart';
import 'package:tpflutter/bo/logement.dart';
import 'package:tpflutter/page/accueil_page.dart';
import 'package:tpflutter/page/detail_logement_page.dart';
import 'package:tpflutter/page/liste_date_page.dart';
import 'package:tpflutter/page/liste_logement_page.dart';
import 'package:tpflutter/page/liste_villes_page.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TpFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings){
        if(settings.name == '/logements'){
          return MaterialPageRoute(builder: (context) =>
              ListeLogementPage(settings.arguments as int)
          );
        }
        if(settings.name == '/logdetail'){
          return MaterialPageRoute(builder: (context) =>
              DetailLogementPage(settings.arguments as Logement)
          );
        }
        if(settings.name == '/dates'){
          return MaterialPageRoute(builder: (context) =>
              ListeDatePage(settings.arguments as Logement)
          );
        }
      },
      initialRoute: '/accueil',
      routes: <String, WidgetBuilder> {
        '/accueil' : (BuildContext context) => const AccueilPage(),
        '/villes' : (BuildContext context) => const ListeVillesPage(),
        //'/logements' : (BuildContext context) => const ListeLogementPage(),
        //'/logdetail' : (BuildContext context) => const DetailLogementPage(),
        //'/dates' : (BuildContext context) => const ListeDatePage()
      },
    );
  }
}

