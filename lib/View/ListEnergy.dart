import 'package:flutter/material.dart';
import 'package:smartgrid/Partials/Card/ItemCard.dart';

class ListEnergy extends StatefulWidget {
  const ListEnergy({ Key? key }) : super(key: key);

  @override
  _ListEnergyState createState() => _ListEnergyState();
}

class _ListEnergyState extends State<ListEnergy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ItemCard(context, title: "PLTS", condition: false, data: "Mbuh"),
      )
    );
  }
}