moduleArgs @ {
  # Snowfall Lib provides a customized `lib` instance with access to your flake's library
  # as well as the libraries available from your flake's inputs.
  # lib,
  # An instance of `pkgs` with your overlays and packages applied is also available.
  pkgs,
  # You also have access to your flake's inputs.
  inputs,
  # Additional metadata is provided by Snowfall Lib.
  # system, # The system architecture for this host (eg. `x86_64-linux`).
  # target, # The Snowfall Lib target for this system (eg. `x86_64-iso`).
  # format, # A normalized name for the system target (eg. `iso`).
  # virtual, # A boolean to determine whether this system is a virtual target using nixos-generators.
  # systems, # An attribute map of your defined hosts.
  # All other arguments come from the module system.
  # config,
  # osConfig,
  ...
}: let
  inherit (moduleArgs.lib) thisFlake;
  scope = thisFlake.mkFeatureScope {
    moduleFilePath = __curPos.file;
    inherit moduleArgs;
  };
in let
  imports = with inputs; [
    nixvim.homeManagerModules.nixvim
  ];

  featOptions = {
  };

  featConfig = scope.mkMerge [
    (scope.WITH_HOME_FEAT_PATH {
      features = scope.enableFeatList [
        "ripgrep"
        "fd"
      ];
    })
    {
      home.packages = with pkgs; [
        alejandra
        codespell
        stylua
      ];

      programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;

        globals.mapleader = " ";

        extraConfigLua = ''
          vim.opt.undodir = os.getenv("HOME") .."/.persist/nvim/undodir";
        '';

        opts = {
          timeoutlen = 0;

          number = true; # Show line numbers
          relativenumber = true; # Show relative line numbers

          tabstop = 4;
          softtabstop = 4;
          expandtab = true;
          shiftwidth = 4;

          smartindent = true;

          wrap = false;

          swapfile = false;
          backup = false;
          undofile = true;

          hlsearch = false;
          incsearch = true;

          termguicolors = true;
          scrolloff = 8;
          signcolumn = "yes";

          updatetime = 50;

          colorcolumn = "80";
        };

        extraPlugins = with pkgs.vimPlugins; [
          onedark-nvim
          dressing-nvim
          nvim-web-devicons
        ];

        colorscheme = "onedark";

        keymaps =
          [
            {
              key = ",";
              action = ":";
              options.desc = ": (command mode)";
            }

            {
              key = ";";
              action = ":";
              options.desc = ": (command mode)";
            }

            {
              key = "<leader>e";
              action = "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>";
              options.desc = "[E]xplore (file browser)";
              mode = "n";
            }

            {
              key = "<Esc>";
              action = "<C-\\><C-n>";
              mode = "t";
            }

            {
              key = "<leader>u";
              action = "vim.cmd.UndotreeToggle";
              options.desc = "[U]ndotree";
              lua = true;
              mode = "n";
            }

            {
              key = "<leader>gg";
              action = "<cmd>Git<CR>";
              options.desc = "[g]it status";
              mode = "n";
            }

            {
              key = "<leader>gb";
              action = "<cmd>Git blame<CR>";
              options.desc = "Git [b]lame";
              mode = "n";
            }

            {
              key = "<leader>gd";
              action = "<cmd>Git diff<CR>";
              options.desc = "Git [d]iff";
              mode = "n";
            }

            {
              key = "<leader>gl";
              action = "<cmd>Git log<CR>";
              options.desc = "Git [l]og";
              mode = "n";
            }

            {
              key = "<leader>gm";
              action = "<cmd>Git mergetool<CR>";
              options.desc = "Git [m]ergetool";
              mode = "n";
            }

            {
              key = "<leader>gD";
              action = "<cmd>Git difftool<CR>";
              options.desc = "Git [d]ifftool";
              mode = "n";
            }

            {
              key = "<leader>gc";
              action = "<cmd>Git commit<CR>";
              options.desc = "Git [c]ommit";
              mode = "n";
            }

            {
              key = "<leader>gp";
              action = "<cmd>Git pull<CR>";
              options.desc = "Git [p]ull";
              mode = "n";
            }

            {
              key = "<leader>gP";
              action = "<cmd>Git push<CR>";
              options.desc = "Git [P]ush";
              mode = "n";
            }

            {
              key = "<leader>gB";
              action = "<cmd>Git branch<CR>";
              options.desc = "Git [b]ranch";
              mode = "n";
            }

            {
              key = "<leader><leader>q";
              action = ":wincmd q<CR>";
              options.desc = "Window [q]uit current";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>t";
              action = "gt";
              options.desc = "[t]ab next";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>t";
              action = ":wincmd T<CR>";
              options.desc = "Window make [t]ab";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>o";
              action = ":wincmd o<CR>";
              options.desc = "Window quit [o]thers";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>s";
              action = ":wincmd s<CR>";
              options.desc = "Window [s]plit";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>v";
              action = ":wincmd v<CR>";
              options.desc = "Window split [v]ertical";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>x";
              action = ":wincmd x<CR>";
              options.desc = "Window swap";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>w";
              action = ":wincmd w<CR>";
              options.desc = "Window next";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>c";
              action = ":bnext<CR>";
              options.desc = "Window [c]hange buffer";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader><leader>n";
              action = ''
                vim.ui.input({ prompt = "New buffer name?:"}, function(input)
                  vim.api.nvim_command(string.format( "badd %s", input))
                end)
              '';
              options.desc = "Window [n]ew buffer";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>qb";
              action = ":bprevious <bar> bdelete #<CR>";
              options.desc = "[q]uit [b]uffer";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>q!b";
              action = ":bprevious <bar> bdelete! #<CR>";
              options.desc = "[q]uit force [b]uffer";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>r";
              action = ":w<CR>";
              options.desc = "W[r]ite";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>qq";
              action = ":q<CR>";
              options.desc = "[q]uit";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>qw";
              action = ":wq<CR>";
              options.desc = "[q]uit with [w]rite";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>q!q";
              action = ":q!<CR>";
              options.desc = "[q]uit force";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<leader>q!w";
              action = ":wq!<CR>";
              options.desc = "[q]uit force [W]rite";
              mode = "n";
              options.silent = true;
            }
          ]
          ++ (let
            vimKeyPrefs = scope.config.thisFlake.userPrefs.keybinds.vim-like;
          in [
            {
              key = vimKeyPrefs.up;
              action = "gk";
              mode = "n";
            }

            {
              key = "<leader><leader>${vimKeyPrefs.up}";
              action = ":wincmd k<CR>";
              options.desc = "Window focus up";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<S-${vimKeyPrefs.up}>";
              action = "K";
              mode = "n";
            }

            {
              key = vimKeyPrefs.down;
              action = "gj";
              mode = "n";
            }

            {
              key = "<leader><leader>${vimKeyPrefs.down}";
              action = ":wincmd j<CR>";
              options.desc = "Window focus down";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<S-${vimKeyPrefs.down}>";
              action = "J";
              mode = "n";
            }

            {
              key = vimKeyPrefs.left;
              action = "<Left>";
              mode = "n";
            }

            {
              key = "<leader><leader>${vimKeyPrefs.left}";
              action = ":wincmd h<CR>";
              options.desc = "Window focus left";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<S-${vimKeyPrefs.left}>";
              action = "H";
              mode = "n";
            }

            {
              key = vimKeyPrefs.right;
              action = "<Right>";
              mode = "n";
            }

            {
              key = "<leader><leader>${vimKeyPrefs.right}";
              action = ":wincmd l<CR>";
              options.desc = "Window focus right";
              mode = "n";
              options.silent = true;
            }

            {
              key = "<S-${vimKeyPrefs.right}>";
              action = "L";
              mode = "n";
            }

            {
              key = "k";
              action = vimKeyPrefs.k;
              mode = "n";
            }

            {
              key = "K";
              action = "<S-${vimKeyPrefs.k}>";
              mode = "n";
            }

            {
              key = "j";
              action = vimKeyPrefs.j;
              mode = "n";
            }

            {
              key = "J";
              action = "<S-${vimKeyPrefs.j}>";
              mode = "n";
            }

            {
              key = "h";
              action = vimKeyPrefs.h;
              mode = "n";
            }

            {
              key = "H";
              action = "<S-${vimKeyPrefs.h}>";
              mode = "n";
            }

            {
              key = "l";
              action = vimKeyPrefs.l;
              mode = "n";
            }

            {
              key = "L";
              action = "<S-${vimKeyPrefs.l}>";
              mode = "n";
            }
          ]);

        plugins = {
          lualine = {
            enable = true;
            sections = {
              lualine_b = [
                {
                  name = "buffers";
                  extraConfig = {
                    mode = 2;
                  };
                }
              ];
              lualine_c = [
                {
                  name = "filename";
                  extraConfig = {
                    newfile_status = true;
                    path = 4;
                    symbols = {readonly = "[R/O]";};
                  };
                }
              ];
            };
            inactiveSections = {
              lualine_b = [
                {
                  name = "buffers";
                  extraConfig = {
                    mode = 2;
                  };
                }
              ];
              lualine_c = [
                {
                  name = "filename";
                  extraConfig = {
                    newfile_status = true;
                    path = 4;
                    symbols = {readonly = "[R/O]";};
                  };
                }
              ];
            };
            tabline = {
              lualine_a = ["mode"];
              lualine_b = ["branch"];
              lualine_z = [
                {
                  name = "tabs";
                  extraConfig = {
                    mode = 2;
                  };
                }
              ];
            };
            winbar = {
              lualine_a = [];
              lualine_b = [];
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
              lualine_x = [];
              lualine_y = [];
              lualine_z = [];
            };

            inactiveWinbar = {
              lualine_a = [];
              lualine_b = [];
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
              lualine_x = [];
              lualine_y = [];
              lualine_z = [];
            };
          };

          undotree = {
            enable = true;

            settings = {
              CursorLine = true;
              DiffAutoOpen = true;
              DiffCommand = "diff";
              DiffpanelHeight = 10;
              HelpLine = true;
              HighlightChangedText = true;
              HighlightChangedWithSign = true;
              HighlightSyntaxAdd = "DiffAdd";
              HighlightSyntaxChange = "DiffChange";
              HighlightSyntaxDel = "DiffDelete";
              RelativeTimestamp = true;
              SetFocusWhenToggle = true;
              ShortIndicators = false;
              SplitWidth = 40;
              TreeNodeShape = "*";
              TreeReturnShape = "\\";
              TreeSplitShape = "/";
              TreeVertShape = "|";
              WindowLayout = 4;
            };
          };

          harpoon = {
            enable = true;
            enableTelescope = true;
            markBranch = true;
            tmuxAutocloseWindows = true;

            keymaps.addFile = "<leader>sa";
            keymaps.toggleQuickMenu = "<leader>sf";
            keymaps.cmdToggleQuickMenu = "<leader>sc";
            keymaps.navFile = {
              "1" = "g1";
              "2" = "g2";
              "3" = "g3";
              "4" = "g4";
            };
            keymaps.gotoTerminal = {
              "1" = "g6";
              "2" = "g7";
              "3" = "g8";
              "4" = "g9";
            };
          };

          cmp = {
            enable = true;
            autoEnableSources = true;

            settings = {
              sources = [
                {
                  name = "nvim_lsp";
                }
                {
                  name = "luasnip";
                }
                {
                  name = "path";
                }
                {
                  name = "buffer";
                }
              ];

              mapping = {
                "<C-Space>" = "cmp.mapping.complete()";
                "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                "<C-e>" = "cmp.mapping.close()";
                "<C-u>" = "cmp.mapping.scroll_docs(4)";
                "<C-y>" = "cmp.mapping.confirm({ select = true })";
                "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              };
            };
          };

          cmp-buffer.enable = true;
          cmp-nvim-lsp-document-symbol.enable = true;
          cmp-nvim-lsp-signature-help.enable = true;
          cmp-nvim-lsp.enable = true;
          cmp-path.enable = true;
          cmp_luasnip.enable = true;
          fugitive.enable = true;
          lsp-lines.enable = true;
          lspkind.enable = true;

          nvim-lightbulb = {
            enable = true;
            settings = {
              autocmd = {
                enabled = true;
                updatetime = 200;
              };
              float = {
                enabled = false;
                text = " 󰌶 ";
                win_opts = {
                  border = "rounded";
                };
              };
              line = {
                enabled = false;
              };
              number = {
                enabled = false;
              };
              sign = {
                enabled = true;
                text = "󰌶";
              };
              status_text = {
                enabled = false;
                text = " 󰌶 ";
              };
              virtual_text = {
                enabled = false;
                text = "󰌶";
              };
            };
          };

          mini = {
            enable = true;
            modules = {
              ai = {
                n_lines = 500;
              };

              surround = {};
              comment = {};
              operators = {};
              bracketed = {};

              files = {
                mappings = let
                  vimKeyPrefs = scope.config.thisFlake.userPrefs.keybinds.vim-like;
                in {
                  go_in = vimKeyPrefs.right;
                  go_out = vimKeyPrefs.left;
                };
                windows = {
                  preview = true;
                  width_nofocus = 25;
                  width_preview = 80;
                };
              };

              hipatterns = {
                highlighters = {
                  # Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                  fixme = {
                    pattern = ''%f[%w]()FIXME()%f[%W]'';
                    group = "MiniHipatternsFixme";
                  };
                  hack = {
                    pattern = ''%f[%w]()HACK()%f[%W]'';
                    group = "MiniHipatternsHack";
                  };
                  todo = {
                    pattern = ''%f[%w]()TODO()%f[%W]'';
                    group = "MiniHipatternsTodo";
                  };
                  note = {
                    pattern = ''%f[%w]()NOTE()%f[%W]'';
                    group = "MiniHipatternsNote";
                  };

                  # Highlight hex color strings (`#rrggbb`) using that color
                  hex_color = "hipatterns.gen_highlighter.hex_color()";
                };
              };
            };
          };

          fidget = {
            enable = true;
            logger.path = {__raw = "string.format('%s/.persist/nvim/fidget.nvim.log', os.getenv('HOME'))";};
          };

          lsp = {
            enable = true;

            servers = {
              lua-ls = {
                enable = true;
                settings.telemetry.enable = false;
              };

              ccls.enable = true;

              nixd.enable = true;
              # nil_ls = {
              #   enable = true;
              #   settings = {
              #     diagnostics.ignored = ["unused_binding" "unused_with"];
              #     formatting.command = ["alejandra"];
              #   };
              # };

              ols.enable = true;
            };

            keymaps = {
              diagnostic = {
                "<leader>cq" = "setloclist";
              };
              lspBuf = {
                "<leader>cr" = "rename";
                "<leader>ca" = "code_action";
                "<leader>cc" = "hover";
                "<leader>cR" = "references";
                "<leader>cd" = "definition";
                "<leader>ci" = "implementation";
                "<leader>cD" = "type_definition";
              };
            };
          };

          nix.enable = true;

          telescope = {
            enable = true;
            highlightTheme = "onedark";
            keymaps = {
              "<leader>fG" = {
                action = "git_files";
                options.desc = "[f]ind [G]it files";
              };
              "<leader>fh" = {
                action = "help_tags";
                options.desc = "[f]ind [h]elp";
              };
              "<leader>fk" = {
                action = "keymaps";
                options.desc = "[f]ind [k]eymaps";
              };
              "<leader>ff" = {
                action = "find_files";
                options.desc = "[f]ind [f]iles";
              };
              "<leader>fs" = {
                action = "builtin";
                options.desc = "[f]ind [s]elect Telescope";
              };
              "<leader>fw" = {
                action = "grep_string";
                options.desc = "[f]ind Current [w]ord";
              };
              "<leader>fg" = {
                action = "live_grep";
                options.desc = "[f]ind by [g]rep";
              };
              "<leader>fd" = {
                action = "diagnostics";
                options.desc = "[f]ind [d]iagnostics";
              };
              "<leader>fr" = {
                action = "resume";
                options.desc = "[f]ind [r]esume";
              };
              "<leader>f." = {
                action = "oldfiles";
                options.desc = "[f]ind Recent Files ('.' for repeat)";
              };
              "<leader>fb" = {
                action = "buffers";
                options.desc = "[f]ind Existing [b]uffers";
              };
            };
          };

          treesitter = {
            enable = true;
            nixvimInjections = true;
            indent = true;
            incrementalSelection.enable = true;
          };

          luasnip.enable = true;

          which-key = {
            enable = true;
            registrations = {
              "<leader>f" = "[f]ind ...";
              "<leader><leader>" = "Window ...";
              "<leader>g" = "[g]it ...";
              "<leader>q" = "[q]uit ...";
              "<leader>q!" = "[q]uit force...";
              "<leader>c" = "[c]ode ...";
              "<leader>cq" = "[q]uickfix diagnostic";
              "<leader>cr" = "[r]ename";
              "<leader>ca" = "Code [A]ction";
              "<leader>cd" = "[d]efinition";
              "<leader>cD" = "Type [D]efinition";
              "<leader>cR" = "Definition [R]eferences";
              "<leader>ci" = "[i]mplementation";
              "<leader>cc" = "[c]ode Documentation";
              "<leader>s" = "[s]hort cuts ...";
              "<leader>sa" = "[a]dd This File";
              "<leader>sf" = "[f]iles Menu";
              "<leader>sc" = "[c]mds Menu";
              "g1" = "goto 1st Shortcut File";
              "g2" = "goto 2nd Shortcut File";
              "g3" = "goto 3rd Shortcut File";
              "g4" = "goto 4th Shortcut File";
              "g6" = "goto 1st Shortcut Terminal";
              "g7" = "goto 2nd Shortcut Terminal";
              "g8" = "goto 3rd Shortcut Terminal";
              "g9" = "goto 4th Shortcut Terminal";
            };
          };

          conform-nvim = {
            enable = true;

            formatOnSave = {
              lspFallback = true;
              timeoutMs = 500;
            };

            formattersByFt = {
              nix = ["alejandra"];
              lua = ["stylua"];
              # use the "*" filetype to run formatters on all filetypes.
              # "*" = ["codespell"];
            };
          };

          indent-blankline = {
            enable = true;
            settings.scope.show_exact_scope = true;
          };

          rainbow-delimiters.enable = true;
        };

        extraConfigLuaPre = let
          c = scope.config.colorScheme.colorRefs;
        in ''
          require('onedark').setup {
            colors = {
              black = "#${c.darkest}",
              bg0 = "#${c.bg0}",
              bg1 = "#${c.bg1}",
              bg2 = "#${c.bg2}",
              bg3 = "#${c.bg3}",
              bg_d = "#${c.darker}",
              bg_blue = "#${c.blue}",
              bg_yellow = "#${c.orange-alt}",
              fg = "#${c.fg2}",
              purple = "#${c.purple}",
              green = "#${c.green}",
              orange = "#${c.orange}",
              blue = "#${c.blue}",
              yellow = "#${c.yellow}",
              cyan = "#${c.cyan}",
              red = "#${c.red}",
              grey = "#${c.fg0}",
              light_grey = "#${c.fg1}",
              dark_cyan = "#${c.cyan-alt}",
              dark_red = "#${c.red-alt}",
              dark_yellow = "#${c.brown}",
              dark_purple = "#${c.purple-alt}",
              diff_add = "#${c.green-alt}",
              diff_delete = "#${c.red-alt}",
              diff_change = "#${c.blue-alt}",
              diff_text = "#${c.fg3}",
            }
          }
          require('onedark').load()
        '';

        extraConfigLuaPost = let
          c = scope.config.colorScheme.colorRefs;
        in ''
          local highlight = {
              "RainbowRed",
              "RainbowYellow",
              "RainbowBlue",
              "RainbowOrange",
              "RainbowGreen",
              "RainbowViolet",
              "RainbowCyan",
          }
          local hooks = require "ibl.hooks"
          -- create the highlight groups in the highlight setup hook, so they are reset
          -- every time the colorscheme changes
          hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
              vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#${c.red}" })
              vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#${c.yellow}" })
              vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#${c.blue}" })
              vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#${c.orange}" })
              vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#${c.green}" })
              vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#${c.purple}" })
              vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#${c.cyan}" })
          end)

          vim.g.rainbow_delimiters = { highlight = highlight }
          require("ibl").setup { scope = { highlight = highlight } }

          hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        '';
      };
      home.sessionVariables = {EDITOR = "nvim";};
    }
  ];
in
  scope.mkFeatureFile {
    inherit featOptions featConfig imports;
    featScope = scope;
  }
