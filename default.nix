{ pkgs ? import <nixpkgs> {}
}: {
  javac = import ./javac.nix { inherit pkgs; };
}

