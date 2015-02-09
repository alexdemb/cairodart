part of cairodart.base;

abstract class Context {
  
  factory Context(Surface surface) {
    return new _Context(surface);
  }
  
}


class _Context extends NativeFieldWrapperClass2 implements Context {
  
  _Context(Surface surface) {
    _create(surface);
  }
  
  void _create(Surface surface) native 'context_create';
  
}