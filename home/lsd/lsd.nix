{ config, pkgs, ... }:

{
  home.file.".config/lsd/config.yaml".source = ./config.yaml;
  home.file.".config/lsd/icons.yaml".source = ./icons.yaml;
}

