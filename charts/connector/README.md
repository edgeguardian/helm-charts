# EdgeGuardian (EG) K8s Connector Helm Chart

* Installs the [EdgeGuardian](https://login.edge-guardian.io/) (EG) K8s Connector to your Kubernetes cluster.

## Get Repo Info

```console
helm repo add edgeguardian https://edgeguardian.github.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release edgeguardian/connector
```

## Upgrading the Chart

To upgrade the chart with the release name `my-release`:

```console
helm upgrade my-release edgeguardian/connector
```


## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
