import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/patient_screen_banners_controllers.dart';
import 'package:get/get.dart';

class PatientScreenBannerWidget extends StatefulWidget {
  const PatientScreenBannerWidget({super.key});

  @override
  State<PatientScreenBannerWidget> createState() =>
      _PatientScreenBannerWidgetState();
}

class _PatientScreenBannerWidgetState extends State<PatientScreenBannerWidget> {
  CarouselController carouselController = CarouselController();
  PatientScreenBannersControllers patientScreenBannersControllers =
      Get.put(PatientScreenBannersControllers());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(
            items: patientScreenBannersControllers.bannerurls
                .map((imageurl) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: imageurl,
                            fit: BoxFit.cover,
                            width: 350,
                            placeholder: (context, url) => ColoredBox(
                              color: Colors.white,
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )),
                    ))
                .toList(),
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1));
      }),
    );
  }
}
