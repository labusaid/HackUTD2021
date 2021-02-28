import 'package:flutter/material.dart';
import '../screens/showDeleteConfirm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math';
import 'package:currensee/screens/productScreen.dart';

class PriceWatch extends StatelessWidget {
  final String productName;
  final double price;
  String get priceString {
    return "\$" + price.toString();
  }
  bool get priceRise {
    Random x =  new Random();
    return x.nextBool();
  }

  PriceWatch(this.productName, this.price);

  @override
  Widget build(BuildContext context) {
    bool riseInPrice = priceRise;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductScreen(productName)))
      },
      onLongPress: () {
        showAlertDialog(context, productName);
      },
      child: Container(
        height: 70,
        child: Card(
          child: Row(
            children: [
              Icon(Icons.devices_outlined, color: Colors.black87,),
              Container(
                  child: AutoSizeText(
                    productName,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    maxLines: 1,
                  ),
                width: 75,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  priceString,
                  style:
                      GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Icon(riseInPrice ? Icons.arrow_upward : Icons.arrow_downward, color: riseInPrice? Colors.lightGreen[900] : Colors.red),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          color: Colors.blue[300],
          shadowColor: Colors.teal,
          borderOnForeground: true,
          
        ),
      ),
    );
  }
}
