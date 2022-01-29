import 'package:flutter/material.dart';
import 'package:tpflutter/bo/logement.dart';

class DetailLogementPage extends StatefulWidget {
  final Logement logement;
  const DetailLogementPage(this.logement, {Key? key}) : super(key: key);

  @override
  _DetailLogementPageState createState() => _DetailLogementPageState();
}

class _DetailLogementPageState extends State<DetailLogementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network("https://flutter-learning.mooo.com" + widget.logement.place.pic.url.toString(), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.logement.title, style: const TextStyle(fontSize: 20.0),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(widget.logement.owner),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children :[
            const Spacer(),
            Text(widget.logement.price.toString() + " €", style: const TextStyle(fontSize: 15.0, color: Colors.grey),),
            const Spacer(),
            OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/dates', arguments: widget.logement),
                child: const Text('Réserver', style: TextStyle(color: Colors.red),),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red)
                ),
            ),
            const Spacer()
          ]
        ),
      ),
    );
  }
}
