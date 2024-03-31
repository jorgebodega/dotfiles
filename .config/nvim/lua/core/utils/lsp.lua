M = {}

function M.on_attach(client, bufnr)
  local capabilities = client.server_capabilities
  local lsp_mappings = {
    n = {
      ['<leader>ld'] = {
        function()
          vim.diagnostic.open_float()
        end,
        desc = 'Hover diagnostics',
      },
      ['[d'] = {
        function()
          vim.diagnostic.goto_prev()
        end,
        desc = 'Previous diagnostic',
      },
      [']d'] = {
        function()
          vim.diagnostic.goto_next()
        end,
        desc = 'Next diagnostic',
      },
      ['gl'] = {
        function()
          vim.diagnostic.open_float()
        end,
        desc = 'Hover diagnostics',
      },
    },
    v = {},
  }

  if is_available 'mason-lspconfig.nvim' then
    lsp_mappings.n['<leader>li'] = { '<cmd>LspInfo<cr>', desc = 'LSP information' }
  end

  if is_available 'null-ls.nvim' then
    lsp_mappings.n['<leader>lI'] = { '<cmd>NullLsInfo<cr>', desc = 'Null-ls information' }
  end

  if capabilities.codeActionProvider then
    lsp_mappings.n['<leader>la'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      desc = 'LSP code action',
    }
    lsp_mappings.v['<leader>la'] = lsp_mappings.n['<leader>la']
  end

  if capabilities.codeLensProvider then
    lsp_mappings.n['<leader>ll'] = {
      function()
        vim.lsp.codelens.refresh()
      end,
      desc = 'LSP codelens refresh',
    }
    lsp_mappings.n['<leader>lL'] = {
      function()
        vim.lsp.codelens.run()
      end,
      desc = 'LSP codelens run',
    }
  end

  if capabilities.declarationProvider then
    lsp_mappings.n['gD'] = {
      function()
        vim.lsp.buf.declaration()
      end,
      desc = 'Declaration of current symbol',
    }
  end

  if capabilities.definitionProvider then
    lsp_mappings.n['gd'] = {
      function()
        vim.lsp.buf.definition()
      end,
      desc = 'Show the definition of current symbol',
    }
  end

  if capabilities.documentFormattingProvider and not tbl_contains(astronvim.lsp.formatting.disabled, client.name) then
    lsp_mappings.n['<leader>lf'] = {
      function()
        vim.lsp.buf.format(astronvim.lsp.format_opts)
      end,
      desc = 'Format buffer',
    }
    lsp_mappings.v['<leader>lf'] = lsp_mappings.n['<leader>lf']

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
      vim.lsp.buf.format(astronvim.lsp.format_opts)
    end, { desc = 'Format file with LSP' })
    local autoformat = astronvim.lsp.formatting.format_on_save
    local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
    if
      autoformat.enabled
      and (tbl_isempty(autoformat.allow_filetypes or {}) or tbl_contains(autoformat.allow_filetypes, filetype))
      and (tbl_isempty(autoformat.ignore_filetypes or {}) or not tbl_contains(autoformat.ignore_filetypes, filetype))
    then
      local autocmd_group = 'auto_format_' .. bufnr
      vim.api.nvim_create_augroup(autocmd_group, { clear = true })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = autocmd_group,
        buffer = bufnr,
        desc = 'Auto format buffer ' .. bufnr .. ' before save',
        callback = function()
          if vim.g.autoformat_enabled then
            vim.lsp.buf.format(astronvim.extend_tbl(astronvim.lsp.format_opts, { bufnr = bufnr }))
          end
        end,
      })
      lsp_mappings.n['<leader>uf'] = {
        function()
          astronvim.ui.toggle_autoformat()
        end,
        desc = 'Toggle autoformatting',
      }
    end
  end

  if capabilities.documentHighlightProvider then
    local highlight_name = vim.fn.printf('lsp_document_highlight_%d', bufnr)
    vim.api.nvim_create_augroup(highlight_name, {})
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = highlight_name,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = highlight_name,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end

  if capabilities.hoverProvider then
    lsp_mappings.n['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = 'Hover symbol details',
    }
  end

  if capabilities.implementationProvider then
    lsp_mappings.n['gI'] = {
      function()
        vim.lsp.buf.implementation()
      end,
      desc = 'Implementation of current symbol',
    }
  end

  if capabilities.referencesProvider then
    lsp_mappings.n['gr'] = {
      function()
        vim.lsp.buf.references()
      end,
      desc = 'References of current symbol',
    }
    lsp_mappings.n['<leader>lR'] = {
      function()
        vim.lsp.buf.references()
      end,
      desc = 'Search references',
    }
  end

  if capabilities.renameProvider then
    lsp_mappings.n['<leader>lr'] = {
      function()
        vim.lsp.buf.rename()
      end,
      desc = 'Rename current symbol',
    }
  end

  if capabilities.signatureHelpProvider then
    lsp_mappings.n['<leader>lh'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = 'Signature help',
    }
  end

  if capabilities.typeDefinitionProvider then
    lsp_mappings.n['gT'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      desc = 'Definition of current type',
    }
  end

  if capabilities.workspaceSymbolProvider then
    lsp_mappings.n['<leader>lG'] = {
      function()
        vim.lsp.buf.workspace_symbol()
      end,
      desc = 'Search workspace symbols',
    }
  end

  if is_available 'telescope.nvim' then -- setup telescope mappings if available
    if lsp_mappings.n.gd then
      lsp_mappings.n.gd[1] = function()
        require('telescope.builtin').lsp_definitions()
      end
    end
    if lsp_mappings.n.gI then
      lsp_mappings.n.gI[1] = function()
        require('telescope.builtin').lsp_implementations()
      end
    end
    if lsp_mappings.n.gr then
      lsp_mappings.n.gr[1] = function()
        require('telescope.builtin').lsp_references()
      end
    end
    if lsp_mappings.n['<leader>lR'] then
      lsp_mappings.n['<leader>lR'][1] = function()
        require('telescope.builtin').lsp_references()
      end
    end
    if lsp_mappings.n.gT then
      lsp_mappings.n.gT[1] = function()
        require('telescope.builtin').lsp_type_definitions()
      end
    end
    if lsp_mappings.n['<leader>lG'] then
      lsp_mappings.n['<leader>lG'][1] = function()
        require('telescope.builtin').lsp_workspace_symbols()
      end
    end
  end

  if not vim.tbl_isempty(lsp_mappings.v) then
    lsp_mappings.v['<leader>l'] = { name = 'LSP' }
  end
  astronvim.set_mappings(user_opts('lsp.mappings', lsp_mappings), { buffer = bufnr })

  local on_attach_override = user_opts('lsp.on_attach', nil, false)
  conditional_func(on_attach_override, true, client, bufnr)
end
