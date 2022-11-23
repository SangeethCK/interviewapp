import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Learn and Evolve',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 157,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffb37ef1)),
                    child: Column(
                      children: const [
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: Text(
                            'Become \nmaster in Data \nScience',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 75),
                          child: Text(
                            'By Asif Abhraham',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
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
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return SizedBox(
                          height: 260,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var doc;
                                doc = snapshot.data!.docs[index].data();
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  height: 220,
                                  width: 250,
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, spreadRadius: 5)
                                  ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(doc['image']),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(doc['course']),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    doc['name'],
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            doc['price'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0XFFb37ef1)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            '₹',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0XFFb37ef1)),
                                          ),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            height: 30,
                                            width: 120,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    18.0),
                                                            side: BorderSide
                                                                .none)),
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            const Color(
                                                                0XFFb37ef1))),
                                                onPressed: () {},
                                                child:
                                                    const Text('Best Seller')),
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
                height: 180,
                child: Image.asset('assets/images/asif.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
