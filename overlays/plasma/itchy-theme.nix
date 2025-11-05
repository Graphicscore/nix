final: prev: {
  itchy-theme = prev.stdenv.mkDerivation rec {
    pname = "itchy-theme";
    version = "latest";
    src = prev.fetchgit {
      url = "https://gitlab.com/jomada/Itchy";
      rev = "4e2f1f224dceae4f4625e66732919fb93ce6145c";
      hash = "sha256-w3D5dZPBhuNiqQXY4g8zngk3hGbGaPSVYSbSSXO8RLw=";
    };
    installPhase = ''
      mkdir -p $out/share/plasma
      cp -aR * $out/share/plasma
    '';
  };
}