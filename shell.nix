{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    gettext # envsubst
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pyyaml
    ]))
  ];
}
