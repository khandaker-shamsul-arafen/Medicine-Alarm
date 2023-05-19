import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'ProfileView is working',
              style: TextStyle(fontSize: 20),
              //   CircleAvatar(
              //     radius: 60.r,
              //     child: ClipOval(
              //         child: FancyShimmerImage(
              //           imageUrl: controller
              //               .data.profileData.value!.image ??
              //               "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
              //           shimmerBaseColor: Colors.white,
              //           shimmerHighlightColor: Colors.blue,
              //           shimmerBackColor: Colors.grey,
              //         )
              //
              //       // Image.network(controller
              //       //         .data.profileData.value!.image ??
              //       //     "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png") //"assets/owner.jpg"
              //
              //       // CachedNetworkImage(
              //       //   imageUrl:
              //       //       "https://wallpapercave.com/dwp2x/wp2637016.jpg",
              //       //   fit: BoxFit.cover,
              //       //   width: 200.h,
              //       //   height: 200.w,
              //       // ),
              //     ),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
