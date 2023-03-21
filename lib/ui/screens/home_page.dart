import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/recommended_tab.dart';
import 'package:flutter_onboarding/ui/screens/widgets/autoCompleteField.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //Plants category
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                width: size.width * .9,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: /*AutocompleteField(
                    Plant.plantList
                  .map((e) => e.plantName)
                  .toSet()
                  .toList(),
                    suffixIcon: IconButton(
                icon: Icon(Icons.mic,
                    color: Colors.black54.withOpacity(.6)),
                onPressed: () {},
                    ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54.withOpacity(.6),
                  ),
                  )*/

                AutocompleteFormField(

                   list : Plant.plantList
                        .map((e) => e.plantName)
                        .toSet()
                        .toList(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.mic,
                          color: Colors.black54.withOpacity(.6)),
                      onPressed: () {},
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54.withOpacity(.6),
                    ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 35,
          child: TabBar(
            tabs: [
              Tab(text: "Recommended"),
              Tab(text: "Indoor"),
              Tab(text: "Outdoor"),
              Tab(text: "Garden"),
            ],
            controller: tabController,
            labelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 16),
            // physics: ScrollPhysics(),
            isScrollable: true,
          ),
          // child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: _plantTypes.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedIndex = index;
          //           });
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //
          //             children: [
          //               Text(
          //                 _plantTypes[index],
          //                 style: GoogleFonts.montserrat(
          //                   fontSize: 16.0,
          //                   fontWeight: FontWeight.bold,
          //                   color: selectedIndex == index
          //                       ? Constants.primaryColor
          //                       : Constants.blackColor,
          //                 ),
          //               ),
          //               Container(
          //                 height: 3,
          //                 margin: EdgeInsets.only(top: 5),
          //                 width: 40,
          //                 color: selectedIndex == index
          //                     ? Colors.green.shade900
          //                     : Colors.transparent,
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
        ),
        SizedBox(
          height: 0,
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              // Container(color: Colors.grey,),
              Recommended(Plant.plantList),
              Recommended(indoor()),
              Recommended(outdoor()),
              Recommended(garden()),
            ],
          ),
        )
        // SizedBox(
        //   height: size.height * .3,
        //   child: ListView.builder(
        //       itemCount: _plantList.length,
        //       scrollDirection: Axis.horizontal,
        //       physics: const BouncingScrollPhysics(),
        //       itemBuilder: (BuildContext context, int index) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => DetailPage(
        //                     plantId: _plantList[index].plantId,
        //                   ),
        //                 ));
        //           },
        //           child: Container(
        //             width: 220,
        //             margin: const EdgeInsets.symmetric(horizontal: 10),
        //             decoration: BoxDecoration(
        //               color: Constants.primaryColor.withOpacity(.6),
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: Stack(
        //               children: [
        //                 Positioned(
        //                   top: 10,
        //                   right: 20,
        //                   child: Container(
        //                     height: 50,
        //                     width: 50,
        //                     decoration: BoxDecoration(
        //                       color: Colors.white54,
        //                       borderRadius: BorderRadius.circular(20),
        //                     ),
        //                     child: IconButton(
        //                       onPressed: () {
        //                         setState(() {
        //                           bool isFavorited = toggleIsFavorated(
        //                               _plantList[index].isFavorated);
        //                           _plantList[index].isFavorated = isFavorited;
        //                         });
        //                       },
        //                       icon: Icon(
        //                         _plantList[index].isFavorated == true
        //                             ? Icons.favorite
        //                             : Icons.favorite_border,
        //                         color: Constants.primaryColor,
        //                       ),
        //                       iconSize: 30,
        //                     ),
        //                   ),
        //                 ),
        //                 Positioned(
        //                   left: 50,
        //                   right: 50,
        //                   top: 50,
        //                   bottom: 50,
        //                   child: Hero(
        //                       tag: "plant${_plantList[index].imageURL}",
        //                       transitionOnUserGestures: true,
        //                       child: Image.asset(_plantList[index].imageURL)),
        //                 ),
        //                 Positioned(
        //                   bottom: 15,
        //                   left: 20,
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         _plantList[index].category,
        //                         style: GoogleFonts.montserrat(
        //                           color: Colors.white70,
        //                           fontWeight: FontWeight.w500,
        //                           fontSize: 15,
        //                         ),
        //                       ),
        //                       Text(
        //                         _plantList[index].plantName,
        //                         style: GoogleFonts.montserrat(
        //                           color: Colors.white70,
        //                           fontSize: 17,
        //                           fontWeight: FontWeight.w800,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 Positioned(
        //                   bottom: 15,
        //                   right: 20,
        //                   child: Container(
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 10, vertical: 2),
        //                     decoration: BoxDecoration(
        //                       color: Colors.white54,
        //                       borderRadius: BorderRadius.circular(10),
        //                     ),
        //                     child: Text(
        //                       r'$' + _plantList[index].price.toString(),
        //                       style: GoogleFonts.montserrat(
        //                           color: Constants.primaryColor,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 16),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       }),
        // ),
        // Container(
        //   padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
        //   child: Text(
        //     'New Plants',
        //     style: GoogleFonts.montserrat(
        //       color: Colors.green.shade900,
        //       fontWeight: FontWeight.w800,
        //       fontSize: 18.0,
        //     ),
        //   ),
        // ),
        // ListView.builder(
        //     itemCount: _plantList.length,
        //     shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemBuilder: (BuildContext context, int index) {
        //       return PlantWidget(index: index, plantList: _plantList);
        //     }),
      ],
    ));
  }

  List<Plant> indoor() {
    List<Plant> j = [];
    for (Plant i in Plant.plantList) {
      if (i.category == 'Indoor') {
        j.add(i);
      }
    }
    return j;
  }

  List<Plant> outdoor() {
    List<Plant> j = [];
    for (Plant i in Plant.plantList) {
      if (i.category == 'Outdoor') {
        j.add(i);
      }
    }
    return j;
  }

  List<Plant> garden() {
    List<Plant> j = [];
    for (Plant i in Plant.plantList) {
      if (i.category == 'Garden') {
        j.add(i);
      }
    }
    return j;
  }
}
