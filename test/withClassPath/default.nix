{ pkgs
}: let
  javac = import ../../javac.nix { inherit pkgs; };
in javac {
  debug = true;
  name = "test.withClassPath";
  version = "0.1.0";
  classpath = [
    (import ../simple { inherit pkgs; })
  ];
  src = ./src;
} 

