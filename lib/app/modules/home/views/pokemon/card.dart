import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/modules/home/controllers/home_controller.dart';
import 'package:pokeapi/app/modules/home/views/pokemon_view.dart';

class PokemonCard extends GetView<HomeController> {
  const PokemonCard({
    Key key,
    this.pokemon,
    this.i,
  }) : super(key: key);

  final Pokemon pokemon;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await controller.getStats(i + 1);
        Get.to(() => PokemonView(pokemon: controller.selectedPokemonList[0]));
      },
      child: Card(
        color: controller.getPokemonColor(pokemon.type).withOpacity(.8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(5),
              height: 130,
              width: 130,
              child: SvgPicture.network(
                pokemon.image,
                placeholderBuilder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: controller.getPokemonColor(pokemon.type),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      pokemon.name.capitalize,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
