

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context){
    showCupertinoModalPopup( 
      context: context,
      builder: (_) => WillPopScope(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height : 150.0,
                child: Image(
                image: AssetImage("assets/images/pawclueslogo.png")
                ),
              ),
              Text('Autenticando',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                )
              ),
              SizedBox(height: 20),
              CircularProgressIndicator()
            ],
          ),
        ),
        onWillPop: () async => false,
      )
    );
  }
}