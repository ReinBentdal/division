# Division

A simple to use yet powerfull styling oriented package with syntax inspired by CSS.

## Getting Started

**A basic example**
```dart
Parent(child: Icon(Icons.add))
    .width(200)
    .height(250)
    .centerChild()
    .backgroundColor(Colors.grey)
    .elevation(5)
    .borderRadius(all: 30)
    .animate(500, Curves.easeIn)
    .gesture(
        onTap: () => print('Parent tapped'),
    )
    .build()

Txt('Some text', angleFormat: AngleFormat.degree)
    .elevation(10, angle: 180)
    .bold()
    .fontSize(24)
    .width(100)
    .height(150)
    .backgroundColor(Colors.grey)
    .ripple(true)
    .build()

```

The Txt widget is still a beta feature

### Current priorities
- Add & update documentation. [Help contribute](https://github.com/ReinBentdal/division)
- Txt into a stable version