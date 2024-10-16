import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/home/components/carousel_items.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Carousel extends StatelessWidget {
  final CarouselSliderController carouselController = CarouselSliderController();

  Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight =
        MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                carouselItems.length,
                (index) => Container(
                  constraints: BoxConstraints(
                    minHeight: carouselContainerHeight,
                  ),
                  child: ScreenHelper(
                    key: Key("carousel responsive view"),
                    // Responsive views
                    desktop: _buildDesktop(
                      context,
                      carouselItems[index].text(context),
                      carouselItems[index].image,
                    ),
                    tablet: _buildTablet(
                      context,
                      carouselItems[index].text(context),
                      carouselItems[index].image,
                    ),
                    mobile: _buildMobile(
                      context,
                      carouselItems[index].text(context),
                      carouselItems[index].image,
                    ),
                  ),
                ),
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}

// Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveConstraints(
      constraint: BoxConstraints(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
      ),
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveConstraints(
      constraint: BoxConstraints(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
      ),
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
