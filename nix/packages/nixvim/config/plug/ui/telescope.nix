{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader>/" = {
        action = "live_grep";
        options = {
          desc = "Grep (root dir)";
        };
      };
      "<leader>:" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>;" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>b" = {
        action = "buffers";
        options = {
          desc = "+buffer";
        };
      };
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fn" = {
        action = "live_grep";
        options = {
          desc = "Find text";
        };
      };
      "<leader>fr" = {
        action = "resume";
        options = {
          desc = "Resume";
        };
      };
      "<leader>f." = {
        action = "oldfiles";
        options = {
          desc = "Recent";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Buffers";
        };
      };
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Search git files";
        };
      };
      "<leader>gc" = {
        action = "git_commits";
        options = {
          desc = "Commits";
        };
      };
      "<leader>gs" = {
        action = "git_status";
        options = {
          desc = "Status";
        };
      };
      "<leader>fa" = {
        action = "autocommands";
        options = {
          desc = "Auto Commands";
        };
      };
      "<leader>f/" = {
        action = "current_buffer_fuzzy_find";
        options = {
          desc = "Buffer";
        };
      };
      "<leader>fc" = {
        action = "commands";
        options = {
          desc = "Commands";
        };
      };
      "<leader>fD" = {
        action = "diagnostics";
        options = {
          desc = "Workspace diagnostics";
        };
      };
      "<leader>fh" = {
        action = "help_tags";
        options = {
          desc = "Help pages";
        };
      };
      "<leader>fH" = {
        action = "highlights";
        options = {
          desc = "Search Highlight Groups";
        };
      };
      "<leader>fk" = {
        action = "keymaps";
        options = {
          desc = "Keymaps";
        };
      };
      "<leader>fM" = {
        action = "man_pages";
        options = {
          desc = "Man pages";
        };
      };
      "<leader>fm" = {
        action = "marks";
        options = {
          desc = "Jump to Mark";
        };
      };
      "<leader>fo" = {
        action = "vim_options";
        options = {
          desc = "Options";
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope file_browser<cr>";
      options = {
        desc = "root File browser";
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
      options = {
        desc = "local File browser";
      };
    }
  ];
}
