{
  # lib,
  inputs,
  # namespace,
  pkgs,
  # stdenv,
  ...
}: let
  nixvim' = inputs.nixvim.legacyPackages.${pkgs.system};
in
  nixvim'.makeNixvimWithModule {
    inherit pkgs;
    module = ./config;
  }
