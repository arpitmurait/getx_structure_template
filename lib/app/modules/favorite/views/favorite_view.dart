import 'package:flutter/material.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends BaseView<FavoriteController> {
  FavoriteView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Favorite',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'FavoriteView is working',
      ),
    );
  }
}
