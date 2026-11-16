# Maloobchodní vícero agentní infrastruktura

**Pokročilý příklad architektury — nefunkční vícero agentní aplikace.**

[Domovská stránka kurzu](../../README.md) ·
[Kapitol 5](../../docs/chapter-05-multi-agent/README.md) ·
[Architektonický plán](../retail-scenario.md)

## Co toto nasazuje

Tento adresář obsahuje ARM šablonu, parametry a nasazovací skript v Bash.
Neexistuje zde **`azure.yaml` ani zdroj maloobchodní aplikace**.

| Zdroj | Skutečný stav po nasazení |
|---|---|
| Primární účet Azure OpenAI | `gpt-4.1-chat` nasazení pomocí `gpt-4.1` verze `2025-04-14`, `GlobalStandard` |
| Sekundární OpenAI účet (volitelný) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` verze `2025-04-14`, `GlobalStandard` |
| Účet pro vkládání (volitelný) | `text-embedding-ada-002` verze `2`, `Standard`; žádný indexovací pipeline |
| Grader OpenAI účet | `gpt-4.1-grader`, model `gpt-4.1` verze `2025-04-14`, `GlobalStandard`; žádný hodnotitel |
| AI Search | Prázdná služba; žádný index nebo dokumenty |
| Úložiště | Prázdné kontejnery blobů `documents` a `uploads` |
| Cosmos DB | Serverless účet, databáze `chathistory`, kontejner `conversations` rozdělený podle `/userId`, 30denní TTL položek |
| Container Apps | Router i frontend běží na `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na portu 80 |
| Key Vault (volitelný) | Prázdný trezor s povoleným RBAC; **žádná tajemství nebo role přiřazení** |
| Application Insights / Log Analytics (volitelný) | Zdroje a sběr protokolů prostředí; žádná vlastní instrumentace aplikace, upozornění nebo dashboardy |
| Document Intelligence | S0 účet; žádný procesní workflow dokumentů |

Legacy Bing Search v7 byl ukončen 11. srpna 2025 a **není poskytován**.
Žádná náhradní integrace webového podkladu není implementována.

**Nezařazeno:** zákaznické/inventární agenty, router `/chat` API, uživatelské rozhraní frontendu pro chat,
schéma vyhledávání nebo skripty pro ingestování, Azure Container Registry, privátní koncové body,
spravované identity, přiřazení RBAC, automatické přepnutí, Front Door, red-team
skener, hodnotící CLI, autentifikace nebo CI/CD.

Úspěšná zpráva ARM pouze potvrzuje vytvoření zdrojů. Neosvědčuje
funkčnost aplikace, bezpečnost, dostupnost ani připravenost do produkce.

## Předpoklady a náklady

- Bash (Git Bash/WSL na Windows) a
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Předplatné s oprávněními pro vytvoření všech uvedených zdrojů.
- Zkontrolujte dostupnost **každého modelu/verze/SKU v každém vybraném regionu** a
  kvótu vašeho předplatného. Výchozí hodnoty jsou příklady, nikoli záruky.
  Konzultujte [dostupnost modelu](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Vyberte dedikovanou skupinu zdrojů, kterou můžete po testování smazat.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Výchozí lokace: primární `eastus2`, sekundární `westus2`, embeddings `francecentral`;
graderský účet používá výchozí primární region, pokud není dodán `graderLocation`.
`--no-multi-region` přeskočí sekundární a embeddings účty; nepřeskočí
graderský účet.

Search je účtován, dokud je poskytován, i když je prázdný. Minimální repliky kontejneru,
redundance úložiště, požadavky/uložení Cosmos DB, tokeny modelů, volání Document Intelligence
a ingestování/uložení protokolů mohou zvyšovat náklady. Neexistuje **žádný pevný nebo ověřený
měsíční součet**. Odhadněte přesné SKU v
[Azure kalkulačce cen](https://azure.microsoft.com/pricing/calculator/) a
nastavte rozpočet před nasazením.

### Režimy nasazení

Tyto nastavení jsou velikosti zdrojů, **nikoli certifikace produkce nebo SLA**:

| Režim | Chat / mini / embedding / jednotky kapacity pro hodnotitele | Repliky směrovače | Repliky frontendu | Vyhledávací vrstva | Úložiště |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | základní, 1 replika | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standardní, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 repliky | Standard_GRS |

Jednotky kapacity modelu jsou specifické pro model/SKU; nesčítejte je jako univerzální TPM
záruku. Premium neumožňuje zónově redundantní Container Apps: to vyžaduje
další návrh sítě. Základní Vyhledávání podporuje vektorové vyhledávání, s výhradou
limitů služby; není inherentně nekompatibilní s vektory.

## 🚀 Rychlé nasazení

Nejprve si přečtěte `azuredeploy.json` a `azuredeploy.parameters.json`. Níže uvedené příkazy
**vytvářejí zpoplatněné zdroje Azure**; nejsou to offline kontroly.

Z kořenového adresáře repozitáře:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skript používá cesty relativní k vlastnímu adresáři, kontroluje přihlášení/nástroje/argumenty,
vytváří skupinu prostředků, pokud chybí, ověřuje nasazení, poskytuje a
zobrazuje ne-tajné výstupy. Nejsou vyžadovány ani prováděny žádné `jq`, naplnění dat,
získávání tajemství nebo nastavení aplikace po nasazení.

Výchozí hodnoty příkazového řádku skriptu přepisují odpovídající hodnoty v
souboru parametrů. Upravte soubor parametrů pro nastavení jako sekundární/terciární
regiony; použijte přímé nasazení CLI, pokud potřebujete libovolné přepsání parametrů:

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

Poskytování může trvat 15–45 minut nebo déle a může selhat kvůli regionálním kvótám nebo
omezením životního cyklu modelu. Neopakujte slepě: nejdříve si přečtěte neúspěšnou operaci.

## Možnosti konfigurace

| Parametr | Výchozí hodnota v šabloně | Význam |
|---|---|---|
| `projectName` | Povinný (`retail` v souboru parametrů) | 3–10 malých písmen/cifer |
| `location` | Umístění skupiny prostředků | Primární region (`eastus2` v souboru parametrů) |
| `secondaryLocation` | `westus2` | Region účtu modelu Mini |
| `tertiaryLocation` | `francecentral` | Region účtu embeddings |
| `graderLocation` | Primární region | Region účtu nezávislého hodnotitele |
| `environmentName` | `dev` | `dev`, `staging` nebo `prod`; pouze název, ne přepínač zpevnění |
| `deploymentMode` | `standard` | Výběr SKU / kapacity |
| `enableMultiRegion` | `true` | Přidejte sekundární a embeddings účty |
| `enableMonitoring` | `true` | Přidat Insights/pracovní prostor a sběr protokolů prostředí |
| `enableSecurity` | `true` | Vytvořit pouze prázdný trezor s povolením RBAC |

Zavádějící parametr `openAiApiVersion` byl odstraněn: verze API datové roviny
nekontroluje verze zdrojů ARM ani verze modelu. Pár názvu/verze modelu
jsou v `variables.modelDeployments`; zkontrolujte je spolu s nasazením SKU.

## Ověření poskytování

Použijte název nasazení z výstupu skriptu nebo `az deployment group list`.
Pro přímé nasazení výše:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Očekáváno: stav nasazení `Succeeded`. V případě selhání zkontrolujte chybu operace
podrobněji. Výstup seznamu zdrojů sám o sobě není spolehlivou kontrolou stavu poskytování.

Otestujte zástupný symbol **root**, nikoli neexistující koncový bod agenta:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Očekáváno: HTTP 200 stránka hello-world, **nikoli odpověď chatu**. HTTP chyba
se nepovažuje za úspěšné ověření.

Pro testování skutečného inferování primárního modelu (zpoplatněno):

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

Očekáváno: JSON s `choices` a `usage`. Název nasazení je
`gpt-4.1-chat`, nikoli základní název modelu `gpt-4.1`.

## 🔧 Po nasazení: další kroky

Toto je **vývojový backlog**, nikoli hotové cvičení:

1. Implementovat autentizované zákaznické/inventární agenty a smlouvu směrovače.
2. Implementovat frontend a ověřit jeho konfiguraci.
3. Vytvořit a naplnit vyhledávací index s dimenzí/profil, který odpovídá vašemu
   embedding modelu, a řešit selhání a aktualizace dokumentů.
4. Vytvořit registr a nastavit identitu/oprávnění pro tahání image.
5. Vytvořit a nahrát reálné image. Změňte porty vstupu a sondy Container App
   tak, aby odpovídaly těmto image před testováním; port 80 zde patří zástupným symbolům.
6. Nakonfigurovat tajemství nebo spravované identity a role v datové rovině s omezením rozsahu.
   Neodkazujte na imaginární názvy tajemství: tato šablona nevytváří žádná aplikační tajemství.
7. Instrumentovat aplikace, konfigurovat upozornění, testovat selhání/obnovu a
   vyhodnotit výsledky s reprezentativní pravdivostí a lidskou kontrolou.

Viz [architektonický plán](../retail-scenario.md) pro hranice návrhu.

## Řešení problémů a bezpečnostní hranice

- **Model nedostupný:** ověřte model/verzi/SKU, region a kvótu předplatného;
  skript nekontroluje katalogy modelů předem.
- **Monitorování zakázáno:** cílové místo protokolů prostředí je `none`, nikoli
  neplatná prázdná konfigurace Log Analytics.
- **Pouze zástupné znaky:** `/chat`, vyhodnocení agenta a ingestování souborů neexistují.
- **Síť/identita:** veřejné koncové body a místní ověřování jsou povoleny.
  Pouhé povolení RBAC v Key Vault nevytváří přiřazení rolí ani identity.
- **Produkce:** přidejte autentizaci, omezené identity, správu tajemství,
  soukromou síť tam, kde je to vhodné, návrh dostupnosti a operační testy.
  Účty s modelem více regionů samy o sobě nezajišťují přepnutí při selhání.

## Vyčištění

Tady není žádný projekt AZD; `azd down` není příkaz pro vyčištění.
Po ověření, že skupina obsahuje pouze vaše učební zdroje:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Očekávejte po dokončení odstranění: `false`. Zdroje Key Vault a Cognitive Services
, které jsou měkce smazané, mohou zachovat názvy; úplné odstranění vyžaduje odpovídající oprávnění.
Zkontrolujte Cost Management kvůli zpožděným poplatkům za využití.

[Nahlásit problém](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->