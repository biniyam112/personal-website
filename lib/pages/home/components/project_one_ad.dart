import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'dart:html' as html;

import '../../../stateManagement/navigate_to_content.dart';
import '../../../utils/scroll_to_section.dart';

class ProjectOneAd extends StatelessWidget {
  ProjectOneAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        key: Key("ios_app_ad"),
        desktop: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: _buildUi(kDesktopMaxWidth, context),
        ),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    final navigateToContent = Provider.of<NavigateToContent>(context);

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveConstraints(
            constraint: BoxConstraints(
              maxWidth: width,
              minWidth: width,
            ),
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child:
                        //  SvgPicture.asset(
                        //   "assets/images/Mockup-Illustration.svg",
                        //   // Set width for image on smaller screen
                        //   width: constraints.maxWidth > 720.0 ? null : 350.0,
                        // ),
                        Image.asset(
                      "assets/images/Mockup-Illustration.png",
                      // Set width for image on smaller screen
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FLUTTER APP",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "RateEat",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "RateEat is a mobile app designed to connect food lovers with the best dining experiences. Users can discover, review, and recommend restaurants while sharing their culinary experiences with a community of fellow diners. The app also integrates online ordering and payment, making it easy to enjoy meals from favorite spots.",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    html.window.open(
                                      "https://play.google.com/store/apps/details?id=org.a2sv.rateeat_mobile&hl=en_US",
                                      '_blank',
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28.0,
                                      vertical: 12,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "EXPLORE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    navigateToContent.navigateTo(PageContent.project2);
                                    scrollToSection(navigateToContent.currentKey);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28.0,
                                      vertical: 12,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "NEXT PROJECT",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
