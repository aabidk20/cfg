--- @type NvPluginSpec
return {
  "mistricky/codesnap.nvim",
  build = "make",
  enabled = true,
  config = function()
    require("codesnap").setup({
      mac_window_bar = false,
      title = "CodeSnap.nvim",
      -- code_font_family = "CaskaydiaCove Nerd Font",
      code_font_family = "JetBrainsMono Nerd Font",
      watermark_font_family = "Pacifico",
      watermark = "",
      bg_theme = "default",
      breadcrumbs_separator = "/",
      has_breadcrumbs = false,
      has_line_number = false,
      show_workspace = false,
      min_width = 0,
      bg_x_padding = 60,
      bg_y_padding = 30,
      save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures"),
    })
  end,
}
