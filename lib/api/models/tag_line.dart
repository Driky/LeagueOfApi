import 'package:equatable/equatable.dart';

class TagLine extends Equatable {
  late final String _tag;

  TagLine(String _tag) {
    var exp = RegExp(r'^\d{4}$');
    if (!exp.hasMatch(_tag)) {
      throw Exception('Wrong format. A TagNine is a string of 4 digits.');
    }
    this._tag = _tag;
  }

  @override
  String toString() {
    return _tag;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_tag];
}
