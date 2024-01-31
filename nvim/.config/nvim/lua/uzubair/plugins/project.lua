return {
  'ahmedkhalf/project.nvim',

  config = function()
    require('project_nvim').setup {
      -- Configuration in the future
      manual_mode = true,
    }
  end,
}
