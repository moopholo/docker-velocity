#!/usr/bin/env bash
if ! [[ -f /velocity/velocity.toml ]] || [[ $FORCE_OVERWRITE_CONFIGS =~ ^[tT](rue|RUE)|[yY](es|ES)|1$ ]]; then
  /bin/gomplate --file=/velocity/velocity.toml.tpl --out=/velocity/velocity.toml
fi

if ! [[ -f /velocity/plugins/bStats/config.txt ]] || [[ $FORCE_OVERWRITE_CONFIGS =~ ^[tT](rue|RUE)|[yY](es|ES)|1$ ]]; then
  /bin/gomplate --file=/velocity/plugins/bStats/config.txt.tpl --out=/velocity/plugins/bStats/config.txt
fi

cd /velocity || exit
exec /velocity/start-velocity.sh
