{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    updateInInsert = false;
    sources = {
      code_actions = {
        gitsigns.enable = true;
      };
      diagnostics = {
        yamllint.enable = true;
        codespell.enable = true;
        markdownlint_cli2.enable = true;
      };
      formatting = {
        prettier.enable = true;
        prettierd.enable = true;
        stylua.enable = true;
        yamlfmt.enable = true;
      };
    };
  };
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
