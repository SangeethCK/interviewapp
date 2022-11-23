import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Learn and Evolve',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 200,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffb37ef1)),
                  child: Column(
                    children: const [
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Become \nmaster in Data \nScience',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'By Asif Abhraham',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Featured Course',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('name')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var doc;
                              doc = snapshot.data!.docs[index].data();
                              return Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                height: 250,
                                width: 200,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.white, spreadRadius: 5)
                                ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/flutter.png'),
                                    Text(doc['course']),
                                    Row(
                                      children: [
                                        const Icon(Icons.person),
                                        Text(doc['name']),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          doc['price'],
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          '₹',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 100,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide
                                                                  .none)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0XFFb37ef1))),
                                              onPressed: () {},
                                              child: const Text('Best Seller')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }),
                Image.asset('assets/images/aef.jpg')
              ],
            ),
            Positioned(
              top: 35,
              height: 150,
              child: Image.asset('assets/images/asif.png'),
            )
          ],
        ),
      ),
    );
  }
}
