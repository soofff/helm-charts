mappings: 
- match: netapp.perf.*.*.node.*.*.*
  name: netapp_perf_node
  labels: 
    Group: $1
    Cluster: $2
    Node: $3
    Tag: $4
    Metric: $5
- match: netapp.perf.*.*.svm.*.*.*
  name: netapp_perf_svm
  labels:
    Group: $1
    Cluster: $2
    Vserver: $3
    Tag: $4
    Metric: $5
- match: netapp.perf.*.*.svm.*.*.*.*
  name: netapp_perf_svm
  labels:
    Group: $1
    Cluster: $2
    Vserver: $3
    TagType: $4
    TagValue: $5
    Metric: $6
- match: netapp.perf.*.*.svm.*.*.*.*.*
  name: netapp_perf_svm
  labels:
    Group: $1
    Cluster: $2
    Vserver: $3
    TagType: $4
    TagValue: $5
    Tag: $6
    Metric: $7
- match: netapp.perf.*.*.svm.*.*.*.*.*.*
  name: netapp_perf_svm
  labels:
    Group: $1
    Cluster: $2
    Vserver: $3
    TagType: $4
    TagValue: $5
    SubTagType: $6
    SubTagValue: $7
    Metric: $8
- match: .
  match_type: regex
  action: drop
  name: dropped