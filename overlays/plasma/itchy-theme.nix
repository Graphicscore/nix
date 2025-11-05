{lib, pkgs, ...}:

{
  itchy-theme = pkgs.mkDerivation {
    pname = "itchy-theme";
    version = "latest";
    src = pkgs.fetchgit {
      url = "https://gitlab.com/jomada/Itchy";
      rev = "4e2f1f224dceae4f4625e66732919fb93ce6145c";
      hash = "sha-256-w3D5dZPBhuNiqQXY4g8zngk3hGbGaPSVYSbSSX08RLw=";
    };
    installPhase = ''
      mkdir -p $out/share/plasma
      cp -aR * $out/share/plasma
    '';
  };
}