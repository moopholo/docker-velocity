
config-version = "1.0"

bind = "0.0.0.0:{{ getenv `VELOCITY_BIND_PORT` `25577` }}"
motd = "{{ getenv `VELOCITY_MOTD` }}"
show-max-players = {{ getenv `VELOCITY_SHOW_MAX_PLAYERS` `500` | conv.ToInt }}
online-mode = {{ getenv `VELOCITY_ONLINE_MODE` `true` | bool | conv.ToString }}
prevent-client-proxy-connections = {{ getenv `VELOCITY_PREVENT_CLIENT_PROXY_CONNECTIONS` `true` | bool | conv.ToString }}
player-info-forwarding-mode = "{{ getenv `VELOCITY_PLAYER_INFO_FORWARDING_MODE` `modern` }}"
forwarding-secret = "{{ getenv `VELOCITY_FORWARDING_SECRET` }}"
announce-forge = {{ getenv `VELOCITY_ANNOUNCE_FORGE` `true` | bool | conv.ToString }}
kick-existing-players = {{ getenv `VELOCITY_KICK_EXISTING_PLAYERS` `true` | bool | conv.ToString }}
ping-passthrough = "{{ getenv `VELOCITY_PING_PASSTHROUGH` `description` }}"

[servers]
{{ getenv `VELOCITY_SERVERS` `{"lobby":"127.0.0.1:30066"}` | json | toTOML }}

try = {{ getenv `VELOCITY_SERVERS_TRY` `["lobby"]` | jsonArray | toJSON }}

[forced-hosts]
{{ getenv `VELOCITY_FORCED_HOSTS` `{}` | json | toTOML }}

[advanced]
	compression-threshold = {{ getenv `VELOCITY_ADVANCED_COMPRESSION_THRESHOLD` `256` | conv.ToInt }}
	compression-level = {{ getenv `VELOCITY_ADVANCED_COMPRESSION_LEVEL` `-1` | conv.ToInt }}
	login-ratelimit = {{ getenv `VELOCITY_ADVANCED_LOGIN_RATELIMIT` `3000` | conv.ToInt }}
	connection-timeout = {{ getenv `VELOCITY_ADVANCED_CONNECTION_TIMEOUT` `5000` | conv.ToInt }}
	read-timeout = {{ getenv `VELOCITY_ADVANCED_READ_TIMEOUT` `30000` | conv.ToInt }}
	haproxy-protocol = {{ getenv `VELOCITY_ADVANCED_PROXY_PROTOCOL` `false` | bool | conv.ToString }}
	tcp-fast-open = {{ getenv `VELOCITY_ADVANCED_TCP_FAST_OPEN` `true` | bool | conv.ToString }}
	bungee-plugin-message-channel = {{ getenv `VELOCITY_ADVANCED_BUNGEE_PLUGIN_MESSAGE_CHANNEL` `true` | bool | conv.ToString }}
	show-ping-requests = {{ getenv `VELOCITY_ADVANCED_SHOW_PING_REQUESTS` | bool | conv.ToString }}
	failover-on-unexpected-server-disconnect = {{ getenv `VELOCITY_ADVANCED_FAILOVER_ON_UNEXPECTED_DISCONNECT` `true` | bool | conv.ToString }}
	announce-proxy-commands = {{ getenv `VELOCITY_ADVANCED_ANNOUNCE_PROXY_COMMANDS` `true` | bool | conv.ToString }}
	log-command-executions = {{ getenv `VELOCITY_ADVANCED_LOG_COMMAND_EXECUTIONS` `false` | bool | conv.ToString }}

[query]
	enabled = {{ getenv `VELOCITY_QUERY_ENABLED` `false` | bool | conv.ToString }}
	port = {{ getenv `VELOCITY_QUERY_PORT` (getenv `VELOCITY_BIND_PORT` `25577`) }}
	map = "{{ getenv `VELOCITY_QUERY_MAP` `Velocity` }}"
	show-plugins = {{ getenv `VELOCITY_QUERY_SHOW_PLUGINS` `false` | bool | conv.ToString }}

[messages]
	kick-prefix = "{{ getenv `VELOCITY_MESSAGES_KICK_PREFIX` `&cKicked from %s: ` }}"
	disconnect-prefix = "{{ getenv `VELOCITY_MESSAGES_DISCONNECT_PREFIX` `&cCan't connect to %s: ` }}"
	online-mode-only = "{{ getenv `VELOCITY_MESSAGES_ONLINE_MODE_ONLY` `&cThis server only accepts connections from online-mode clients.\n\n&7Did you change your username? Sign out of Minecraft, sign back in, and try again.` }}"
	no-available-servers = "{{ getenv `VELOCITY_MESSAGES_NO_AVAILABLE_SERVERS` `&cThere are no available servers.` }}"
	already-connected = "{{ getenv `VELOCITY_MESSAGES_ALREADY_CONNECTED` `&cYou are already connected to this proxy!` }}"
	moved-to-new-server-prefix = "{{ getenv `VELOCITY_MESSAGES_MOVED_TO_NEW_SERVER_PREFIX` `&cThe server you were on kicked you: ` }}"
	generic-connection-error = "{{ getenv `VELOCITY_MESSAGES_GENERIC_CONNECTION_ERROR` `&cAn internal error occurred in your connection.` }}"

[metrics]
	enabled = {{ getenv `VELOCITY_METRICS_ENABLED` `false` | bool | conv.ToString }}
	log-failure = {{ getenv `VELOCITY_METRICS_LOG_FAILURE` `false` | bool | conv.ToString }}
