import 'package:flutter/material.dart';
import 'package:pokeapi/app/modules/home/components/customDialog/custom_rect_tween.dart';
import 'package:pokeapi/app/modules/home/components/customDialog/hero_dialog_route.dart';

class CustomPopupButton extends StatelessWidget {
  const CustomPopupButton({Key key, this.title, this.icon}) : super(key: key);
  final String title;
  final String tag = '';
  final String userName = '';
  final int userAge = 0;
  final String userUnity = '';
  final String userFunction = '';
  final int userPoints = 1;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: tag,
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin, end: end);
        },
        child: Material(
          color: Colors.transparent,
          child: Icon(
            icon,
            size: 25,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return _EditPopupCard();
        }));
      },
    );
  }
}

class _EditPopupCard extends StatelessWidget {
  const _EditPopupCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Hero(
          tag: 'tag',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'title',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: ''),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: ''),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: ''),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: ''),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: ''),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff8F54E1)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
