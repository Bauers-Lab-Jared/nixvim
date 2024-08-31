{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib.nixvim) defaultNullOpts;
in
  lib.nixvim.neovim-plugin.mkNeovimPlugin config {
    name = "solarized-osaka";
    isColorscheme = true;
    originalName = "solarized-osaka.nvim";
    defaultPackage = pkgs.vimUtils.buildVimPlugin {
      pname = "solarized.nvim";
      version = "2024-05-26";
      src = pkgs.fetchFromGitHub {
        owner = "craftzdog";
        repo = "solarized-osaka.nvim";
        rev = "a2a435aa0e6088ccc0d7c3aa2813c10570d90c87";
        sha256 = "0az6sfxn34df6ld7frqi3dd5iajg6b13g75px7y5agga5vskmfy9";
      };
    };

    maintainers = [{none = {name = "none";};}];

    settingsOptions = {
      transparent = defaultNullOpts.mkBool false ''
        Disable setting the background color.
      '';

      terminal_colors = defaultNullOpts.mkBool true ''
        Configure the colors used when opening a :terminal in Neovim
      '';

      styles = let
        mkBackgroundStyle = name:
          defaultNullOpts.mkEnumFirstDefault [
            "transparent"
            "dark"
            "normal"
          ] "Background style for ${name}";
      in {
        comments = defaultNullOpts.mkHighlight "{italic = true;}" "" ''
          Define comments highlight properties.
        '';

        keywords = defaultNullOpts.mkHighlight "{italic = true;}" "" ''
          Define keywords highlight properties.
        '';

        functions = defaultNullOpts.mkHighlight "{}" "" ''
          Define functions highlight properties.
        '';

        variables = defaultNullOpts.mkHighlight "{}" "" ''
          Define variables highlight properties.
        '';

        sidebars = mkBackgroundStyle "sidebars";

        floats = mkBackgroundStyle "floats";
      };

      sidebars = defaultNullOpts.mkListOf lib.types.str ''["qf" "help"]'' ''
        Set a darker background on sidebar-like windows.
      '';

      hide_inactive_statusline = defaultNullOpts.mkBool false ''
        Enabling this option will hide inactive statuslines and replace them with a thin border instead.
        Should work with the standard **StatusLine** and **LuaLine**.
      '';

      dim_inactive = defaultNullOpts.mkBool false ''
        Dims inactive windows.
      '';

      lualine_bold = defaultNullOpts.mkBool false ''
        When true, section headers in the lualine theme will be bold.
      '';

      on_colors = defaultNullOpts.mkLuaFn "function(colors) end" ''
        Override specific color groups to use other groups or a hex color.
        Function will be called with a `ColorScheme` table.
        `@param colors ColorScheme`
      '';

      on_highlights = defaultNullOpts.mkLuaFn "function(highlights, colors) end" ''
        Override specific highlights to use other groups or a hex color.
        Function will be called with a `Highlights` and `ColorScheme` table.
        `@param highlights Highlights`
        `@param colors ColorScheme`
      '';
    };

    settingsExample = {
      transparent = false;
      terminal_colors = true;
      styles = {
        comments.italic = true;
        keywords.italic = true;
        functions = {};
        variables = {};
        sidebars = "dark";
        floats = "dark";
      };
      sidebars = [
        "qf"
        "terminal"
        "help"
      ];
      hide_inactive_statusline = false;
      dim_inactive = false;
      lualine_bold = false;
      on_colors = "function(colors) end";
      on_highlights = "function(highlights, colors) end";
    };

    extraConfig = cfg: {
      opts.termguicolors = lib.mkDefault true;
    };
  }
