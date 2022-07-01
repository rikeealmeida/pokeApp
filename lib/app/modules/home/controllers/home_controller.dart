import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/models/pokemon_type_model.dart';
import 'package:pokeapi/app/services/rest_client.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final pokemonList = <Pokemon>[].obs;
  final typeList = <PokemonType>[].obs;
  final inputController = TextEditingController().obs;
  final pokeName = ''.obs;
  final filterVisibility = false.obs;
  final isChecked = false.obs;

  Future<void> getTypes() async {
    try {
      isLoading.value = true;
      var res = await ApiClient.client
          .get(Uri.parse('https://pokeapi.co/api/v2/type'));
      if (res.statusCode == 200) {
        var j = jsonDecode(res.body)['results'];
        var typs = <Map<String, dynamic>>[];
        for (var i = 0; i < j.length; i++) {
          var type = j[i];
          typs.add(type);
        }
        var encoded = jsonEncode(typs);
        typeList.value = typeFromJson(encoded);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Erro', e.toString(), borderRadius: 5);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFirst150Pokemon() async {
    try {
      isLoading.value = true;
      var res = await ApiClient.client
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));

      if (res.statusCode == 200) {
        var j = jsonDecode(res.body)['results'];
        var pks = <Map<String, dynamic>>[];
        for (var i = 0; i < j.length; i++) {
          var pokemon = j[i];
          pokemon['id'] = "${i + 1}";
          pks.add(pokemon);
        }
        var encoded = jsonEncode(pks);
        pokemonList.value = pokemonFromJson(encoded);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        borderRadius: 5,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void searchPokemon(name) async {}

  @override
  void onInit() {
    getTypes();
    getFirst150Pokemon();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
