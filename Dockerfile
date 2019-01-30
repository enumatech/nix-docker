FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -iA nixpkgs.bash
RUN nix-env -iA nixpkgs.git
RUN rm -rf /root/.cache/nix/*

# FIXME: workaround for gitlab-runner using hardcoded path to shell
RUN ln -s $(which bash) /bin/bash
RUN rm -f /bin/sh
RUN ln -s $(which sh) /bin/sh

