# Retail Multi-Agent Infrastructure Scaffold

**Advanced architecture example — not a working multi-agent application.**

[Course home](../../README.md) ·
[Chapter 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architecture blueprint](../retail-scenario.md)

## What this deploys

This directory contains an ARM template, parameters, and a Bash deployment script.
There is **no `azure.yaml` or retail application source**.

| Resource | Actual state after provisioning |
|---|---|
| Primary Azure OpenAI account | `gpt-4.1-chat` deployment using `gpt-4.1` version `2025-04-14`, `GlobalStandard` |
| Secondary OpenAI account (optional) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` version `2025-04-14`, `GlobalStandard` |
| Embeddings account (optional) | `text-embedding-ada-002` version `2`, `Standard`; no indexing pipeline |
| Grader OpenAI account | `gpt-4.1-grader`, model `gpt-4.1` version `2025-04-14`, `GlobalStandard`; no evaluator |
| AI Search | Empty service; no index or documents |
| Storage | Empty `documents` and `uploads` blob containers |
| Cosmos DB | Serverless account, `chathistory` database, `conversations` container partitioned by `/userId`, 30-day item TTL |
| Container Apps | Router and frontend both run `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` on port 80 |
| Key Vault (optional) | Empty RBAC-enabled vault; **no secrets or role assignments** |
| Application Insights / Log Analytics (optional) | Resources and environment log collection; no custom app instrumentation, alerts, or dashboards |
| Document Intelligence | S0 account; no document processing workflow |

Legacy Bing Search v7 was retired on August 11, 2025 and is **not provisioned**.
No replacement web-grounding integration is implemented.

**Not included:** customer/inventory agents, router `/chat` API, frontend chat UI,
search schema or ingestion scripts, Azure Container Registry, private endpoints,
managed identities, RBAC assignments, automatic failover, Front Door, red-team
scanner, evaluation CLI, authentication, or CI/CD.

An ARM success message only confirms resource provisioning. It does not certify
application functionality, security, availability, or production readiness.

## Prerequisites and costs

- Bash (Git Bash/WSL on Windows) and
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- A subscription with permissions to create all listed resources.
- Check availability of **each model/version/SKU in each selected region** and
  quota for your subscription. The defaults are examples, not guarantees.
  Consult [model availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Choose a dedicated resource group you can delete after testing.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Default locations: primary `eastus2`, secondary `westus2`, embeddings `francecentral`;
the grader defaults to the primary region unless `graderLocation` is supplied.
`--no-multi-region` skips secondary and embeddings accounts; it does not skip the
grader account.

Search is charged while provisioned even when empty. Container minimum replicas,
storage redundancy, Cosmos DB requests/storage, model tokens, Document Intelligence
calls, and log ingestion/storage can add charges. There is **no fixed or validated
monthly total**. Estimate the exact SKUs in the
[Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) and
configure a budget before deploying.

### Deployment modes

These settings are resource sizes, **not production or SLA certifications**:

| Mode | Chat / mini / embedding / grader capacity units | Router replicas | Frontend replicas | Search tier | Storage |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replicas | Standard_GRS |

Model capacity units are model/SKU-specific; do not sum them as a universal TPM
guarantee. Premium does not enable zone-redundant Container Apps: that requires
additional networking design. Basic Search supports vector search, subject to
service limits; it is not inherently incompatible with vectors.

## 🚀 Quick Deployment

Review `azuredeploy.json` and `azuredeploy.parameters.json` first. The commands
below **create billable Azure resources**; they are not offline checks.

From the repository root:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

The script uses paths relative to its own directory, checks login/tools/arguments,
creates the resource group if absent, validates the deployment, provisions, and
shows non-secret outputs. No `jq`, data population, secret retrieval, or
post-deployment application setup is required or performed.

The script's default command-line values override corresponding values in the
parameters file. Edit the parameters file for settings such as secondary/tertiary
regions; use direct CLI deployment if you need arbitrary parameter overrides:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Provisioning can take 15–45 minutes or longer, and may fail on regional quotas or
model lifecycle restrictions. Do not retry blindly: read the failed operation first.

## Configuration options

| Parameter | Default in template | Meaning |
|---|---|---|
| `projectName` | Required (`retail` in parameters file) | 3–10 lowercase letters/digits |
| `location` | Resource group location | Primary region (`eastus2` in parameters file) |
| `secondaryLocation` | `westus2` | Mini model account region |
| `tertiaryLocation` | `francecentral` | Embeddings account region |
| `graderLocation` | Primary region | Independent grader account region |
| `environmentName` | `dev` | `dev`, `staging`, or `prod`; name only, not a hardening toggle |
| `deploymentMode` | `standard` | SKU/capacity selection |
| `enableMultiRegion` | `true` | Add secondary and embeddings accounts |
| `enableMonitoring` | `true` | Add Insights/workspace and environment log collection |
| `enableSecurity` | `true` | Create an empty RBAC-enabled vault only |

The misleading `openAiApiVersion` parameter was removed: a data-plane API version
does not control ARM resource versions or model versions. Model name/version pairs
are in `variables.modelDeployments`; check them together with deployment SKU.

## Verify provisioning

Use the deployment name from the script's output or `az deployment group list`.
For direct deployment above:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Expected: deployment state `Succeeded`. For a failure, inspect operation error
details. Resource-list output alone is not a reliable provisioning-state check.

Test the placeholder **root**, not a nonexistent agent endpoint:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Expected: HTTP 200 hello-world page, **not a chat response**. An HTTP error does
not count as successful verification.

To test actual primary model inference (billable):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Expected: JSON with `choices` and `usage`. The deployment name is
`gpt-4.1-chat`, not the underlying model name `gpt-4.1`.

## 🔧 Post-Deployment: Next Steps

This is a **development backlog**, not a finished exercise:

1. Implement authenticated customer/inventory agents and the router contract.
2. Implement the frontend and validate its configuration.
3. Create and populate a search index with a dimension/profile matching your
   embedding model, and handle document failures and updates.
4. Create a registry and configure image-pull identity/permissions.
5. Build and push real images. Change Container App ingress ports and probes to
   match those images before testing; port 80 here belongs to the placeholders.
6. Configure secrets or managed identities and scoped data-plane roles. Do not
   reference imaginary secret names: this template creates no application secrets.
7. Instrument applications, configure alerts, test failure/recovery, and evaluate
   results with representative ground truth and human review.

See the [architecture blueprint](../retail-scenario.md) for design boundaries.

## Troubleshooting and security boundaries

- **Model unavailable:** verify model/version/SKU, region, and subscription quota;
  the script does not preflight model catalogs.
- **Monitoring disabled:** the environment log destination is `none`, not an
  invalid empty Log Analytics configuration.
- **Placeholders only:** `/chat`, agent evaluation, and file ingestion do not exist.
- **Network/identity:** public endpoints and local authentication are enabled.
  Merely enabling Key Vault RBAC does not create role assignments or identities.
- **Production:** add authentication, scoped identities, secret management,
  private networking where appropriate, availability design, and operational tests.
  Multi-region model accounts alone do not provide failover.

## Cleanup

There is no AZD project here; `azd down` is not the cleanup command.
After checking that the group contains only your learning resources:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Expected after deletion finishes: `false`. Key Vault and Cognitive Services
soft-deleted resources may retain names; purging requires appropriate permissions.
Check Cost Management for delayed usage charges.

[Report an issue](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->