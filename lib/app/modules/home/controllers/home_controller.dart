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
  final pokemonStats = [].obs;
  final inputController = TextEditingController().obs;
  final pokeName = ''.obs;
  final filterVisibility = false.obs;
  final isChecked = false.obs;
  final url = 'https://pokeapi.co/api/v2/'.obs;
  final filteredPokemonList = <Pokemon>[].obs;
  final selectedPokemon = {}.obs;

  pokeFilter(String query) {}

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

  Future<void> getFirstPokemons(int quantity) async {
    try {
      isLoading.value = true;
      var poke = await ApiClient.client
          .get(Uri.parse('${url}pokemon?limit=$quantity'));

      if (poke.statusCode == 200) {
        var P = jsonDecode(poke.body)['results'];
        var pks = <Map<String, dynamic>>[];
        var types = <List<dynamic>>[];
        for (var i = 0; i < P.length; i++) {
          var pokemon = P[i];
          pokemon['id'] = "${i + 1}";

          //add type to object
          var pokeType = await ApiClient.client
              .get(Uri.parse('${url.value}/pokemon/${i + 1}'));
          var T = jsonDecode(pokeType.body)['types'];
          types.add(T);
          pokemon['types'] = types[i];
          //add modified object to main array
          pks.add(pokemon);
        }

        var encoded = jsonEncode(pks);

        pokemonList.value = pokemonFromJson(encoded);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void getStats(id) async {
    //add stats to object
    var pokeDetails =
        await ApiClient.client.get(Uri.parse('${url.value}/pokemon/${id}'));
    var pokemon = {};
    var S = jsonDecode(pokeDetails.body)['stats'];
    var P = jsonDecode(pokeDetails.body)['name'];

    pokemon['name'] = P;
    pokemon['S'] = S;
    pokemon['id'] = id;

    selectedPokemon.value = pokemon;

    // selectedPokemon.value =

    // var pokemon = S[id];
    // stats.add(S);
    // pokemon['stats'] = stats[id];
  }

  void searchPokemon(name) async {}

  @override
  void onInit() async {
    await getFirstPokemons(10);
    getTypes();
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
