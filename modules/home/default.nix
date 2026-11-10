{
    imports = [ 
	      ./connect.nix
	      ./git.nix
	      ./kitty.nix
        ./librewolf.nix
	      ./lsd/lsd.nix
	      #./mako.nix
	      ./nixvim/default.nix
        ./noctalia/noctalia.nix
	      ./starship/starship.nix
        #./steam.nix
	      #./swayidle.nix
    	  ./tmux.nix
        ./vscodium.nix
	      ./zsh.nix
	  ];
	  home = {
		    username = "rxsl";
		    homeDirectory = "/home/rxsl";
		    stateVersion = "26.05";
	  };
    services.udiskie = {
        enable = true;
    };
    
    # Allows for Steam to open via Noctalia-shell launcher
    xdg.desktopEntries.steam = {
        name = "Steam";
        exec = "sh -c \"steam %U\"";
        icon = "steam";
        type = "Application";
    };

    xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
 
    gtk = {
        enable = true;
        theme.name = "Adwaita-dark";
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
    };
    
}

