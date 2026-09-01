{ self, inputs, ... }: {
	flake.nixosModules.environment = { ... }: {
		
    environment.sessionVariables = {
		    # If your cursor becomes invisible
        WLR_NO_HARDWARE_CURSORS = "1";
        # Hint electron apps to use wayland
        NIXOS_OZONE_WL = "1";
        # XDG_BASE_DIR variables
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";

        XDG_BIN_HOME = "$HOME/.loca/bin";

    };

    environment.variables = { 
	EDITOR = "nvim"; 
        SCREENSHOT_DIR = "$HOME/Pictures/Screenshots";
	  };
	};
 }

