{
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  lib,
  # You also have access to your flake's inputs.
  inputs,
  # All other arguments come from NixPkgs. You can use `pkgs` to pull shells or helpers
  # programmatically or you may add the named attributes as arguments here.
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = let
    inherit (lib.snowfall.fs) get-file;

    username = lib.removeSuffix "\n" (builtins.readFile (get-file ".user"));

    nixvim-base =
      if username != ""
      then pkgs.nixvim.nixvimExtend (import (get-file "modules/nixos/user-${username}"))
      else pkgs.nixvim;

    nixvim-final =
      nixvim-base.nixvimExtend (import (get-file "modules/nixos/proj-nix"));
  in [
    nixvim-final
  ];
}
