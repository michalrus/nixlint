{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = {nixpkgs, ...}: let
    eachSystem = f:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: f nixpkgs.legacyPackages.${system});
  in {
    packages = eachSystem (pkgs: rec {
      default = pkgs.callPackage ./default.nix {};
      nixlint = default;
    });
  };
}
