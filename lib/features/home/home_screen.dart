import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes2_uas_kelompok7/features/home/controller/home_controller.dart';
import 'package:tubes2_uas_kelompok7/features/home/widgets/home_cardview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              Expanded(
                child: Obx(() => controller.images.isNotEmpty
                    ? _buildImageList(controller)
                    : _buildLoadingIndicator()),
              )
            ],
          )),
    ));
  }

  Widget _buildHeaderSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo Kucing Lovers!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Text(
            'Temukan kucing lucu untuk dijadikan wallpaper hp kamu ?',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }

  Widget _buildImageList(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final image = controller.images[index];
            return HomeCard(
              image: image,
              onFavoritePressed: () => controller.onFavoritePressed(image.id),
              onLikePressed: () => controller.onLikePressed(image.id),
              borderRadius: 16,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemCount: controller.images.length),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }
}