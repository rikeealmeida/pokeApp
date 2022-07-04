import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/models/pokemon_type_model.dart';
import 'package:pokeapi/app/services/rest_client.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController().obs;
  final isLoading = true.obs;
  final pokemonList = <Pokemon>[].obs;
  final typeList = <PokemonType>[].obs;
  final pokemonStats = [].obs;
  final inputController = TextEditingController().obs;
  final pokeName = ''.obs;
  final filterVisibility = false.obs;
  final isChecked = false.obs;
  final url = 'https://pokeapi.co/api/v2/'.obs;
  final selectedPokemonList = <Pokemon>[].obs;
  final filteredPokemonList = <Pokemon>[].obs;
  final selectedPokemon = 0.obs;
  final currentPage = 0.obs;
  final totalPage = 0.0.obs;
  final totalPokemonQuantity = 151.obs;
  final color = Colors.white.obs;

  pokeFilter(String query) {}

  getTotalPages() {
    totalPage.value = pokemonList.length / 10;
  }

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
        for (var i = 0; i < P.length; i++) {
          var types =
              await ApiClient.client.get(Uri.parse('${url}pokemon/${i + 1}'));
          var T = jsonDecode(types.body)['types'];
          var pokemon = P[i];
          pokemon['isFavorite'] = false;
          pokemon['id'] = "${i + 1}";
          pokemon['types'] = T;
          pks.add(pokemon);
        }

        var encoded = jsonEncode(pks);

        pokemonList.value = pokemonFromJson(encoded);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Erro', e.toString(), borderRadius: 5);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStats(id) async {
    try {
      selectedPokemon.value = id;
      isLoading.value = true;
      var poke =
          await ApiClient.client.get(Uri.parse('${url}pokemon?limit=1000'));
      var pokeDetails =
          await ApiClient.client.get(Uri.parse('${url.value}/pokemon/$id'));
      var pokeTypes = jsonDecode(pokeDetails.body)['types'];
      var pokeStats = jsonDecode(pokeDetails.body)['stats'];

      var P = jsonDecode(poke.body)['results'];
      var pks = <Map<String, dynamic>>[];

      var pokemon = P[id - 1];
      pokemon['types'] = pokeTypes;
      pokemon['stats'] = pokeStats;

      pks.add(pokemon);

      var encoded = jsonEncode(pks);

      selectedPokemonList.value = pokemonFromJson(encoded);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Erro', e.toString(), borderRadius: 5);
    }
  }

  void searchPokemon(name) async {}

  ///API called used to get a single pokemon
  Future<Pokemon> getSinglePokemon(String name) async {
    try {
      var res = await ApiClient.client
          .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"));

      if (res.statusCode == 200) {
        var j = json.decode(res.body)['results'];
        return Pokemon.fromJson(j);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        borderRadius: 5.0,
      );
    }
    throw "Pokemon could not be found";
  }

  Color getPokemonColor(String type) {
    switch (type) {
      case "grass":
        color.value = Colors.green;
        return Colors.green;
        break;
      case "fire":
        color.value = Colors.red;
        return Colors.red;
        break;
      case "water":
        color.value = Colors.blue;
        return Colors.blue;
        break;
      case "poison":
        color.value = Colors.purple;
        return Colors.purple;
        break;
      case "psychic":
        color.value = Colors.purple;
        return Colors.purple;
        break;
      case "normal":
        color.value = Colors.brown;
        return Colors.brown;
        break;
      case "ground":
        color.value = Color.fromARGB(225, 100, 66, 54);
        return Color.fromARGB(225, 100, 66, 54);
        break;
      case "bug":
        color.value = Color.fromARGB(255, 1, 88, 20);
        return Color.fromARGB(255, 1, 88, 20);
        break;
      case "rock":
        color.value = Color.fromARGB(255, 116, 116, 116);
        return Color.fromARGB(255, 116, 116, 116);
        break;
      case "steel":
        color.value = Color.fromARGB(255, 116, 116, 116);
        return Color.fromARGB(255, 116, 116, 116);
        break;
      case "electric":
        color.value = Color.fromARGB(255, 229, 233, 0);
        return Color.fromARGB(255, 229, 233, 0);
        break;
      case "fairy":
        color.value = Color.fromARGB(255, 203, 0, 221);
        return Color.fromARGB(255, 203, 0, 221);
        break;
      case "ghost":
        color.value = Color.fromARGB(255, 52, 0, 136);
        return Color.fromARGB(255, 52, 0, 136);
        break;
      case "dragon":
        color.value = Color.fromARGB(255, 52, 0, 136);
        return Color.fromARGB(255, 52, 0, 136);
        break;
      default:
        return Colors.grey;
    }
  }

  @override
  void onInit() async {
    scrollController.value.addListener(() async {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        if (currentPage.value != totalPage.value) {
          currentPage.value += 1;
          print(totalPage.value);
        }
      }
    });
    await getFirstPokemons(totalPokemonQuantity.value);
    await getTypes();
    await getTotalPages();
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
