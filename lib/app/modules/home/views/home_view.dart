import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pokeapi/app/modules/home/components/pokemon_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Teste',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                controller.selectedPokemon['name'] != null
                    ? controller.selectedPokemon['name']
                    : '',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.inputController.value,
                    onChanged: (text) {
                      controller.pokeName.value = text;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Nome do pokemon',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 30,
                          width: 40,
                          child: TextField(
                            controller: textController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.getFirstPokemons(
                                int.tryParse(textController.text));
                            // controller.pokeFilter(controller.pokeName.value);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 100,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue,
                            ),
                            child: Center(child: Text('Pesquisar')),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.filterVisibility.value =
                            !controller.filterVisibility.value;
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 25,
                        width: 100,
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Center(child: Text('Filtros')),
                      ),
                    )
                  ],
                ),
              ],
            ),
            if (controller.filterVisibility.value)
              Container(
                height: 200,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      mainAxisExtent: 25),
                  itemCount: controller.typeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (v) {
                              controller.isChecked.value = v;
                            }),
                        Text(controller.typeList[index].name.capitalize),
                      ],
                    );
                  },
                ),
              ),
            controller.isLoading.value
                ? Expanded(
                    child: Container(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      controller: ScrollController(),
                      itemCount: controller.pokemonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              controller.getStats(index + 1);
                              Get.to(PokemonView());
                            },
                            child: Card(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.all(5),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: SvgPicture.network(
                                      controller.pokemonList[index].image,
                                      placeholderBuilder: (context) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.pokemonList[index].name
                                              .capitalize,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
