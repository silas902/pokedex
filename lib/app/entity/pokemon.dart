import 'package:pokemon/app/entity/about.dart';
import 'package:pokemon/app/entity/evolution.dart';
import 'package:pokemon/app/entity/move.dart';
import 'package:pokemon/app/entity/stat.dart';

class Pokemon {
  final int id;
  final String nome;
  List<String>? types;
  List<String>? weakenes;
  List<String>? strenghts;
  List<Move>? moves;
  List<Evolution>? evolutions;
  Stat? stat;
  final About? about;
  Pokemon({
    required this.id,
    required this.nome,  
    this.types,
    this.weakenes,
    this.strenghts,
    this.moves,
    this.evolutions,
    this.stat,
    required this.about,
  });
}
