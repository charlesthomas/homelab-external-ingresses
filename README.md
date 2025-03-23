# homelab-external-ingresses

This is a mirco-services repo for configuring
external ingresses
in [my homelab](https://github.com/charlesthomas/homelab).

These "external ingresses" are used to point the k3s ingress controller to services running outside the cluster. It enables external-dns and cert-manager to do everything automatically, and have https on services that would otherwise not have it at all, or would use a self-signed cert.

---
This repo is templated via
[homelab-template](https://github.com/charlesthomas/homelab-template)
and automatically updated via
[🤖 Templatron](https://github.com/charlesthomas/templatron).
