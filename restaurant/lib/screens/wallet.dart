import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Colours.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/screens/MenuScreen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colours.lightdark,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Track",
                  style: GoogleFonts.davidLibre(
                      fontSize: 45,
                      color: Colours.yellow,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your order",
                  style: GoogleFonts.davidLibre(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
               haveOrder? StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("orders")
                        .doc(code_all!.toString())
                        .collection("orderDetails")
                        .snapshots(),
                    builder: (context, productsnapshot) {
                      if (productsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var OrderedList = productsnapshot.data!.docs;
                      return OrderedList.length>0? ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: OrderedList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Slidable(
                                  key: UniqueKey(),
                            endActionPane: ActionPane(
                              key: UniqueKey(),
                              // dismissible: DismissiblePane(onDismissed: () {}),
                              dismissible:!OrderedList[index]['isComplete']? DismissiblePane(onDismissed: () {
                                FirebaseFirestore.instance
                        .collection("orders")
                        .doc(code_all)
                        .collection("orderDetails").doc(OrderedList[index].id).delete();
                              }):null,
                              motion:DrawerMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.

                                  flex: 2,
                                  onPressed: null,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colours.yellow,
                                  icon: Icons.delete_outline_rounded,
                                  label: 'Remove',
                                ),
                              ],
                            ),
                              child: Container(
                                 margin: EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 120,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 120,
                                      child: Center(
                                        child: OrderedList[index]['isComplete']?Icon(Icons.check_circle,size: 40,color:Colors.green[600]):Icon(Icons.check_circle_outline_rounded,size: 40,color:Colours.dark),
                                      ),
                                    ),
                                    Container(
                                     width: MediaQuery.of(context).size.width/1.4,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 50, 51, 51),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          
                                          color: Colours.dark,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(15))),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 11),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                         Image.network(OrderedList[index]['img'],width: 90,height: 90,),
                                                    SizedBox(width: 6,),
                                                    Text("X",style: TextStyle(fontSize:25,color: Colours.yellow)),
                                                    SizedBox(width: 5,),
                                                    Text(OrderedList[index]['qty'].toString(),style: TextStyle(fontSize:40,color: Colours.yellow))
                                                      ],
                                                    ),
                                                   Text("Rs. "+OrderedList[index]['rs'].toString(),style: TextStyle(fontSize:21,color: Colors.white))
                                                  ],
                                                ),
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }):Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/png/fryingpan.png',width: 300,height: 300,),
                    ),

                    Text(
                  "No order yet",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colours.yellow,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "You're cart is empty",
                  style:  TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Add something from the menu",
                  style:  TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                  ],
                );
                    })
                :Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/png/fryingpan.png',width: 300,height: 300,),
                    ),

                    Text(
                  "No order yet",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colours.yellow,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "You're cart is empty",
                  style:  TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Add something from the menu",
                  style:  TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
