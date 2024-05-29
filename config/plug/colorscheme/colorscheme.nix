{lib, ...}: let
  lua = x: {__raw = x;};
in {
  colorschemes = {
    gruvbox = {
      enable = false;
      settings = {
        transparent_mode = true;
      };
    };

    onedark = {
      enable = false;
      settings = {
        style = "deep";
        transparent = false;
        ending_tildes = true;

        code_style = {
          comments = "italic";
          keywords = "bold";
          functions = "bold";
        };

        highlights = {
          TelescopeBorder.fg = "$orange";
          TelescopePromptBorder.fg = "$blue";
          TelescopeResultsBorder.fg = "$blue";
          TelescopePreviewBorder.fg = "$blue";
        };
      };
    };

    solarized-osaka = let
      transparent = true;
    in {
      enable = true;
      settings = {
        inherit transparent;
        styles = {
          sidebars = lib.mkIf transparent "transparent";
          floats = lib.mkIf transparent "transparent";
        };

        on_colors =
          #lua
          ''
            function(c)
              c.bg_statusline = ${
              if transparent
              then "c.none"
              else "c.base04"
            }
            end
          '';
        on_highlights =
          #lua
          ''
            function(hl, c)
                hl.WinSeparator = {
                  fg = c.blue700,
                  bold = true,
                }
                hl.TelescopeBorder = {
                  fg = c.blue700,
                }
                hl.TelescopeNormal = {
                  fg = c.fg,
                }
                hl.StatusLine = {
                  bg = c.bg_statusline,
                  fg = c.fg
                }
                hl.StatusLineNC = {
                  bg = c.bg_statusline,
                  fg = c.fg
                }
                hl.lualine_c_normal = {
                  bg = c.bg_statusline,
                  fg = c.fg
                }
                hl.lualine_b_normal = {
                  bg = c.bg_statusline,
                  fg = c.fg
                }
                hl.ColorColumn = {
                  bg = c.blue900
                }
                hl.Cursor = {
                  fg = c.blue900
                }
                hl.lCursor = {
                  fg = c.blue900
                }
                hl.CursorIM = {
                  fg = c.blue900
                }
                hl.CursorLine = {
                  bg = c.blue900
                }
                hl.EndOfBuffer = {
                  fg = c.yellow700
                }
                hl.LazyGitBorder = {
                  fg = c.blue700,
                  bg = c.base04
                }
                hl.LazyGitFloat = {
                  fg = c.base0,
                  bg = c.base04
                }
            end
          '';
      };
    };

    tokyonight = {
      enable = false;
      settings = {
        style = "storm";
        transparent = false;
        onHighlights = ''
          function(hl, c)
              local prompt = "#2d3149"
              hl.TelescopeNormal = {
                  bg = c.bg_dark,
                  fg = c.fg_dark,
              }
              hl.TelescopeBorder = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              hl.TelescopePromptNormal = {
                  bg = prompt,
              }
              hl.TelescopePromptBorder = {
                  bg = prompt,
                  fg = prompt,
              }
              hl.TelescopePromptTitle = {
                  bg = prompt,
                  fg = prompt,
              }
              hl.TelescopePreviewTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              hl.TelescopeResultsTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              end
        '';
      };
    };
    oxocarbon.enable = false;
    rose-pine = {
      enable = false;
      settings = {
        style = "main"; #  "main", "moon", "dawn" or raw lua code
        styles = {
          bold = false;
          italic = false;
          transparency = true;
        };
        transparentBackground = true;
        highlightGroups = {
          TelescopeNormal = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
          TelescopeBorder = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
          TelescopePreviewTitle = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
        };
      };
    };
    catppuccin = {
      enable = false;
      settings = {
        background = {
          light = "macchiato";
          dark = "macchiato";
        };
        flavour = "macchiato"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
        disableBold = false;
        disableItalic = false;
        disableUnderline = false;
        transparentBackground = true;
        integrations = {
          cmp = true;
          noice = true;
          notify = true;
          gitsigns = true;
          which_key = true;
          illuminate = {
            enabled = true;
          };
          treesitter = true;
          treesitter_context = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini.enabled = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
        };
      };
    };
  };
}
