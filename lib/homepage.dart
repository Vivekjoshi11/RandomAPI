import 'dart:convert';

import 'user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shopapi/user.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Random user API call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final user = users[index];
          // final name = users[index];
          // final email = user.email;
          // final color = user.gender == 'male' ? Colors.blue : Colors.green;
        return ListTile(
       title: Text(user.name.first),
       subtitle: Text(user.phone),
      //  tileColor: color,
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: fetchUsers,
        focusColor: Colors.blueAccent,
      ),
    );
  }

  void fetchUsers() async{
    // print('fetch users');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    // ignore: non_constant_identifier_names
    final Transformed = results.map((e){
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender:  e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        
      );
    }).toList();
    setState(() {
      users = Transformed;
    });
    // print('done');
  }
}