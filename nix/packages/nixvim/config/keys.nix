{
  globals.mapleader = " ";

  keymaps = [
    # General maps
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }

    {
      mode = "n";
      key = "<leader>q";
      action = "+quit/session";
    }

    {
      mode = ["n" "v"];
      key = "<leader>g";
      action = "+git";
    }

    {
      mode = ["n" "v"];
      key = "<leader>d";
      action = "+debug";
    }

    {
      mode = ["n" "v"];
      key = "<leader>c";
      action = "+code";
    }

    {
      mode = ["n"];
      key = "<leader>t";
      action = "+test";
    }

    # Windows

    {
      key = ",";
      action = ":";
      options.desc = ": (command mode)";
      mode = "n";
    }

    {
      key = ";";
      action = ":";
      options.desc = ": (command mode)";
      mode = "n";
    }

    {
      key = "<leader>w";
      action = ":wincmd w<CR>";
      options = {
        desc = "Window next";
        silent = true;
      };
      mode = "n";
    }

    {
      mode = "n";
      key = "<leader><up>";
      action = ":wincmd k<CR>";
      options = {
        desc = "Window focus up";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader><down>";
      action = ":wincmd j<CR>";
      options = {
        desc = "Window focus down";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader><left>";
      action = ":wincmd h<CR>";
      options = {
        desc = "Window focus left";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader><right>";
      action = ":wincmd l<CR>";
      options = {
        desc = "Window focus right";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader><leader>s";
      action = ":wincmd s<CR>";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader><leader>v";
      action = ":wincmd v<CR>";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<leader><leader>o";
      action = ":wincmd o<CR>";
      options = {
        silent = true;
        desc = "Delete other windows";
      };
    }

    {
      mode = "n";
      key = "<leader><leader>d";
      action = ":wincmd q<CR>";
      options = {
        silent = true;
        desc = "Delete this window";
      };
    }

    {
      mode = "n";
      key = "<leader><leader>x";
      action = ":wincmd x<CR>";
      options = {
        silent = true;
        desc = "Swap windows";
      };
    }

    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Write file";
      };
    }

    # Quit/Session

    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    {
      mode = "n";
      key = "<leader>q!";
      action = ":qa!<CR>";
      options = {
        silent = true;
        desc = "Force quit all";
      };
    }

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {desc = "Use move command when line is highlighted ";};
    }

    {
      mode = "v";
      key = "K";
      action = ":m '>-2<CR>gv=gv";
      options = {desc = "Use move command when line is highlighted ";};
    }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        desc = "Allow cursor to stay in the same place after appending to current line ";
      };
    }

    {
      mode = "n";
      key = "<Tab>";
      action = "<C-d>zz";
      options = {
        desc = "Scroll Down";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<C-u>zz";
      options = {
        desc = "Scroll Up";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {desc = "Allow search terms to stay in the middle ";};
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {desc = "Allow search terms to stay in the middle ";};
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
      options = {desc = "Deletes to void register and paste over";};
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim

    {
      mode = ["n" "v"];
      key = "Y";
      action = ''"+y'';
      options = {desc = "Copy to system clipboard";};
    }

    # Delete to void register
    {
      mode = ["n" "v"];
      key = "D";
      action = ''"_d'';
      options = {desc = "Delete to void register";};
    }

    # <C-c> instead of pressing esc just because
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }

    {
      mode = "n";
      key = "<leader>zz";
      action = "<CMD> ZenMode | Pencil<CR>";
      options = {desc = "Toggle writting mode";};
    }

    {
      mode = "n";
      key = "\\";
      action = "<CMD> Grapple toggle <CR>";
      options = {desc = "Tag a file";};
    }

    {
      mode = "n";
      key = "<leader>m";
      action = "<CMD> Grapple toggle_tags <CR>";
      options = {desc = "Toggle tags menu";};
    }

    {
      mode = "n";
      key = "<leader>M";
      action = "<CMD> Grapple toggle_scopes <CR>";
      options = {desc = "Grapple Toggle scopes";};
    }

    {
      mode = "n";
      key = "<leader><Tab>";
      action = "<CMD> Grapple cycle forward <CR>";
      options = {desc = "Grapple Cycle forward";};
    }

    {
      mode = "n";
      key = "<leader><S-Tab>";
      action = "<CMD> Grapple cycle backward <CR>";
      options = {desc = "Grapple Cycle backward";};
    }

    {
      mode = "n";
      key = "<F8>";
      action = "<CMD> Grapple select index=1<CR>";
      options = {desc = "Grapple Select 1";};
    }

    {
      mode = "n";
      key = "<F7>";
      action = "<CMD> Grapple select index=2<CR>";
      options = {desc = "Grapple Select 2";};
    }

    {
      mode = "n";
      key = "<F6>";
      action = "<CMD> Grapple select index=3<CR>";
      options = {desc = "Grapple Select 3";};
    }

    {
      mode = "n";
      key = "<F5>";
      action = "<CMD> Grapple select index=4<CR>";
      options = {desc = "Grapple Select 4";};
    }

    # debug
    {
      mode = "n";
      key = "<leader>dt";
      action = "<CMD>lua require('dap').terminate()<CR>";
      options = {desc = "Terminate session";};
    }
    {
      mode = "n";
      key = "<leader>db";
      action = "<CMD>! task bd<CR>";
      options = {desc = "Build debug binary";};
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<CMD>lua require('dap').run_to_cursor()<CR>";
      options = {desc = "Run to cursor";};
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<CMD>lua require('dap').repl.toggle()<CR>";
      options = {desc = "Toggle repl";};
    }
    {
      mode = "n";
      key = "<leader>de";
      action = ''
        function()
          require('dapui').eval(nil, {enter = true})
        end
      '';
      options = {desc = "Eval var under cursor";};
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<CMD>lua require('dapui').open()<CR>";
      options = {desc = "Open debug ui";};
    }
    {
      mode = "n";
      key = "<leader>dq";
      action = "<CMD>lua require('dapui').close()<CR>";
      options = {desc = "Quit debug ui";};
    }

    {
      mode = "n";
      key = "<f1>";
      action = "<CMD>lua require('dap').terminate()<CR>";
      options = {desc = "Debug Disconnect";};
    }
    {
      mode = "n";
      key = "<f2>";
      action = "<CMD>lua require('dap').continue()<CR>";
      options = {desc = "Debug Continue";};
    }
    {
      mode = "n";
      key = "<f3>";
      action = "<CMD>lua require('dap').step_into()<CR>";
      options = {desc = "Debug Step into";};
    }
    {
      mode = "n";
      key = "<f4>";
      action = "<CMD>lua require('dap').step_over()<CR>";
      options = {desc = "Debug Step over";};
    }

    {
      mode = "n";
      key = "<f9>";
      action = "<CMD>lua require('dap').toggle_breakpoint()<CR>";
      options = {desc = "Toggle breakpoint";};
    }
    {
      mode = "n";
      key = "<f10>";
      action = "<CMD>lua require('dap').restart()<CR>";
      options = {desc = "Debug Restart";};
    }
    {
      mode = "n";
      key = "<f11>";
      action = "<CMD>lua require('dap').step_out()<CR>";
      options = {desc = "Debug Step out";};
    }
    {
      mode = "n";
      key = "<f12>";
      action = "<CMD>lua require('dap').step_back()<CR>";
      options = {desc = "Debug Step back";};
    }

    # Tests

    {
      mode = "n";
      key = "<leader>tt";
      action = "<CMD>make test<CR>";
      options = {desc = "Run tests once";};
    }
  ];
}
