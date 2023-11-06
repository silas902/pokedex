import 'package:pokemon/app/entity/about.dart';
import 'package:pokemon/app/entity/move.dart';
import 'package:pokemon/app/entity/pokemon.dart';
import 'package:pokemon/app/home_page/data_source/pokemon_data_source.dart';
import '../../core/result.dart';
import 'package:uuid/uuid.dart';
import '../../entity/evolution.dart';
import '../../entity/stat.dart';

abstract class IPokemonRepository {
  Future<Result<Exception, List<Pokemon>>> getPokemons();
  Future<Result<Exception, Map<String, dynamic>>> _getPokemonDetails({required String url});
}

class PokemonRepositoryIMPL extends IPokemonRepository {
  final IPokemonDataSource _dataSource;
  PokemonRepositoryIMPL({required IPokemonDataSource dataSource}) : _dataSource = dataSource;
  final _uuid = const Uuid();

  @override
  Future<Result<Exception, List<Pokemon>>> getPokemons() async {
    final List<Pokemon> pokemons = [];
    final response = await _dataSource.getPokemons();

    final List<dynamic> mapData = response.$2!.data['results'];

    for (Map element in mapData) {
      final Result<Exception, Map<String, dynamic>> mapPokemonDetails = await _getPokemonDetails(url: element['url']);
      if (mapPokemonDetails.$2 != null) {
        final List<Move> moves = _getMoves(moves: mapPokemonDetails.$2?['moves']);
        final Stat stat = _getStat(statsList: mapPokemonDetails.$2?['stats']);
        final List<String> types = _getTypes(typesList: mapPokemonDetails.$2?['types']);
        final About? about = await _getAbout(typesList: mapPokemonDetails.$2);
        final pokemon = Pokemon(
          id: mapPokemonDetails.$2?['id'],
          nome: mapPokemonDetails.$2?['name'],
          about: about,
          types: types,
          moves: moves,
          stat: stat,
        );
        pokemons.add(pokemon);
      }
    }

    return (
      null,
      pokemons
    );
  }

  @override
  Future<Result<Exception, Map<String, dynamic>>> _getPokemonDetails({required String url}) async {
    final responsePokemonDetails = await _dataSource.getPokemonDetails(url: url);
    final Map<String, dynamic> mapPokemonDetails = responsePokemonDetails.$2!.data;

    return (
      null,
      mapPokemonDetails
    );
  }

  List<Move> _getMoves({required List<dynamic> moves}) {
    List<Move> movesList = [];
    movesList.clear();
    for (var i = 0; i < moves.length; i++) {
      final Map<String, dynamic> ss = moves[i];
      movesList.add(Move(id: _uuid.v1(), name: ss['move']['name']));
    }

    return movesList;
  }

  Stat _getStat({required List<dynamic> statsList}) {
    final Stat stat = Stat(
      hp: statsList[0]['base_stat'],
      attack: statsList[1]['base_stat'],
      defense: statsList[2]['base_stat'],
      specialAttack: statsList[3]['base_stat'],
      specialDefense: statsList[4]['base_stat'],
      speed: statsList[5]['base_stat'],
    );

    return stat;
  }

  List<String> _getTypes({required List<dynamic> typesList}) {
    final List<String> types = [];

    for (var i = 0; i < typesList.length; i++) {
      types.add(typesList[i]['type']['name'].toString());
    }
    print(types);
    return types;
  }

  Future<About?> _getAbout({required Map<String, dynamic>? typesList}) async {
    //final response = await _dataSource.getGenderPokemon(id: typesList?['id']);
    print('object');
    //About(
    //  height: typesList?['height'],
    //  weight: typesList?['weight'],
    //  gender: response.$2?.data['name'],
    //  category: typesList?['category'],
    //  abilities: typesList?['abilities'],
    //);
    print('object');
  }

  List<Evolution> _getEvolution() {
    return [];
  }
}
