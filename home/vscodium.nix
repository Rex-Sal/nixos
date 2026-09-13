{ pkgs, lib, ... }: {

    programs.vscode = {
        enable = true;
        userSettings = {
            "terminal.integrated.fontFamily" = [ "Droid Sans Mono" "monospace" "monospace" "Hack Nerd Font" ];# or any other font
        };
    };
}

