{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        historyLimit = 1000;
        keyMode = "vi";
        mouse = true;
        prefix = "C-Space";
        terminal = "xterm-256color";
        escapeTime = 0;
        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.vim-tmux-navigator
            #tmuxPlugins.catppuccin
            tmuxPlugins.gruvbox
            tmuxPlugins.yank
        ];
        extraConfig = 
            ''
                # Set mouse support
                #set -g mouse on

                # Opens panes in pwd
                bind '"' split-window -v -c "#{pane_current_path}"
                bind % split-window -h -c "#{pane_current_path}"

                # Indexes windows from 1 instead of 0
                #set -g base-index 1
                #set -g pane-base-index 1
                #set-window-option -g pane-base-index 1
                #set-option -g renumber-windows on

                # Shift Alt vim keys to switch windows
                bind -n M-H previous-window
                bind -n M-L next-window

                # Sets Ctrl+<SPACE> as prefix 
                #unbind C-b
                #set -g prefix C-Space
                #bind C-Space send-prefix

                # Sets nvim colorscheme to that outside tmux
                set-option -sa terminal-overrides ",xterm*:Tc"

                # Fixes highlighing issue in nvim
                #set -g default-terminal {TERM}
                # Fixes delayed escape time in nvim
                #set -s escape-time 0
            '';
    };
}
