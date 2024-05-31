{pkgs, ...}: {
  extraPackages = [pkgs.jq];
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      lua = ["stylua"];
      json = ["jq"];
      markdown = [["prettierd" "prettier"]];
      yaml = ["yamlfmt"];
    };
  };
}
