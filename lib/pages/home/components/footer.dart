import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'dart:html' as html;

final List<FooterItem> footerItems = [
  FooterItem(
      iconPath: "assets/images/phone.png",
      title: "PHONE",
      text1: "+251 941726567",
      onTap: () {
        html.window.open("tel:+251941726567", "phone");
      }),
  FooterItem(
    iconPath: "assets/images/telegram.png",
    title: "TELEGRAM",
    text1: "@bnym112",
    onTap: () {
      html.window.open("https://t.me/BNYM112", "telegram");
    },
  ),
  FooterItem(
      iconPath: "assets/images/email.png",
      title: "EMAIL",
      text1: "biniyamdemissew112@gmail.com",
      text2: "biniyamluna112@gmail.com",
      onTap: () {
        html.window.open("mailto:biniyamdemissew112@gmail.com", "email");
      }),
  FooterItem(
    iconPath: "assets/images/whatsapp.png",
    title: "WHATSAPP",
    text1: "+251 941726567",
    onTap: () {
      html.window.open("https://wa.me/+251941726567", "whatsapp");
    },
  )
];

final List<String> techStacks = [];

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("footer"),
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveConstraints(
      constraint: BoxConstraints(
        maxWidth: width,
        minWidth: width,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: footerItem.onTap,
                                        child: Text(
                                          "${footerItem.text1}\n",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (footerItem.text2 != null)
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: footerItem.onTap,
                                          child: Text(
                                            "${footerItem.text2}\n",
                                            style: TextStyle(
                                              color: kCaptionColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      "© 2024 Biniyam Demissew. Made with Flutter & ❤️.",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      techStacks.length,
                      (index) => _techStack(context, isLast: index == techStacks.length - 1),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}

Widget _techStack(BuildContext context, {bool isLast = true}) {
  return Row(
    children: [
      SvgPicture.network("url"),
      if (!isLast)
        GestureDetector(
          onTap: () {},
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "|",
                style: TextStyle(
                  color: kCaptionColor,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}
