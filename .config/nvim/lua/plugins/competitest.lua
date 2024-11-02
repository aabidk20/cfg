--- @type NvPluginSpec
return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup {
      -- testcases_use_single_file = true,
      testcases_directory = "./testcases",
      view_output_diff = true,
      -- received_problems_path = "$(HOME)/code/CP_practice/problems/$(PROBLEM).$(FEXT)",
      received_problems_path = "$(HOME)/code/CP_practice/problems/main.$(FEXT)",
      received_contests_directory = "$(HOME)/code/CP_practice/$(JUDGE)/$(CONTEST)",
      template_file = {
        cpp = "~/code/CP_practice/problems/template.cpp",
      },
      evaluate_template_modifiers = true,
    }
  end,
}
