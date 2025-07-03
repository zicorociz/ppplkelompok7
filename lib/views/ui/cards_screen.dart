import 'package:sikilap/controller/ui/cards_controller.dart';
import 'package:sikilap/helpers/theme/app_themes.dart';
import 'package:sikilap/helpers/utils/my_shadow.dart';
import 'package:sikilap/helpers/utils/ui_mixins.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb.dart';
import 'package:sikilap/helpers/widgets/my_breadcrumb_item.dart';
import 'package:sikilap/helpers/widgets/my_button.dart';
import 'package:sikilap/helpers/widgets/my_card.dart';
import 'package:sikilap/helpers/widgets/my_container.dart';
import 'package:sikilap/helpers/widgets/my_flex.dart';
import 'package:sikilap/helpers/widgets/my_flex_item.dart';
import 'package:sikilap/helpers/widgets/my_progress_bar.dart';
import 'package:sikilap/helpers/widgets/my_spacing.dart';
import 'package:sikilap/helpers/widgets/my_star_rating.dart';
import 'package:sikilap/helpers/widgets/my_text.dart';
import 'package:sikilap/helpers/widgets/responsive.dart';
import 'package:sikilap/images.dart';
import 'package:flutter/material.dart';
import 'package:sikilap/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> with SingleTickerProviderStateMixin, UIMixin {
  late CardsController controller;

  @override
  void initState() {
    controller = CardsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'cards_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Cards", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Widgets'), MyBreadcrumbItem(name: 'Card', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(sizes: 'lg-2.4 md-6', child: crmStateCard("\$347M", "Annual Profit", LucideIcons.briefcase, "5.23%", contentTheme.primary)),
                    MyFlexItem(
                        sizes: 'lg-2.4 md-6', child: crmStateCard("\$23,345", "Daily average Income", LucideIcons.wallet, "5.23%", contentTheme.secondary)),
                    MyFlexItem(sizes: 'lg-2.4 md-6', child: crmStateCard("33%", "Lead Conversation", LucideIcons.radio, "5.23%", contentTheme.danger)),
                    MyFlexItem(sizes: 'lg-2.4 md-6', child: crmStateCard("392", "Campaign sent", LucideIcons.rocket, "5.23%", contentTheme.info)),
                    MyFlexItem(sizes: 'lg-2.4', child: crmStateCard("12,678", "Annual Deals", LucideIcons.heart_handshake, "7.93%", contentTheme.warning)),
                    MyFlexItem(sizes: 'lg-4 md-6', child: card1()),
                    MyFlexItem(sizes: 'lg-4 md-6', child: card2()),
                    MyFlexItem(sizes: 'lg-4', child: card3()),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.users, contentTheme.primary, "Total Jobs", "5678564")),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.file_input, contentTheme.secondary, "Apply Jobs", "5678564")),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.user_plus, contentTheme.success, "New Jobs", "5678564")),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.book_open_check, contentTheme.info, "Interview", "5678564")),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.award, contentTheme.warning, "Hired", "5678564")),
                    MyFlexItem(sizes: 'xl-2 lg-4 md-6 sm-12', child: jobStateCard(LucideIcons.git_pull_request, contentTheme.danger, "Rejected", "5678564")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.shopping_cart, contentTheme.primary, "Total Order", "13500", "Increased by +1.34")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.luggage, contentTheme.secondary, "Total Sales", "15600", "Decreased by -1.34")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.user, contentTheme.success, "Total Visitors", "365238", "Increased by +1.34")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.circle_dollar_sign, contentTheme.info, "Total Income", "\$12543", "Increased by +1.34")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.receipt, contentTheme.danger, "Total Expenses", "\$22540", "Decreased by -1.34")),
                    MyFlexItem(
                        sizes: 'xl-4 lg-4 md-6 sm-12',
                        child: stateCart(LucideIcons.heart, contentTheme.warning, "Total Products", "\$22680", "Increased by +1.34")),
                    MyFlexItem(sizes: 'lg-4 md-6', child: buildTrafficSources()),
                    MyFlexItem(sizes: 'lg-4 md-6', child: topSellingProduct()),
                    MyFlexItem(
                        sizes: 'lg-4 md-6',
                        child: nftCard("Color Abstract -NFT", Images.dummy[0], Images.avatars[1], "Bloom NFT", "@bloom678", "0.43", "Last 4 days", "1.23k")),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget crmStateCard(String amount, title, IconData icon, String rate, Color color) {
    return MyCard.none(
      height: 130,
      paddingAll: 23,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(amount, fontWeight: 600),
                      MyText.bodySmall(title, fontWeight: 600, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
              MyContainer(
                  paddingAll: 0, height: 54, width: 54, clipBehavior: Clip.antiAliasWithSaveLayer, color: color.withAlpha(32), child: Icon(icon, color: color))
            ],
          ),
          Row(
            children: [
              MyContainer(
                color: contentTheme.success.withAlpha(32),
                padding: MySpacing.xy(8, 4),
                child: MyText.bodySmall(rate, fontWeight: 600, color: contentTheme.success),
              ),
              MySpacing.width(4),
              Expanded(
                child: MyText.bodySmall("vs last month", fontWeight: 600, muted: true, overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget stateCart(IconData icon, Color color, String valueName, totalValue, stateValue) {
    return MyCard.none(
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      paddingAll: 23,
      child: Row(
        children: [
          MyContainer(
            height: 70,
            width: 70,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: color.withAlpha(36),
            child: Icon(icon, color: color),
          ),
          MySpacing.width(20),
          Expanded(
            child: SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodySmall(valueName, fontWeight: 600, overflow: TextOverflow.ellipsis),
                  MyText.bodyLarge(numberFormatter('$totalValue'), fontWeight: 600, overflow: TextOverflow.ellipsis),
                  MyText.bodySmall(stateValue, fontWeight: 600, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget jobStateCard(IconData icon, Color color, String title, amount) {
    return MyCard.none(
      height: 95,
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Positioned(
              bottom: -8,
              right: -8,
              child: Transform.rotate(
                angle: 5.7,
                child: Icon(
                  icon,
                  size: 60,
                  color: color.withAlpha(32),
                ),
              )),
          Positioned(
            top: 23,
            left: 23,
            bottom: 23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyContainer(
                  paddingAll: 0,
                  height: 54,
                  width: 54,
                  color: color.withAlpha(32),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Icon(icon, color: color),
                ),
                MySpacing.width(20),
                SizedBox(
                  height: 43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.titleMedium(title, fontWeight: 600),
                      MyText.bodySmall(amount, fontWeight: 600),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topSellingProduct() {
    Widget productData(String image, productName, cartCount) {
      return Row(
        children: [
          MyContainer.rounded(
            paddingAll: 0,
            height: 38,
            width: 38,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          MySpacing.width(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodySmall(productName, fontWeight: 600),
              MyStarRating(
                rating: 4.5,
                size: 12,
                activeColor: Colors.orange,
              )
            ],
          ),
          Spacer(),
          MyText.bodySmall(cartCount, fontWeight: 600),
        ],
      );
    }

    return MyCard.none(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      height: 400,
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Top Selling Products", fontWeight: 600),
          MySpacing.height(20),
          productData(Images.dummy[0], 'Jacket', '268'),
          MySpacing.height(17),
          productData(Images.dummy[1], 'Dress', '853'),
          MySpacing.height(17),
          productData(Images.dummy[2], 'Kurtis', '624'),
          MySpacing.height(17),
          productData(Images.dummy[0], 'Dress', '486'),
          MySpacing.height(17),
          productData(Images.dummy[1], 'Couple Dress', '574'),
          MySpacing.height(17),
          productData(Images.dummy[2], 'Top', '897'),
        ],
      ),
    );
  }

  Widget nftCard(String title, backgroundImage, image, name, id, highest, time, like) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.bottomCenter,
      children: [
        MyCard.none(
          shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
          height: 400,
          width: double.infinity,
          paddingAll: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        MyContainer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          marginAll: 23,
          paddingAll: 23,
          color: contentTheme.background.withValues(alpha: .8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.titleMedium(title, fontWeight: 600),
              MySpacing.height(12),
              Row(
                children: [
                  MyContainer.rounded(
                    paddingAll: 0,
                    height: 32,
                    width: 32,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                  MySpacing.width(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(name, fontWeight: 600),
                      MyText.bodySmall(id, fontWeight: 600),
                    ],
                  ),
                ],
              ),
              MySpacing.height(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyMedium("Highest Bid", fontWeight: 600, overflow: TextOverflow.ellipsis),
                          MyText.bodySmall("$highest BTC", fontWeight: 600, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText.bodyMedium("Ending-in", fontWeight: 600, overflow: TextOverflow.ellipsis),
                        MyText.bodySmall(time, fontWeight: 600, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
              MySpacing.height(12),
              MyButton.block(
                  elevation: 0,
                  backgroundColor: contentTheme.primary,
                  onPressed: () {},
                  child: MyText.bodyMedium(
                    "Place Bid",
                    fontWeight: 600,
                    color: contentTheme.onPrimary,
                  ))
            ],
          ),
        ),
        Positioned(
          top: 32,
          right: 32,
          child: MyContainer(
            padding: MySpacing.xy(8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(LucideIcons.heart, size: 14), MySpacing.width(4), MyText.bodySmall(like, fontWeight: 600)],
            ),
          ),
        )
      ],
    );
  }

  Widget buildTrafficSources() {
    Widget buildData(String browser, session, double process) {
      return Row(
        children: [
          Expanded(child: MyText.bodyMedium(browser, fontWeight: 600, overflow: TextOverflow.ellipsis)),
          Expanded(
            child: Row(
              children: [
                if (session >= 5000) Icon(LucideIcons.trending_up, size: 20, color: contentTheme.success),
                if (session < 5000) Icon(LucideIcons.trending_down, size: 20, color: contentTheme.danger),
                MySpacing.width(8),
                Expanded(
                  child: MyText.bodyMedium("$session", fontWeight: 600, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyProgressBar(
              progress: process,
              height: 4,
              radius: 4,
              inactiveColor: theme.dividerColor,
              activeColor: contentTheme.primary,
            ),
          ),
        ],
      );
    }

    return MyCard.none(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      paddingAll: 0,
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.only(left: 20, top: 20),
              child: MyText.titleMedium("Traffic Sources", fontWeight: 600),
            ),
            Divider(height: 20),
            Padding(
              padding: MySpacing.only(left: 23),
              child: Row(children: [
                Expanded(child: MyText.bodyMedium("Browser", fontWeight: 600)),
                Expanded(child: MyText.bodyMedium("Sessions", fontWeight: 600)),
                Expanded(child: MyText.bodyMedium("Traffic", fontWeight: 600)),
              ]),
            ),
            Divider(height: 30),
            Padding(
              padding: MySpacing.x(23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildData("Chrome", 9000, .26),
                  MySpacing.height(20),
                  buildData("Safari", 6000, .19),
                  MySpacing.height(20),
                  buildData("Opera", 3200, .1),
                  MySpacing.height(20),
                  buildData("Firefox", 5500, .24),
                  MySpacing.height(20),
                  buildData("Edge", 2000, .2),
                  MySpacing.height(20),
                  buildData("Brave", 1000, .1),
                  MySpacing.height(20),
                  buildData("Mozilla", 5340, .24),
                ],
              ),
            ),
            MySpacing.height(12),
          ],
        ),
      ),
    );
  }

  Widget card3() {
    return MyCard.none(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      height: 450,
      paddingAll: 23,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyContainer(
            height: 290,
            width: double.infinity,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.dummy[2], fit: BoxFit.cover),
          ),
          MyText.bodySmall(controller.dummyTexts[4], maxLines: 2),
          MyText.bodySmall(controller.dummyTexts[5], maxLines: 3),
        ],
      ),
    );
  }

  Widget card2() {
    return MyCard.none(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      height: 450,
      paddingAll: 23,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Card Title", fontWeight: 600),
          MyContainer(
            paddingAll: 0,
            margin: MySpacing.y(12),
            height: 270,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.dummy[1], fit: BoxFit.cover),
          ),
          MyText.bodySmall(controller.dummyTexts[2], maxLines: 2, fontWeight: 600),
          MyButton.block(
              onPressed: () {},
              elevation: 0,
              backgroundColor: contentTheme.primary,
              child: MyText.bodyMedium("Another Link", fontWeight: 600, color: contentTheme.onPrimary))
        ],
      ),
    );
  }

  Widget card1() {
    return MyCard.none(
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 450,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            paddingAll: 0,
            height: 290,
            width: double.infinity,
            child: Image.asset(Images.dummy[0], fit: BoxFit.cover),
          ),
          Padding(
            padding: MySpacing.xy(23, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium("Card Title", fontWeight: 600),
                MySpacing.height(12),
                MyText.bodySmall(controller.dummyTexts[9], maxLines: 2, fontWeight: 600),
                MySpacing.height(12),
                MyButton(
                    onPressed: () {},
                    backgroundColor: contentTheme.primary,
                    elevation: 0,
                    padding: MySpacing.xy(16, 16),
                    child: MyText.bodyMedium("Click Link", fontWeight: 600, color: contentTheme.onPrimary))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
