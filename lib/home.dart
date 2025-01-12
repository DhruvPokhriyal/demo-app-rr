import 'package:flutter/material.dart';
import 'package:demo_app_rr/item.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:sidebarx/sidebarx.dart';
import 'dart:ui' as ui;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Item> data = [
    Item(name: 'Badminton', imgUrl: 'assets/images/badminton.jpg', description: 'In Good Working Conditions', rentStatus: true, saleStatus: false, price: 400.0)
  ];
  List<String> carouselImages = ['coca-cola', 'sprite', 'drinks', 'oreo-shake'];



  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      for(String imageName in carouselImages){
        precacheImage('assets/images/$imageName.jpg' as ImageProvider<Object>, context);
      }
    }

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
                child: FlutterCarousel(
                  options: FlutterCarouselOptions(
                    height: 400.0,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(),
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                  ),
                  items: carouselImages.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: Image(
                              image: AssetImage('assets/images/$i.jpg'),
                              fit: BoxFit.cover,
                            ),
                        );
                      },
                    );
                  }).toList(),
                )
            ),
            SizedBox(height: 30.0,),
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
                        onTap: () {
                          print(data[index].name);
                        },
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


