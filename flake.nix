{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  outputs =
    inputs@{ self, ... }:

    let
      mkAndroidPkgs =
        pkgs:
        pkgs.androidenv.composeAndroidPackages {
          platformVersions = [
            "35"
            "36"
          ];
          buildToolsVersions = [ "35.0.0" ];
          includeEmulator = true;
          includeSystemImages = false;
          includeNDK = true;
          # abiVersions = [ "x86_64" ];
          extraLicenses = [
            "android-googletv-license"
            "android-googlexr-license"
            "android-sdk-arm-dbt-license"
            "android-sdk-preview-license"
            "google-gdk-license"
            "mips-android-sysimage-license"
          ];
          ndkVersion = "28.2.13676358";
          cmakeVersions = [ "3.22.1" ];
        };
    in
    {
      packages = builtins.mapAttrs (system: pkgs: {
        default = pkgs.flutter.buildFlutterApplication
          {
            pname = "flutter_application_1";
            version = "0.0.1";

            autoPubspecLock = ./pubspec.lock;
            src = ./.;
          }
        ;
      }) inputs.nixpkgs.legacyPackages;

      devShells = builtins.mapAttrs (
        system: pkgs:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.android_sdk.accept_license = true;
            config.allowUnfree = true;
          };
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.flutter
            ];
          };
          android = self.outputs.devShells.${system}.default.overrideAttrs (
            final: prev:
            let
              androidPkgs = mkAndroidPkgs pkgs;
            in
            rec {
              nativeBuildInputs = prev.nativeBuildInputs ++ [
                androidPkgs.androidsdk
                androidPkgs.ndk-bundle
                androidPkgs.build-tools
                androidPkgs.cmake
                pkgs.openjdk17
                pkgs.gradle
              ];

              GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${builtins.head androidPkgs.build-tools}/libexec/android-sdk/build-tools/35.0.0/aapt2";

              ANDROID_HOME = "${androidPkgs.androidsdk}/libexec/android-sdk";
              ANDROID_SDK_ROOT = ANDROID_HOME;

              NDK_HOME = androidPkgs.ndk-bundle;
              ANDROID_NDK_HOME = NDK_HOME;
            }
          );
        }
      ) inputs.nixpkgs.legacyPackages;
    };
}
