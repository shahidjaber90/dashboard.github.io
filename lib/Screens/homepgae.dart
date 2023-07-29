import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:singleclub/Local_variables/navigationData.dart';
import 'package:singleclub/Utils/colors.dart';
import 'package:singleclub/Widgets/side_navigation_bar.dart';
import 'package:singleclub/Widgets/users_layout_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Left Navigation Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 300,
                  color: ColorConstant.searchColor,
                  child: const SideNavigationBar(),
                ),
              ),
              // Other Data
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // App Bar
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 1000,
                        // color: Colors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 45,
                              width: 225,
                              // color: Colors.yellow,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide.none),
                                    fillColor: ColorConstant.searchColor,
                                    filled: true,
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Search or type'),
                              ),
                            ),
                            Text(
                              ' (${DateFormat('hh:mm').format(selectedDate)})  ${DateFormat('EEEE').format(selectedDate)} ${DateFormat(' dd/MM/yyyy').format(selectedDate)}',
                              style: GoogleFonts.beVietnamPro(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  color: ColorConstant.blueColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Container(
                                      width: 230,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LineIcon(
                                            Icons.notifications,
                                            color: ColorConstant.blueColor,
                                            size: 32,
                                          ),
                                          LineIcon(
                                            Icons.email,
                                            color: ColorConstant.blueColor,
                                            size: 32,
                                          ),
                                          LineIcon.whatSApp(
                                            color: ColorConstant.blueColor,
                                            size: 32,
                                          ),
                                          LineIcon(
                                            Icons.calendar_month,
                                            color: ColorConstant.blueColor,
                                            size: 32,
                                          ),
                                          LineIcon(
                                            Icons.settings,
                                            color: ColorConstant.blueColor,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // profile select
                                  const SizedBox(width: 50),
                                  Container(
                                    width: 220,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/user.png'))),
                                        ),
                                        Text(
                                          "King of King’s",
                                          style: GoogleFonts.beVietnamPro(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: ColorConstant.blueColor),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ColorConstant.arrowColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // after App Bar
                    Row(
                      children: [
                        // Center Page Content
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: 620,
                            color: ColorConstant.whiteColor,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 46,
                                      width: 155,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.searchColor,
                                          border: Border.all(
                                              color: ColorConstant.arrowColor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Last 30 Days',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    ColorConstant.arrowColor),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: ColorConstant.arrowColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: GridView.builder(
                                    itemCount: 20,
                                    padding: const EdgeInsetsDirectional.all(8),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 16.0,
                                            mainAxisSpacing: 12.0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstant.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorConstant.blueColor
                                                      .withOpacity(0.30),
                                                  offset: const Offset(1, 2.0),
                                                  blurRadius: 2.0,
                                                  spreadRadius: 0.0),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/icons/${navigationData[index]['icon']}',
                                                scale: 0.6,
                                              ),
                                              Text(
                                                  '${navigationData[index]['count']}'),
                                              Text(
                                                '${navigationData[index]['title']}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Right Users Content
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: 380,
                            child: UsersLayout(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
