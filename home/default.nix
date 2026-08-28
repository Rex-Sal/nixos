{ inputs, config, pkgs, ... }: {
	imports = [ 
	  ./kitty.nix
	  ./connect.nix
	  ./git.nix
	  ./zsh.nix
	  ./lsd/lsd.nix
	  ./starship/starship.nix
    	  ./tmux.nix
	];
	home = {
		username = "rxsl";
		homeDirectory = "/home/rxsl";
		stateVersion = "26.05";
	};
}

