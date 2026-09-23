{ 
    programs.nixvim.plugins = {
        # Automatically create a pair of brackets
        nvim-autopairs.enable = true;

        # Auto-indent
        indent-blankline = {
            enable = true;
            settings = {
                indent = {
                    smart_indent_cap = true;
                    char = " ";
                };
                scope = {
                    enabled = true;
                    char = "|";
                };
            };
        };

        # Lazygit
        lazygit.enable = true;

        telescope = {
            enable = true;
            keymaps = {
              "<leader>fg" = "live_grep";
              "<C-p>" = {
                action = "git_files";
                options = {
                  desc = "Telescope Git Files";
                };
              };
            };
            settings.defaults = {
                file_ignore_pattern = [
                    "^.git/"
                    "^.mypy_cache/"
                    "^__pychache__/"
                    "^output/"
                    "^data/"
                    "%.ipynb"
                ];
            };
            extensions.fzf-native = { enable = true; };
        };

        toggleterm = {
            enable = true;
            settings.open_mapping = "[[<C-t>]]";
        };

        web-devicons.enable = true;

        which-key.enable = true;

        wilder = {
            enable = true;
            modes = [ ":" "/" "?" ];
        };

    };

    

}
