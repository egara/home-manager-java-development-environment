# Java Development Environment

This is a Java Development environment created using a Nix Flake and Home Manager. The purpose of it is to install all the tools needed for a GUI Java Development environment (for my specific use case)

# How can I set up this flake?
This flake is prepared for any distribution except NixOS.

**Prerequisites:**

- Nix package manager has to be installed in your system. For example, if you are on Arch or derivatives you can check [the Arch Wiki](https://wiki.archlinux.org/title/Nix).
- You have to enable flakes support once Nix package manager is installed. For this, you can edit **/etc/nix/nix.conf** and add something like this:

```
#
# https://nixos.org/manual/nix/stable/#sec-conf-file
#

# Unix group containing the Nix build user accounts
build-users-group = nixbld

max-jobs = auto

# Enabling flakes and nix-command
experimental-features = nix-command flakes

# Disable sandbox
sandbox = false
```

Then, clone this repo:

    git clone https://github.com/egara/home-manager-java-development-environment.git
    cd home-manager-java-development-environment
    

Edit **flake.nix** and **home.nix** and change the user **egarcia** for your own user. Add, change or remove all the desired packages and configurations too.

Build the flake the first time:

    nix build .#homeConfigurations.egarcia.activationPackage
    

Activate and switch to the new generation created. Also, you can remove **result** link because it won't be needed anymore.

    result/activate
    rm result


# How can I install new packages or change and apply new configurations?

Change **home.nix** and:

    home-manager switch --flake .#egarcia

# How can I update the flake?

Type:

    nix flake update
    home-manager switch --flake .#egarcia

# Home Manager and Nix useful commands

 - **home-manager packages** -> List all the packages available in the current and enabled generation
 - **home-manager generations** -> List all the generations available in the current profile
 - **home-manager remove-generations ID** -> Removes a specific **ID** generation
 - **nix profile history** -> Lists the history of the current profile (i.e. it will list all the changes in that specific profile (generations))
 - **nix profile rollback** -> Rollbacks the current profile to the previous generation
 - **nix profile rollback --to ID** -> Rollbacks the profile to a specific **ID** generation
 - **nix profile diff-closures** -> Checks all the differences between the generations of the current profile