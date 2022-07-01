import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                controller.pokeName.value,
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
                    InkWell(
                      onTap: () {},
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
            Expanded(
              child: ListView.builder(
                itemCount: controller.pokemonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        print(controller.pokemonList[index].image);
                      },
                      child: Card(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(5),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: SvgPicture.network(
                                controller.pokemonList[index].image,
                                placeholderBuilder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    controller
                                        .pokemonList[index].name.capitalize,
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
