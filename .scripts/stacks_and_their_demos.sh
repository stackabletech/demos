#!/usr/bin/env sh
cat demos/demos-v2.yaml | yq -y '.demos | to_entries | group_by(.value.stackableStack) | sort_by(.[0].value.stackableStack) | map({(.[0].value.stackableStack): map(.key)}) | add'
