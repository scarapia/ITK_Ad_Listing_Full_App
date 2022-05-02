import 'package:flutter/material.dart';

class ContactSellerScree extends StatefulWidget {
  ContactSellerScree({Key? key}) : super(key: key);

  @override
  State<ContactSellerScree> createState() => _ContactSellerScreeState();
}

class _ContactSellerScreeState extends State<ContactSellerScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(          padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Used Macbook Pro for sale',style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
               /* Text(
                  'Edit',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                */
                SizedBox(height: 15,),
                Text('45000.0',style: TextStyle(color: Colors.orange[900],fontSize: 18,fontWeight: FontWeight.bold), ),

              ],

            ),
),
           
              
                Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    child: Image.asset(
                              'images/apple-macbook-pro-m1.jpeg',
                              fit: BoxFit.cover,
                            ),

                  ),
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Icon(Icons.person),
                     SizedBox(width: 15,),
                      Icon(Icons.timer_sharp),
                      Text('14 days ago'),
                                      

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    SizedBox(height: 15,),
                    Text('Used Mac 2012 for sale with good quality. 500 GB SSD. 8 GB RAM. Space Grey. Mid 2012 Model. Includes charger'),
                    SizedBox(height: 15,),
                    ElevatedButton(
            onPressed: () {
              //Get.to(AdsListingScreen());
            },
            child: Text("Contact Seller"),
            style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 50),
                  primary: Colors.orange[900],
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),

                  ],),
                )
              
            
          ],
        ),
      ),
    );
  }
}
