import 'package:flutter/material.dart';
class ProfileWidget extends StatelessWidget {
  final String imgPath;
  ProfileWidget(this.imgPath);

  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
          children:[ ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Image.asset(imgPath,fit: BoxFit.cover,
                width: 130,
                height: 130,),
            ),
          ),
            Positioned(
              bottom: 0,
              right: 3,
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color:  Color.fromRGBO(92, 104, 152, 1),
                      child: Icon(
                        color:Colors.white,
                        Icons.edit,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}
