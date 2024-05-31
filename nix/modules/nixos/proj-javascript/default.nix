{
  plugins = {
    lsp.servers.tsserver.enable = true;
    typescript-tools.enable = true;
    conform-nvim.formattersByFt = {
      javascript = [["prettierd" "prettier"]];
      typescript = [["prettierd" "prettier"]];
    };
  };
}
