
config-version = "1.0"
bind = "0.0.0.0:{{ getenv `VELOCITY_BIND_PORT` `25577` }}"
motd = "{{ getenv `VELOCITY_MOTD` }}"
show-max-players = 500
online-mode = true
prevent-client-proxy-connections = {{ getenv `VELOCITY_PREVENT_CLIENT_PROXY_CONNECTIONS` | bool | conv.ToString }}
player-info-forwarding-mode = "{{ getenv `VELOCITY_PLAYER_INFO_FORWARDING_MODE` `MODERN` }}"
forwarding-secret = "{{ getenv `VELOCITY_FORWARDING_SECRET` }}"
announce-forge = {{ getenv `VELOCITY_ANNOUNCE_FORGE` | bool | conv.ToString }}
kick-existing-players = {{ getenv `VELOCITY_KICK_EXISTING_PLAYERS` | bool | conv.ToString }}
ping-passthrough = "{{ getenv `VELOCITY_PING_PASSTHROUGH` `DISABLED` }}"

[servers]
{{ getenv `VELOCITY_SERVERS` `{}` | json | toTOML }}

{{- with getenv `VELOCITY_SERVERS_TRY` }}
try = {{ . | jsonArray | toJSON }}{{ end }}

[forced-hosts]
{{ getenv `VELOCITY_FORCED_HOSTS` `{}` | json | toTOML }}

[advanced]
	compression-threshold = {{ getenv `VELOCITY_ADVANCED_COMPRESSION_THRESHOLD` | conv.ToInt }}
	compression-level = {{ getenv `VELOCITY_ADVANCED_COMPRESSION_LEVEL` | conv.ToInt }}
	login-ratelimit = {{ getenv `VELOCITY_ADVANCED_LOGIN_RATELIMIT` | conv.ToInt }}
	connection-timeout = {{ getenv `VELOCITY_ADVANCED_CONNECTION_TIMEOUT` | conv.ToInt }}
	read-timeout = {{ getenv `VELOCITY_ADVANCED_READ_TIMEOUT` | conv.ToInt }}
	haproxy-protocol = {{ getenv `VELOCITY_ADVANCED_HAPROXY_PROTOCOL` | bool | conv.ToString }}
	tcp-fast-open = {{ getenv `VELOCITY_ADVANCED_TCP_FAST_OPEN` | bool | conv.ToString }}
	bungee-plugin-message-channel = {{ getenv `VELOCITY_ADVANCED_BUNGEE_PLUGIN_MESSAGE_CHANNEL` | bool | conv.ToString }}
	show-ping-requests = {{ getenv `VELOCITY_ADVANCED_SHOW_PING_REQUESTS` | bool | conv.ToString }}
	failover-on-unexpected-server-disconnect = {{ getenv `VELOCITY_ADVANCED_FAILOVER_ON_UNEXPECTED_DISCONNECT` | bool | conv.ToString }}
	announce-proxy-commands = {{ getenv `VELOCITY_ADVANCED_ANNOUNCE_PROXY_COMMANDS` | bool | conv.ToString }}
	log-command-executions = {{ getenv `VELOCITY_ADVANCED_LOG_COMMAND_EXECUTIONS` | bool | conv.ToString }}

[query]
	enabled = false
	port = 25577
	map = "Velocity"
	show-plugins = false

