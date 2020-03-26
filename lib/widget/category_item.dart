import 'package:flutter/material.dart';
import '../ miscFiles/routeNames.dart';

// import '../widget/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String cId;
  final String title;
  final Color bgColor;

  CategoryItem(this.title, this.bgColor, this.cId);

  void selectCategory(BuildContext bCtx) {
    Navigator.of(bCtx).pushNamed(
      RouteNames.mealScreen ,
      arguments: {
        'id': cId,
        'title': title,
      },
    );
    // Navigator.of(bCtx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return MealsScreen(cId, title);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [bgColor.withOpacity(0.7), bgColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
