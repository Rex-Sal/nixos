# file tree plugin
{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    openOnSetupFile = true;
    autoReloadOnWrite = true;
  };
}

