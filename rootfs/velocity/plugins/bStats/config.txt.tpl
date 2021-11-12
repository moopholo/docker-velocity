# bStats (https://bStats.org) collects some basic information for plugin authors, like
# how many people use their plugin and their total player count. It's recommended to keep
# bStats enabled, but if you're not comfortable with this, you can turn this setting off.
# There is no performance penalty associated with having metrics enabled, and data sent to
# bStats is fully anonymous.
enabled={{ getenv `BSTATS_ENABLED` `false` | bool | conv.ToString }}
log-errors={{ getenv `BSTATS_LOG_ERRORS` `false` | bool | conv.ToString }}
log-sent-data={{ getenv `BSTATS_LOG_SENT_DATA` `false` | bool | conv.ToString }}
log-response-status-text={{ getenv `BSTATS_LOG_RESPONSE_STATUS_TEXT` `false` | bool | conv.ToString }}
