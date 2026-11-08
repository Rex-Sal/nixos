{ 
    # Plugin to navigate between panes using the same navigation binds as niri
    programs.nixvim = {
        plugins.tmux-navigator.enable = true;
        keymaps = [
            {
                mode = "n";
                key = "<C-h>";
                action = "<CMD>TmuxNavigationLeft<CR>";
                options.desc = "Shift focus to the left pane";
            }
            
            {
	              mode = "n";
	              key = "<C-l>";
                action = "<CMD>TmuxNavigationRight<CR>";
                options.desc = "Shift focus to the right pane";
            }
    
            {
    	          mode = "n";
	              key = "<C-j>";
	              action = "<CMD>TmuxNavigationDown<CR>";
	              options.desc = "Shift focus to the lower pane";
            }
            
            {
	              mode = "n";
	              key = "<C-k>";
	              action = "<CMD>TmuxNavigationUp<CR>";
	              options.desc = "Shift focus to the upper pane";
            }
        ];
    };
}
