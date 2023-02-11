local ts_setup, telescope = pcall(require, "telescope")
if not ts_setup then
  return
end

local ts_actions_setup, actions = pcall(require,"telescope.actions")
if not ts_actions_setup then
  return
end

-- configure telescope
telescope.setup({
  defaults = {
    prompt_prefix = ' > ',
    color_devicons = true,
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      i =  {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false,
    },
    live_grep = {
      additional_args = function() return { "-u",  "--max-depth=99" } end
    }
  },
  extensions = {
    repo = {
      list = {
        layout_strategy = "vertical",
        fd_opts = {
          "--no-ignore-vcs"
        },
        search_dirs = {
          "/Users/uzubair/workspace/git",
          "/Users/uzubair/dotfiles"
        }
      }
    },
    projects.projects{}
  }
})

telescope.load_extension("fzf")
telescope.load_extension("repo")
telescope.load_extension("projects")
