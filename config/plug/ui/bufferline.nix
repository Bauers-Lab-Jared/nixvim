{
  config,
  lib,
  ...
}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins = {
    bufferline = {
      enable = true;
      showBufferCloseIcons = false;
      separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
      highlights = lib.mkIf config.colorschemes.base16.enable {
        fill = {
          fg = colors.base00;
          bg = colors.base00;
        };
        background = {
          fg = colors.base03;
          bg = colors.base00;
        };
        bufferSelected = {
          fg = colors.base05;
          bg = colors.base00;
          italic = false;
        };
        bufferVisible = {
          fg = colors.base03;
          bg = colors.base00;
        };
        closeButton = {
          fg = colors.base03;
          bg = colors.base00;
        };
        closeButtonVisible = {
          fg = colors.base03;
          bg = colors.base00;
        };
        closeButtonSelected = {
          fg = colors.base08;
          bg = colors.base00;
        };

        indicatorSelected = {
          fg = colors.base00;
          bg = colors.base00;
        };
        modified = {
          fg = colors.base03;
          bg = colors.base00;
        };
        modifiedVisible = {
          fg = colors.base00;
          bg = colors.base00;
        };
        modifiedSelected = {
          fg = colors.base0B;
          bg = colors.base00;
        };
        tabClose = {
          fg = colors.base00;
          bg = colors.base00;
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "m";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "M";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bdr";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bdl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bdo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bdd";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>enew<cmd>";
      options.desc = "Window [n]ew buffer";
    }
  ];
}
