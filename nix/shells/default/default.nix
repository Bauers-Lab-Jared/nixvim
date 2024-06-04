{
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  lib,
  # You also have access to your flake's inputs.
  # inputs,
  namespace,
  # All other arguments come from NixPkgs. You can use `pkgs` to pull shells or helpers
  # programmatically or you may add the named attributes as arguments here.
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = [
    pkgs.go-task
    (lib.${namespace}.mkNixvim {
      inherit pkgs;
      addons = ["proj-nix"];
    })
  ];
}
