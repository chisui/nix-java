{ pkgs
}: let
  nix-java = import ../.. { inherit pkgs; };
in nix-java.javac {
  debug = true;
  name = "test.simple";
  version = "0.1.0";
  src = ./src;
} 

