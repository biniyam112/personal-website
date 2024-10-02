import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';

import '../../../stateManagement/navigate_to_content.dart';
import '../../../utils/scroll_to_section.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: (context) {
      final navigateToContent = Provider.of<NavigateToContent>(context);
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Web Developer | UI/UX Designer".toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.fredoka(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Biniyam \nDemissew".toUpperCase(),
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                height: 1.2,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              "Mobile developer and UI/UX designer, based in Ethiopia",
              style: GoogleFonts.plusJakartaSans(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.0,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Wrap(
                children: [
                  Text(
                    "Need a complete Mobile application?",
                    style: GoogleFonts.plusJakartaSans(
                      color: kCaptionColor,
                      fontSize: 12.0,
                      height: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        " Let's work together",
                        style: GoogleFonts.plusJakartaSans(
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
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
                    navigateToContent.navigateTo(PageContent.contactMe);
                    scrollToSection(navigateToContent.currentKey);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 12,
                    ),
                    child: Text(
                      "GET STARTED",
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
          ],
        ),
      );
    },
    image: Container(
      child: Image.asset(
        "assets/pixel_profile.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
