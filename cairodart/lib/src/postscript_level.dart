part of cairodart.base;

abstract class PostScriptLevel {
  static final PostScriptLevel LevelTwo = new _PostScriptLevel(0);
  static final PostScriptLevel LevelThree = new _PostScriptLevel(1);


  int get value;

}

class _PostScriptLevel implements PostScriptLevel {

  int _val;
  int get value => _val;

  _PostScriptLevel(this._val);

  @override
  operator==(PostScriptLevel other) => other.value == value;

  @override
  String toString() => _levelToString(value);

  String _levelToString(int val) native 'ps_level_to_string';
}