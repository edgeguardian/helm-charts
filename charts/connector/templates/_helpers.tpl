{{/* vim: set filetype=mustache: */}}

Expand the name of the chart.
*/}}
{{- define "eg-connector.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
 - Create a default fully qualified app name.
 - We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
 - If release name contains chart name it will be used as a full name.
*/}}
{{- define "eg-connector.fullname" -}}
  {{- if .Values.fullnameOverride -}}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- $name := default .Chart.Name -}}
    {{- if contains $name .Release.Name -}}
      {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "eg-connector.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "eg-connector.chartName" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Generate basic labels */}}
{{- define "eg-connector.labels" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ replace "+" "_" .Chart.Version }}"
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ template "eg-connector.chartName" . }}
{{- if .Values.commonLabels}}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{/* Create the name of eg-connector service account to use */}}
{{- define "eg-connector.serviceAccountName" -}}
  {{- if .Values.serviceAccount.create -}}
    {{ default (include "eg-connector.fullname" .) .Values.serviceAccount.name }}
  {{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
  {{- end -}}
{{- end -}}

{{/*
Create secret name
*/}}
{{- define "eg-connector.secretName" -}}
  {{ default (include "eg-connector.fullname" .) }}
{{- end }}