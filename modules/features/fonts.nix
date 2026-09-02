{ self, inputs, ... }:{
    flake.nixosModules.fonts = { pkgs, lib, ... }: {
		
	      environment.systemPackages = with pkgs; [
		        nerd-font-patcher
	      ];
			  ### Fonts ###
	      fonts.packages = with pkgs; [
		        jetbrains-mono
		        noto-fonts
		        noto-fonts-color-emoji
		        twemoji-color-font
		        font-awesome_6
		        font-awesome
		        powerline-fonts
		        powerline-symbols
		        corefonts
		        vista-fonts # Microsoft fonts ()
		        noto-fonts-cjk-sans
		        #(nerd-fonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
        ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues nerd-fonts); 
    };
}
