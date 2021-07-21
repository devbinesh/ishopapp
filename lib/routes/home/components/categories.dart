import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishop_app/constants.dart';
import 'package:ishop_app/generated/l10n.dart';
import 'package:ishop_app/size_config.dart';

class CategoriesWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/categories/grocery.jpg", "text": "Groceries"},
      {"icon": "assets/images/categories/fruits.jpg", "text": "Fruits & Vegitables"},
      {"icon": "assets/images/categories/medicine.jpg", "text": "Medicine"},
      {"icon": "assets/images/categories/food.jpg", "text": "Restaurants"},
      {"icon": "assets/images/categories/meat.jpg", "text": "Meat & Fish"},
      {"icon": "assets/images/categories/pet-shop.jpg", "text": "Pet Shop"},
    ];
     return Container(
       padding: EdgeInsets.all(getProportionateScreenWidth(paddingDefault)),
       color: cardBgColor,
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).home_store_category_heading,style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
            )),
            SizedBox(height: spacerHeight,),
            SizedBox(
              height: getProportionateScreenHeight(300),
              width: double.infinity,
              child: GridView.builder(

                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,

                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemCount: categories.length,
                  // physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return CategoryCard(

                      icon: categories[index]["icon"],
                      text: categories[index]["text"],
                      press: () {},
                    );

                  } ),
            )


          ],
       ),
     );
  }
  
}

class CategoryCard extends StatelessWidget{
  const CategoryCard({
     Key? key,
    required  this.icon,
    required  this.text,
    required  this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: press,
      child: Container(

           child: Column(

            children: [
              Container(
               // padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(200),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(child:Image.asset(icon,) ,fit: BoxFit.fill,)  //SvgPicture.asset(icon),
              ),
              SizedBox(height: 5),
              Expanded(child:Text(text, textAlign: TextAlign.center,overflow: TextOverflow.ellipsis ,))
            ],
          )
      ) ,
    );
  }
  
}