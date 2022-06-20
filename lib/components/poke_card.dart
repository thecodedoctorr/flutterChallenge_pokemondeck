import 'package:flutter/material.dart';
import '/screens/poke_detail_screen.dart';
import '/components/type_card.dart';
import 'package:intl/intl.dart';

class PokeCard extends StatelessWidget {
  final dynamic poke;
  final BuildContext context;

  const PokeCard(this.poke, this.context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PokeDetailScreen.routeName, arguments: poke.id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        padding: EdgeInsets.fromLTRB(21, 15, 10, 15),
        margin: EdgeInsets.only(bottom: 10, top: 5, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#' + poke.id.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  toBeginningOfSentenceCase(poke.name),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    if (poke.type1 != null) TypeCard(poke.type1),
                    SizedBox(width: 5),
                    if (poke.type2 != null) TypeCard(poke.type2),
                  ],
                )
              ],
            ),
            Positioned(
              right: -35,
              bottom: -30,
              child: FadeInImage.assetNetwork(
                placeholder: 'images/pokeLoad.gif',
                image: poke.sprite,
                imageScale: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
