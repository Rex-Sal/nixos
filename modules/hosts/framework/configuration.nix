{ self, inputs, ... }: {
	flake.nixosModules.frameworkConfiguration = { pkgs, lib, ... }: {

        environment.sessionVariables.FLAKE_PROFILE = "framework";
	};
}
