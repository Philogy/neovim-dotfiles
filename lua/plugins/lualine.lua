local function config()
    local lualine = require("lualine")

    lualine.setup {
        sections = {
            lualine_x = { "filetype" },
            lualine_y = { "lsp_status" },
        }
    }
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config
}
