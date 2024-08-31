{pkgs, ...}: {
  extraPackages = [pkgs.jq];
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
      formatters_by_ft = {
        lua = ["stylua"];
        json = ["jq"];
        markdown = [["prettierd" "prettier"]];
        yaml = ["yamlfmt"];
      };
    };
  };
}
