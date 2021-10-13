import 'package:flutter/material.dart';
import 'package:gitify/ui/screens/user_details_screen.dart';
import 'package:gitify/providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';


class UserNameSearch extends StatefulWidget {
  const UserNameSearch({Key? key}) : super(key: key);

  @override
  _UserNameSearchState createState() => _UserNameSearchState();
}

class _UserNameSearchState extends State<UserNameSearch> {
  TextEditingController _usernameController = new TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  void submit() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            UserDetailsScreen(username: _usernameController.text)));
            //UserScreenNew(username: _usernameController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //resizeToAvoidBottomInset: false,
        // body: Center(
        //     child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),

                    //seach textfiled
                    TextFormField(
                        controller: _usernameController,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.search,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please write Something";
                          }
                        },
                        onFieldSubmitted: (ctx) {
                          submit();
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,

                          prefixIcon: Icon(Icons.search),
                          suffix: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.clear),
                            onPressed: () => _usernameController.clear(),
                          ),
                          // contentPadding: EdgeInsets.all(5.0),
                          //contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          //hintText: "Search with GitHub Username",
                          labelText: "Search with GitHub Username",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    //ignore: deprecated_member_use
                    Center(
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.fromLTRB(100, 00, 100, 00),
                        // margin: EdgeInsets.symmetric(
                        //     horizontal: 60, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.amber,
                        ),
                        child: MaterialButton(
                            onPressed: ()   {
                              submit();
                            },
                            child: Text(
                              'Check',
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(
                    //       left: 10, right: 10, bottom: 10, top: 40),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(20),
                    //     child: Image.asset(
                    //       'assets/images/SearchImage.png',
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 40,
                    ),
                  ]))
        ]));
  }
}
