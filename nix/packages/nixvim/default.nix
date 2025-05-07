{
  # lib,
  inputs,
  # namespace,
  pkgs,
  # stdenv,
  ...
}: let
  targetSystem = pkgs.system;
  nixvim' = inputs.nixvim.legacyPackages.${targetSystem};
  nixpkgs = inputs.nixpkgs.legacyPackages.${targetSystem};
in
  nixvim'.makeNixvimWithModule {
    pkgs = nixpkgs;
    module = ./config;
  }
