local status_ok, codesnap = pcall(require, "codesnap")
if not status_ok then
  return
end

codesnap.setup{
  -- mac_window_bar = true,
  -- title = "CodeSnap.nvim",
  code_font_family = "CaskaydiaCove Nerd Font",
  -- watermark_font_family = "Pacifico",
  -- watermark = "CodeSnap.nvim",
  -- bg_theme = "default",
  bg_color = "#535c68",
  save_path = "~/Pictures",
  -- breadcrumbs_separator = "/",
  has_breadcrumbs = true,
  -- has_line_number = false,
  -- min_width = 0
}
