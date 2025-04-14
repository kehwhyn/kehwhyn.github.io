let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    nodejs_22
    pnpm_9
  ];

  shellHook = ''
    echo "Welcome to the Astro dev environment!"
    echo "Node: $(node -v)"
    echo "Pnpm: $(pnpm -v)"
  '';
}
