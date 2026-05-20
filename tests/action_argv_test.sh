#!/usr/bin/env bash
set -euo pipefail

build_action_args() {
  local input_py_module=$1
  local input_ts_file=$2
  local input_exclude_models=${3-}
  local model
  local -a exclude_models=()

  args=(--module "$input_py_module" --output "$input_ts_file")
  if [ -n "$input_exclude_models" ]; then
    IFS=',' read -r -a exclude_models <<< "$input_exclude_models"
    for model in "${exclude_models[@]}"
    do
      model="${model#"${model%%[![:space:]]*}"}"
      model="${model%"${model##*[![:space:]]}"}"
      if [ -n "$model" ]; then
        args+=(--exclude "$model")
      fi
    done
  fi
}

assert_action_args() {
  local -a expected=(
    --module 'pkg.models; echo injected'
    --output 'dist/types $(echo injected) `echo injected`.ts'
    --exclude 'Login Response'
    --exclude 'Audit Record'
  )

  if [ "${#args[@]}" -ne "${#expected[@]}" ]; then
    printf 'expected %s args, got %s\n' "${#expected[@]}" "${#args[@]}" >&2
    printf 'actual args: [%s]\n' "${args[*]}" >&2
    exit 1
  fi

  for i in "${!expected[@]}"
  do
    if [ "${args[$i]}" != "${expected[$i]}" ]; then
      printf 'arg %s mismatch\nexpected: [%s]\nactual:   [%s]\n' \
        "$i" "${expected[$i]}" "${args[$i]}" >&2
      exit 1
    fi
  done
}

build_action_args \
  'pkg.models; echo injected' \
  'dist/types $(echo injected) `echo injected`.ts' \
  'Login Response,Audit Record'
assert_action_args
