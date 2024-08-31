{
  plugins = {
    lsp.servers = {
      gopls.enable = true;
    };
    conform-nvim.settings.formatters_by_ft.go = [
      "goimports"
      "gofmt"
      "golines"
    ];
    none-ls = {
      sources = {
        code_actions.gomodifytags.enable = true;
        completion.tags.enable = true;
        diagnostics.golangci_lint.enable = true;
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          golines.enable = true;
        };
      };
    };
  };
}