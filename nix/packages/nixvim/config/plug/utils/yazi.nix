{
  plugins.yazi = {
    enable = true;
    settings = {
      enable_mouse_support = true;
      floating_window_scaling_factor = 0.95;
      open_for_directories = true;
      keymaps = {
        show_help = "?";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Explore<CR>";
      options.desc = "Explore files";
    }
  ];
}
