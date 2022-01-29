import 'package:flutter/material.dart';
import 'package:tpflutter/bo/logement.dart';

class ListeDatePage extends StatefulWidget {
  final Logement logement;
  const ListeDatePage(this.logement, {Key? key}) : super(key: key);

  @override
  _ListeDatePageState createState() => _ListeDatePageState();
}

class _ListeDatePageState extends State<ListeDatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context,
            int index) => const Divider(),
        itemCount: widget.logement.listDateAvailable.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(widget.logement.listDateAvailable[index].toString(), style: const TextStyle(fontSize: 20.0, color: Colors.grey))
          );
        }),
    );
  }
}
