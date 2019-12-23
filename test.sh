#! /bin/sh
nix-build test
nix-shell -p jdk --run "java -cp ./result/simple:./result/withClassPath WithClassPath"

