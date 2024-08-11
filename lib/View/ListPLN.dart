import 'package:flutter/material.dart';
import 'package:smartgrid/Partials/Card/ItemCard.dart';

class ListPLN extends StatefulWidget {
  const ListPLN({ Key? key }) : super(key: key);

  @override
  _ListPLNState createState() => _ListPLNState();
}

class _ListPLNState extends State<ListPLN> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ItemCard(context, title: "PLTB", condition: true, data: "Mbuh"),
      )
    );
  }
}