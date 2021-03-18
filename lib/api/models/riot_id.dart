import 'package:league_of_api/api/models/tag_line.dart';

class RiotId {
  final String _gameName;
  final TagLine _tagLine;

  RiotId(this._gameName, this._tagLine);

  String get gameName {
    return _gameName;
  }

  String get tagLine {
    return _tagLine.toString();
  }
}
