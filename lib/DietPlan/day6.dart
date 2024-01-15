
// ignore_for_file: use_key_in_widget_constructors

import 'package:fitness/DietPlan/Bullet.dart';
import 'package:flutter/material.dart';

class DaySix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saturday"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  text: '',
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(text: 'VEG', style: TextStyle(color: Colors.orange,fontSize: 28)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Breakfast',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text(
                      '1 cup of tea or black coffee without sugar and milk'),
                ),
              ),
              Card(
                child:   ListTile(
                  leading: MyBullet(),
                  title: const Text('Oatmeal porridge'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Lunch',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title:
                  const Text('2 pieces of whole-grain toast with vegetables.'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text('Smoothie or low-fat yogurt'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Snacks',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child:  ListTile(
                  leading: MyBullet(),
                  title: const Text('Any no-salted nuts'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text('1 piece of cheese'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Dinner',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child:  ListTile(
                  leading: MyBullet(),
                  title: const Text('Cooked or baked beans'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text('Oatmeal porridge'),
                ),
              ),
              const SizedBox(height: 50),
              RichText(
                text: const TextSpan(
                  text: 'NON-',
                  style: TextStyle(color: Colors.white,fontSize: 28),
                  children: [
                    TextSpan(text: 'VEG', style: TextStyle(color: Colors.orange,fontSize: 28)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Breakfast',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text(
                      '1 cup of tea or black coffee without sugar and milk'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: MyBullet(),
                  title: const Text('2 scrambled eggs'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Lunch',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child:  ListTile(
                  leading: MyBullet(),
                  title: const Text('Brown rice or noodle.'),
                ),
              ),
              Card(
                child:   ListTile(
                  leading: MyBullet(),
                  title: const Text('Any nonveg soup.'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Snacks',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                child:  ListTile(
                  leading: MyBullet(),
                  title: const Text('Any no-salted nuts'),
                ),
              ),
              Card(
                child:   ListTile(
                  leading: MyBullet(),
                  title: const Text('1 piece of cheese'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    'Dinner',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 30),
                  ),
                ),
              ),
              Card(
                  child:   ListTile(
                    leading: MyBullet(),
                    title: const Text('Cooked or baked beans'),
                  )
              ),
              Card(
                  child:  ListTile(
                    leading: MyBullet(),
                    title: const Text('Any grilled or boiled lean meats.'),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
