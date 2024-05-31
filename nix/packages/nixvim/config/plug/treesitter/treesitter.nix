{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

  extraPackages = [
    pkgs.zig
  ];

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  '';
}
