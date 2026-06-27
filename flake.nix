{
  outputs = { self }: {
    nixosModules.default = {
      nix.settings.flake-registry = self + "/flake-registry.json";
    };
  };
}
