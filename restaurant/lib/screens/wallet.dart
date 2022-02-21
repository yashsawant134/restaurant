import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';

class Wallet extends StatefulWidget {
  const Wallet({ Key? key }) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
     return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colours.lightdark,
    );
  }
}