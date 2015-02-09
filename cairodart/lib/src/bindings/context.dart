part of cairodart.base;

abstract class Context {
  
  factory Context(Surface surface) {
    return new _Context(surface);
  }
  
  void save();
  void restore();
  void pushGroup();
  void pushGroupWithContent(Content content);
  void popGroupToSource();
  void setSourceRgb(double red, double green, double blue);
  void setSourceRgba(double red, double green, double blue, double alpha);
  void stroke();
  void paint();
  
}


class _Context extends NativeFieldWrapperClass2 implements Context {
  
  _Context(Surface surface) {
    _create(surface);
  }
  
  void _create(Surface surface) native 'context_create';
  
  void save() native 'save';
  
  void restore() native 'restore';
  
  void pushGroup() native 'push_group';
  
  void pushGroupWithContent(Content content) native 'push_group_with_content';
  
  void popGroupToSource() native 'pop_group_to_source';
  
  void setSourceRgb(double red, double green, double blue) native 'set_source_rgb';
  
  void setSourceRgba(double red, double green, double blue, double alpha) native 'set_source_rgba';
  
  void stroke() native 'stroke';
  
  void paint() native 'paint';
  
}