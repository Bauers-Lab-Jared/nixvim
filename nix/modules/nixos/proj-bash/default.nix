{pkgs, ...}: {
  extraPackages = [
    pkgs.shellcheck
  ];
  plugins = {
    lsp.servers = {
      bashls.enable = true;
    };
  };
}
