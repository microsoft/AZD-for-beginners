# Infrastruktúra pre maloobchodnú multi-agentovú platformu

**Pokročilý príklad architektúry — nie funkčná multi-agentová aplikácia.**

[Domov kurzu](../../README.md) ·
[Kapitola 5](../../docs/chapter-05-multi-agent/README.md) ·
[Návrh architektúry](../retail-scenario.md)

## Čo toto nasadzuje

Tento adresár obsahuje ARM šablónu, parametre a Bash skript na nasadenie.
Neexistuje žiadny **`azure.yaml` alebo zdroj maloobchodnej aplikácie**.

| Zdroj | Skutočný stav po nasadení |
|---|---|
| Primárny Azure OpenAI účet | `gpt-4.1-chat` nasadenie pomocou `gpt-4.1` verzie `2025-04-14`, `GlobalStandard` |
| Sekundárny OpenAI účet (voliteľné) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` verzia `2025-04-14`, `GlobalStandard` |
| Embeddings účet (voliteľné) | `text-embedding-ada-002` verzia `2`, `Standard`; bez indexovacej pipeline |
| Grader OpenAI účet | `gpt-4.1-grader`, model `gpt-4.1` verzia `2025-04-14`, `GlobalStandard`; bez evaluátora |
| AI Search | Prázdna služba; bez indexu alebo dokumentov |
| Úložisko | Prázdne kontajnery blobov `documents` a `uploads` |
| Cosmos DB | Serverless účet, databáza `chathistory`, kontajner `conversations` rozdelený podľa `/userId`, 30-dňový TTL položky |
| Container Apps | Router aj frontend bežia obaja na `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na porte 80 |
| Key Vault (voliteľné) | Prázdny trezor s povoleným RBAC; **žiadne tajomstvá ani priradenia rolí** |
| Application Insights / Log Analytics (voliteľné) | Zhromažďovanie logov zdrojov a prostredia; žiadna vlastná inštrumentácia aplikácie, upozornenia alebo dashboardy |
| Document Intelligence | Účet S0; bez spracovania dokumentov v pracovnom postupe |

Legacy Bing Search v7 bol vyradený 11. augusta 2025 a **nie je sprístupnený**.
Nie je implementovaná náhrada integrácie web-grounding.

**Nie je zahrnuté:** zákaznícke/inventárne agenti, router `/chat` API, frontend chat UI,
schéma vyhľadávania alebo skripty na ingestovanie, Azure Container Registry, súkromné koncové body,
spravované identity, priradenia RBAC, automatické prepnutie, Front Door, red-team
skener, hodnotiace CLI, autentifikácia alebo CI/CD.

Správa o úspechu ARM potvrdzuje len nasadenie zdroja. Nezaručuje
funkčnosť aplikácie, bezpečnosť, dostupnosť ani pripravenosť do produkcie.

## Predpoklady a náklady

- Bash (Git Bash/WSL na Windows) a
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Predplatné s oprávneniami na vytvorenie všetkých uvedených zdrojov.
- Skontrolujte dostupnosť **každého modelu/verzie/SKU v každom vybranom regióne** a
  kvót pre svoje predplatné. Predvolené hodnoty sú príklady, nie záruky.
  Konzultujte [dostupnosť modelov](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Vyberte vyhradenú skupinu zdrojov, ktorú môžete po testovaní vymazať.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Predvolené lokality: primárny `eastus2`, sekundárny `westus2`, embeddings `francecentral`;
grader používa primárny región, pokiaľ nie je uvedené `graderLocation`.
`--no-multi-region` preskočí sekundárne a embeddings účty; nepreskočí
grading účet.

Vyhľadávanie je spoplatnené počas nasadenia aj keď je prázdne. Minimálne repliky kontajnerov,
redundancia úložiska, požiadavky/uloženie Cosmos DB, tokeny modelov, volania Document Intelligence
a ingestovanie/uloženie logov môžu pridať poplatky. Neexistuje **žiadny fixný alebo overený
mesačný celkový poplatok**. Odhadnite presné SKU v
[Azure kalkulačke cien](https://azure.microsoft.com/pricing/calculator/) a
nastavte si rozpočet pred nasadením.

### Spôsoby nasadenia

Tieto nastavenia sú veľkosti zdrojov, **nie certifikáty produkcie alebo SLA**:

| Režim | Chat / mini / embedding / grader kapacitné jednotky | Repliky routera | Repliky frontendu | Vyhľadávacia vrstva | Úložisko |
|---|---|---|---|---|---|
| minimálny | 10 / 10 / 20 / 5 | 0–3 | 1–2 | základný, 1 replika | Standard_LRS |
| štandardný | 20 / 15 / 30 / 15 | 1–3 | 1–2 | štandardný, 1 replika | Standard_ZRS |
| prémiový | 40 / 30 / 60 / 30 | 1–10 | 1–5 | štandard2, 2 repliky | Standard_GRS |

Kapacitné jednotky modelu sú špecifické pre model/SKU; nesčítavajte ich ako univerzálnu TPM
záruku. Prémiový režim neaktivuje zónovo-redundantné Container Apps: na to je potrebný
dodatočný sieťový dizajn. Základné vyhľadávanie podporuje vektorové vyhľadávanie, s
obmedzeniami služby; nie je inherentne nekompatibilné s vektormi.

## 🚀 Rýchle nasadenie

Najskôr si prezrite `azuredeploy.json` a `azuredeploy.parameters.json`. Príkazy
nižšie **vytvárajú zúčtovateľné zdroje Azure**; nie sú to offline kontroly.

Z koreňa repozitára:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skript používa cesty vzhľadom na svoj vlastný adresár, kontroluje prihlásenie/nástroje/argumenty,
vytvára skupinu zdrojov, ak neexistuje, validuje nasadenie, zabezpečuje a
zobrazuje výstupy bez tajomstiev. Nie je potrebné ani sa nevykonáva žiadne `jq`,
napĺňanie dát, získavanie tajomstiev či post-nasadenie nastavenia aplikácie.

Predvolené hodnoty príkazového riadku skriptu prepisujú zodpovedajúce hodnoty v
parametrovom súbore. Upravte parametrový súbor pre nastavenia ako sekundárne/terciárne
regióny; použite priame nasadenie CLI, ak potrebujete ľubovoľné prepísanie parametrov:

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

Nasadenie môže trvať 15–45 minút alebo dlhšie a môže zlyhať kvôli regionálnym kvótam alebo
obmedzeniam životného cyklu modelu. Nepokračujte slepo s opakovaním: najskôr si prečítajte neúspešnú operáciu.

## Konfiguračné možnosti

| Parameter | Predvolené v šablóne | Význam |
|---|---|---|
| `projectName` | Povinné (`retail` v parametrovom súbore) | 3–10 malých písmen/cifier |
| `location` | Lokácia skupiny zdrojov | Primárny región (`eastus2` v parametrovom súbore) |
| `secondaryLocation` | `westus2` | Región účtu mini modelu |
| `tertiaryLocation` | `francecentral` | Región účtu embeddings |
| `graderLocation` | Primárny región | Región nezávislého účtu graderu |
| `environmentName` | `dev` | `dev`, `staging` alebo `prod`; iba názov, nie prepínač stvrdzovania |
| `deploymentMode` | `standard` | Výber SKU/kapacity |
| `enableMultiRegion` | `true` | Pridajte sekundárne a embeddings účty |
| `enableMonitoring` | `true` | Pridajte Insights/pracovný priestor a zber logov prostredia |
| `enableSecurity` | `true` | Vytvorte iba prázdnu RBAC-povolenú schránku |

Zavádzajúci parameter `openAiApiVersion` bol odstránený: API verzia dátovej roviny
neovplyvňuje verzie ARM zdrojov ani modelov. Pár názov/verzia modelu
sú v `variables.modelDeployments`; skontrolujte ich spolu s nasadeným SKU.

## Overenie poskytovania

Použite názov nasadenia zo skriptu alebo `az deployment group list`.
Pre priame nasadenie vyššie:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Očakávané: stav nasadenia `Succeeded`. V prípade zlyhania skontrolujte podrobnosti chyby operácie.
Výstup zo zoznamu zdrojov sám o sebe nie je spoľahlivou kontrolou stavu poskytovania.

Otestujte zástupný symbol **root**, nie neexistujúci agentový koncový bod:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Očakávané: HTTP 200 stránka hello-world, **nie odpoveď v chate**. HTTP chyba sa
nepočíta ako úspešné overenie.

Na testovanie skutočného primárneho inferenčného modelu (účtované):

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

Očakávané: JSON s `choices` a `usage`. Názov nasadenia je
`gpt-4.1-chat`, nie základný názov modelu `gpt-4.1`.

## 🔧 Po nasadení: Ďalšie kroky

Toto je **vývojový zoznam úloh**, nie dokončené cvičenie:

1. Implementujte overených zákazníckych/inventárnych agentov a routerovú zmluvu.
2. Implementujte front-end a overte jeho konfiguráciu.
3. Vytvorte a naplňte vyhľadávací index s rozmermi/profilom zodpovedajúcim vášmu
   embedding modelu a spracujte zlyhania dokumentov a aktualizácie.
4. Vytvorte register a nakonfigurujte identitu/opravenia pre sťahovanie obrázkov.
5. Vytvorte a nahrajte skutočné obrázky. Pred testovaním upravte porty a sondy Container App
   tak, aby zodpovedali týmto obrázkom; port 80 tu patrí zástupcom.
6. Nakonfigurujte tajomstvá alebo spravované identity a role pre scope data-plane. Neodkazujte
   na imaginárne názvy tajomstiev: táto šablóna nevytvára žiadne aplikačné tajomstvá.
7. Instrumentujte aplikácie, nakonfigurujte upozornenia, testujte zlyhania/obnovenia a
   vyhodnoťte výsledky s reprezentatívnou pravdou a ľudským hodnotením.

Pozrite si [architektonický plán](../retail-scenario.md) pre hranice dizajnu.

## Riešenie problémov a bezpečnostné hranice

- **Model nedostupný:** overte model/verziu/SKU, región a kvótu predplatného;
  skript nekontroluje katalógy modelov.
- **Monitorovanie vypnuté:** cieľ denníka prostredia je `none`, nie
  neplatná prázdna konfigurácia Log Analytics.
- **Iba zástupy:** `/chat`, hodnotenie agentov a ingestovanie súborov neexistujú.
- **Sieť/identita:** verejné koncové body a lokálne overovanie sú povolené.
  Iba povolenie Key Vault RBAC nevytvára priradenia rolí ani identity.
- **Produkcia:** pridajte overovanie, scope identity, správu tajomstiev,
  súkromné siete, kde je to vhodné, dizajn dostupnosti a prevádzkové testy.
  Viacregiónové účty modelov samotné neposkytujú failover.

## Čistenie

Tu nie je žiadny projekt AZD; `azd down` nie je príkaz na čistenie.
Po kontrole, že skupina obsahuje iba vaše učebné zdroje:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Očakávané po ukončení mazania: `false`. Soft-delete zdroje Key Vault a Cognitive Services môžu
ponechať názvy; zmazanie vyžaduje príslušné oprávnenia.
Skontrolujte Cost Management pre oneskorené poplatky za používanie.

[Nahlásiť problém](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->