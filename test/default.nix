{ pkgs ? import <nixpkgs> {}
, mkDerivation ? pkgs.stdenv.mkDerivation
}:
mkDerivation {
  name         = "nix-javac-examples";
  version      = "0.1.0";
  phases       = ["installPhase"];
  installPhase = ''
    mkdir $out
    ln -s ${import ./simple { inherit pkgs; } } $out/simple
  '';
}

