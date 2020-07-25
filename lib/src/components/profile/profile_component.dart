import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/profile/profile-service.dart';
import 'package:courses/src/model/profile_model.dart';

@Component(
    selector: 'profile',
    templateUrl: './profile_template.html',
    directives: [
      coreDirectives,
      routerDirectives,
      formDirectives,
    ],
    providers: [
      ClassProvider(ProfileService)
    ],
    pipes: [
      commonPipes
    ])
class ProfileComponent implements OnInit {
  final ProfileService _profileService;
  bool editMode = false;
  Profile profile;

  ProfileComponent(this._profileService);

  @override
  void ngOnInit() {
    profile = this._profileService.getProfile();
  }
}
