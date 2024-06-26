{pkgs, ...}: {
  extraPackages = [
    pkgs.gdb
  ];
  plugins = {
    lsp.servers.ols.enable = true;

    dap = {
      adapters.executables.gdb = {
        command = "gdb";
        args = ["-i" "dap"];
      };

      configurations = {
        odin = [
          {
            name = "Launch";
            type = "gdb";
            request = "launch";
            program = "\${workspaceFolder}/debug/main";
            args = {};
            cwd = "\${workspaceFolder}";
            stopOnEntry = false;
          }
        ];
      };

      extensions = {
        dap-ui.enable = true;
        dap-virtual-text.enable = true;
      };
    };
  };
}
