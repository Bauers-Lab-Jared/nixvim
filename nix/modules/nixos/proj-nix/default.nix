{
  plugins = {
    lsp.servers.nixd.enable = true;
    conform-nvim.settings.formatters_by_ft.nix = ["alejandra"];
    none-ls = {
      sources = {
        code_actions.statix.enable = true;
        diagnostics.statix.enable = true;
        formatting.alejandra.enable = true;
      };
    };
  };
}
