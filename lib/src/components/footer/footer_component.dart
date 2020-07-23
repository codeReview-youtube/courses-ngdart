import 'package:angular/angular.dart';

@Component(
  selector: 'footer',
  template: '''
  <div class="row">
    <div class="col d-flex justify-content-center align-items-center">
    <p class="text-muted lead">Copyright &#169; {{date}} | CodeReview.io</p></div>
  </div>
  ''',
  directives: [coreDirectives],
)
class FooterComponent {
  int date = DateTime.now().year;
}
