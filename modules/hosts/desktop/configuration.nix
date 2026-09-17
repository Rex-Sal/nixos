{ self, inputs, ... }: {
	flake.nixosModules.desktopConfiguration = { pkgs, lib, ... }: {
        
        environment.sessionVariables.FLAKE_PROFILE = "desktop";
	};
}
