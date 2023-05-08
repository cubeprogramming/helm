{{- define "container1" -}}
- name: newcontainer
  image: "{{ .Values.deployment.image.app }}:{{ .Values.deployment.image.version }}"
  ports:
    - name: http
      containerPort: 80
      protocol: tcp
{{- end -}}

{{- define "container2" -}}
- name: container2
  image: "{{ .Values.deployment.image.app }}:{{ .Values.deployment.image.version }}"
  ports:
    - name: http
      containerPort: 80
      protocol: tcp
{{- end -}}
