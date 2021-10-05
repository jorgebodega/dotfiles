---@diagnostic disable: lowercase-global
local vim = vim

local function maps(type, input, output)
    vim.api.nvim_set_keymap(type, input, output,
                            {noremap = false, silent = true})
end

local function map(type, input, output)
    vim.api.nvim_set_keymap(type, input, output,
                            {noremap = false, silent = false})
end

local function noremaps(type, input, output)
    vim.api
        .nvim_set_keymap(type, input, output, {noremap = true, silent = true})
end

local function noremap(type, input, output)
    vim.api.nvim_set_keymap(type, input, output,
                            {noremap = true, silent = false})
end

function nnoremap(input, output) noremap('n', input, output) end
function nnoremaps(input, output) noremaps('n', input, output) end
function inoremap(input, output) noremap('i', input, output) end
function inoremaps(input, output) noremaps('i', input, output) end
function vnoremap(input, output) noremap('v', input, output) end
function vnoremaps(input, output) noremaps('v', input, output) end
function xnoremap(input, output) noremap('x', input, output) end
function xnoremaps(input, output) noremaps('x', input, output) end
function onoremap(input, output) noremap('o', input, output) end
function onoremaps(input, output) noremaps('o', input, output) end
function tnoremap(input, output) noremap('t', input, output) end
function tnoremaps(input, output) noremaps('t', input, output) end

function nmap(input, output) map('n', input, output) end
function nmaps(input, output) maps('n', input, output) end
function imap(input, output) map('i', input, output) end
function imaps(input, output) maps('i', input, output) end
function vmap(input, output) map('v', input, output) end
function vmaps(input, output) maps('v', input, output) end
function xmap(input, output) map('x', input, output) end
function xmaps(input, output) maps('x', input, output) end
function omap(input, output) map('o', input, output) end
function omaps(input, output) maps('o', input, output) end
function tmap(input, output) map('t', input, output) end
function tmaps(input, output) maps('t', input, output) end
