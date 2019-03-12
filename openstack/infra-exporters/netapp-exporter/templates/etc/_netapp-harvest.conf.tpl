[global]

[default]
graphite_enabled  = 1
graphite_server   = localhost
graphite_port     = 2003
graphite_proto    = tcp

host_type         = FILER
auth_type         = password
data_update_freq  = 300

{{- range $idx, $avzone := .Values.shares  }}
{{- range $idx, $share := .shares_netapp }}

[{{ $share.host | regexFind "[a-zA-Z0-9-_]*" }}]
hostname = {{ $share.host }}
username = {{ required "netapp filer api user" $share.username }}
password = {{ required "netapp filer password" $share.password }}

{{- with $share.host | regexFind "bb|cp|bm|ma" }}
{{- if eq . "bb" }}
group    = vpod
{{- else if eq . "cp" }}
group    = control-plane
{{- else if eq . "bm" }}
group    = bare-metal
{{- else if eq . "ma" }}
group    = manila
{{- end }}
{{- end }}

{{- end }}
{{- end }}