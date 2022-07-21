# nodejs-gitops

GitOps stuff for the [example nodejs](https://github.com/redhat-capgemini-exchange/nodejs-rest) app.

## Deployment

Bootstrap the installation:

```shell
oc apply -f app/app.yaml
```

Deploy pipeline configs and secrets:

```shell
oc apply -f secrets/github_secrets.yaml -n nodejs-gitops-pipeline
oc apply -f secrets/argocd_secrets.yaml -n nodejs-gitops-pipeline
oc apply -f secrets/argocd_configmap.yaml -n nodejs-gitops-pipeline

```

Deploy application secrets:

```shell
oc apply -f secrets/app_secrets.yaml -n nodejs-gitops-develop
oc apply -f secrets/app_secrets.yaml -n nodejs-gitops-release
oc apply -f secrets/app_secrets.yaml -n nodejs-gitops-main
```

Get the pipeline listener endpoints:

```shell
oc get routes -n nodejs-gitops-pipeline
```

Configure the GitHub webhooks:

* nodejs-gitops: host/port of route `el-rollout-pipeline`
* nodejs-rest: host/port of route `el-build-pipeline`

### References

* [CIS Software Supply Chain Security Guide](https://github.com/aquasecurity/chain-bench/blob/main/docs/CIS-Software-Supply-Chain-Security-Guide-v1.0.pdf)