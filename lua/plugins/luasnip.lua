local function config()
    local luasnip = require("luasnip")

    local loader = require("luasnip.loaders.from_lua")
    local snippet_folder = vim.fn.stdpath("config") .. "/luasnip"
    local function load_snippets()
        loader.lazy_load({
            paths = { snippet_folder }
        })
        local project_snippets = vim.fn.getcwd() .. "/.luasnip/"
        loader.lazy_load({
            paths = { project_snippets },
            override_priority = 1100
        })
    end

    load_snippets()

    vim.keymap.set({ "i" }, "<C-j>", function()
        local snip = require("luasnip")
        if snip.expand_or_jumpable(1) then
            snip.expand_or_jump()
        end
    end)
    vim.keymap.set({ "i" }, "<C-k>", function()
        local snip = require("luasnip")
        if snip.jumpable(-1) then
            snip.jump(-1)
        end
    end)
    vim.keymap.set({ "i" }, "<C-l>", function()
        local snip = require("luasnip")
        if snip.choice_active() then
            snip.change_choice(1)
        end
    end)

    vim.keymap.set({ "n" }, "\\s", load_snippets)

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true
    }
end

return {
    "L3MON4D3/LuaSnip",
    config = config
}
