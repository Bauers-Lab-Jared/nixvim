{
  config,
  lib,
  ...
}: {
  imports = [
    ./keys.nix
    ./sets.nix

    ./plug/colorscheme/colorscheme.nix
    ./plug/colorscheme/solarized-osaka.nix

    ./plug/completion/cmp.nix
    ./plug/completion/copilot-cmp.nix
    ./plug/completion/lspkind.nix
    ./plug/completion/schemastore.nix

    ./plug/git/gitlinker.nix
    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix
    ./plug/git/worktree.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/hlchunk.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/none-ls.nix
    ./plug/lsp/trouble.nix

    ./plug/mini/ai.nix
    ./plug/mini/surround.nix
    ./plug/mini/operators.nix
    ./plug/mini/files.nix
    ./plug/mini/hipatterns.nix
    ./plug/mini/comment.nix

    ./plug/snippets/luasnip.nix

    ./plug/statusline/lualine.nix

    #./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    ./plug/ui/bufferline.nix
    ./plug/ui/noice.nix
    ./plug/ui/nvim-notify.nix
    ./plug/ui/telescope.nix

    ./plug/utils/copilot.nix
    ./plug/utils/flash.nix
    #./plug/utils/harpoon.nix
    ./plug/utils/grapple.nix
    # ./plug/utils/illuminate.nix
    ./plug/utils/undotree.nix
    ./plug/utils/ufo.nix
    ./plug/utils/whichkey.nix
  ];
  options = {
    theme = lib.mkOption {
      default = "tokyonight";
      type = lib.types.enum ["paradise" "decay" "mountain" "tokyonight" "everforest" "everblush" "jellybeans" "aquarium" "gruvbox"];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "tokyonight";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
