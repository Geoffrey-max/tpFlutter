import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tpflutter/bo/ville.dart';
import 'package:http/http.dart';

class ListeVillesPage extends StatefulWidget {
  const ListeVillesPage({Key? key}) : super(key: key);

  @override
  _ListeVillesPageState createState() => _ListeVillesPageState();
}

class _ListeVillesPageState extends State<ListeVillesPage> {
  late StreamController<List<Ville>> _streamControllerListVilles;
  late Stream<List<Ville>> _streamVilles;

  @override
  void initState() {
    super.initState();
    _streamControllerListVilles = StreamController<List<Ville>>();
    _streamVilles = _streamControllerListVilles.stream;
    importVilles();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Ville>>(
        stream: _streamVilles,
        builder: (context, snapshot) {
          if(snapshot.hasError) return const Icon(Icons.error);
          if(!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context,
                  int index) => const Divider(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/logements', arguments: snapshot.data![index].id),
                  child: ListTile(
                    leading: Image.network("https://flutter-learning.mooo.com" + snapshot.data![index].pic.url.toString(), height: 150, width: 75, fit: BoxFit.fill),
                    title: Text(snapshot.data![index].name.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void importVilles(){
    Future<Response> resVilles = get(Uri.parse("https://flutter-learning.mooo.com/villes"));
    resVilles.then((value) {
      if(value.statusCode == 200){
        String jsonBody = value.body;
        List<Ville> lsVilles = List.empty(growable: true);
        for(Map<String, dynamic> ville in jsonDecode(jsonBody)){
          lsVilles.add(Ville.fromJson(ville));
        }
        _streamControllerListVilles.sink.add(lsVilles);
      }
    },
        onError: (_, err) => log("Erreur lors du download des msgs:" + err.toString()));
  }
}
