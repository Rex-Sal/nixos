{ self, inputs, config, ...}: {
	flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [ 
			self.nixosModules.frameworkConfiguration	
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.rxsl = import ../../../home/default.nix;
				home-manager.backupFileExtension = "backup";
			}
		];	
	};
}
