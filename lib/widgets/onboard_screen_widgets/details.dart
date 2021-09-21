import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../my_theme.dart';

class Details extends StatelessWidget {
  final String? texttitle;
  final String? image;

  const Details({Key? key, this.texttitle, this.image}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'E ORGANIC',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: MyTheme.green,
                fontSize: 50.0),
          ),
        ),
        Text(
          texttitle!,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              color: MyTheme.darkBluishColor,
              fontSize: 15.0),
        ),
        SizedBox(height: 80),
        SvgPicture.asset(
          image!,
          width: 240,
        )
      ],
    );
  }
}
