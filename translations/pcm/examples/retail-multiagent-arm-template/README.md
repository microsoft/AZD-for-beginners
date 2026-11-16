# Retail Multi-Agent Infrastructure Scaffold

**Advanced architecture example — no be working multi-agent application.**

[Course home](../../README.md) ·
[Chapter 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architecture blueprint](../retail-scenario.md)

## Wetin dis one dey deploy

Dis directory get ARM template, parameters, plus Bash deployment script.
E no get **`azure.yaml` or retail application source**.

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

Legacy Bing Search v7 retire for August 11, 2025 and e **no provision**.
No replacement web-grounding integration dey.

**No include:** customer/inventory agents, router `/chat` API, frontend chat UI,
search schema or ingestion scripts, Azure Container Registry, private endpoints,
managed identities, RBAC assignments, automatic failover, Front Door, red-team
scanner, evaluation CLI, authentication, or CI/CD.

ARM success message just mean say resource don provision. E no mean say
application dey work well, secure, available, or ready for production.

## Wetin you need and costs

- Bash (Git Bash/WSL for Windows) plus
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Subscription wey get permission to create all resources wey dey list.
- Check availability of **every model/version/SKU for every region wey you pick** plus
  quota for your subscription. Dem defaults na examples, no be guarantee.
  Check [model availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Choose resource group wey you fit delete after you don test.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Default locations: primary `eastus2`, secondary `westus2`, embeddings `francecentral`;
the grader dey use primary region unless `graderLocation` dey.
`--no-multi-region` no go create secondary and embeddings accounts; e no go skip
grader account.

Search go dey charge as e dey provision even if e empty. Container minimum replicas,
storage redundancy, Cosmos DB requests/storage, model tokens, Document Intelligence
calls, and log ingestion/storage fit add more charges. No **fixed or sure
monthly total** dey. Make you estimate exact SKUs for
[Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) and
set budget before you deploy.

### Deployment modes

These settings na resource sizes, **no be production or SLA guarantees**:

| Mode | Chat / mini / embedding / grader capacity units | Router replicas | Frontend replicas | Search tier | Storage |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replicas | Standard_GRS |

Model capacity units depend on model/SKU; no add dem up as universal TPM
guarantee. Premium no enable zone-redundant Container Apps: dat one need
extra network design. Basic Search fit support vector search, check
service limits; e no dey clash with vectors as e be.

## 🚀 Quick Deployment

First make you review `azuredeploy.json` and `azuredeploy.parameters.json`. The commands
below go **create billable Azure resources**; no be offline checks dem be.

From repository root:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

The script dey use paths relative to im own directory, check login/tools/arguments,
create resource group if e no dey, validate deployment, provision, then
show non-secret output. No `jq`, data population, secret fetching, or
post-deployment application setup dey required or dey done.

Default command-line values for script dey override corresponding values for the
parameters file. Edit parameters file for settings like secondary/tertiary
regions; use direct CLI deployment if you want arbitrary parameter overrides:

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

Provisioning fit take 15–45 minutes or pass, fit fail for regional quotas or
model lifecycle rules. No dey retry anyhow; first check operation wey fail.

## Configuration options

| Parameter | Default for template | Meaning |
|---|---|---|
| `projectName` | Required (`retail` for parameters file) | 3–10 lowercase letters/digits |
| `location` | Resource group location | Primary region (`eastus2` for parameters file) |
| `secondaryLocation` | `westus2` | Mini model account region |
| `tertiaryLocation` | `francecentral` | Embeddings account region |
| `graderLocation` | Primary region | Independent grader account region |
| `environmentName` | `dev` | `dev`, `staging`, or `prod`; name only, no be hardening toggle |
| `deploymentMode` | `standard` | SKU/capacity selection |
| `enableMultiRegion` | `true` | Add secondary and embeddings accounts |
| `enableMonitoring` | `true` | Add Insights/workspace and environment log collection |
| `enableSecurity` | `true` | Create empty RBAC-enabled vault only |

Confusing `openAiApiVersion` parameter don comot: data-plane API version
no dey control ARM resource versions or model versions. Model name/version pairs
dey inside `variables.modelDeployments`; check dem along with deployment SKU.

## Check say e don provision

Use deployment name from script output or `az deployment group list`.
For direct deployment wey I mention above:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Expected: deployment state `Succeeded`. If e fail, check operation error
details. Just resource-list output no be reliable provisioning-state check.

Test the placeholder **root**, no be agent endpoint wey no dey:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Expected: HTTP 200 hello-world page, **no be chat response**. HTTP error no
mean say e verify finish well.

To test real primary model inference (wey go charge):

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

Wetin dem expect: JSON wit `choices` and `usage`. Di deployment name na
`gpt-4.1-chat`, no be di model name wey under am `gpt-4.1`.

## 🔧 After Deployment: Next Steps

Dis one na **development backlog**, no be finish work:

1. Make authenticated customer/inventory agents and di router contract.
2. Make di frontend and check if e configuration dey okay.
3. Make and put correct search index wit dimension/profile wey match your
   embedding model, and handle document wahala and updates.
4. Make registry and set image-pull identity/permissions.
5. Build and push real images. Change Container App ingress ports and probes make
   e match those images before you test; port 80 na for placeholders here.
6. Set secrets or managed identities and scoped data-plane roles. No make
   you refer imaginary secret names: dis template no create any application secrets.
7. Make instrumentations for apps, set alerts, test failure/recovery, and check
   results with correct ground truth and human review.

Check [architecture blueprint](../retail-scenario.md) for design boundaries.

## Troubleshooting and security boundaries

- **Model no dey:** make you check model/version/SKU, region, and subscription quota;
  di script no go preflight model catalogs.
- **Monitoring no dey:** environment log destination na `none`, no be
  empty Log Analytics configuration wey no pure.
- **Na placeholders only:** `/chat`, agent evaluation, and file ingestion no dey.
- **Network/identity:** public endpoints and local authentication dey enabled.
  Just enabling Key Vault RBAC no go create role assignments or identities.
- **Production:** add authentication, scoped identities, secret management,
  private networking where e fit, availability design, and operational tests.
  Multi-region model accounts alone no fit provide failover.

## Cleanup

No AZD project dey here; `azd down` no be the cleanup command.
After you don check say di group get only your learning resources:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Wetin you go see after deletion finish: `false`. Key Vault and Cognitive Services
soft-deleted resources fit still get names; if you want purge, you gots get correct permissions.
Make you check Cost Management for any delayed usage charges.

[Report an issue](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->