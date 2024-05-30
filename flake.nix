{
  description = "Bauer's Lab - Composable NixVim Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        root = ./nix;

        namespace = "bl-nixvim";

        meta = {
          name = "bauers-lab-nixvim";

          title = "Bauer's Lab NixVim";
        };
      };
    };
}
