{ pkgs ? import <nixpkgs> {}
}:
{ debug ? false
, jdk ? pkgs.jdk
, name
, version
, src ? null
, srcs ? []
, classpath ? []
, sourceVersion ? null
, targetVersion ? null
, encoding ? "UTF-8"
}: let
  inherit (builtins)
    concatStringsSep;
  inherit (pkgs.lib)
    optional;

  mapOptArg = name: f: value: optional (value != null && value != []) "-${name} ${f value}";
  optArg    = name: mapOptArg name (x: x);

  javacArgs = []
    ++ mapOptArg "classpath" (concatStringsSep ":") classpath
    ++ optArg "source" sourceVersion
    ++ optArg "target" targetVersion
    ++ [ "-encoding ${encoding}" ];
  javacCmd = "javac ${concatStringsSep " " javacArgs} -d $out $src/*";

in pkgs.stdenv.mkDerivation {
  inherit name version src srcs;
  phases = [ "unpackPhase" "buildPhase" ];
  buildPhase = ''
    ${if debug then "echo \"${javacCmd}\"" else "" }
    mkdir $out
    ${jdk}/bin/${javacCmd}
  '';
}

