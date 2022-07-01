import 'dart:convert';

List<PokemonType> typeFromJson(String str) {
  return List<PokemonType>.from(
      json.decode(str).map((x) => PokemonType.fromJson(x)));
}

class PokemonType {
  final String name;

  const PokemonType({this.name});

  factory PokemonType.fromJson(Map<dynamic, dynamic> json) {
    return PokemonType(
      name: json["name"],
    );
  }
}
