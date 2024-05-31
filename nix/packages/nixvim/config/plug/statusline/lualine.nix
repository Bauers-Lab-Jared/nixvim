{helpers, ...}: {
  plugins.lualine = let
    separators = {
      left = "";
      right = "";
    };
    removeComponent = name: {
      inherit name;
      fmt = ''
        function(str)
          return ""
        end
      '';
    };
    removeComponents = names: builtins.map removeComponent names;
  in {
    enable = true;
    componentSeparators = separators;
    sectionSeparators = separators;

    sections = {
      lualine_b =
        (removeComponents ["branch" "diff" "diagnostics"])
        ++ [
          {
            name = "location";
            color = {
              bg = "bg";
              fg = "fg";
            };
          }
          {
            name = "progress";
            color = {
              bg = "bg";
              fg = "fg";
            };
          }
          {
            name = "filename";
            color = {
              bg = "bg";
              fg = "fg";
            };
            extraConfig = {
              # cond = helpers.mkRaw ''
              #   function()
              #     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
              #   end
              # '';
              newfile_status = true;
              path = 1;
              symbols = {
                readonly = "[R/O]";
                unnamed = "";
              };
            };
          }
        ];

      lualine_c = [
        (removeComponent "filename")
        {
          name = "diagnostics";
          color.bg = "bg";
          extraConfig = {
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
            };
            diagnostics_color = {
              color_error = {fg = "red";};
              color_warn = {fg = "yellow";};
              color_info = {fg = "cyan";};
            };
          };
        }
      ];

      lualine_x = [
        (removeComponent "fileformat")
        {
          name = "filetype";
          color = {
            bg = "bg";
            fg = "fg";
            gui = "bold";
          };
        }
        {
          name = "encoding";
          fmt = "string.upper";
          extraConfig.cond = helpers.mkRaw ''
            function()
              return vim.fn.winwidth(0) > 80
            end
          '';
          color = {
            bg = "bg";
            fg = "fg";
            gui = "bold";
          };
        }
      ];

      lualine_y = [
        (removeComponent "progress")
        {
          name = "branch";
          color = {
            bg = "bg";
            fg = "fg";
          };
        }
        {
          name = "diff";
          color = {
            bg = "bg";
          };
        }
      ];

      lualine_z = [
        (removeComponent "location")
      ];
    };
    inactiveSections = {
      lualine_c = [
        (removeComponent "filename")
      ];
      lualine_x = [
        (removeComponent "location")
      ];
    };
  };
}
