import 'package:flutter/material.dart';
import 'package:ishop_app/routes/home/components/feature_banner.dart';

import '../../../size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [


            CategoriesWidget(),
            SizedBox(height: getProportionateScreenHeight(10)),
            FeatureBannerWidget(),
            SizedBox(height: getProportionateScreenWidth(30)),


          ],
        ),
      ),
    );
  }
}
