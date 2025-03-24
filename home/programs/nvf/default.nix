# nvim for special needs ppl
{ inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.nvf
/*     ./plugins/cmp.nix
    ./plugins/git.nix
    ./plugins/lsp.nix
    ./plugins/markdown.nix
    ./plugins/mini.nix
    ./plugins/picker.nix
    ./plugins/snacks.nix
    ./plugins/trouble.nix
    ./plugins/utils.nix

    ./options.nix
    ./keymaps.nix
    ./autocmds.nix */
  ];

  programs.nvf.enableManpages = true;
  programs.nvf.enable = true;
}
