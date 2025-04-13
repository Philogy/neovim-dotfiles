local function set_bg(bg)
  if vim.o.background ~= bg then
    vim.o.background = bg
    vim.cmd('syntax off')
    vim.cmd('syntax on')
  end
end


local function get_sys_bg()
  local out = vim.api.nvim_exec2(
    '!defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo dark || echo light',
    { output = true }
  )
  local raw = out.output
  if raw:match("dark\n") then
    return "dark"
  elseif raw:match("light\n") then
    return "light"
  else
    return "dark"
  end
end

set_bg(get_sys_bg())

vim.keymap.set("n", "<leader>td", function()
  set_bg("dark")
  background_mode = "manual"
end)
vim.keymap.set("n", "<leader>tl", function()
  set_bg("light")
  background_mode = "manual"
end)
