import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:day35/models/service.dart';
import 'package:day35/pages/select_service.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({ Key? key }) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<Service> services = [
    Service('healthy', 'https://static.vecteezy.com/system/resources/previews/000/353/829/original/vector-health-icon.jpg'),
    Service('milk', 'https://png.pngtree.com/png-vector/20240909/ourmid/pngtree-refreshing-milk-splash-with-bottle-png-image_13757755.png'),
    Service('sayur', 'https://www.bing.com/images/search?view=detailV2&ccid=zcofUkUw&id=9F99762E85C453A9C4AD2BAB1A5E2167D35445C9&thid=OIP.zcofUkUw2oacCaVJYfPGxwHaEA&mediaurl=https%3a%2f%2fw7.pngwing.com%2fpngs%2f124%2f133%2fpng-transparent-vegetarian-cuisine-vegetable-eating-fruit-health-vegetable-natural-foods-leaf-vegetable-food.png&exph=497&expw=920&q=sayur.png&FORM=IRPRST&ck=8AA3EFEEB8CD700D375C6AC3A9ED9512&selectedIndex=0&itb=0'),
    Service('bugar', 'https://th.bing.com/th/id/OIP.263nryZv0lUoqmi1RAcIkAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('Donor', 'https://tse3.mm.bing.net/th/id/OIP.QbMXkC8TK5_V-lJGfSbGdAHaGR?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('panjang umur', 'https://th.bing.com/th/id/OIP.xmMJqKrMYSxhIEdw7FwmbgHaD4?w=273&h=180&c=7&r=0&o=7&pid=1.7&rm=3'),
  ];

  int selectedService = 4;

  @override
  void initState() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) { 
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInUp(
                  delay: Duration(milliseconds: index * 100),
                  child: serviceContainer(services[index].imageURL, services[index].name, index));
              }
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  FadeInUp(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Text(
                        'Selamat datang di PEDULI SEHAT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(height: 20,),
                  FadeInUp(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Center(
                      child: Text(
                        'kita akan membantu anda selamat sampai pulang ke rumah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )),
                  FadeInUp(child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: MaterialButton(
                      elevation: 0,
                      color: Colors.black,
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectService(),
                          ),
                        );
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'Mulai',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: 30),
            SizedBox(height: 10,),
            Text(name, style: TextStyle(fontSize: 14),)
          ]
        ),
      ),
    );
  }
}
