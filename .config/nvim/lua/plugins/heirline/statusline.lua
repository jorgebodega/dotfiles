local icons = require 'core.icons'
local conditions = require 'heirline.conditions'

-- Common helpers
local Align = { provider = '%=' }
local Space = { provider = ' ' }
local Empty = { provider = '' }
local Trim = { provider = '%<' } -- this means that the statusline is cut here when there's not enough space

-- File name modules
local FileIcon = {
  provider = function(self)
    return require('nvim-web-devicons').get_icon_color_by_filetype(vim.bo.filetype)
  end,
}
local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = '[]',
    hl = { fg = 'green' },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = '',
    hl = { fg = 'red' },
  },
}
local FileName = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    if self.filename == '' then
      self.filename = '[No Name]'
    end
  end,
  hl = { fg = 'blue' },
  provider = function(self)
    return vim.fn.fnamemodify(self.filename, ':t')
  end,
}
local FileNameModule = {
  flexible = true,
  { FileIcon, Space, FileName, Space, FileFlags },
  Empty,
}

-- File info modules
local FileEncoding = {
  -- condition = function()
  --   return vim.bo.fenc ~= '' and vim.bo.fenc ~= 'utf-8'
  -- end,
  provider = function()
    return vim.bo.fenc:upper()
  end,
}
local FileFormat = {
  -- condition = function()
  --   return vim.bo.fileformat ~= 'unix'
  -- end,
  provider = function()
    return vim.bo.fileformat:upper()
  end,
}
local FileType = {
  -- hl = { fg = 'yellow' },
  provider = function()
    return vim.bo.filetype
  end,
}
local FileTypeClickable = {
  on_click = {
    callback = function()
      vim.schedule(function()
        require('telescope.builtin').filetypes()
      end)
    end,
    name = 'heirline_filetype',
  },
  FileType,
}
local FileInfoModule = {
  flexible = true,
  { FileEncoding, Space, FileFormat, Space, FileTypeClickable },
  Empty,
}

-- Statusline info mode
local ViMode = {
  provider = function(self)
    return '█ ' .. self:mode_name()
  end,
  hl = function(self)
    return { fg = self:mode_color() }
  end,
  update = { 'ModeChanged' },
}
local SquareMode = {
  provider = '█',
  hl = function(self)
    return { fg = self:mode_color() }
  end,
  update = { 'ModeChanged' },
}

-- Git modules
local GitBranchName = {
  hl = { fg = 'magenta' },
  provider = function()
    return icons.GitBranch .. ' ' .. vim.b.gitsigns_head
  end,
}
local GitBranchNameClickable = {
  on_click = {
    callback = function()
      vim.schedule(function()
        require('telescope.builtin').git_branches()
      end)
    end,
    name = 'heirline_gitbranch',
  },
  GitBranchName,
}
local GitBranchModule = {
  condition = conditions.is_git_repo,
  { GitBranchNameClickable },
}

local GitAdded = {
  condition = function(self)
    return self.status_dict.added ~= nil and self.status_dict.added > 0
  end,
  hl = { fg = 'green' },
  provider = function(self)
    return icons.GitAdd .. ' ' .. self.status_dict.added .. ' '
  end,
}
local GitModified = {
  condition = function(self)
    return self.status_dict.changed ~= nil and self.status_dict.changed > 0
  end,
  hl = { fg = 'yellow' },
  provider = function(self)
    return icons.GitChange .. ' ' .. self.status_dict.changed .. ' '
  end,
}
local GitRemoved = {
  condition = function(self)
    return self.status_dict.removed ~= nil and self.status_dict.removed > 0
  end,
  hl = { fg = 'red' },
  provider = function(self)
    return icons.GitDelete .. ' ' .. self.status_dict.removed .. ' '
  end,
}
local GitDiffModule = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,
  {
    flexible = true,
    {
      GitAdded,
      GitModified,
      GitRemoved,
    },
    Empty,
  },
}

-- LSP Module
-- local NullLsInfo = {
--   condition = function(self)
--     return #self.sources > 0
--   end,
--   on_click = {
--     callback = function()
--       vim.schedule(function()
--         vim.cmd 'NullLsInfo'
--       end)
--     end,
--     name = 'heirline_nulllsinfo',
--   },
--   flexible = true,

--   -- {
--   --   provider = function(self)
--   --     return string.format('N(%s) ', table.concat(self.sources, '|'))
--   --   end,
--   -- },
--   {
--     provider = function()
--       return 'null-ls '
--     end,
--   },
-- }
local LspInfo = {
  on_click = {
    callback = function()
      vim.schedule(function()
        vim.cmd 'LspInfo'
      end)
    end,
    name = 'heirline_lspinfo',
  },
  provider = function(self)
    local lsp_attached = vim.list_extend(self.clients, self.sources)
    return table.concat(lsp_attached, ',') .. ']'
  end,
}
local LSPActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },
  init = function(self)
    self.clients = {}
    self.sources = {}
    for _, client in ipairs(vim.lsp.get_active_clients { bufnr = 0 }) do
      if client.name ~= 'null-ls' then
        self.clients[#self.clients + 1] = client.name
      else -- null-ls sources
        local sources = {}
        vim.tbl_map(function(source)
          -- filter repeat source name
          if not sources[source.name] then
            sources[source.name] = source
          end
        end, require('null-ls.sources').get_available(vim.bo.filetype))
        print(vim.inspect(vim.tbl_keys(sources)))
        self.sources = vim.tbl_keys(sources)
      end
    end
  end,
  hl = { fg = 'green' },
  {
    on_click = {
      callback = function()
        vim.schedule(function()
          vim.cmd 'Mason'
        end)
      end,
      name = 'heirline_lspinstall',
    },
    provider = '[',
  },
  -- NullLsInfo,
  LspInfo,
}
-- local Diagnostics = {
--   condition = conditions.has_diagnostics,
--   static = {
--     signs = require('plugins.lsp.diagnostic').signs,
--   },
--   init = function(self)
--     for severity, _ in pairs(self.signs) do
--       self[severity] = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[string.upper(severity)] })
--     end
--   end,
--   update = { 'DiagnosticChanged', 'BufEnter' },
--   on_click = {
--     callback = function()
--       require('trouble').toggle { mode = 'document_diagnostics' }
--     end,
--     name = 'heirline_diagnostics',
--   },
--   hl = { fg = 'yellow' },
--   { provider = '[' },
--   {
--     provider = function(self)
--       local severity = 'Error'
--       local count = self[severity]
--       return count > 0 and (self.signs[severity] .. count .. ' ')
--     end,
--     hl = { fg = utils.get_highlight('DiagnosticSignError').fg },
--   },
--   {
--     provider = function(self)
--       local severity = 'Warn'
--       local count = self[severity]
--       return count > 0 and (self.signs[severity] .. count .. ' ')
--     end,
--     hl = { fg = utils.get_highlight('DiagnosticSignWarn').fg },
--   },
--   {
--     provider = function(self)
--       local severity = 'Info'
--       local count = self[severity]
--       return count > 0 and (self.signs[severity] .. count .. ' ')
--     end,
--     hl = { fg = utils.get_highlight('DiagnosticSignInfo').fg },
--   },
--   {
--     provider = function(self)
--       local severity = 'Hint'
--       local count = self[severity]
--       return count > 0 and (self.signs[severity] .. count)
--     end,
--     hl = { fg = utils.get_highlight('DiagnosticSignHint').fg },
--   },
--   { provider = ']' },
-- }
-- table.insert(Diagnostics, { provider = '![' })
-- for severity, icon in pairs(Diagnostics.static.signs) do
--   table.insert(Diagnostics, {
--     provider = function()
--       local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[string.upper(severity)] })
--       return count > 0 and (icon .. ' ' .. count .. ' ')
--     end,
--     hl = { fg = utils.get_highlight('DiagnosticSign' .. severity).fg },
--   })
-- end
-- table.insert(Diagnostics, { provider = ']' })
local LspBlock = {
  flexible = true,
  {
    -- Diagnostics,
    -- Space,
    LSPActive,
  },
  -- {
  --   Diagnostics,
  -- },
  Empty,
}

-- File position module
local Ruler = {
  provider = '%l:%c',
}

local DefaultStatusline = {
  -- Left block
  ViMode,
  { flexible = 20, { Space, GitBranchModule }, Empty },
  { flexible = 20, { Space, GitDiffModule }, Empty },
  Trim,
  Align,

  -- Center block
  { flexible = 100, { Space, FileNameModule }, Empty },
  Align,

  -- Right block
  { flexible = 20, { LspBlock, Space }, Empty },
  { flexible = 30, { FileInfoModule, Space }, Empty },
  { flexible = 40, { Ruler, Space }, Empty },
  SquareMode,
}

return {
  static = {
    mode_initials = {
      ['n'] = 'N',
      ['no'] = 'V',
      ['nov'] = 'V',
      ['noV'] = 'V',
      ['no'] = 'V',
      ['niI'] = 'N',
      ['niR'] = 'N',
      ['niV'] = 'N',
      ['nt'] = 'N',
      ['v'] = 'V',
      ['vs'] = 'V',
      ['V'] = 'V',
      ['Vs'] = 'V',
      [''] = 'V',
      ['s'] = 'V',
      ['s'] = 'V',
      ['S'] = 'V',
      [''] = 'V',
      ['i'] = 'I',
      ['ic'] = 'I',
      ['ix'] = 'I',
      ['R'] = 'R',
      ['Rc'] = 'R',
      ['Rx'] = 'N',
      ['Rv'] = 'N',
      ['Rvc'] = 'R',
      ['Rvx'] = 'R',
      ['c'] = 'C',
      ['cv'] = 'C',
      ['r'] = 'R',
      ['rm'] = 'N',
      ['r?'] = 'N',
      ['!'] = 'N',
      ['t'] = 'T',
    },
    mode_names = {
      N = 'NORMAL',
      I = 'INSERT',
      V = 'VISUAL',
      R = 'REPLACE',
      C = 'COMMAND',
      T = 'TERMINAL',
    },
    mode_colors = {
      N = 'blue',
      I = 'green',
      V = 'yellow',
      R = 'yellow',
      C = 'magenta',
      T = 'green',
    },
    mode_name = function(self)
      local mode = conditions.is_active() and vim.fn.mode(1)
      return self.mode_names[self.mode_initials[mode] or 'N']
    end,
    mode_color = function(self)
      local mode = conditions.is_active() and vim.fn.mode(1)
      return self.mode_colors[self.mode_initials[mode] or 'N']
    end,
  },
  hl = { fg = 'fg', bg = 'bg' },
  DefaultStatusline,
}
