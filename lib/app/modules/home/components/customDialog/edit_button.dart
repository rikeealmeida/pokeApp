import 'package:dbv_app/screens/users/components/custom_rect_tween.dart';
import 'package:dbv_app/screens/users/components/hero_dialog_route.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton(
      {Key key,
      this.title,
      this.tag,
      this.userName,
      this.userAge,
      this.userUnity,
      this.userFunction,
      this.userPoints})
      : super(key: key);
  final String title;
  final String tag;
  final String userName;
  final int userAge;
  final String userUnity;
  final String userFunction;
  final int userPoints;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Hero(
          tag: tag,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Text('Editar'),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return _EditPopupCard(
            title: title,
            tag: tag,
            userAge: userAge,
            userFunction: userFunction,
            userName: userName,
            userPoints: userPoints,
            userUnity: userUnity,
          );
        }));
      },
    );
  }
}

class _EditPopupCard extends StatelessWidget {
  const _EditPopupCard(
      {Key key,
      this.title,
      this.tag,
      this.userName,
      this.userAge,
      this.userUnity,
      this.userPoints,
      this.userFunction})
      : super(key: key);
  final String title;
  final String tag;
  final String userName;
  final int userAge;
  final String userUnity;
  final String userFunction;
  final int userPoints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Hero(
          tag: tag,
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
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Nome: $userName'),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Idade: $userAge'),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Unidade: $userUnity'),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Cargo: $userFunction'),
                      cursorColor: Colors.black,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Pontuação: $userPoints'),
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
                            color: Colors.green),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: const Text('Salvar'),
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
