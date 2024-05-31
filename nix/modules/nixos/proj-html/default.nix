{
  plugins = {
    lsp.servers = {
      html.enable = true;
      cssls.enable = true;
      htmx.enable = true;
    };
    conform-nvim.formattersByFt = {
      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];
    };
  };
}
