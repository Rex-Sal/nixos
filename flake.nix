{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        niri-flake = {
            url = "github:sodiboo:niri-flake";
            inputs.nixpkds.follows = "nixpkgs";
        };

        noctalia.url = "github:noctalia-dev/noctalia/cachix";
        
        flake-parts.url = "github:hercules-ci/flake-parts";
        
        import-tree.url = "github:vic/import-tree";

        swww.url = "github:LGFae/swww";
        
        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    (inputs.import-tree ./modules);
}

