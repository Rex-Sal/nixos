{ inputs, ... }: {

    imports = [
	      inputs.nixvim.homeManagerModules.nixvim
		    ./options.nix
	  ];
	  programs.nixvim = {
		    enable = true;
		    defaultEditor = true;
		    nixpkgs.useGlobalPackages = true;
		    viAlias = true;
		    vimAlias = true;
	  };
}
