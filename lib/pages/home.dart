import 'package:animate_do/animate_do.dart';
import 'package:day35/models/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Service> services = [
    Service('healthy', 'https://static.vecteezy.com/system/resources/previews/000/353/829/original/vector-health-icon.jpg'),
    Service('milk', 'https://png.pngtree.com/png-vector/20240909/ourmid/pngtree-refreshing-milk-splash-with-bottle-png-image_13757755.png'),
    Service('sayur', 'https://www.bing.com/images/search?view=detailV2&ccid=zcofUkUw&id=9F99762E85C453A9C4AD2BAB1A5E2167D35445C9&thid=OIP.zcofUkUw2oacCaVJYfPGxwHaEA&mediaurl=https%3a%2f%2fw7.pngwing.com%2fpngs%2f124%2f133%2fpng-transparent-vegetarian-cuisine-vegetable-eating-fruit-health-vegetable-natural-foods-leaf-vegetable-food.png&exph=497&expw=920&q=sayur.png&FORM=IRPRST&ck=8AA3EFEEB8CD700D375C6AC3A9ED9512&selectedIndex=0&itb=0'),
    Service('bugar', 'https://th.bing.com/th/id/OIP.263nryZv0lUoqmi1RAcIkAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('Donor', 'https://tse3.mm.bing.net/th/id/OIP.QbMXkC8TK5_V-lJGfSbGdAHaGR?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'),
    Service('panjang umur', 'https://th.bing.com/th/id/OIP.xmMJqKrMYSxhIEdw7FwmbgHaD4?w=273&h=180&c=7&r=0&o=7&pid=1.7&rm=3'),
  ];

  List<dynamic> workers = [
    ['Nurdin', 'Dokter jantung', 'https://th.bing.com/th/id/OIP.LTPg2_qJ4mw0_r65KYKfpgHaGy?w=197&h=180&c=7&r=0&o=7&pid=1.7&rm=3', 4.8],
    ['Slamet', 'Dokter bedah', 'https://th.bing.com/th/id/OIP.eilZCOOCfcAq6UMTFrPpuAHaEK?w=333&h=187&c=7&r=0&o=7&pid=1.7&rm=3', 4.6],
    ['Samsul', 'Dokter umum', 'https://cdn.harian.news/imageresize/assets/media/upload/2023/12/Photo_1703353256359.jpg&width=640&height=360', 4.4]
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Dashboard', style: TextStyle(color: Colors.black),),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications_none, color: Colors.grey.shade700, size: 30,),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://uifaces.co/our-content/donated/NY9hnAbp.jpg'),
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInUp(child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('View all',)
                  )
                ],
              ),
            )),
            FadeInUp(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0, 4),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network('data:image/jpeg;base64,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', width: 70,)
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Isabel Kirkland", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text("Cleaner", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Center(child: Text('View Profile', style: TextStyle(color: Colors.white, fontSize: 18),)),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(height: 20,),
            FadeInUp(child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('View all',)
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
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
            SizedBox(height: 20,),
            FadeInUp(child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Rated', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('View all',)
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workers.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInUp(
                    delay: Duration(milliseconds: 500 * index),
                    child: workerContainer(workers[index][0], workers[index][1], workers[index][2], workers[index][3]));
                }
              ),
            ),
            SizedBox(height: 150,),
          ]
        )
      )
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: 45),
            SizedBox(height: 20,),
            Text(name, style: TextStyle(fontSize: 15),)
          ]
        ),
      ),
    );
  }

  workerContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(image)
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(job, style: TextStyle(fontSize: 15),)
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rating.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Icon(Icons.star, color: Colors.orange, size: 20,)
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}