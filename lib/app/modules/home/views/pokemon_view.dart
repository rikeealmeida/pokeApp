import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/modules/home/controllers/home_controller.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = controller.pokemonList
        .firstWhere((element) => element.name == widget.pokemon.name)
        .image;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 40),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            controller.getPokemonColor(widget.pokemon.type),
            controller.getPokemonColor(widget.pokemon.type).withOpacity(.5),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios_rounded,
                        color: Colors.white, size: 30)),
                Text(
                  widget.pokemon.name.capitalize,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const InkWell(
                    child: Icon(Icons.favorite, color: Colors.white, size: 30)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InkWell(
                  child: Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white, size: 45)),
              SvgPicture.network(
                image,
                height: 250,
                width: 250,
              ),
              const InkWell(
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white, size: 45)),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(35),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(.2)),
                BoxShadow(
                    offset: const Offset(-1, -1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(.2)),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                            'assets/icons/pokeball-pokemon-svgrepo-com.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Tipo:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                      ),
                      Text(
                        widget.pokemon.type.capitalize,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                            'assets/icons/health-care-add-svgrepo-com.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Hp:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                      ),
                      Text(
                        "${widget.pokemon.hp}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: SvgPicture.asset(
                              'assets/icons/sword-svgrepo-com.svg')),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Atk:',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "${widget.pokemon.attack}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                            'assets/icons/shield-svgrepo-com.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Def:',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "${widget.pokemon.defense}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Atack speed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.pokemon.spAttack}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Defense Speed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.pokemon.spDefense}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Speed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.pokemon.speed}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
