# Infrastrukturni okvir za maloprodajne večagentne sisteme

**Napreden primer arhitekture — ni delujoča večagentna aplikacija.**

[Domača stran tečaja](../../README.md) ·
[Poglavje 5](../../docs/chapter-05-multi-agent/README.md) ·
[Načrt arhitekture](../retail-scenario.md)

## Kaj to postavi v delo

Ta imenik vsebuje ARM predlogo, parametre in Bash skripto za uvajanje.
Ni **virne kode `azure.yaml` ali maloprodajne aplikacije**.

| Vir | Dejansko stanje po uvajanju |
|---|---|
| Glavni Azure OpenAI račun | `gpt-4.1-chat` namestitev z uporabo `gpt-4.1` različice `2025-04-14`, `GlobalStandard` |
| Sekundarni OpenAI račun (opcijsko) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` različice `2025-04-14`, `GlobalStandard` |
| Račun za vdelave (opcijsko) | `text-embedding-ada-002` različice `2`, `Standard`; brez indeksirnega procesa |
| Grader OpenAI račun | `gpt-4.1-grader`, model `gpt-4.1` različice `2025-04-14`, `GlobalStandard`; brez ocenjevalca |
| AI Iskanje | Prazna storitev; brez indeksa ali dokumentov |
| Shranjevanje | Prazni `documents` in `uploads` blob zabojniki |
| Cosmos DB | Brezstrežni račun, `chathistory` baza podatkov, `conversations` zabojnik partitiran po `/userId`, 30-dnevni TTL elementov |
| Container Apps | Router in frontend oba tečeta `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na vratih 80 |
| Key Vault (opcijsko) | Prazen zaklad z omogočenim RBAC; **brez skrivnosti ali dodelitev vlog** |
| Application Insights / Log Analytics (opcijsko) | Viri in zbiranje dnevnikov okolja; brez lastne aplikacijske instrumentacije, opozoril ali nadzornih plošč |
| Document Intelligence | S0 račun; brez procesa obdelave dokumentov |

Stari Bing Search v7 je bil upokojljen 11. avgusta 2025 in NI **zagotovljen**.
Nadomestna integracija spletne osnove ni implementirana.

**Ni vključeno:** agenti za stranke/inventar, API za usmerjevalnik `/chat`, frontend klepetalni UI,
sheme iskanja ali skripte za zajem, Azure Container Registry, zasebni končni točki,
upravljane identitete, dodelitve RBAC, samodejni preklop, Front Door, rdeča ekipa
skener, evalvacijski CLI, avtentikacija ali CI/CD.

Sporočilo o uspehu ARM samo potrjuje zagotovitev vira. Ne zagotavlja
funkcionalnosti aplikacije, varnosti, razpoložljivosti ali pripravljenosti za produkcijo.

## Predpogoji in stroški

- Bash (Git Bash/WSL na Windows) in
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Naročnina z dovoljenji za ustvarjanje vseh navedenih virov.
- Preverite razpoložljivost **vsakega modela/različice/SKU v vsaki izbrani regiji** in
  kvoto za vašo naročnino. Privzeti so primeri, ne garancije.
  Posvetujte se z [razpoložljivostjo modelov](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Izberite namensko skupino virov, ki jo lahko po testiranju izbrišete.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Privzete lokacije: primarna `eastus2`, sekundarna `westus2`, vdelave `francecentral`;
grader privzeto ciljna na primarno regijo, razen če je zagotovljen `graderLocation`.
`--no-multi-region` preskoči sekundarne in račune za vdelave; ne preskoči
računa graderja.

Za iskanje se zaračunava tudi, kadar je zagotovljeno, četudi prazno. Minimalne replike zabojnikov,
redundanca shranjevanja, zahteve/shranjevanje Cosmos DB, modelni tokeni, klici Document Intelligence
in zajem/shranjevanje dnevnikov lahko povečajo stroške. Ni **fiksnega ali preverjenega
mesečnega skupnega zneska**. Natančno ocenite SKU-je v
[kalkulatorju cen Azure](https://azure.microsoft.com/pricing/calculator/) in
nastavite proračun pred uvajanjem.

### Načini uvajanja

Te nastavitve so velikosti virov, **ne certifikati za produkcijo ali SLA**:

| Način | Enote zmogljivosti za klepet / mini / vdelave / grader | Replike usmerjevalnika | Replike frontenda | Stopnja iskanja | Shranjevanje |
|---|---|---|---|---|---|
| minimalno | 10 / 10 / 20 / 5 | 0–3 | 1–2 | osnovno, 1 replika | Standard_LRS |
| standardno | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standardno, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 repliki | Standard_GRS |

Enote zmogljivosti modela so specifične za model/SKU; ne seštevajte jih kot univerzalno TPM
jamstvo. Premium ne omogoča conovno redundantnih Container Apps: to zahteva
dodatno zasnovo omrežja. Basic Search podpira vektorsko iskanje, obpogojeno z
omejitvami storitve; ni inherentno nezdružljivo z vektorji.

## 🚀 Hitro uvajanje

Najprej preglejte `azuredeploy.json` in `azuredeploy.parameters.json`. Ukazi
spodaj **ustvarijo zaračunljive vire Azure**; niso offline preverjanja.

Iz korena repozitorija:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skripta uporablja poti relativno do lastnega imenika, preverja prijavo/orodja/argumente,
ustvari skupino virov, če manjka, potrdi namestitev, zagotovi vire in
prikaže ne-tajne izhode. Ni potrebno in ni izvedeno npr. `jq`, polnjenje podatkov, pridobivanje skrivnosti ali
namestitev aplikacije po uvajanju.

Privzete vrednosti ukazne vrstice skripte preglasijo ustrezne vrednosti v
datoteki parametrov. Uredite datoteko parametrov za nastavitve kot so sekundarne/terciarne
regije; uporabite neposredno CLI uvajanje, če potrebujete poljubne nadzore parametrov:

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

Namestitev lahko traja 15–45 minut ali več in lahko ne uspe zaradi regionalnih kvot ali
omejitev življenjskega cikla modela. Ne ponavljajte slepo: najprej preberite neuspešno operacijo.

## Možnosti konfiguracije

| Parameter | Privzeto v predlogi | Pomen |
|---|---|---|
| `projectName` | Obvezno (`retail` v datoteki parametrov) | 3–10 malih črk/številk |
| `location` | Lokacija skupine virov | Primarna regija (`eastus2` v datoteki parametrov) |
| `secondaryLocation` | `westus2` | Regija računa mini modela |
| `tertiaryLocation` | `francecentral` | Regija računa za vdelave |
| `graderLocation` | Primarna regija | Regija neodvisnega računa graderja |
| `environmentName` | `dev` | `dev`, `staging` ali `prod`; samo ime, ne stikalo za omilitev |
| `deploymentMode` | `standard` | Izbira SKU/zmogljivosti |
| `enableMultiRegion` | `true` | Dodaj sekundarni in račune za vdelave |
| `enableMonitoring` | `true` | Dodaj Insights/ delovni prostor in zbiranje dnevnikov okolja |
| `enableSecurity` | `true` | Ustvari samo prazen zaklad z omogočenim RBAC |

Zavajajoči parameter `openAiApiVersion` je bil odstranjen: različica API podatkovne ravni
ne nadzoruje različic ARM virov ali modelov. Pari imena/različice modelov
so v `variables.modelDeployments`; preverite jih skupaj z SKU za uvajanje.

## Preverite namestitev

Uporabite ime uvajanja iz izhoda skripte ali `az deployment group list`.
Za neposredno uvajanje zgoraj:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Pričakovano stanje uvajanja `Succeeded`. V primeru napake preglejte podrobnosti napake operacije.
Izhod seznama virov sam po sebi ni zanesljiva kontrola stanja namestitve.

Preizkusite nadomestni znak **root**, ne neobstoječ konec agenta:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Pričakovana stran HTTP 200 hello-world, **ne odziv klepeta**. HTTP napaka
ne šteje kot uspešna verifikacija.

Za preizkus dejanskega primarnega modela (zaračunljivo):

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

Pričakovano: JSON z `choices` in `usage`. Ime uvajanja je
`gpt-4.1-chat`, ne osnovno ime modela `gpt-4.1`.

## 🔧 Po uvajanju: Naslednji koraki

To je **razvojni seznam nalog**, ne dokončana vaja:

1. Implementirajte overjene agente za stranke/inventar in pogodbo usmerjevalnika.
2. Implementirajte frontend in potrdite njegovo konfiguracijo.
3. Ustvarite in zapolnite iskalni indeks z dimenzijo/profilom, ki ustreza vašemu
   vdelanemu modelu, ter obdelajte napake in posodobitve dokumentov.
4. Ustvarite register in konfigurirajte identiteto/dovoljenja za poteg slike.
5. Zgradite in potisnite resnične slike. Pred testiranjem spremenite vhodne porte in preiskave Container App, da
   bodo ustrezale tem slikam; port 80 tukaj pripada nadomestnim mestom.
6. Konfigurirajte skrivnosti ali upravljane identitete ter vloge s povezanimi območji podatkovne ravni. Ne
   navajajte izmišljenih imen skrivnosti: ta predloga ne ustvarja aplikacijskih skrivnosti.
7. Instrumentirajte aplikacije, konfigurirajte opozorila, preizkusite napake/obnovitve in ocenite
   rezultate z reprezentativno dejansko resnico in človeškim pregledom.

Oglejte si [osnutek arhitekture](../retail-scenario.md) za meje oblikovanja.

## Odpravljanje težav in varnostne meje

- **Model ni na voljo:** preverite model/različico/SKU, regijo in kvoto naročnine;
  skripta ne preverja katalogov modelov vnaprej.
- **Nadzor je onemogočen:** cilj dnevnika okolja je `none`, ne
  neveljavna prazna konfiguracija Log Analytics.
- **Samo nadomestna mesta:** `/chat`, ocenjevanje agentov in vnosi datotek ne obstajajo.
- **Omrežje/identiteta:** javni končni točki in lokalna avtentikacija sta omogočeni.
  Samo omogočanje RBAC za Key Vault ne ustvari dodelitev vlog ali identitet.
- **Produkcija:** dodajte avtentikacijo, določene identitete, upravljanje skrivnosti,
  zasebno omrežje, kjer je primerno, zasnovo razpoložljivosti in operativne preizkuse.
  Računi modelov na več regijah sami ne zagotavljajo nadomestne rešitve.

## Čiščenje

Tukaj ni projekta AZD; `azd down` ni ukaz za čiščenje.
Po preverjanju, da skupina vsebuje samo vaše učne vire:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Pričakovano po končani izbrisu: `false`. Soft-izbrisani viri Key Vault in Cognitive Services
lahko ohranijo imena; izbris zahteva ustrezna dovoljenja.
Preverite upravljanje stroškov za morebitne zamujene stroške uporabe.

[Prijavite težavo](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->