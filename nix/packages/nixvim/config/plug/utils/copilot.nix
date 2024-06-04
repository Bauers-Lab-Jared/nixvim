{
  plugins.copilot-chat = {
    enable = true;
  };

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
      key = "<leader>ar";
      action = "<cmd>CopilotChatReview<cr>";
    }
    {
      mode = "x";
      key = "<leader>af";
      action = "<cmd>CopilotChatFixDiagnostic<cr>";
    }
    {
      mode = "x";
      key = "<leader>at";
      action = "<cmd>CopilotChatTests<cr>";
    }
    {
      mode = "x";
      key = "<leader>ad";
      action = "<cmd>CopilotChatOptimize<cr>";
    }
    {
      mode = "x";
      key = "<leader>ac";
      action = "<cmd>CopilotChatCommitStaged<cr>";
    }
  ];
}
