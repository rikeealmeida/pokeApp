import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokeapi/app/modules/home/controllers/home_controller.dart';
import 'package:pokeapi/app/modules/home/views/pokemon/card.dart';

class PokemonGrid extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MasonryGridView.builder(
        controller: controller.scrollController.value,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        gridDelegate: const SliverMasonryGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controller.pokemonList.length,
        itemBuilder: (ctx, i) {
          var pokemon = controller.pokemonList[i];
          return PokemonCard(
            pokemon: pokemon,
            i: i,
          );
        },
      ),
    );
  }
}
