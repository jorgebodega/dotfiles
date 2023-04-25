-- local cmd = vim.cmd

-- local present, packer = pcall(require, 'packer')

-- local first_install = false

-- if not present then
--   local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

--   print('Cloning packer..')
--   -- remove the dir before cloning
--   vim.fn.delete(packer_path, 'rf')
--   vim.fn.system({
--     'git',
--     'clone',
--     'https://github.com/wbthomason/packer.nvim',
--     '--depth',
--     '1',
--     packer_path,
--   })

--   cmd('packadd packer.nvim')
--   present, packer = pcall(require, 'packer')

--   if present then
--     print('Packer cloned successfully.')
--     first_install = true
--   else
--     error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
--   end
-- end
