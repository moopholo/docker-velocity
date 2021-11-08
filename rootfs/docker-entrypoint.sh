#!/usr/bin/env bash
/bin/gomplate --file=/velocity/velocity.toml.tpl --out=/velocity/velocity.toml
cd /velocity || exit
exec /velocity/start-velocity.sh
