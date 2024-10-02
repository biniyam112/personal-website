import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

import '../../../../utils/constants.dart';
import 'header_logo.dart';
import 'header_row_desktop.dart';
import 'header_row_tablet.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Container(
        child: ScreenHelper(
          key: Key("header"),
          desktop: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: buildHeader(),
          ),
          tablet: buildTabletHeader(),
          mobile: buildMobileHeader(),
        ),
      ),
    );
  }
}

class ScrolledHeader extends StatelessWidget {
  ScrolledHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kDarkColor,
          boxShadow: [
            BoxShadow(
              color: kDarkColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ScreenHelper(
          key: Key("scrolledHeader"),
          desktop: buildScrolledHeader(),
          tablet: buildTabletHeader(),
          mobile: buildMobileHeader(),
        ),
      ),
    );
  }
}

Widget buildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderLogo(),
        Expanded(
          child: HeaderRowDesktop(),
        ),
      ],
    ),
  );
}

Widget buildScrolledHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeaderLogo(),
          SizedBox(width: 32.0),
          HeaderRowDesktop(),
        ],
      ),
    ),
  );
}

Widget buildTabletHeader() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderLogo(),
        SizedBox(width: 16.0),
        HeaderRowTablet(),
      ],
    ),
  );
}

Widget buildMobileHeader() {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          GestureDetector(
            onTap: () {
              Globals.scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Iconsax.menu,
              color: Colors.white,
              size: 28.0,
            ),
          )
        ],
      ),
    ),
  );
}
