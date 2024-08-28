{
  plugins.noice = {
    enable = true;
    presets = {
      bottom_search = false;
      command_palette = false;
      long_message_to_split = true;
      inc_rename = false;
      lsp_doc_border = true;
    };
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = true;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    views.popup = {
      backend = "popup";
      relative = "editor";
      close = {
        events = ["BufLeave"];
        keys = ["q"];
      };
      enter = true;
      border = {
        style = "rounded";
      };
      position = "50%";
      size = {
        width = "95%";
        height = "95%";
      };
      win_options = {
        winhighlight = {
          Normal = "NoicePopup";
          FloatBorder = "NoicePopupBorder";
        };
        winbar = "";
        foldenable = false;
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        icon = "󱞪";
        lang = "regex";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>NoiceTelescope<cr>";
      options = {
        desc = "Popup Message History";
      };
    }
  ];
}
