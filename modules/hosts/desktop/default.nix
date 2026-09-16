{ self, self', inputs, config, ...}: {
	flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [ 
			self.nixosModules.commonConfiguration	
			self.nixosModules.desktopConfiguration	
			self.nixosModules.desktopHardware
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = {
					myNoctalia = self.packages."x86_64-linux".myNoctalia;
					inherit inputs;
				};
				home-manager.users.rxsl = {	
 				  imports = [ 
				   	../../../home/default.nix
				   ];
				};
				home-manager.backupFileExtension = "backup";
			}
		];	
	};
}
