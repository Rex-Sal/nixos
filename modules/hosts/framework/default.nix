{ self, self', inputs, config, ...}: {
	flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
		modules = [ 
			../common/configuration.nix
			./configuration.nix
			./hardware.nix
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
            inputs.noctalia.homeModules.default
				   ];
				};
				home-manager.backupFileExtension = "backup";
			}
		];	
	};
}
