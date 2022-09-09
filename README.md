# Cubos CLI

Ação para deploy

### Inputs

#### `script`

**Required** The script you want to use. Options:

`"cluster_from_env"` - Configure kubectl to deploy.

`"deploy"` - Used to deploy the application.

## Example usage

```
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Test build file
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Set Cluster
        env:
          KUBERNETES_DEV_TOKEN: ${{ secrets.KUBERNETES_DEV_TOKEN }}
        uses: cubos-devops/cubos-cli@v0.0.1
        with:
          script: "dev_cluster_from_env KUBERNETES_DEV_TOKEN"

      - name: Deploy (Probably)
        uses: cubos-devops/cubos-cli@v0.0.1
        with:
          script: "deploy"

```
