" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/jorgebodega/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jorgebodega/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jorgebodega/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jorgebodega/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jorgebodega/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["better-escape.vim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.betterescape\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/better-escape.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.indent-guides\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nord-vim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.nord\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-lsp"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-lsp"
  },
  ["vim-lsp-settings"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-lsp-settings"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.startify\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.snippets\frequire\0" },
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/jorgebodega/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0", "config", "galaxyline.nvim")
-- Config for: indent-guides.nvim
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.indent-guides\frequire\0", "config", "indent-guides.nvim")
-- Config for: vim-startify
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.startify\frequire\0", "config", "vim-startify")
-- Config for: nord-vim
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.nord\frequire\0", "config", "nord-vim")
-- Config for: vim-vsnip
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.snippets\frequire\0", "config", "vim-vsnip")
-- Config for: vim-fugitive
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0", "config", "vim-fugitive")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0", "config", "fzf.vim")
-- Config for: better-escape.vim
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.betterescape\frequire\0", "config", "better-escape.vim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
