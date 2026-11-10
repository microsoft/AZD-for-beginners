# Retail Multi-Agent Infrastructure Scaffold

**Advanced architecture example — hindi isang gumaganang multi-agent application.**

[Course home](../../README.md) ·
[Chapter 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architecture blueprint](../retail-scenario.md)

## Ano ang dine-deploy nito

Ang directory na ito ay naglalaman ng ARM template, mga parameter, at isang Bash deployment script.
Walang **`azure.yaml` o retail application source**.

| Resource | Aktwal na estado pagkatapos ng provisioning |
|---|---|
| Primary Azure OpenAI account | `gpt-4.1-chat` deployment gamit ang `gpt-4.1` bersyon `2025-04-14`, `GlobalStandard` |
| Sekondaryang OpenAI account (opsyonal) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` bersyon `2025-04-14`, `GlobalStandard` |
| Embeddings account (opsyonal) | `text-embedding-ada-002` bersyon `2`, `Standard`; walang indexing pipeline |
| Grader OpenAI account | `gpt-4.1-grader`, model `gpt-4.1` bersyon `2025-04-14`, `GlobalStandard`; walang evaluator |
| AI Search | Walang laman na serbisyo; walang index o mga dokumento |
| Storage | Walang laman na `documents` at `uploads` blob containers |
| Cosmos DB | Serverless account, `chathistory` database, `conversations` container na naka-partition ayon sa `/userId`, 30-araw na TTL ng item |
| Container Apps | Router at frontend parehong tumatakbo sa `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` sa port 80 |
| Key Vault (opsyonal) | Walang laman na RBAC-enabled na vault; **walang mga sikreto o role assignments** |
| Application Insights / Log Analytics (opsyonal) | Mga resource at koleksyon ng log ng kapaligiran; walang custom app instrumentation, alerts, o dashboards |
| Document Intelligence | S0 account; walang workflow sa pagproseso ng dokumento |

Ang Legacy Bing Search v7 ay na-retire noong Agosto 11, 2025 at **hindi dine-deploy**.
Walang ipinatupad na kapalit na web-grounding integration.

**Hindi kasama:** mga customer/inventory agents, router `/chat` API, frontend chat UI,
search schema o ingestion scripts, Azure Container Registry, private endpoints,
managed identities, RBAC assignments, automatic failover, Front Door, red-team
scanner, evaluation CLI, authentication, o CI/CD.

Ang mensahe ng tagumpay ng ARM ay kumpirmasyon lamang ng provisioning ng resource. Hindi nito pinapatunayan
ang functionality ng application, seguridad, availability, o kahandaan para sa produksyon.

## Mga kinakailangan at gastos

- Bash (Git Bash/WSL sa Windows) at
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Isang subscription na may pahintulot na gumawa ng lahat ng nakalistang mga resource.
- Suriin ang availability ng **bawat model/bersyon/SKU sa bawat napiling rehiyon** at
  quota para sa iyong subscription. Ang mga default ay halimbawa lamang, hindi garantiya.
  Konsultahin ang [model availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Pumili ng dedikadong resource group na maaari mong tanggalin pagkatapos ng testing.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Default na mga lokasyon: primary `eastus2`, secondary `westus2`, embeddings `francecentral`;
ang grader ay nagdedepende sa primary na rehiyon maliban kung mayroong `graderLocation`.
Ang `--no-multi-region` ay nilalaktawan ang secondary at embeddings accounts; hindi nito nilalaktawan ang
grader account.

Sisingilin ang Search habang nakaprovide kahit walang laman. Ang minimum replicas ng container,
storage redundancy, Cosmos DB requests/storage, token ng model, tawag sa Document Intelligence,
at pag-ingest/pag-imbak ng log ay maaaring magdagdag ng singil. Walang **nakapirming o na-validate na
kabuuan kada buwan**. Tantiyahin ang eksaktong SKUs sa
[Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) at
magtakda ng budget bago mag-deploy.

### Mga paraan ng deployment

Ang mga setting na ito ay laki ng resource, **hindi sertipikasyon para sa produksyon o SLA**:

| Mode | Chat / mini / embedding / grader capacity units | Router replicas | Frontend replicas | Search tier | Storage |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replica | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replica | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replicas | Standard_GRS |

Ang mga model capacity units ay specific sa model/SKU; huwag pagsamahin bilang pangkalahatang TPM
garantiya. Hindi nagbibigay ang Premium ng zone-redundant Container Apps: nangangailangan iyon
ng karagdagang disenyo sa networking. Sinusuportahan ng Basic Search ang vector search, alinsunod sa
limitasyon ng serbisyo; hindi ito sadyang hindi compatible sa mga vector.

## 🚀 Mabilis na Deployment

Suriin muna ang `azuredeploy.json` at `azuredeploy.parameters.json`. Ang mga utos sa ibaba
**gumagawa ng may bayad na Azure resources**; hindi ito offline na pagsuri.

Mula sa root ng repository:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Ginagamit ng script ang mga path na relative sa sarili nitong directory, sinusuri ang login/tools/arguments,
gumagawa ng resource group kung wala pa, sinusuri ang deployment, nagbibigay, at
nagpapakita ng hindi secret outputs. Walang `jq`, pagpopulate ng data, retrieval ng sikreto, o
post-deployment na setup ng application ang kinakailangan o ginagawa.

Pinapalitan ng default na command-line values ng script ang katumbas na values sa
parameters file. I-edit ang parameters file para sa mga setting tulad ng secondary/tertiary
regions; gamitin ang direct CLI deployment kung kailangan ng arbitrary parameter overrides:

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

Ang provisioning ay maaaring tumagal ng 15–45 minuto o higit pa, at maaaring mabigo dahil sa regional quotas o
mga limitasyon sa lifecycle ng model. Huwag basta-basta mag-retry: basahin muna ang failed operation.

## Mga opsyon sa konfigurasyon

| Parameter | Default sa template | Kahulugan |
|---|---|---|
| `projectName` | Kinakailangan (`retail` sa parameters file) | 3–10 maliit na titik/mga digit |
| `location` | Lokasyon ng resource group | Primary rehiyon (`eastus2` sa parameters file) |
| `secondaryLocation` | `westus2` | Rehiyon ng mini model account |
| `tertiaryLocation` | `francecentral` | Rehiyon ng embeddings account |
| `graderLocation` | Primary rehiyon | Rehiyon ng independent grader account |
| `environmentName` | `dev` | `dev`, `staging`, o `prod`; pangalan lamang, hindi toggle para sa hardening |
| `deploymentMode` | `standard` | SKU/pagpili ng kapasidad |
| `enableMultiRegion` | `true` | Magdagdag ng secondary at embeddings accounts |
| `enableMonitoring` | `true` | Magdagdag ng Insights/workspace at koleksyon ng log ng kapaligiran |
| `enableSecurity` | `true` | Gumawa ng walang laman na RBAC-enabled vault lamang |

Ang nakaliligaw na `openAiApiVersion` parameter ay tinanggal: ang data-plane API version
ay hindi kumokontrol sa ARM resource versions o model versions. Ang mga pangalan/bersyon ng modelo
ay nasa `variables.modelDeployments`; suriin ito kasabay ng deployment SKU.

## Suriin ang provisioning

Gamitin ang deployment name mula sa output ng script o `az deployment group list`.
Para sa direct deployment sa itaas:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Inaasahan: estado ng deployment ay `Succeeded`. Para sa pagkabigo, suriin ang detalye ng error
ng operasyon. Ang paglista lang ng resources ay hindi maaasahang pagsuri sa estado ng provisioning.

Subukan ang placeholder na **root**, hindi isang hindi umiiral na agent endpoint:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Inaasahan: HTTP 200 hello-world page, **hindi chat response**. Ang error sa HTTP
ay hindi katumbas ng matagumpay na pagsuri.

Para subukan ang aktwal na primary model inference (may bayad):

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

Inaasahan: JSON na may `choices` at `usage`. Ang pangalan ng deployment ay
`gpt-4.1-chat`, hindi ang pangalan ng underlying model na `gpt-4.1`.

## 🔧 Post-Deployment: Mga Susunod na Hakbang

Ito ay isang **development backlog**, hindi isang tapos na ehersisyo:

1. Ipatupad ang authenticated na customer/inventory agents at ang router contract.
2. Ipatupad ang frontend at suriin ang konfigurasyon nito.
3. Gumawa at punan ang search index na may dimensyon/profile na tumutugma sa iyong
   embedding model, at pangasiwaan ang mga pagkabigo at update ng dokumento.
4. Gumawa ng registry at i-configure ang image-pull identity/permissions.
5. Bumuo at itulak ang totoong mga imahe. Baguhin ang Container App ingress ports at probes upang
   tumugma sa mga imahe bago subukan; ang port 80 dito ay para sa mga placeholder.
6. I-configure ang mga sikreto o managed identities at mga scoped na data-plane roles. Huwag
   mag-reference ng mga imahinaryo na pangalan ng sikreto: ang template na ito ay hindi gumagawa ng anumang sikreto ng application.
7. I-instrument ang mga application, i-configure ang mga alert, subukan ang pagkabigo/pag-recover, at suriin
   ang mga resulta gamit ang representative ground truth at pagsusuring pantao.

Tingnan ang [architecture blueprint](../retail-scenario.md) para sa mga hangganan ng disenyo.

## Pag-troubleshoot at mga hangganan ng seguridad

- **Hindi available ang modelo:** suriin ang model/bersyon/SKU, rehiyon, at quota ng subscription;
  hindi sinusuri ng script ang mga catalog ng modelo bago lumipad.
- **Hindi naka-enable ang monitoring:** ang destinasyon ng environment log ay `none`, hindi isang
  invalid na walang laman na Log Analytics configuration.
- **Mga placeholder lamang:** ang `/chat`, agent evaluation, at file ingestion ay wala.
- **Network/identity:** ang mga public endpoint at local authentication ay naka-enable.
  Ang pag-enable lamang ng Key Vault RBAC ay hindi lumilikha ng mga role assignments o identities.
- **Produksyon:** magdagdag ng authentication, scoped identities, pamamahala ng sikreto,
  pribadong networking kung kinakailangan, disenyo ng availability, at mga operational test.
  Ang multi-region model accounts lamang ay hindi nagbibigay ng failover.

## Paglilinis

Walang AZD project dito; ang `azd down` ay hindi command para sa paglilinis.
Pagkatapos tiyakin na ang grupo ay naglalaman lamang ng iyong mga learning resource:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Inaasahan pagkatapos ng pagtanggal: `false`. Ang Key Vault at Cognitive Services
na soft-deleted na mga resource ay maaaring magpanatili ng mga pangalan; kailangan ng tamang pahintulot para sa purging.
Suriin ang Cost Management para sa mga delayed usage charges.

[Mag-ulat ng isyu](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->