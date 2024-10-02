import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header/header.dart';
import 'package:web_portfolio/pages/home/components/project_one_ad.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/pages/home/components/project_two_ad.dart';
import 'package:web_portfolio/utils/globals.dart';

import '../../stateManagement/navigate_to_content.dart';
import 'components/header/header_drawer_mobile.dart';
import 'components/tech_stacks.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigateToContent = Provider.of<NavigateToContent>(context);
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: HeaderDrawerMobile(),
      body: SingleChildScrollView(
        controller: navigateToContent.scrollController,
        child: StickyHeader(
          header: Consumer<NavigateToContent>(
            builder: (context, navigateToContent, child) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0.0, -0.1),
                        end: Offset(0.0, 0.0),
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                layoutBuilder: (currentChild, previousChildren) {
                  return Stack(
                    children: <Widget>[
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },
                child: navigateToContent.isScrolled ? ScrolledHeader() : Header(),
              );
            },
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Carousel(
                key: navigateToContent.contentKeys[PageContent.about],
              ),
              CvSection(),
              ProjectOneAd(
                key: navigateToContent.contentKeys[PageContent.project1],
              ),
              ProjectTwoAd(
                key: navigateToContent.contentKeys[PageContent.project2],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: PortfolioStats(),
              ),
              EducationSection(
                key: navigateToContent.contentKeys[PageContent.education],
              ),
              SkillSection(
                key: navigateToContent.contentKeys[PageContent.skills],
              ),
              TechStacks(),
              TestimonialWidget(
                key: navigateToContent.contentKeys[PageContent.testimonials],
              ),
              Footer(
                key: navigateToContent.contentKeys[PageContent.contactMe],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
