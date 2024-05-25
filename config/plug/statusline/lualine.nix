{config, ...}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins.lualine = {
    enable = true;
    globalstatus = true;
    disabledFiletypes = {
      statusline = ["dashboard" "alpha" "starter"];
    };

    winbar = {
      lualine_a = ["mode"];
      lualine_b = [
        {
          name = "diagnostic";
          extraConfig = {
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          };
        }
      ];
      lualine_c = [
        {
          name = "filename";
          extraConfig = {
            newfile_status = true;
            path = 1;
            symbols = {readonly = "[R/O]";};
          };
        }
      ];
    };

    inactiveWinbar = {
      lualine_a = [];
      lualine_b = [
        {
          name = "diagnostic";
          extraConfig = {
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          };
        }
      ];
      lualine_c = [
        {
          name = "filename";
          extraConfig = {
            newfile_status = true;
            path = 1;
            symbols = {readonly = "[R/O]";};
          };
        }
      ];
    };
  };
}
