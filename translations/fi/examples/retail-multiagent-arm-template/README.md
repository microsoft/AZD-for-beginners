<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-21T15:36:31+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "fi"
}
-->
# Retail Multi-Agent Solution - Infrastruktuurimalli

**Luku 5: Tuotantokäyttöön tarkoitettu paketti**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../../README.md)
- **📖 Aiheeseen liittyvä luku**: [Luku 5: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Skenaariokäsikirja**: [Täydellinen arkkitehtuuri](../retail-scenario.md)
- **🎯 Nopea käyttöönotto**: [Yhden napsautuksen käyttöönotto](../../../../examples/retail-multiagent-arm-template)

> **⚠️ VAIN INFRASTRUKTUURIMALLI**  
> Tämä ARM-malli ottaa käyttöön **Azure-resursseja** monen agentin järjestelmälle.  
>  
> **Mitä otetaan käyttöön (15-25 minuuttia):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, upotukset kolmessa alueessa)
> - ✅ AI-hakupalvelu (tyhjä, valmis indeksin luomiseen)
> - ✅ Container Apps (paikkamerkkikuvat, valmiina koodillesi)
> - ✅ Tallennus, Cosmos DB, Key Vault, Application Insights
>  
> **Mitä EI sisälly (vaatii kehitystyötä):**
> - ❌ Agenttien toteutuskoodi (asiakasagentti, varastoagentti)
> - ❌ Reitityksen logiikka ja API-päätepisteet
> - ❌ Käyttöliittymän chat-näkymä
> - ❌ Hakemiston skeemat ja dataputket
> - ❌ **Arvioitu kehitystyön kesto: 80-120 tuntia**
>  
> **Käytä tätä mallia, jos:**
> - ✅ Haluat ottaa käyttöön Azure-infrastruktuurin monen agentin projektille
> - ✅ Suunnittelet agenttien toteutuksen kehittämistä erikseen
> - ✅ Tarvitset tuotantovalmiin infrastruktuurin perustan
>  
> **Älä käytä, jos:**
> - ❌ Odotat toimivaa monen agentin demoa heti
> - ❌ Etsit täydellisiä sovelluskoodiesimerkkejä

## Yleiskatsaus

Tämä hakemisto sisältää kattavan Azure Resource Manager (ARM) -mallin, jolla otetaan käyttöön **monen agentin asiakastukijärjestelmän infrastruktuurin perusta**. Malli ottaa käyttöön kaikki tarvittavat Azure-palvelut, jotka on asianmukaisesti konfiguroitu ja yhdistetty, valmiina sovelluskehitystä varten.

**Käyttöönoton jälkeen sinulla on:** Tuotantovalmiit Azure-infrastruktuurit  
**Järjestelmän täydentämiseksi tarvitset:** Agenttikoodin, käyttöliittymän ja datakonfiguraation (katso [Arkkitehtuuriohje](../retail-scenario.md))

## 🎯 Mitä otetaan käyttöön

### Ydininfra (tilanne käyttöönoton jälkeen)

✅ **Azure OpenAI -palvelut** (valmiina API-kutsuille)
  - Ensisijainen alue: GPT-4o-käyttöönotto (20K TPM kapasiteetti)
  - Toissijainen alue: GPT-4o-mini-käyttöönotto (10K TPM kapasiteetti)
  - Kolmas alue: Tekstiupotusmalli (30K TPM kapasiteetti)
  - Arviointialue: GPT-4o-arviointimalli (15K TPM kapasiteetti)
  - **Tila:** Täysin toimiva - voi tehdä API-kutsuja heti

✅ **Azure AI Search** (tyhjä - valmis konfiguroitavaksi)
  - Vektorihakukyvyt käytössä
  - Standard-taso, 1 osio, 1 replika
  - **Tila:** Palvelu käynnissä, mutta vaatii indeksin luomisen
  - **Toimenpiteet:** Luo hakemisto omalla skeemallasi

✅ **Azure Storage Account** (tyhjä - valmis latauksille)
  - Blob-kontit: `documents`, `uploads`
  - Suojattu konfiguraatio (vain HTTPS, ei julkista pääsyä)
  - **Tila:** Valmis vastaanottamaan tiedostoja
  - **Toimenpiteet:** Lataa tuotedatasi ja dokumenttisi

⚠️ **Container Apps -ympäristö** (paikkamerkkikuvat otettu käyttöön)
  - Agenttireititin (nginx-oletuskuva)
  - Käyttöliittymäsovellus (nginx-oletuskuva)
  - Automaattinen skaalaus konfiguroitu (0-10 instanssia)
  - **Tila:** Paikkamerkkikontit käynnissä
  - **Toimenpiteet:** Rakenna ja ota käyttöön agenttisovelluksesi

✅ **Azure Cosmos DB** (tyhjä - valmis datalle)
  - Tietokanta ja kontti esikonfiguroitu
  - Optimoitu matalan viiveen operaatioille
  - TTL käytössä automaattista siivousta varten
  - **Tila:** Valmis tallentamaan keskusteluhistoriaa

✅ **Azure Key Vault** (valinnainen - valmis salaisuuksille)
  - Pehmeä poisto käytössä
  - RBAC konfiguroitu hallinnoiduille identiteeteille
  - **Tila:** Valmis tallentamaan API-avaimia ja yhteysmerkkijonoja

✅ **Application Insights** (valinnainen - valvonta aktiivinen)
  - Yhdistetty Log Analytics -työtilaan
  - Mukautetut mittarit ja hälytykset konfiguroitu
  - **Tila:** Valmis vastaanottamaan telemetriatietoja sovelluksistasi

✅ **Document Intelligence** (valmiina API-kutsuille)
  - S0-taso tuotantokuormille
  - **Tila:** Valmis käsittelemään ladattuja dokumentteja

✅ **Bing Search API** (valmiina API-kutsuille)
  - S1-taso reaaliaikaisille hauille
  - **Tila:** Valmis verkkohakukyselyille

### Käyttöönottomoodit

| Moodi | OpenAI-kapasiteetti | Kontti-instanssit | Hakutaso | Tallennuksen redundanssi | Paras käyttöön |
|-------|---------------------|-------------------|----------|--------------------------|----------------|
| **Minimal** | 10K-20K TPM | 0-2 replikaa | Basic | LRS (paikallinen) | Kehitys/testaus, oppiminen, konseptin todistus |
| **Standard** | 30K-60K TPM | 2-5 replikaa | Standard | ZRS (alueellinen) | Tuotanto, kohtalainen liikenne (<10K käyttäjää) |
| **Premium** | 80K-150K TPM | 5-10 replikaa, alueellinen redundanssi | Premium | GRS (maantieteellinen) | Yrityskäyttö, korkea liikenne (>10K käyttäjää), 99,99 % SLA |

**Kustannusvaikutus:**
- **Minimal → Standard:** ~4x kustannusten kasvu ($100-370/kk → $420-1,450/kk)
- **Standard → Premium:** ~3x kustannusten kasvu ($420-1,450/kk → $1,150-3,500/kk)
- **Valitse perustuen:** Odotettuun kuormitukseen, SLA-vaatimuksiin, budjettirajoituksiin

**Kapasiteettisuunnittelu:**
- **TPM (Tokens Per Minute):** Yhteensä kaikille mallikäyttöönottoille
- **Kontti-instanssit:** Automaattisen skaalauksen alue (min-max replikaa)
- **Hakutaso:** Vaikuttaa kyselyjen suorituskykyyn ja indeksikokorajoihin

## 📋 Esivaatimukset

### Tarvittavat työkalut
1. **Azure CLI** (versio 2.50.0 tai uudempi)
   ```bash
   az --version  # Tarkista versio
   az login      # Todennus
   ```

2. **Aktiivinen Azure-tilaus** omistajan tai avustajan oikeuksilla
   ```bash
   az account show  # Vahvista tilaus
   ```

### Tarvittavat Azure-kvotat

Varmista ennen käyttöönottoa, että kohdealueillasi on riittävät kvotat:

```bash
# Tarkista Azure OpenAI:n saatavuus alueellasi
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Varmista OpenAI:n kiintiö (esimerkki gpt-4o:lle)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Tarkista Container Apps -kiintiö
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Vähimmäisvaaditut kvotat:**
- **Azure OpenAI:** 3-4 mallikäyttöönottoa alueilla
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Huom:** GPT-4o saattaa olla jonotuslistalla joillakin alueilla - tarkista [mallien saatavuus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Hallinnoitu ympäristö + 2-10 kontti-instanssia
- **AI Search:** Standard-taso (Basic ei riitä vektorihakuun)
- **Cosmos DB:** Standard provisioned throughput

**Jos kvotat eivät riitä:**
1. Siirry Azure-portaaliin → Kvotat → Pyydä lisäystä
2. Tai käytä Azure CLI:tä:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Harkitse vaihtoehtoisia alueita, joilla on saatavuutta

## 🚀 Nopea käyttöönotto

### Vaihtoehto 1: Azure CLI:n käyttö

```bash
# Kloonaa tai lataa mallitiedostot
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Tee käyttöönotto-skripti suoritettavaksi
chmod +x deploy.sh

# Ota käyttöön oletusasetuksilla
./deploy.sh -g myResourceGroup

# Ota käyttöön tuotantoon premium-ominaisuuksilla
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Vaihtoehto 2: Azure-portaalin käyttö

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Vaihtoehto 3: Suora Azure CLI:n käyttö

```bash
# Luo resurssiryhmä
az group create --name myResourceGroup --location eastus2

# Ota käyttöön mallipohja
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Käyttöönoton aikajana

### Mitä odottaa

| Vaihe | Kesto | Mitä tapahtuu |
|-------|-------|---------------||
| **Mallin validointi** | 30-60 sekuntia | Azure validoi ARM-mallin syntaksin ja parametrit |
| **Resurssiryhmän luonti** | 10-20 sekuntia | Luo resurssiryhmän (jos tarpeen) |
| **OpenAI:n käyttöönotto** | 5-8 minuuttia | Luo 3-4 OpenAI-tiliä ja ottaa käyttöön malleja |
| **Container Apps** | 3-5 minuuttia | Luo ympäristön ja ottaa käyttöön paikkamerkkikontteja |
| **Haku ja tallennus** | 2-4 minuuttia | Ottaa käyttöön AI-hakupalvelun ja tallennustilit |
| **Cosmos DB** | 2-3 minuuttia | Luo tietokannan ja konfiguroi kontit |
| **Valvonnan asennus** | 2-3 minuuttia | Ottaa käyttöön Application Insightsin ja Log Analyticsin |
| **RBAC-konfiguraatio** | 1-2 minuuttia | Konfiguroi hallinnoidut identiteetit ja käyttöoikeudet |
| **Kokonaiskäyttöönotto** | **15-25 minuuttia** | Täydellinen infrastruktuuri valmiina |

**Käyttöönoton jälkeen:**
- ✅ **Infrastruktuuri valmis:** Kaikki Azure-palvelut otettu käyttöön ja käynnissä
- ⏱️ **Sovelluskehitys:** 80-120 tuntia (sinun vastuullasi)
- ⏱️ **Indeksin konfigurointi:** 15-30 minuuttia (vaatii skeemasi)
- ⏱️ **Datan lataus:** Riippuu datasetin koosta
- ⏱️ **Testaus ja validointi:** 2-4 tuntia

---

## ✅ Varmista käyttöönoton onnistuminen

### Vaihe 1: Tarkista resurssien käyttöönotto (2 minuuttia)

```bash
# Varmista, että kaikki resurssit on otettu käyttöön onnistuneesti
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Odotettu tulos:** Tyhjä taulukko (kaikki resurssit näyttävät tilan "Onnistunut")

### Vaihe 2: Varmista Azure OpenAI -käyttöönotot (3 minuuttia)

```bash
# Luettele kaikki OpenAI-tilit
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Tarkista mallien käyttöönotot ensisijaiselle alueelle
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Odotettu tulos:** 
- 3-4 OpenAI-tiliä (ensisijainen, toissijainen, kolmas, arviointialueet)
- 1-2 mallikäyttöönottoa per tili (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Vaihe 3: Testaa infrastruktuurin päätepisteet (5 minuuttia)

```bash
# Hae Container App -URL-osoitteet
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testaa reitittimen päätepistettä (paikkamerkkikuva vastaa)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Odotettu tulos:** 
- Container Apps näyttää tilan "Running"
- Paikkamerkki nginx vastaa HTTP 200 tai 404 (ei sovelluskoodia vielä)

### Vaihe 4: Varmista Azure OpenAI API -pääsy (3 minuuttia)

```bash
# Hanki OpenAI-päätepiste ja avain
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testaa GPT-4o käyttöönottoa
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Odotettu tulos:** JSON-vastaus keskustelun täydentämisestä (vahvistaa, että OpenAI toimii)

### Mikä toimii ja mikä ei

**✅ Toimii käyttöönoton jälkeen:**
- Azure OpenAI -mallit otettu käyttöön ja hyväksyvät API-kutsuja
- AI-hakupalvelu käynnissä (tyhjä, ei indeksejä vielä)
- Container Apps käynnissä (paikkamerkki nginx-kuvat)
- Tallennustilit käytettävissä ja valmiina latauksille
- Cosmos DB valmis dataoperaatioihin
- Application Insights kerää infrastruktuuritelemetriaa
- Key Vault valmis salaisuuksien tallennukseen

**❌ Ei vielä toiminnassa (vaatii kehitystyötä):**
- Agenttien päätepisteet (ei sovelluskoodia otettu käyttöön)
- Keskustelutoiminnallisuus (vaatii käyttöliittymän + taustajärjestelmän toteutuksen)
- Hakukyselyt (ei hakemistoa luotu vielä)
- Dokumenttien käsittelyputki (ei dataa ladattu)
- Mukautettu telemetria (vaatii sovelluksen instrumentoinnin)

**Seuraavat vaiheet:** Katso [Käyttöönoton jälkeinen konfigurointi](../../../../examples/retail-multiagent-arm-template) kehittääksesi ja ottaaksesi käyttöön sovelluksesi

---

## ⚙️ Konfigurointivaihtoehdot

### Mallin parametrit

| Parametri | Tyyppi | Oletus | Kuvaus |
|-----------|--------|--------|--------|
| `projectName` | merkkijono | "retail" | Kaikkien resurssien nimen etuliite |
| `location` | merkkijono | Resurssiryhmän sijainti | Ensisijainen käyttöönottoalue |
| `secondaryLocation` | merkkijono | "westus2" | Toissijainen alue monialuekäyttöönotolle |
| `tertiaryLocation` | merkkijono | "francecentral" | Alue upotusmallille |
| `environmentName` | merkkijono | "dev" | Ympäristön määrittely (kehitys/testaus/tuotanto) |
| `deploymentMode` | merkkijono | "standard" | Käyttöönottokonfiguraatio (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Ota käyttöön monialuekäyttöönotto |
| `enableMonitoring` | bool | true | Ota käyttöön Application Insights ja lokitus |
| `enableSecurity` | bool | true | Ota käyttöön Key Vault ja parannettu tietoturva |

### Parametrien mukauttaminen

Muokkaa `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Arkkitehtuurin yleiskatsaus

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Käyttöönottoskriptin käyttö

`deploy.sh`-skripti tarjoaa interaktiivisen käyttöönoton kokemuksen:

```bash
# Näytä ohje
./deploy.sh --help

# Perustason käyttöönotto
./deploy.sh -g myResourceGroup

# Edistynyt käyttöönotto mukautetuilla asetuksilla
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Kehityskäyttöönotto ilman monialueellisuutta
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Skriptin ominaisuudet

- ✅ **Esivaatimusten validointi** (Azure CLI, kirjautumistila, mallin tiedostot)
- ✅ **Resurssiryhmän hallinta** (luo, jos ei ole olemassa)
- ✅ **Mallin validointi** ennen käyttöönottoa
- ✅ **Edistymisen seuranta** värikoodatulla ulostulolla
- ✅ **Käyttöönoton tulosten** näyttö
- ✅ **Käyttöönoton jälkeinen opastus**

## 📊 Käyttöönoton seuranta

### Tarkista käyttöönoton tila

```bash
# Listaa käyttöönotot
az deployment group list --resource-group myResourceGroup --output table

# Hae käyttöönoton tiedot
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Seuraa käyttöönoton etenemistä
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Käyttöönoton tulokset

Onnistuneen käyttöönoton jälkeen seuraavat tulokset ovat saatavilla:

- **Käyttöliittymän URL**: Julkinen päätepiste verkkokäyttöliittymälle
- **Reitittimen URL**: API-päätepiste agenttireitittimelle
- **OpenAI-päätepisteet**: Ensisijaiset ja toissijaiset OpenAI-palvelun päätepisteet
- **Hakupalvelu**: Azure AI Search -palvelun päätepiste
- **Tallennustili**: Dokumenttien tallennustilin nimi
- **Key Vault**: Key Vaultin nimi (jos käyt
> **📝 Tärkeää:** Infrastruktuuri on otettu käyttöön, mutta sinun täytyy kehittää ja ottaa käyttöön sovelluskoodi.

### Vaihe 1: Kehitä agenttisovellukset (Sinun vastuullasi)

ARM-malli luo **tyhjiä Container Appseja** paikkamerkki-nginx-kuvilla. Sinun täytyy:

**Vaadittava kehitys:**
1. **Agenttien toteutus** (30-40 tuntia)
   - Asiakaspalveluagentti GPT-4o-integraatiolla
   - Varastoagentti GPT-4o-mini-integraatiolla
   - Agenttien reitityksen logiikka

2. **Frontend-kehitys** (20-30 tuntia)
   - Keskustelukäyttöliittymä (React/Vue/Angular)
   - Tiedoston lataustoiminnallisuus
   - Vastausten esittäminen ja muotoilu

3. **Backend-palvelut** (12-16 tuntia)
   - FastAPI- tai Express-reititin
   - Autentikointivälimuisti
   - Telemetriaintegrointi

**Katso:** [Arkkitehtuuriohje](../retail-scenario.md) yksityiskohtaisiin toteutusmalleihin ja koodiesimerkkeihin

### Vaihe 2: Määritä AI-hakemisto (15-30 minuuttia)

Luo hakemisto, joka vastaa tietomalliasi:

```bash
# Hae hakupalvelun tiedot
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Luo indeksi skeemallasi (esimerkki)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Resurssit:**
- [AI-hakemiston skeeman suunnittelu](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vektorihakemiston konfigurointi](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Vaihe 3: Lataa tietosi (Aika vaihtelee)

Kun sinulla on tuotedata ja asiakirjat:

```bash
# Hanki tallennustilin tiedot
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Lataa asiakirjasi
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Esimerkki: Lataa yksittäinen tiedosto
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Vaihe 4: Rakenna ja ota sovelluksesi käyttöön (8-12 tuntia)

Kun olet kehittänyt agenttikoodisi:

```bash
# 1. Luo Azure Container Registry (tarvittaessa)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Rakenna ja työnnä agent router -kuva
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Rakenna ja työnnä frontend-kuva
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Päivitä Container Apps kuvillasi
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Määritä ympäristömuuttujat
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Vaihe 5: Testaa sovelluksesi (2-4 tuntia)

```bash
# Hanki sovelluksesi URL-osoite
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testaa agentin päätepiste (kun koodisi on otettu käyttöön)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Tarkista sovelluksen lokit
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Toteutusresurssit

**Arkkitehtuuri ja suunnittelu:**
- 📖 [Täydellinen arkkitehtuuriohje](../retail-scenario.md) - Yksityiskohtaiset toteutusmallit
- 📖 [Moniagenttisuunnittelumallit](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Koodiesimerkit:**
- 🔗 [Azure OpenAI Chat -esimerkki](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG-malli
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Agenttikehys (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Agenttien orkestrointi (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Moniagenttikeskustelut

**Arvioitu kokonaisaika:**
- Infrastruktuurin käyttöönotto: 15-25 minuuttia (✅ Valmis)
- Sovelluskehitys: 80-120 tuntia (🔨 Sinun työsi)
- Testaus ja optimointi: 15-25 tuntia (🔨 Sinun työsi)

## 🛠️ Vianmääritys

### Yleiset ongelmat

#### 1. Azure OpenAI -kiintiö ylittynyt

```bash
# Tarkista nykyinen kiintiön käyttö
az cognitiveservices usage list --location eastus2

# Pyydä kiintiön korotusta
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps -käyttöönotto epäonnistui

```bash
# Tarkista säilösovelluksen lokit
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Käynnistä säilösovellus uudelleen
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Hakupalvelun alustaminen

```bash
# Vahvista hakupalvelun tila
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testaa hakupalvelun yhteys
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Käyttöönoton validointi

```bash
# Varmista, että kaikki resurssit on luotu
az resource list \
  --resource-group myResourceGroup \
  --output table

# Tarkista resurssien tila
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Tietoturva

### Avainten hallinta
- Kaikki salaisuudet tallennetaan Azure Key Vaultiin (jos käytössä)
- Container Apps käyttää hallittua identiteettiä autentikointiin
- Tallennustileillä on turvalliset oletusasetukset (vain HTTPS, ei julkista blob-pääsyä)

### Verkkoturvallisuus
- Container Apps käyttää sisäistä verkkoa aina kun mahdollista
- Hakupalvelu on konfiguroitu yksityisillä päätepisteillä
- Cosmos DB on konfiguroitu vähimmäisoikeuksilla

### RBAC-konfiguraatio
```bash
# Määritä tarvittavat roolit hallitulle identiteetille
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Kustannusoptimointi

### Kustannusarviot (kuukausittain, USD)

| Tila | OpenAI | Container Apps | Hakupalvelu | Tallennus | Kokonaisarvio |
|------|--------|----------------|-------------|-----------|---------------|
| Minimi | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standardi | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Kustannusseuranta

```bash
# Aseta budjettihälytykset
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Päivitykset ja ylläpito

### Mallipäivitykset
- Versioi ARM-mallitiedostot
- Testaa muutokset ensin kehitysympäristössä
- Käytä inkrementaalista käyttöönottoa päivityksissä

### Resurssipäivitykset
```bash
# Päivitä uusilla parametreilla
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Varmuuskopiointi ja palautus
- Cosmos DB:n automaattinen varmuuskopiointi käytössä
- Key Vaultin pehmeä poisto käytössä
- Container App -versiot säilytetään palautusta varten

## 📞 Tuki

- **Malliongelmat:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure-tuki:** [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Yhteisö:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Valmis ottamaan moniagenttiratkaisusi käyttöön?**

Aloita komennolla: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi katsoa ensisijaiseksi lähteeksi. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->