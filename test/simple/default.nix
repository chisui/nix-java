{ pkgs
}: let
  javac = import ../../javac.nix { inherit pkgs; };
in javac {
  debug = true;
  name = "test.simple";
  version = "0.1.0";
  src = ./src;
} 

