# division

A flutter widget inspired by HTML/CSS

## Getting Started

This package is all about giving a simple common use widget inspired by HTML/ CSS. The widget has 3 main parameters. Style: everything related to styling, gesture: all gesture functions and child. As simple as that!

### The basic widget

```dart
Division(style: [], gesture: [], child: Widget);
```
### Example

```dart
import 'package:division/division.dart'

Division(
  style: [
    S.height(100.0),
    S.width(500.0),
    S.minWidth(500.0),
    S.align('center'),
    S.alignChild('center'),
    S.padding(vertical: 20.0, horizontal: 10.0),
    S.margin(horizontal: 30.0),
    S.backgroundColor(hex: '55ffff'),
    S.borderRadius(all: 20.0),
    S.boxShadow(hex: '55ffff', spread: -10.0, blur: 20.0, offset: [0.0, 15.0]),
  ],
  gesture: [
    G.onTap(() => print('Division widget pressed!')),
  ],
  child: Text('Centered text inside the division widget'),
)
```

![App demo](https://drive.google.com/uc?id=1yULs_-2BpocAPPSLjxWLr6zCbMjjwqo7)

Having one list of all styling improves readability. But maybe more important, it makes it very easy to store the style in variables and share the same style accross many widgets.

### Style Property

*The `S` class is responsible for everything stylingwise*

- **`S.height(), S.minHeight(), S.maxHeight(), S.width(), S.minWidth(), S.maxWidth()`** - Expects a double

- **`S.align()`** - Alignment of the Division widget. Expects a String. Valid values: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`

- **`S.alignChild()`** - Alignment of the child widget. Expects a String. Valid values: `'center'`, `'top'`, `'bottom'`, `'left'`, `'right'`, `'topLeft'`, `'topRight'`, `'bottomLeft'` and `'bottomRight'`

- **`S.padding`** - You can choose how you want your padding to work. Eighter specify the `all` parameter with a double, the `horizontal` and `vertical` parameter with a double or `top`, `bottom`, `left` and `right` parameter with a double.

- **`S.margin`** - You can choose how you want your padding to work. Eighter specify the `all` parameter with a double, the `horizontal` and `vertical` parameter with a double or `top`, `bottom`, `left` and `right` parameter with a double.

- **`S.backgroundColor`** - Expects eighter the `hex` parameter as a 6 digit hex color, `rgba` parameter in the [r,g,b,a] format or the normal flutter `Color` format.

- **`S.borderRadius`** - Expects eighter the `all` parameter as a double or `topLeft`, `topRight`, `bottomLeft` and `bottomRight` parameters as a double

- **`S.boxShadow`** - Expects a `color` parameter in the form of eighter the `hex` parameter, the `rgba` parameter or the standart `color` parameter. Expects `spread` parameter as a double, the `blur` parameter as a double. The `offset` parameter can eighter be specified as a `List` with one item. That single item will apply on both the horizontal and the vertical axis. The `offset` parameter can also be specified with a `List` of 2 items, which will apply on the horizontal and vertical axis.

Future features
- **`S.animate`** - Animates between a old and new style property. Expects a `duration` parameter in milliseconds, a `curve` parameter and a `only` parameter witch contains a list of the style properties the animation is going to get applied to.
What it might look like: `S.animate(duration: 500, curve: 'ease-in', only: ['width', 'margin'])`

  
### Gesture Property

*The `G` class is responsible for all the gestures*

- **`G.onTap()`** - onTap function

Future features
- Other useful gesture functions

### GestureStyle (not implemented yet)

Style to be applied while a gesture is taking place. For example button style when button is beeing pressed.

### Child Property

Widget child