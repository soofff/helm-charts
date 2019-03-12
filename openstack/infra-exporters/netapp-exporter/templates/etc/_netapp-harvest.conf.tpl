[global]


[default]
graphite_enabled  = 1
graphite_server   = localhost
graphite_port     = 2003
graphite_proto    = tcp

host_type         = FILER
auth_type         = password
username          = {{ .Values.global.netapp_filer.username | default "dummyuser" }}
password          = {{ .Values.global.netapp_filer.password | default "******" }}
data_update_freq  = 60

{{/*
{{ .Values.netapp.filers | indent 0 }}
*/}}
{{- range $idx, $avzone := .Values.shares  }}
{{- range $idx, $share := .shares_netapp }}
[{{ $share.host | regexFind "[a-zA-Z0-9-_]*" }}]
hostname = {{ $share.host }}
{{- with $share.host | regexFind "bb|cp|bm|ma" }}
{{- if eq . "bb" }}
group = vpod
{{- else if eq . "cp" }}
group = control-plane
{{- else if eq . "bm" }}
group = bare-metal
{{- else if eq . "ma" }}
group = manila
{{- end }}
{{- end }}
{{- end }}
{{- end }}