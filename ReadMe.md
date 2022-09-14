```
vault write sys/replication/performance/primary/paths-filter/secondary  \
    mode="deny" \
    paths="invariance/aws/appid-34, invariance/gcp, invariance/azure, invariance/onprem, shashparab/gcp, shashparab/azure, shashparab/onprem"
```
