enum Profile {
  dev('lib/resource/env/dev.env'),
  local('lib/resource/env/local.env'),
  prod('lib/resource/env/prod.env');

  final String path;

  const Profile(this.path);

  String get value => path;

  static Profile stringToProfile(String inputValue) {
    return switch (inputValue) {
      'dev' => Profile.dev,
      'local' => Profile.local,
      'prod' => Profile.prod,
      _ => Profile.local,
    };
  }
}
