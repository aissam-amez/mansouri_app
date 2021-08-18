import 'package:flutter/material.dart';
import 'package:mansouri/components/circles.dart';
import 'package:connectivity/connectivity.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future connectivityResult;

  @override
  void initState() {
    super.initState();
    connectivityResult = Connectivity().checkConnectivity();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: connectivityResult,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == ConnectivityResult.mobile ||
                    snapshot.data == ConnectivityResult.wifi) {
                  return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Circle(
                                    background: "assets/images/menara.jpg",
                                    label: 'مراكش الغد',
                                    avatar: 'assets/images/user_circle.png'),
                                Circle(
                                    background: "assets/images/jmf_j.jpg",
                                    label: 'المسار',
                                    avatar: 'assets/images/user_circle.png'),
                              ],
                            )),
                            Container(
                                child: Row(
                              children: [
                                Circle(
                                    background: "assets/images/jmf_n.jpg",
                                    label: 'المنجزات',
                                    avatar: 'assets/images/user_circle.png'),
                                Circle(
                                    background: "assets/images/koutchi.jpg",
                                    label: 'المنصة',
                                    avatar: 'assets/images/user_circle.png'),
                              ],
                            )),
                          ],
                        ),
                      )));
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'المرجو الإتصال بالشبكة !!!',
                          style: TextStyle(fontSize: 20),
                          textDirection: TextDirection.rtl,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.cyan[800]),
                              onPressed: () {
                                setState(() {
                                  connectivityResult =
                                      Connectivity().checkConnectivity();
                                });
                              },
                              child: Text('تحديث')),
                        )
                      ],
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('ثدوث غلط أثناء محاولة التأكد من الإتصال بالشبكة !!!'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
