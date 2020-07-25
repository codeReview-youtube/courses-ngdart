import 'dart:html' as html;
import 'package:angular/core.dart';

@Directive(selector: '[highlight]')
class HighlightDirective {
  html.Element _elementRef;

  @Input('highlight')
  String highlightColor;

  @Input('defaultColor')
  String defaultColor;

  HighlightDirective(this._elementRef);

  @HostListener('mouseenter')
  void onMouseEnter() => _highlight(
        highlightColor ?? defaultColor ?? 'red',
      );

  @HostListener('mouseleave')
  void mouseLeave() => _highlight();

  void _highlight([String color, String opacity]) {
    this._elementRef.style.transition = 'all 750ms ease';
    this._elementRef.style.opacity = opacity;
    this._elementRef.style.backgroundColor = color;
  }
}
