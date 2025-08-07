{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
in
{
  # https://devenv.sh/basics/
  env.PKG_CONFIG_PATH = "${pkgs.glib.dev}/lib/pkgconfig,${pkgs.graphene.dev}/lib/pkgconfig,${pkgs.gtk4.dev}/lib/pkgconfig,${pkgs.libadwaita.dev}/lib/pkgconfig";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    glib.dev
    pkg-config
    graphene.dev
    gtk4.dev
    libadwaita.dev
  ];

  # https://devenv.sh/languages/
  languages.rust = {
    enable = true;
    channel = "nixpkgs";
  };

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = ''
  #   echo hello from $GREET
  # '';

  enterShell = ''
    tmux
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
