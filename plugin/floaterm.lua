local function init_state()
    return { win = -1, buf = -1 }
end

local function close_window(state)
    if state.win == vim.api.nvim_get_current_win() then
        vim.api.nvim_win_hide(state.win)
        return true
    end

    return false
end

local function process_window_toggle(state)
    state.win = state.win or -1
    state.buf = state.buf or -1

    if close_window(state) then
        return true
    end

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    if not vim.api.nvim_buf_is_valid(state.buf) then
        state.buf = vim.api.nvim_create_buf(false, true)
    end

    if not vim.api.nvim_win_is_valid(state.win) then
        state.win = vim.api.nvim_open_win(state.buf, true, {
            col = col,
            row = row,
            width = width,
            height = height,
            relative = "editor",
            style = "minimal",
            border = "rounded"
        })
    end

    if vim.bo[state.buf].buftype ~= "terminal" then
        vim.cmd('term')
    end

    vim.api.nvim_set_current_win(state.win)

    return false
end

local terminal1 = init_state()
local terminal2 = init_state()

vim.api.nvim_create_user_command("Floaterm1", function()
    if process_window_toggle(terminal1) then
        close_window(terminal2)
    end
end, {})

vim.api.nvim_create_user_command("Floaterm2", function()
    if process_window_toggle(terminal2) then
        close_window(terminal1)
    end
end, {})

vim.api.nvim_create_user_command("FloatermCloseAll", function()
    close_window(terminal1)
    close_window(terminal2)
end, {})

vim.keymap.set("n", "<leader>g", function() vim.cmd.Floaterm1() end)
vim.keymap.set("n", "<leader>d", function() vim.cmd.Floaterm2() end)
