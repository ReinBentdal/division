import '../model/overflow.dart';

OverflowType formatOverflow(String overflow) {
  OverflowType formattedOverflow;
  // if (overflow is OverflowType)
  //   formattedOverflow = overflow;
  if (overflow == 'visible')
    formattedOverflow = OverflowType.visible;
  else if (overflow == 'hidden')
    formattedOverflow = OverflowType.hidden;
  else if (overflow == 'scroll')
    formattedOverflow = OverflowType.scroll;
  else
    throw ('Unsupported overflow value: $overflow');
  return formattedOverflow;
}
