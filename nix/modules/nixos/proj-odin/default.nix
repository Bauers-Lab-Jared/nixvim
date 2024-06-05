{
  plugins = {
    lsp.servers.ols.enable = true;

    dap = {
      adapters.executables = {
        command = "gdb";
        args = ["-i" "dap"];
      };

      configurations = {
        odin = [
          {
            name = "Launch";
            type = "gdb";
            request = "launch";
            program = "\${workspaceFolder}/debug/bin/main";
            args = {};
            cwd = "\${workspaceFolder}";
            stopOnEntry = false;
          }
        ];
      };

      extensions = {
        dap-ui.enabled = true;
        dap-virtual-text.enabled = true;
      };
    };
  };
}
