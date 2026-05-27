import 'package:animate_do/animate_do.dart';
import 'package:day35/models/service.dart';
import 'package:day35/pages/cleaning.dart';
import 'package:flutter/material.dart';

class SelectService extends StatefulWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  List<Service> services = [
    Service('healthy', 'https://static.vecteezy.com/system/resources/previews/000/353/829/original/vector-health-icon.jpg'),
    Service('milk', 'https://png.pngtree.com/png-vector/20240909/ourmid/pngtree-refreshing-milk-splash-with-bottle-png-image_13757755.png'),
    Service('sayur', 'https://www.bing.com/images/search?view=detailV2&ccid=zcofUkUw&id=9F99762E85C453A9C4AD2BAB1A5E2167D35445C9&thid=OIP.zcofUkUw2oacCaVJYfPGxwHaEA&mediaurl=https%3a%2f%2fw7.pngwing.com%2fpngs%2f124%2f133%2fpng-transparent-vegetarian-cuisine-vegetable-eating-fruit-health-vegetable-natural-foods-leaf-vegetable-food.png&exph=497&expw=920&q=sayur.png&FORM=IRPRST&ck=8AA3EFEEB8CD700D375C6AC3A9ED9512&selectedIndex=0&itb=0'),
    Service('bugar', 'https://th.bing.com/th/id/OIP.263nryZv0lUoqmi1RAcIkAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('Donor', 'https://tse3.mm.bing.net/th/id/OIP.QbMXkC8TK5_V-lJGfSbGdAHaGR?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('panjang umur', 'https://th.bing.com/th/id/OIP.xmMJqKrMYSxhIEdw7FwmbgHaD4?w=273&h=180&c=7&r=0&o=7&pid=1.7&rm=3'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CleaningPage(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios, size: 20,),
        backgroundColor: Colors.blue,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeInUp(child: Padding(
                padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  'Which service \ndo you need?',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInUp(
                      delay: Duration(milliseconds: 500 * index),
                      child: serviceContainer(services[index].imageURL, services[index].name, index));
                  }
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.blue : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: 80),
            SizedBox(height: 20,),
            Text(name, style: TextStyle(fontSize: 20),)
          ]
        ),
      ),
    );
  }
}