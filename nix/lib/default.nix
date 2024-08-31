{
  # This is the merged library containing your namespaced library as well as all libraries from
  # your flake's inputs.
  lib,
  # Your flake inputs are also available.
  inputs,
  # The namespace used for your flake, defaulting to "internal" if not set.
  # namespace,
  # Additionally, Snowfall Lib's own inputs are passed. You probably don't need to use this!
  # snowfall-inputs,
}: rec {
  extendWithList = {
    thisNixvim,
    configList,
  }: let
    inherit (builtins) elemAt length;
  in
    if (length configList) > 0
    then let
      nextList =
        if (length configList) > 1
        then lib.sublist 1 100 configList
        else [];

      nextNixvim = thisNixvim.nixvimExtend (elemAt configList 0);
    in
      extendWithList {
        thisNixvim = nextNixvim;
        configList = nextList;
      }
    else thisNixvim;

  extendWithNameList = thisNixvim: nameList: let
    inherit (lib.snowfall.fs) get-snowfall-file;
    inherit (builtins) map filter tryEval pathExists toString concatStringsSep;

    getConfig = n: let
      fixPath = p:
        concatStringsSep "/" (
          lib.sublist 4 10 (
            lib.splitString "/" (
              toString p
            )
          )
        );

      path = get-snowfall-file "modules/nixos/${n}";
      try =
        if pathExists path
        then tryEval (import path)
        else if lib.hasPrefix "user-" n
        then
          (lib.warn "User config not found: ${fixPath path}\nUsing default."
            (tryEval (import (get-snowfall-file "modules/nixos/user-default"))))
        else
          (lib.warn "Nixvim config not found: ${fixPath path}"
            {
              success = false;
              value = "noPath";
            });
    in
      if try.success
      then try.value
      else if try.value != "noPath"
      then (lib.warn "Nixvim config failed to import: ${fixPath path}" null)
      else null;

    configList = filter (a: a != null) (map getConfig nameList);
  in
    extendWithList {inherit thisNixvim configList;};

  mkNixvim = {
    pkgs,
    addons ? [],
  }: let
    inherit (lib.snowfall.fs) get-snowfall-file;
    inherit (builtins) getEnv;

    username = getEnv "USER";
    user-configList = ["user-${username}"] ++ addons;
    nixvim =
      import
      (get-snowfall-file "packages/nixvim") {inherit inputs pkgs;};
  in
    extendWithNameList nixvim user-configList;
}
