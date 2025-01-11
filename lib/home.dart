import 'package:flutter/material.dart';
import 'package:demo_app_rr/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Item> data = [
    Item(name: 'Badminton', imgUrl: 'assets/images/badminton.jpg', description: 'In Good Working Conditions', rentStatus: true, saleStatus: false, price: 400.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Demo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 230,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {

            String rentMsg = data[index].rentStatus ? 'On Rent' : 'Not On Rent';
            String saleMsg = data[index].saleStatus ? 'On Sale' : 'Not On Sale';

            return GestureDetector(
              onTap: () {
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          data[index].name,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        height: 80,
                        child: Image.asset(
                          'assets/images/badminton.jpg',
                          fit: BoxFit.fitWidth,

                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        rentMsg,
                      ),
                      Text(
                          saleMsg,
                      ),
                      Text(
                          '${data[index].price} INR',
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
