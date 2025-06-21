import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:stay_place/controller/client/home_controller.dart';
import 'package:stay_place/helpers/utils/ui_mixins.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb.dart';
import 'package:stay_place/helpers/widgets/my_breadcrumb_item.dart';
import 'package:stay_place/helpers/widgets/my_container.dart';
import 'package:stay_place/helpers/widgets/my_flex.dart';
import 'package:stay_place/helpers/widgets/my_flex_item.dart';
import 'package:stay_place/helpers/widgets/my_spacing.dart';
import 'package:stay_place/helpers/widgets/my_text.dart';
import 'package:stay_place/helpers/widgets/responsive.dart';
import 'package:stay_place/model/hotel_model.dart';
import 'package:stay_place/model/room_model.dart';
import 'package:stay_place/views/layout/layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with UIMixin {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Home",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Home', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                        sizes: 'lg-6',
                        child: CarouselSlider(
                          items: controller.featuredImages.map((url) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: controller.goToHotelDetail,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                              height: 300,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              animateToClosest: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              autoPlayAnimationDuration: Duration(seconds: 2),
                              autoPlayCurve: Curves.ease),
                        )),
                    MyFlexItem(
                        sizes: 'lg-6',
                        child: MyContainer(
                          paddingAll: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyMedium("Popular Destination", fontWeight: 600),
                              MySpacing.height(24),
                              popularDestination(),
                              MySpacing.height(24),
                              MyText.bodyMedium("Special Offer", fontWeight: 600),
                              MySpacing.height(24),
                              specialOffer(),
                            ],
                          ),
                        )),
                    MyFlexItem(child: specialHotel()),
                    MyFlexItem(child: specialRoom()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget popularDestination() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.destinations.length,
        itemBuilder: (context, index) {
          return MyContainer.bordered(
            height: 120,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: contentTheme.primary,
                  child: Icon(LucideIcons.map_pin, size: 16, color: Colors.white),
                ),
                MyText.bodySmall(controller.destinations[index]),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 24);
        },
      ),
    );
  }

  Widget specialOffer() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.offers.length,
        itemBuilder: (context, index) {
          return MyContainer.bordered(
            padding: MySpacing.x(8),
            child: Center(
              child: MyText.labelMedium(
                controller.offers[index],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 24);
        },
      ),
    );
  }

  Widget specialHotel() {
    return MyContainer(
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Special Hotel", fontWeight: 600),
          MySpacing.height(24),
          SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: controller.hotel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                HotelModel hotel = controller.hotel[index];
                return MyContainer.bordered(
                  onTap: controller.goToHotelDetail,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainer(
                        paddingAll: 0,
                        height: 150,
                        width: 300,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(hotel.image, fit: BoxFit.cover),
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.hotel, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(hotel.hotelName),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.user, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(hotel.ownerName),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.mail, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(hotel.email),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.map_pin, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(hotel.cityName),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 24);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget specialRoom() {
    return MyContainer(
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium("Special Room", fontWeight: 600),
          MySpacing.height(24),
          SizedBox(
            height: 300,
            child: ListView.separated(
              itemCount: controller.room.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                RoomModel room = controller.room[index];
                return MyContainer.bordered(
                  onTap: controller.goToRoomDetail,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainer(
                        paddingAll: 0,
                        height: 150,
                        width: 300,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(room.image, fit: BoxFit.cover),
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.bed_single, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(room.bedType),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.bed, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium(room.roomType),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.users, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium('${room.capacity} Capacity'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(LucideIcons.building, size: 16),
                          MySpacing.width(8),
                          MyText.bodyMedium('${room.floor} Floor'),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 24);
              },
            ),
          )
        ],
      ),
    );
  }
}
