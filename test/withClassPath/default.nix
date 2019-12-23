{ pkgs
}: let
  nix-java = import ../.. { inherit pkgs; };
in nix-java.javac {
  debug = true;
  name = "test.withClassPath";
  version = "0.1.0";
  classpath = [
    (import ../simple { inherit pkgs; })
  ];
  src = ./src;
} 

