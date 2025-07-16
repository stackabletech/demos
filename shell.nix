{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    gettext # envsubst

    # Needed by .scripts/update_helm_charts.py
    python311Packages.pyyaml
    kubernetes-helm
  ];
}
