{ inputs, config, pkgs, ... }: {
    imports = [ 
	      ./kitty.nix
	      ./connect.nix
	      ./git.nix
	      ./zsh.nix
	      ./lsd/lsd.nix
	      ./starship/starship.nix
    	  ./tmux.nix
	      ./mako.nix
	      ./swayidle.nix
	      #./chromium.nix
	      ./nixvim/default.nix
	  ];
	  home = {
		    username = "rxsl";
		    homeDirectory = "/home/rxsl";
		    stateVersion = "26.05";
	  };
    services.udiskie = {
        enable = true;
    };
}

