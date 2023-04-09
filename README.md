# Nix Flake Registry

Welcome to the Nix Flake Registry repository! This repository contains the default [flake-registry.json](flake-registry.json) file utilized by the Nix CLI. The flake registry serves as a convenient method for the Nix CLI to associate short names with flake URIs, such as linking `nixpkgs` to `github:NixOS/nixpkgs/nixpkgs-unstable`.

## Usage

Mapped names from this registry are employed in two distinct contexts:

### CLI

The registry allows for more concise invocations of `nix run` and other Nix commands.

For instance, when executing `nix run nixpkgs#hello`, the `nixpkgs` portion is resolved to the corresponding GitHub repository via the registry mapping.

### Flake Inputs

When a flake output function refers to an input that has not been explicitly specified, the input is resolved using the registry.

Consider the following minimal `flake.nix` file:
```nix
{
  outputs = { self, nixpkgs }: { };
}
```

Here, `self` refers to the flake itself, while `nixpkgs` is resolved automatically through the registry.

> NOTE: Although this feature offers convenience, we recommend explicitly listing all inputs, as the flake registry content may change over time.

## Registry File Format

The file format is briefly documented here: <https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-registry.html#registry-format>.

## Inclusion Policy

Inclusion criteria are evaluated based on the following considerations:

1. The namespace has a limited size.
2. Common names should be avoided to prevent confusion if a user mistypes an input in their `flake.nix` and it resolves to another input via the registry.
3. The shortcut must offer clear utility to the NixOS ecosystem; it is not intended to showcase random projects.
4. Project popularity is taken into account.

When submitting a PR, please acknowledge and refer to these policy points for
argumentation.

If your goal is to get your project listed somewhere, consider submitting it to <https://github.com/nix-community/awesome-nix/> instead.

> NOTE: Some existing entries may not adhere to this policy due to historical reasons.

## Publication Pipeline

By default, the Nix CLI is configured to fetch the registry at <https://channels.nixos.org/flake-registry.json>. This URL is proxied to this repository using Fastly:
<https://github.com/NixOS/nixos-org-configurations/blob/72adc59c5ba946c3d4844a920e9beefae12bbd49/terraform/channels.tf#L106-L116>.
