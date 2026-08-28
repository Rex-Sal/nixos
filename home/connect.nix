{ config, pkgs, ... }: {
	programs.ssh = {
		enable = true;
		addKeysToAgent = "yes";
	};

	
	programs.keychain = {
		enable = true;
		keys = [ "rxsl_gh" ];
		extraFlags = [ "--quiet" ];
	};
	
}
