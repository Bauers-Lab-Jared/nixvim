{
  description = "Forked from Elyth's NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    flake-parts,
    pre-commit-hooks,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        system,
        pkgs,
        self',
        lib,
        ...
      }: let
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
        };
        nvim-odin = nvim.nixvimExtend (import ./languages/odin.nix);
      in {
        checks = {
          default = pkgs.nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration";
          };
          odin = pkgs.nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim-odin;
            name = "A nixvim configuration for odin projects";
          };
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              statix.enable = true;
              alejandra.enable = true;
            };
          };
        };

        formatter = pkgs.alejandra;

        packages.default = nvim;
        packages.nvim-odin = nvim-odin;

        devShells = {
          default = with pkgs;
            mkShell {inherit (self'.checks.pre-commit-check) shellHook;};
        };
      };
    };
}
