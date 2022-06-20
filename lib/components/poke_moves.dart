import 'package:flutter/material.dart';
import '/models/pokemon.dart';
import 'package:intl/intl.dart';

class PokeMoves extends StatelessWidget {
  final Pokemon pokeData;
  PokeMoves(this.pokeData);

  Widget moveLabel(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(2, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List moveList = pokeData.moves;
    return Container(
      padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 6 / 1.5,
        crossAxisSpacing: 10,
        children: moveList.map((item) => moveLabel(item, pokeData)).toList(),
      ),
    );
  }
}
