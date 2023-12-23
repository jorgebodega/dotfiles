local M = {}

local function get_pickers(actions)
  return {
    find_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
      theme = "dropdown",
    },
    grep_string = {
      only_sort_text = true,
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      show_untracked = true,
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  }
end

function M.setup()
  local telescope = require "telescope"
  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      prompt_prefix = icons.ui.Search .. " ",
      selection_caret = icons.ui.Forward .. " ",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        preview_cutoff = 120,
        vertical = { mirror = false },
        width = 0.75,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
      mappings = {
        -- i = {
        --   ["<C-n>"] = actions.move_selection_next,
        --   ["<C-p>"] = actions.move_selection_previous,
        --   ["<C-c>"] = actions.close,
        --   ["<C-j>"] = actions.cycle_history_next,
        --   ["<C-k>"] = actions.cycle_history_prev,
        --   ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        --   ["<CR>"] = actions.select_default,
        -- },
        -- n = {
        --   ["<C-n>"] = actions.move_selection_next,
        --   ["<C-p>"] = actions.move_selection_previous,
        --   ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- },
      },
      -- pickers = get_pickers(actions),
      -- path_display = { "smart" },
      -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
    -- pickers = get_pickers(actions),
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }

  -- if lvim.builtin.project.active then
  --   pcall(function()
  --     require("telescope").load_extension "projects"
  --   end)
  -- end

  pcall(function()
    require("telescope").load_extension "fzf"
  end)
end

return M
