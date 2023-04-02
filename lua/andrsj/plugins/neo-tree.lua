require("neo-tree").setup({
    close_if_last_window = true,
    source_selector = {
        winbar = true,
        statusline = true,
    },
    filesystem = {
        window = {
            width = 50,
            mappings = {
                ["S"] = "split_with_window_picker",
                ["s"] = "vsplit_with_window_picker",
                ["Z"] = "expand_all_nodes",
                ["C"] = "close_all_subnodes",
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["a"] = {
                    "add",
                    -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "relative" -- "none", "relative", "absolute"
                    }
                },
                ["c"] = {
                    "copy",
                    config = {
                        show_path = "relative" -- "none", "relative", "absolute"
                    }
                }
            }
        },
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                "node_modules",
                ".git",
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
            },
            always_show = {
                -- ".gitignored",
            },
        },
        follow_current_file = true,
    },
})
