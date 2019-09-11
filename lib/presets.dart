import 'src/style.dart';

// // The goal of the presets is to both offer material design presets and some custom
// // but to have custom good looking presets as an alternative to material design.

// // dummies presets. Please contribute!

// StyleClass cardStyle = StyleClass()
//   ..background.hex('#f5f5f5')
//   ..borderRadius(all: 10.0)
//   ..elevation(1)
//   ..alignment.center()
//   ..alignmentChild.center()
//   ..margin(horizontal: 20.0, vertical: 10.0)
//   ..padding(all: 20.0)
//   ..height(300);

// StyleClass rasiedButtonStyle = StyleClass()
//   ..width(150)
//   ..height(50)
//   ..borderRadius(all: 30.0)
//   ..elevation(5.0)
//   ..background.hex('#f5f5f5')
//   ..alignment.center()
//   ..alignmentChild.center();

StyleClass frostedGlassStyle = StyleClass()
  ..width(400)
  ..height(400)
  ..alignment.center()
  ..borderRadius(all: 10)
  ..background.blur(20)
  ..background.rgba(255, 255, 255, 0.15);
