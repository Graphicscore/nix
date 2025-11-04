{config, pkgs, lib, ... }:

{
  itchy-theme = pkgs.stdenv.mkDerivation {
    pname = "itchy-theme";
    version = "latest";
    src = pkgs.fetchgit {
      url = "https://gitlab.com/jomada/Itchy";
      rev = "4e2f1f224dceae4f4625e66732919fb93ce6145c";
    };
    installPhase = ''
      mkdir -p $out/share/plasma
      cp -aR * $out/share/plasma
    '';
  };
}