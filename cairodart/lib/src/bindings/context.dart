part of cairodart.base;

abstract class Context {
  
  factory Context() {
    return new _Context();
  }
  
}


class _Context extends NativeFieldWrapperClass2 implements Context {
  
  _Context() {
    _create();
  }
  
  void _create() native 'createContext';
  
}