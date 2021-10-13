import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitify/ui/screens/user_details_screen.dart';
import 'package:gitify/ui/widgets/username_search.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController _usernameController = new TextEditingController();
  // final GlobalKey<FormState> _formkey = GlobalKey();

  // void submit() {
  //   if (!_formkey.currentState!.validate()) {
  //     return;
  //   }
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (ctx) =>
  //           UserDetailsScreen(username: _usernameController.text)));
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          backwardsCompatibility: false,
          brightness: Brightness.light,
          title: Center(
            child: Text(
              'Gitify',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 25,
                letterSpacing: .2,
              ),
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.lightbulb),
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeTheme(ThemeData.light())
                      : Get.changeTheme(ThemeData.dark());
                })
          ],
        ),
        body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                UserNameSearch(),
                SizedBox(
                              height: 20,
                            ),
                
                Container(
                margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 40),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Image.asset(
                                  'assets/images/SearchImage.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                ]
                )
              ),
        )
    );
    
                // padding: EdgeInsets.all(10),
                // child: Column(children: <Widget>[
                //   Form(
                //       key: _formkey,
                //       child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             SizedBox(
                //               height: 15,
                //             ),

                            //seach textfiled
                            // TextFormField(
                            //     controller: _usernameController,
                            //     textAlignVertical: TextAlignVertical.center,
                            //     style: TextStyle(color: Colors.black),
                            //     textInputAction: TextInputAction.search,
                            //     validator: (value) {
                            //       if (value!.isEmpty) {
                            //         return "Please write Something";
                            //       }
                            //     },
                            //     onFieldSubmitted: (ctx) {
                            //       submit();
                            //     },
                            //     decoration: InputDecoration(
                            //       focusedBorder: OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.black)),
                            //       isCollapsed: true,
                            //       contentPadding: EdgeInsets.zero,

                            //       prefixIcon: Icon(Icons.search),
                            //       suffix: IconButton(
                            //         alignment: Alignment.center,
                            //         icon: Icon(Icons.clear),
                            //         onPressed: () =>
                            //             _usernameController.clear(),
                            //       ),
                            //       // contentPadding: EdgeInsets.all(5.0),
                            //       //contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            //       //hintText: "Search with GitHub Username",
                            //       labelText: "Search with GitHub Username",
                            //       labelStyle: TextStyle(
                            //         color: Colors.black,
                            //       ),
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.red,
                            //           width: 2.0,
                            //         ),
                            //         borderRadius: BorderRadius.all(
                            //           Radius.circular(15.0),
                            //         ),
                            //       ),
                            //     )),
                            
                            
                            // SizedBox(
                            //   height: 15,
                            // ),
                            // // ignore: deprecated_member_use
                            // Container(
                            //   width: double.infinity,
                            //   margin: EdgeInsets.symmetric(
                            //       horizontal: 80, vertical: 5),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(50),
                            //     color: Colors.amber,
                            //   ),
                            //   child: MaterialButton(
                            //       onPressed: () {
                            //         submit();
                            //       },
                            //       child: Text(
                            //         'Check',
                            //         style: TextStyle(
                            //             color: Colors.black, fontSize: 18),
                            //       )
                            //    ),
                            // ),

                          //   SizedBox(
                          //     height: 20,
                          //   ),

                          //   Container(
                          //     margin: EdgeInsets.only(
                          //         left: 10, right: 10, bottom: 10, top: 40),
                          //     child: Padding(
                          //       padding: EdgeInsets.all(20),
                          //       child: Image.asset(
                          //         'assets/images/SearchImage.png',
                          //         fit: BoxFit.contain,
                          //       ),
                          //     ),
                          //   ),
                          //   SizedBox(
                          //     height: 40,
                          //   ),
                          // ])
                           // )
                // ]))
                
                //)));

// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final searchUsername = TextFormField(
//         autofocus: false,
//         keyboardType: TextInputType.text,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Username");
//           }
//         },
//         // onSaved: (value) {}
//         // textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.done),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Search with GitHub Username",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amberAccent,
//           backwardsCompatibility: false,
//           brightness: Brightness.light,
//           title: Center(
//             child: Text(
//               'Gitify',
//               style: GoogleFonts.roboto(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 25,
//                 letterSpacing: .2,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.lightbulb),
//                 onPressed: () {
//                   Get.isDarkMode
//                       ? Get.changeTheme(ThemeData.light())
//                       : Get.changeTheme(ThemeData.dark());
//                 })
//           ],
//         ),
//         body: Center(
//             child: SingleChildScrollView(
//                 child: Container(
//                     color: Colors.white,
//                     child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               // SizedBox(
//                               //   height: 10,
//                               // ),
//                               searchUsername,
//                             ]))))));
//   }
// }

// Widget buildSearch() => SearchWidget(

//     );
  }
}
