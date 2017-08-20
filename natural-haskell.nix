{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "NaturalHaskell";
  version = "1.0";
  src = ./.;
  libraryHaskellDepends = [ base ];
  homepage = "https://github.com/rylm/NaturalHaskell";
  description = "An implementation of natural numbers and basic arithmetic in Haskell";
  license = stdenv.lib.licenses.agpl3;
}
