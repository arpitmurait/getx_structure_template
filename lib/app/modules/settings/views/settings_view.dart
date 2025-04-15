import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/values/app_keys.dart';
import 'package:getx_structure_template/localization/app_strings.dart';
import 'package:getx_structure_template/localization/localization.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  SettingsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: AppStrings.bottomNavSettings.toLocalized(),
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        GetBuilder<SettingsController>(
          id: AppKeys.themeMode,
          autoRemove: true,
          builder: (controller) {
          return ItemSettings(
            title: controller.themeMode.name,
            prefixImage: 'ic_theme.png',
            suffixImage: 'arrow_forward.svg',
            onTap: () => _onThemeItemClicked(context),
          );
        },),
        _getHorizontalDivider(),
        GetBuilder<SettingsController>(
          id: AppKeys.locale,
          builder: (controller) {
            return ItemSettings(
              title: getLanguageNameFromCode(controller.currentLocale ?? ''),
              prefixImage: 'ic_language.svg',
              suffixImage: 'arrow_forward.svg',
              onTap: () => _onLanguageItemClicked(context),
            );
          },),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Choose Theme"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children:  ThemeMode.values.map((e) => ListTile(
            title: Text(e.name,style: Theme.of(context).textTheme.bodyLarge,),
            onTap: () {
              controller.themeMode = e;
              Get.changeThemeMode(e);
              controller.update([AppKeys.themeMode]);
              Navigator.pop(context);
            },
          ),).toList(),
        ),
      );
    },);
  }

  void _onLanguageItemClicked(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Choose Language"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children:  languageNames.map((e) => ListTile(
            title: Text(e,style: Theme.of(context).textTheme.bodyLarge),
            onTap: () {
              controller.currentLocale = getLanguageCodeFromName(e);
              Get.updateLocale(Locale(getLanguageCodeFromName(e)));
              LocalizationService.delegate().load(Locale(getLanguageCodeFromName(e)));
              controller.update([AppKeys.locale]);
              Navigator.pop(context);
            },
          ),).toList(),
        ),
      );
    },);
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

}
