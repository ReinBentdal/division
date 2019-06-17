import 'src/function/color.dart';
import 'src/style_class.dart';

// The goal of the presets is not to replicate material design,
// but to have custom good looking presets as an alternative to material design.

// dummies presets. Please contribute!

StyleClass cardStyle = StyleClass()
  ..backgroundColor('#f5f5f5')
  ..borderRadius(all: 10.0)
  ..elevation(1)
  ..align('center')
  ..alignChild('center')
  ..margin(horizontal: 20.0, vertical: 10.0)
  ..padding(all: 20.0)
  ..height(300);

StyleClass rasiedButtonStyle = StyleClass()
  ..width(150)
  ..height(50)
  ..borderRadius(all: 30.0)
  ..elevation(5.0)
  ..backgroundColor('#03A9F4')
  ..align('center')
  ..alignChild('center');

StyleClass frostedGlassStyle = StyleClass()
  ..width(400)
  ..height(400)
  ..align('center')
  ..borderRadius(all: 10)
  ..backgroundBlur(20)
  ..backgroundColor(rgba(255,255,255,0.15));