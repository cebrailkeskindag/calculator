import 'package:flutter/material.dart';

class Trendyol extends StatelessWidget {
  const Trendyol({Key? key}) : super(key: key);
//deneme satırı
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              //  TextField(decoration: InputDecoration(hintText: "Marka, ürün")),
              Icon(Icons.notifications)
            ],
          ),
        ),
        body: Column(
          children: [
// TabBar(),
            Card(
              child: Image.network(""),
            ),

            Text("Hizmetlerimizi keşfet"),
            Card(
              child: Image.network(""),
            )
          ],
        ));
  }
}
