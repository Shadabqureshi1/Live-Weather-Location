import 'package:flutter/material.dart';

const decorationTextfield = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    ),
    hintText: 'Enter a city name ',
    hintStyle: TextStyle(
        color: Colors.grey
    ),
  icon: Icon(Icons.location_city,
  color: Colors.white,
  )
);

class Citylocation extends StatefulWidget {
  const Citylocation({super.key});



  @override
  State<Citylocation> createState() => _CitylocationState();
}


class _CitylocationState extends State<Citylocation> {

  String? cityName;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.black
                  ),
                  decoration: decorationTextfield,
                  onChanged: (value){
                    cityName = value;
                  },

                ),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context, cityName);
              }, child: Text('CLICK TO GET WEATHER',
                style: TextStyle(
                  color: Colors.white
                ),

              ))
            ],
          ),
        ),
      ),


    );
  }
}
