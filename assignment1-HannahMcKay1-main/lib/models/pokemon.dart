//Create a pokemon class
class Pokemon {
  //Create a master list that contains all of the pokemon types 
  static const List<String> _validPokemonTypes = [
    "normal", "fire", "water", "electric", "grass", "ice", "fighting",
    "poison", "ground", "flying", "psychic", "bug", "rock", "ghost",
    "dragon", "dark", "steel", "fairy"
  ];
  // Private fields to encapsulate data
  late String _name;
  late int _id;
  late double _height;
  late double _weight;
  late int _baseExperience;
  late List<String> _types;
  late DateTime _captureDate;

  // Factory constructor to handle the mapping of JSON data
  factory Pokemon.fromPokeApiData(Map<String, dynamic> data) {
    // Navigates the nested API structure
    List<String> typeList = (data['types'] as List)
        .map((typeEntry) => typeEntry['type']['name'] as String)
        .toList();

    return Pokemon(
      name: data['name'],
      id: data['id'],
      // Convert decimeters into meters
      height: data['height'] / 10.0, 
      // Convert hectograms into kilograms
      weight: data['weight'] / 10.0,
      baseExperience: data['base_experience'],
      types: typeList,
      captureDate: DateTime.now(), 
    );
  }
}