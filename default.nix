{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.pkgs.haskellPackages.callPackage ./natural-haskell.nix { pkgs = nixpkgs; }

