local function config()
    local harpoon = require("harpoon")

    -- Setup (required).
    harpoon:setup()

    local function get_current(hlist)
        return hlist.config.create_list_item(hlist.config)
    end

    local function get_index_of_current(hlist)
        local current = get_current(hlist)
        local value = current.value
        for i=1,hlist._length do
            local other = hlist:get(i)
            if other ~= nil and other.value == value then
                return current, i
            end
        end
        return current, nil
    end

    -- High-level Harpoon Hook Management
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>b", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- Set to Harpoon index
    for i=1,10 do
        local key = i % 10
        vim.keymap.set("n", "\\"..tostring(key), function()
            local hlist = harpoon:list()
            local current, idx = get_index_of_current(hlist)

            -- Cache the previous file at the index (potential nil).
            local prev = hlist:get(i)

            -- Move the current file there
            hlist:replace_at(i, current)

            -- If there was something at the index we overwrote move it
            if prev ~= nil then
                if idx ~= nil then
                    hlist:replace_at(idx, prev)
                else
                    hlist:add(prev)
                end
            end
        end)
    end

    -- Select Harpoon index.
    for i=1,10 do
        local key = i % 10
        vim.keymap.set("n", "<leader>"..tostring(key), function()
            harpoon:list():select(i)
        end)
    end

    -- Next/Prev
    vim.keymap.set("n", "<C-k>", function() harpoon:list():prev({ui_nav_wrap = true}) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():next({ui_nav_wrap = true}) end)
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config
}

