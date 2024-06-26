# k8up

![Version: 4.8.0](https://img.shields.io/badge/Version-4.8.0-informational?style=flat-square)

Kubernetes and OpenShift Backup Operator based on restic

**Homepage:** <https://k8up.io/>

## Installation

```bash
helm repo add dasmeta https://dasmeta.github.io/helm/
helm install backup dasmeta/backup
```

```bash
helm repo add dasmeta https://dasmeta.github.io/helm/
helm upgrade --install backup dasmeta/backup -f path/to/values.yaml --values schedule.yaml
```


# For specfy shedulers need to change this values in sheduler.yaml file 
```yaml
  backup:
    schedule: '*/5 * * * *'
    failedJobsHistoryLimit: 2
    successfulJobsHistoryLimit: 2
    # optional
    #promURL: https://prometheus-io-instance:8443
  check:
    schedule: '0 1 * * 1'
    # optional
    #promURL: https://prometheus-io-instance:8443
  prune:
    schedule: '0 1 * * 0'
    retention:
      keepLast: 5
      keepDaily: 14
```

# for modufy backup folders need to change 
```yaml 
  endpoint: http://minio:9000
  bucket: backups
  accessKeyIDSecretRef:
    name: minio-credentials
    key: username
  secretAccessKeySecretRef:
    name: minio-credentials
    key: password
repoPasswordSecretRef:
  name: backup-repo
  key: password
```


# -- Specifies the timezone K8up is using for scheduling.
# Empty value defaults to the timezone in which Kubernetes is deployed.
# Accepts `tz database` compatible entries, e.g. `Europe/Zurich`
```yaml
timezone: ""
```

# -- Specifies the namespace in which K8up's `EffectiveSchedules` are stored.
# Defaults to release namespace if left empty.
```yaml
operatorNamespace: ""
```
