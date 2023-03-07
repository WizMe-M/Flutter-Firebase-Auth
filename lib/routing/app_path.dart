enum AppPage {
  signUp('/sign-up'),
  signIn('/sign-in'),
  signInWithPassword('/sign-in/email'),
  signInWithLink('/sign-in/link'),
  home('/home');

  const AppPage(this.path);

  final String path;
}
