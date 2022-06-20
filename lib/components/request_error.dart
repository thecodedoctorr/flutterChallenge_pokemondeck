import 'package:flutter/material.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.gamepad_outlined,
            color: Colors.teal,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            'Pokemon deck',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text('get to Home'),
          )
        ],
      ),
    );
  }
}
