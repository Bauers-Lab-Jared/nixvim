{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.CopilotChat-nvim
  ];
  extraConfigLua = ''
    require("CopilotChat").setup { }
  '';

  keymaps = [
    {
      mode = "x";
      key = "<leader>a";
      action = "+copilot(AI)";
    }
    {
      mode = "x";
      key = "<leader>ae";
      action = "<cmd>CopilotChatExplain<cr>";
    }
    {
      mode = "x";
      key = "<leader>af";
      action = "<cmd>CopilotChatFix<cr>";
    }
    {
      mode = "x";
      key = "<leader>ad";
      action = "<cmd>CopilotChatDocs<cr>";
    }
    {
      mode = "x";
      key = "<leader>ac";
      action = "<cmd>CopilotChatCommit<cr>";
    }
  ];
}
