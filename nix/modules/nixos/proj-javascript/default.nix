{
  plugins = {
    lsp.servers.tsserver.enable = true;
    typescript-tools.enable = true;
    conform-nvim.settings.formatters_by_ft = {
      javascript = [["prettierd" "prettier"]];
      typescript = [["prettierd" "prettier"]];
    };
  };
}
