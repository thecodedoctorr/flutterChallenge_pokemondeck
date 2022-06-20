import 'package:flutter/material.dart';
import '/theme/card_color.dart';
import '/theme/type_icon.dart';
import 'package:intl/intl.dart';

class TypeCard extends StatelessWidget {
  final String type;
  TypeCard(this.type);
  @override
  Widget build(BuildContext context) {
    String typeIcon = setTypeIcon(type);
    String typeText = toBeginningOfSentenceCase(type);
    return Material(
      elevation: 6,
      shadowColor: setTypeColor(type),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        decoration: BoxDecoration(
          color: setTypeColor(type),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              typeIcon,
              style: TextStyle(
                fontFamily: 'PokeGoTypes',
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              typeText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.5, 2),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
