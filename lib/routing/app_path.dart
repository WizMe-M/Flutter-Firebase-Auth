enum AppPage {
  signUp('/sign-up'),
  signIn('/sign-in'),
  home('/home');

  const AppPage(this.path);

  final String path;
}
