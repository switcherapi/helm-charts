{{/*
Expand the name of the chart.
*/}}
{{- define "switcher-management.name" -}}
{{- default .Chart.Name .Values.management.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "switcher-management.fullname" -}}
{{- if .Values.management.fullnameOverride }}
{{- .Values.management.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.management.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "switcher-management.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "switcher-management.labels" -}}
helm.sh/chart: {{ include "switcher-management.chart" . }}
{{ include "switcher-management.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "switcher-management.selectorLabels" -}}
app.kubernetes.io/name: {{ include "switcher-management.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "switcher-management.serviceAccountName" -}}
{{- if .Values.management.serviceAccount.create }}
{{- default (include "switcher-management.fullname" .) .Values.management.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.management.serviceAccount.name }}
{{- end }}
{{- end }}
