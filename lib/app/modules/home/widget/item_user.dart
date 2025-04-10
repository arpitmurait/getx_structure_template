import 'package:flutter/material.dart';
import 'package:getx_structure_template/app/core/widget/ripple.dart';
import 'package:getx_structure_template/app/data/model/users_response.dart';

import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';

class ItemUser extends StatelessWidget with BaseWidgetMixin {
  final UserData dataModel;

  ItemUser({super.key, required this.dataModel});

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Ripple(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: AppValues.margin_10),
              _getDetailsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDetailsView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataModel.firstName ?? 'N/A',
            style: cardTitleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: AppValues.margin_4),
          Text(
            dataModel.lastName ?? 'N/A',
            style: cardSubtitleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppValues.margin_4),
        ],
      ),
    );
  }

  void _onTap() {}
}
