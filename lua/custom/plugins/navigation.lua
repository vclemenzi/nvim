return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        lazy = true,
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        lazy = true,
        build = 'make',
        enabled = vim.fn.executable "make" == 1,
      }
    },
    lazy = true,
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.90,
          height = 0.70,
        },
        file_ignore_patterns = { "node_modules" },
      },
      pickers = {
        find_files = {
          previewer = false,
          theme = "dropdown",
          no_ignore = true,
        },
        file_browser = {
          previewer = false,
          theme = "dropdown",
        },
        buffers = {
          previewer = false,
          theme = "dropdown",
        },
        man_pages = {
          previewer = false,
          help_tags = {
            previewer = false,
          },
        },
      },
    },
    setup = function()
      require("telescope").load_extension("fzf")
    end,
    keys = {
      {
        "<leader><space>",
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        desc = "Find files",
      },
      {
        "<leader>?",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        desc = "Find files",
      },
      {
        "<leader>/",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false }))<cr>",
        desc = "Fuzzily search in current buffer",
      },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        desc = "Find files",
      },
      {
        "<leader>fb",
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        desc = "Find buffer",
      },
      {
        "<leader>fs",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false }))<cr>",
        desc = "Find buffer",
      },
      {
        "<leader>al",
        "<cmd>Telescope filetypes<CR>",
        desc = "Change the current buffer language",
      },
      {
        "<leader>gs",
        "<cmd>Telescope git_status<CR>",
        desc = "View current git status",
      },
      {
        "<leader>gc",
        "<cmd>Telescope git_commits<CR>",
        desc = "View current git repository commits",
      },
      {
        "<leader>gb",
        "<cmd>Telescope git_branches<CR>",
        desc = "View current git repository branches",
      },
      {
        "<leader>gf",
        "<cmd>Telescope git_files<CR>",
        desc = "View current git repository files",
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      columns = {
        "icon",
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Oil<cr>",
        desc = "Browse files"
      }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "{Left-Mapping}",     ":<C-U>TmuxNavigateLeft<cr>",     desc = "Navigate left in Tmux" },
      { "{Down-Mapping}",     ":<C-U>TmuxNavigateDown<cr>",     desc = "Navigate down in Tmux" },
      { "{Up-Mapping}",       ":<C-U>TmuxNavigateUp<cr>",       desc = "Navigate up in Tmux" },
      { "{Right-Mapping}",    ":<C-U>TmuxNavigateRight<cr>",    desc = "Navigate right in Tmux" },
      { "{Previous-Mapping}", ":<C-U>TmuxNavigatePrevious<cr>", desc = "Navigate to the previous location in Tmux" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    event = "BufReadPre",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        lazy = true,
        event = "BufReadPre",
        opts = function()
          local builtin = require("statuscol.builtin")

          return {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
              { text = { "%s" },                  click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
            }
          }
        end
      }
    },
    opts = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      return {
        provider_selector = function(_, _, _)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
    keys = {
      {
        "<leader>zR",
        "<cmd>lua require('ufo').openAllFolds<cr>",
        desc = "Open all folds"
      },
      {
        "<leader>zM",
        "<cmd>lua require('ufo').closeAllFolds<cr>",
        desc = "Close all folds"
      }
    },
  }
}
