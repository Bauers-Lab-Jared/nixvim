{config, ...}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins.lualine = {
    enable = true;
    globalstatus = true;
    disabledFiletypes = {
      statusline = ["dashboard" "alpha" "starter"];
    };

    sections = {
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
            path = 2;
            symbols = {readonly = "[R/O]";};
          };
        }
      ];
    };

    inactiveSections = {
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
            path = 2;
            symbols = {readonly = "[R/O]";};
          };
        }
      ];
    };
  };
}
