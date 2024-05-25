{
  plugins.mini = {
    enable = true;
    modules = {
      files = {
        mappings = {
          go_in = "<right>";
          go_out = "<left>";
        };
        windows = {
          preview = true;
          width_nofocus = 25;
          width_preview = 80;
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>";
      options.desc = "Explore files";
    }
  ];
}
