{
  plugins.nvim-ufo = {
    enable = true;
    providerSelector = /*lua*/''
      function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    '';
    foldVirtTextHandler = /*lua*/''
      function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end
    '';
  };
  keymaps = [
    {
      mode = "n";
      key = "zO";
      action = "<cmd>lua require('ufo').openAllFolds()<CR>";
      options = {
        desc = "Open all folds";
      };
    }

    {
      mode = "n";
      key = "zm";
      action = "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>";
      options = {
        desc = "Fold reduce";
      };
    }

    {
      mode = "n";
      key = "zC";
      action = "<cmd>lua require('ufo').closeAllFolds()<CR>";
      options = {
        desc = "Close all folds";
      };
    }

    {
      mode = "n";
      key = "zm";
      action = "<cmd>lua require('ufo').closeFoldsWith()<CR>";
      options = {
        desc = "Fold more";
      };
    }
  ];
}
