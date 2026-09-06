{ pkgs, ... }:{

    imports = [
        ./fidget.nix
        ./none-ls.nix
        ./trouble.nix
    ];
    programs.nixvim.plugins = {
        lsp = {
            enable = true;
            servers = {
                bashls.enable = true;
                clangd.enable = true;
                cmake.enable = true;
                cssls.enable = true;
                elixirls.enable = true;
                gleam.enable = true;
                gopls.enable = true;
                html.enable = true;
                #htmx.enable = true;
                #kotlin_language_server.enable = true;
                lua_ls = {
                    enable = true;
                    settings.telemetry.enable = false;
                };
                nixd.enable = true;
                prolog_ls = {
                  enable = true;
                  package = pkgs.swi-prolog;
                };
                pylyzer.enable = true;
                #ruby_lsp.enable = true;
                #ruff.enable = true;
                rust_analyzer = {
                    enable = true;
                    installCargo = true;
                    installRustc = true;
                };
                sqls.enable = true;
                svelte.enable = true;
                tailwindcss.enable = true;
                ts_ls.enable = true;
            };
            keymaps.lspBuf = {
                "gd" = "definition";
                "gD" = "references";
                "gt" = "type_definition";
                "gi" = "implementation";
                "K" = "hover";
            };
        };
    };
}

