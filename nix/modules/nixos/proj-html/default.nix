{
  plugins = {
    lsp.servers = {
      html.enable = true;
      cssls.enable = true;
      htmx.enable = true;
    };
    conform-nvim.settings.formatters_by_ft = {
      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];
    };
  };
}
