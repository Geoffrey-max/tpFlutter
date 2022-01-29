import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tpflutter/bo/logement.dart';

class ListeLogementPage extends StatefulWidget {
  final int id;
  const ListeLogementPage(this.id, {Key? key}) : super(key: key);

  @override
  _ListeLogementPageState createState() => _ListeLogementPageState();
}

class _ListeLogementPageState extends State<ListeLogementPage> {
  late StreamController<List<Logement>> _streamControllerListLogements;
  late Stream<List<Logement>> _streamLogements;

  @override
  void initState() {
    super.initState();
    _streamControllerListLogements = StreamController<List<Logement>>();
    _streamLogements = _streamControllerListLogements.stream;
    importLogement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Logement>>(
        stream: _streamLogements,
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
                  onTap: () => Navigator.of(context).pushNamed('/logdetail', arguments: snapshot.data![index]),
                  child: ListTile(
                    leading: Image.network("https://flutter-learning.mooo.com" + snapshot.data![index].place.pic.url.toString(), height: 150, width: 75, fit: BoxFit.fill),
                    title: Text(snapshot.data![index].title.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
  void importLogement() {
    Future<Response> resLogements = get(Uri.parse("https://flutter-learning.mooo.com/logements?place.id=" + widget.id.toString()));
    resLogements.then((value) {
      if(value.statusCode == 200){
        String jsonBody = value.body;
        List<Logement> lsLogements = List.empty(growable: true);
        for(Map<String, dynamic> logement in jsonDecode(jsonBody)){
          lsLogements.add(Logement.fromJson(logement));
        }
        _streamControllerListLogements.sink.add(lsLogements);
      }
    },
        onError: (_, err) => log("Erreur lors du download des msgs:" + err.toString()));
  }
}
