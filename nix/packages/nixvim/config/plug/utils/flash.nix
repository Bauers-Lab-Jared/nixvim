{
  plugins.flash = {
    enable = true;
    settings = {
      label = {
        labels = "asdflqwertuiocbnm";
        after = false;
        before = true;
        distance = false;
        exclude = "xwmgqjhvflduoyp";
        uppercase = false;
      };
      search = {
        mode = "fuzzy";
      };
      jump = {
        autojump = true;
        nohlsearch = true;
      };
    };
  };
  keymaps = [
    {
      mode = ["n" "x" "o"];
      key = "zz";
      action = ''<cmd>lua require('flash').jump({ search = { mode = function(str) return "\\<" .. str end, }, })<cr>'';
      options = {
        desc = "Flash";
      };
    }

    {
      mode = ["n" "x" "o"];
      key = "zt";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options = {
        desc = "Flash Treesitter";
      };
    }

    {
      mode = "o";
      key = "r";
      action = "<cmd>lua require('flash').remote()<cr>";
      options = {
        desc = "Remote Flash";
      };
    }

    {
      mode = ["x" "o"];
      key = "<C-r>";
      action = "<cmd>lua require('flash').treesitter_search()<cr>";
      options = {
        desc = "Treesitter Search";
      };
    }
  ];
}
