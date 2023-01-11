import 'package:flutter/material.dart';
import 'package:shoea_admin/presentation/screens/allProduct/all_product.dart';
import 'package:shoea_admin/presentation/screens/productside/categories/categorylist.dart';
import 'package:shoea_admin/presentation/screens/user%20Side/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Shoea Admin'),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => Home(),
          //       ));
          //     },
          //     icon: Icon(Icons.abc_outlined)),
        ),
        body: SafeArea(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Userside(),
                )),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black),
                    child: const Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Raleway',
                              color: Colors.white,
                            ),
                            'Users'))),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoryList())),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black,
                    ),
                    child: const Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Font1",
                              color: Colors.white,
                            ),
                            'Product side'))),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Allproduct())),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black,
                    ),
                    child: const Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Font1",
                              color: Colors.white,
                            ),
                            'All Product'))),
              ),
            ],
          ),
        ));
  }
}
