local gl = require('galaxyline')
local utils = require('utils')
local nord_colors = require 'utils.palette'
local vcs = require('galaxyline.provider_vcs')
local condition = require('galaxyline.condition')

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree'}

local function is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

local function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

-- Local helper functions
local buffer_not_empty = function() return not is_buffer_empty() end

local checkwidth = function() return has_width_gt(45) and buffer_not_empty() end

local mode_color = function()
    local mode_colors = {
        [110] = nord_colors.nord14_gui,
        [105] = nord_colors.nord8_gui,
        [99] = nord_colors.nord14_gui,
        [116] = nord_colors.nord8_gui,
        [118] = nord_colors.nord15_gui,
        [22] = nord_colors.nord15_gui,
        [86] = nord_colors.nord15_gui,
        [82] = nord_colors.nord11_gui,
        [115] = nord_colors.nord11_gui,
        [83] = nord_colors.nord11_gui
    }

    mode_color = mode_colors[vim.fn.mode():byte()]
    if mode_color ~= nil then
        return mode_color
    else
        return nord_colors.nord15_gui
    end
end

local function file_readonly()
    if vim.bo.filetype == 'help' then return '' end
    if vim.bo.readonly == true then return '  ' end
    return ''
end

local function get_current_file_name()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
    if vim.bo.modifiable then
        if vim.bo.modified then return file .. '  ' end
    end
    return file .. ' '
end

local function get_basename(file) return file:match("^.+/(.+)$") end

local GetGitRoot = function()
    local git_dir = require('galaxyline.provider_vcs').get_git_dir()
    if not git_dir then return '' end

    local git_root = git_dir:gsub('/.git/?$', '')
    return get_basename(git_root)
end

-- Left side
gls.left[1] = {
    ViMode = {
        provider = function()
            local aliases = {
                [110] = 'NORMAL',
                [105] = 'INSERT',
                [99] = 'COMMAND',
                [116] = 'TERMINAL',
                [118] = 'VISUAL',
                [22] = 'V-BLOCK',
                [86] = 'V-LINE',
                [82] = 'REPLACE',
                [115] = 'SELECT',
                [83] = 'S-LINE'
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
            alias = aliases[vim.fn.mode():byte()]
            if alias ~= nil then
                if has_width_gt(35) then
                    mode = alias
                else
                    mode = alias:sub(1, 1)
                end
            else
                mode = vim.fn.mode():byte()
            end
            return '  ' .. mode .. ' '
        end,
        highlight = {nord_colors.nord1_gui, nord_colors.nord1_gui, 'bold'}
    }
}
gls.left[2] = {
    GitBranch = {
        provider = {function() return '   ' .. vcs.get_git_branch() end},
        condition = condition.check_git_workspace,
        highlight = {nord_colors.nord1_gui, nord_colors.nord15_gui, 'bold'},
        separator = '',
        separator_highlight = {
            nord_colors.nord15_gui, nord_colors.nord3_gui_bright
        }
    }
}
gls.left[3] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = checkwidth,
        highlight = {nord_colors.nord6_gui, nord_colors.nord3_gui_bright}
    }
}
gls.left[4] = {
    FileName = {
        provider = get_current_file_name,
        condition = checkwidth,
        highlight = {
            nord_colors.nord4_gui, nord_colors.nord3_gui_bright, 'bold'
        },
        separator = '',
        separator_highlight = {
            nord_colors.nord3_gui_bright, nord_colors.nord2_gui
        }
    }
}
gls.left[5] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {nord_colors.nord11_gui, nord_colors.nord2_gui}
    }
}
gls.left[6] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {nord_colors.nord3_gui_bright, nord_colors.nord2_gui}
    }
}
gls.left[7] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {nord_colors.nord12_gui, nord_colors.nord2_gui}
    }
}
gls.left[8] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {nord_colors.nord3_gui_bright, nord_colors.nord2_gui}
    }
}
gls.left[9] = {
    DiagnosticInfo = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {nord_colors.nord8_gui, nord_colors.nord2_gui}
    }
}
gls.left[10] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {nord_colors.nord3_gui_bright, nord_colors.nord2_gui}
    }
}
gls.left[10] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {nord_colors.nord8_gui, nord_colors.nord2_gui}
        -- separator = ' ',
        -- separator_highlight = {nord_colors.nord14_gui, nord_colors.nord3_gui}
    }
}

-- Right side
gls.right[1] = {
    DiffAdd = {
        condition = checkwidth,
        provider = {'DiffAdd'},
        separator = '',
        separator_highlight = {
            nord_colors.nord3_gui_bright, nord_colors.nord2_gui
        },
        icon = '+',
        highlight = {
            nord_colors.nord14_gui, nord_colors.nord3_gui_bright, 'bold'
        }
    }
}
gls.right[2] = {
    DiffModified = {
        condition = function()
            return checkwidth() and condition.check_git_workspace()
        end,
        provider = {'DiffModified'},
        icon = '~',
        highlight = {
            nord_colors.nord12_gui, nord_colors.nord3_gui_bright, 'bold'
        }
    }
}
gls.right[3] = {
    DiffRemove = {
        condition = function()
            return checkwidth() and condition.check_git_workspace()
        end,
        provider = {'DiffRemove'},
        icon = '-',
        highlight = {
            nord_colors.nord11_gui, nord_colors.nord3_gui_bright, 'bold'
        }
    }
}
gls.right[4] = {
    GitRoot = {
        condition = function()
            return checkwidth() and condition.check_git_workspace()
        end,
        provider = {
            function() return ' ' end, GetGitRoot, function()
                return ' '
            end
        },
        highlight = {
            nord_colors.nord4_gui, nord_colors.nord3_gui_bright, 'bold'
        }
    }
}
gls.right[5] = {
    PerCent = {
        provider = 'LinePercent',
        separator = '',
        separator_highlight = {
            nord_colors.nord8_gui, nord_colors.nord3_gui_bright
        },
        highlight = {nord_colors.nord2_gui, nord_colors.nord8_gui, 'bold'}
    }
}
gls.right[6] = {
    Twitter = {
        provider = function() return ' @jorge_bodega ' end,
        separator = '',
        separator_highlight = {nord_colors.nord15_gui, nord_colors.nord8_gui},
        highlight = {nord_colors.nord1_gui, nord_colors.nord15_gui, 'bold'}
    }
}
-- gls.right[7] = {
--     Arch = {
--         provider = function()
--             local kernel = vim.api.nvim_exec('!uname -r', false)
--             return '  ' .. kernel
--         end,
--         highlight = {nord_colors.nord1_gui, nord_colors.nord15_gui, 'bold'}
--     }
-- }
-- TODO Add arch linux kernel version

-- Short status line
-- gls.short_line_left[1] = {
--     ViMode = {
--         provider = function()
--             local aliases = {
--                 [110] = 'NORMAL',
--                 [105] = 'INSERT',
--                 [99] = 'COMMAND',
--                 [116] = 'TERMINAL',
--                 [118] = 'VISUAL',
--                 [22] = 'V-BLOCK',
--                 [86] = 'V-LINE',
--                 [82] = 'REPLACE',
--                 [115] = 'SELECT',
--                 [83] = 'S-LINE'
--             }
--             vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
--             alias = aliases[vim.fn.mode():byte()]
--             if alias ~= nil then
--                 if has_width_gt(35) then
--                     mode = alias
--                 else
--                     mode = alias:sub(1, 1)
--                 end
--             else
--                 mode = vim.fn.mode():byte()
--             end
--             return '  ' .. mode .. ' '
--         end,
--         highlight = {nord_colors.nord1_gui, nord_colors.nord1_gui, 'bold'},
--     }
-- }
-- gls.short_line_left[2] = {
--     FileIcon = {
--         provider = 'FileIcon',
--         condition = buffer_not_empty,
--         highlight = {
--             nord_colors.nord6_gui,
--             nord_colors.nord3_gui_bright
--         }
--     }
-- }
-- gls.short_line_left[3] = {
--     FileName = {
--         provider = get_current_file_name,
--         condition = buffer_not_empty,
--         highlight = {nord_colors.nord4_gui, nord_colors.nord3_gui_bright, 'bold'},
--         separator = '',
--         separator_highlight = {nord_colors.nord3_gui_bright, nord_colors.nord2_gui}
--     }
-- }

-- gls.short_line_right[1] = {
--     DiffAdd = {
--         condition = checkwidth,
--         provider = { 'DiffAdd' },
--         separator = '',
--         separator_highlight = {nord_colors.nord3_gui_bright, nord_colors.nord2_gui},
--         icon = '+',
--         highlight = {nord_colors.nord14_gui, nord_colors.nord3_gui_bright, 'bold'},
--     }
-- }
-- gls.short_line_right[2] = {
--     DiffModified = {
--         condition = function()
--             return checkwidth() and condition.check_git_workspace()
--         end,
--         provider = { 'DiffModified' },
--         icon = '~',
--         highlight = {nord_colors.nord12_gui, nord_colors.nord3_gui_bright, 'bold'}
--     }
-- }
-- gls.short_line_right[3] = {
--     DiffRemove = {
--         condition = function()
--             return checkwidth() and condition.check_git_workspace()
--         end,
--         provider = { 'DiffRemove' },
--         icon = '-',
--         highlight = {nord_colors.nord11_gui, nord_colors.nord3_gui_bright, 'bold'}
--     }
-- } 

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
