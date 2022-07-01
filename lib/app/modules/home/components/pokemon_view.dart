import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pokeapi/app/modules/home/controllers/home_controller.dart';

class PokemonView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('PokemonView'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                        'assets/icons/pokeball-pokemon-svgrepo-com.svg'),
                  ),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                        'assets/icons/health-care-add-svgrepo-com.svg'),
                  ),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                          'assets/icons/sword-svgrepo-com.svg')),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child:
                        SvgPicture.asset('assets/icons/shield-svgrepo-com.svg'),
                  ),
                  Text(
                    controller.selectedPokemon.value['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Atack speed: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Defense Speed: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Speed: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.selectedPokemon['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
