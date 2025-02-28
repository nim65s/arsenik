{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "arsenik";
  version = "0.2.0";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.gitTracked ./kanata;
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share
    cp -r kanata $out/share/arsenik
  '';
}
