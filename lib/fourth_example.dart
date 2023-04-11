import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourExample extends StatefulWidget {
  const FourExample({Key? key}) : super(key: key);

  @override
  State<FourExample> createState() => _FourExampleState();
}

class _FourExampleState extends State<FourExample> {

  var data;
  Future<void> getUserApi() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data= jsonDecode(response.body.toString());


    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot){
              if(snapshot.connectionState== ConnectionState.waiting){
                return Text('Loading....');

              }else{
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index){
                  return Card(
                    child:Column(
                      children: [
                        ReusableRow(title: 'name', value: data[index]['name'].toString()),
                        ReusableRow(title: 'username', value: data[index]['username'].toString()),
                        ReusableRow(title: 'address', value: data[index]['address']['city'].toString()),
                        ReusableRow(title: 'lat', value: data[index]['address']['geo']['lat'].toString()),

                      ],
                    ) ,
                  );
                });
              }
            }),
          )

        ],
      ),
    );
  }
}
class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    ) ;
  }
}