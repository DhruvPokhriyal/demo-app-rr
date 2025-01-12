import 'package:flutter/material.dart';
import 'package:demo_app_rr/item.dart';
import 'package:sidebarx/sidebarx.dart';

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
      ),
      endDrawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: [
          SidebarXItem(icon: Icons.home, label: 'Home', onTap: () { print('Home is clicked'); }),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {

                  String rentMsg = data[index].rentStatus ? 'On Rent' : 'Not On Rent';
                  String saleMsg = data[index].saleStatus ? 'On Sale' : 'Not On Sale';

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Container(
                      height: 110,
                      child: GestureDetector(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(data[index].imgUrl),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data[index].name,
                                    ),
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

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          data[index].description,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
