{ inputs, config, pkgs, ... }: {
	imports = [ 
	  ./kitty.nix
	  ./connect.nix
	  ./git.nix
	];
	home = {
		username = "rxsl";
		homeDirectory = "/home/rxsl";
		stateVersion = "26.05";
	};
}

