import 'package:flutter/material.dart';

class Actualhome extends StatelessWidget {
  List data = ["Action", "Drama", "Comedy"];
  List items = [
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"],
    ["Action", "I'll kill you hehe", "images/action.jpg"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("images/logo.png", height: 200)),
              const Center(
                  child: Text(
                "Audio books",
                style: TextStyle(fontSize: 25),
              )),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[i],
                            style: TextStyle(fontSize: 20),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var i in items)
                                Row(

                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      splashColor: Color(0xff8B0000),
                                      child: SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                i[2],
                                                height: 100,
                                                width: 150,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                  child:
                                                      Text(i[1]))
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      );
  }
}
