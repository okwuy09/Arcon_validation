// import 'dart:math';
import 'dart:math';

import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/view/homepage/qrcode_sheet.dart';
import 'package:arcon_app/view/homepage/reqistration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool registered = true;
  bool isAdmin = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.white,
          surfaceTintColor: AppColor.white,
          toolbarHeight: size.width < 800 ? 60 : 100,
          elevation: 0,
          centerTitle: true,
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () => {},
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.darkgrey,
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(
              width: size.width / 12,
            ),
          ],
          title: Image.asset(
            'assets/logo.jpg',
            height: size.width < 800 ? 65 : 100,
            width: size.width < 800 ? 65 : 100,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      'PROGRAMS',
                      style: style.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColor.black.withOpacity(0.8),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 20,
                ),
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => GestureDetector(
                    //onTap: () => setState(() {}),
                    child: Container(
                      width: size.width,
                      height: size.width < 800 ? 145 : 160,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 9,
                      ),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 3.0,
                          color: AppColor.primaryColor.withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkgrey,
                            offset: const Offset(0.0, 1.0), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'ARCON memebers conference, on important of treatment of cancer and prevention',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Divider(
                              thickness: 2,
                              color: AppColor.black.withOpacity(0.2)),

                          Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5 jan, 2023',
                                style: style.copyWith(
                                  fontSize: 12.5,
                                  color: AppColor.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Enugu',
                                style: style.copyWith(
                                  fontSize: 12.5,
                                  color: AppColor.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Expanded(child: Container()),
                              isAdmin
                                  ? InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/deleteicon.png',
                                        height: 20,
                                        width: 20,
                                        color: AppColor.primaryColor,
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(
                                width: 20,
                              ),
                              registered
                                  ? InkWell(
                                      onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return const QRCodeSheet();
                                        },
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.qr_code_2,
                                              color: AppColor.white,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'QR',
                                              style: style.copyWith(
                                                fontSize: 12,
                                                color: AppColor.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) =>
                                              const RegistrationScreen(),
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          'Register Here',
                                          style: style.copyWith(
                                            fontSize:
                                                size.width < 800 ? 12 : 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
