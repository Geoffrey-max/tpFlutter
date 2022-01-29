import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  height: 50.0,
                  width: 300.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )
                    ),
                    onPressed: () => {Navigator.of(context).pushNamed('/villes')},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : const [
                        Icon(Icons.search, color: Colors.red),
                        Text("Où allez-vous ?", style: TextStyle(color: Colors.black)),
                      ]
                    ),
                  ),
                ),
              const Spacer()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: const IconThemeData(color: Colors.black),
          child: Row(
            children: [
              const Spacer(),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
              const Spacer(),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.favorite_border)),
              const Spacer(),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.home_outlined)),
              const Spacer(),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.messenger_outline)),
              const Spacer(),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.perm_identity)),
              const Spacer(),
            ],
          )
        )
      ),
    );
  }
}
