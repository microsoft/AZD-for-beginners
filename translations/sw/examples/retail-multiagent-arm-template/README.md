# Suluhisho la Wakala Wengi wa Rejareja - Kiolezo cha Miundombinu

**Sura ya 5: Kifurushi cha Utekelezaji wa Uzalishaji**  
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)  
- **📖 Sura Inayohusiana**: [Sura ya 5: Suluhisho za AI za Wakala Wengi](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)  
- **📝 Mwongozo wa Hali**: [Muundo Kamili](../retail-scenario.md)  
- **🎯 Utekelezaji wa Haraka**: [Utekelezaji wa Bonyeza Moja](../../../../examples/retail-multiagent-arm-template)  

> **⚠️ KIOLEZO CHA MIUNDOMBINU PEKEE**  
> Kiolezo hiki cha ARM kinapeleka **rasilimali za Azure** kwa mfumo wa wakala wengi.  
>  
> **Kinachopelekwa (dakika 15-25):**  
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings katika maeneo 3)  
> - ✅ Huduma ya Utafutaji wa AI (tupu, tayari kwa uundaji wa faharasa)  
> - ✅ Programu za Kontena (picha za nafasi, tayari kwa msimbo wako)  
> - ✅ Hifadhi, Cosmos DB, Key Vault, Application Insights  
>  
> **Kinachokosekana (kinahitaji maendeleo):**  
> - ❌ Msimbo wa utekelezaji wa wakala (Wakala wa Wateja, Wakala wa Hifadhi)  
> - ❌ Mantiki ya usambazaji na viingilio vya API  
> - ❌ UI ya mazungumzo ya mbele  
> - ❌ Miundo ya faharasa za utafutaji na njia za data  
> - ❌ **Makadirio ya juhudi za maendeleo: Saa 80-120**  
>  
> **Tumia kiolezo hiki ikiwa:**  
> - ✅ Unataka kuandaa miundombinu ya Azure kwa mradi wa wakala wengi  
> - ✅ Unapanga kuendeleza utekelezaji wa wakala kando  
> - ✅ Unahitaji msingi wa miundombinu tayari kwa uzalishaji  
>  
> **Usitumie ikiwa:**  
> - ❌ Unatarajia demo ya wakala wengi inayofanya kazi mara moja  
> - ❌ Unatafuta mifano kamili ya msimbo wa programu  

## Muhtasari

Folda hii ina kiolezo kamili cha Azure Resource Manager (ARM) kwa ajili ya kupeleka **msingi wa miundombinu** ya mfumo wa msaada wa wateja wa wakala wengi. Kiolezo hiki kinapeleka huduma zote muhimu za Azure, zikiwa zimeundwa na kuunganishwa ipasavyo, tayari kwa maendeleo ya programu yako.

**Baada ya utekelezaji, utakuwa na:** Miundombinu ya Azure tayari kwa uzalishaji  
**Kukamilisha mfumo, unahitaji:** Msimbo wa wakala, UI ya mbele, na usanidi wa data (angalia [Mwongozo wa Muundo](../retail-scenario.md))  

## 🎯 Kinachopelekwa

### Miundombinu ya Msingi (Hali Baada ya Utekelezaji)

✅ **Huduma za Azure OpenAI** (Tayari kwa miito ya API)  
  - Eneo kuu: Utekelezaji wa GPT-4o (uwezo wa 20K TPM)  
  - Eneo la pili: Utekelezaji wa GPT-4o-mini (uwezo wa 10K TPM)  
  - Eneo la tatu: Mfano wa embeddings ya maandishi (uwezo wa 30K TPM)  
  - Eneo la tathmini: Mfano wa GPT-4o grader (uwezo wa 15K TPM)  
  - **Hali:** Inafanya kazi kikamilifu - inaweza kufanya miito ya API mara moja  

✅ **Azure AI Search** (Tupu - tayari kwa usanidi)  
  - Uwezo wa utafutaji wa vekta umewezeshwa  
  - Kiwango cha kawaida na kizigeu 1, nakala 1  
  - **Hali:** Huduma inafanya kazi, lakini inahitaji uundaji wa faharasa  
  - **Hatua inayohitajika:** Tengeneza faharasa ya utafutaji na muundo wako  

✅ **Akaunti ya Hifadhi ya Azure** (Tupu - tayari kwa upakiaji)  
  - Kontena za blob: `documents`, `uploads`  
  - Usanidi salama (HTTPS tu, hakuna ufikiaji wa umma)  
  - **Hali:** Tayari kupokea faili  
  - **Hatua inayohitajika:** Pakia data ya bidhaa zako na nyaraka  

⚠️ **Mazingira ya Programu za Kontena** (Picha za nafasi zimepelekwa)  
  - Programu ya router ya wakala (picha ya chaguo-msingi ya nginx)  
  - Programu ya mbele (picha ya chaguo-msingi ya nginx)  
  - Usanidi wa kuongeza kiotomatiki (0-10 nakala)  
  - **Hali:** Kontena za nafasi zinafanya kazi  
  - **Hatua inayohitajika:** Jenga na peleka programu zako za wakala  

✅ **Azure Cosmos DB** (Tupu - tayari kwa data)  
  - Hifadhidata na kontena zimeundwa awali  
  - Imeboreshwa kwa shughuli za ucheleweshaji wa chini  
  - TTL imewezeshwa kwa usafishaji wa kiotomatiki  
  - **Hali:** Tayari kuhifadhi historia ya mazungumzo  

✅ **Azure Key Vault** (Hiari - tayari kwa siri)  
  - Kufutwa kwa upole kumewezeshwa  
  - RBAC imeundwa kwa vitambulisho vilivyosimamiwa  
  - **Hali:** Tayari kuhifadhi funguo za API na nyuzi za muunganisho  

✅ **Application Insights** (Hiari - ufuatiliaji unafanya kazi)  
  - Imeunganishwa na workspace ya Log Analytics  
  - Vipimo maalum na arifa zimeundwa  
  - **Hali:** Tayari kupokea telemetry kutoka kwa programu zako  

✅ **Hati za Akili** (Tayari kwa miito ya API)  
  - Kiwango cha S0 kwa mzigo wa kazi wa uzalishaji  
  - **Hali:** Tayari kushughulikia nyaraka zilizopakiwa  

✅ **Bing Search API** (Tayari kwa miito ya API)  
  - Kiwango cha S1 kwa utafutaji wa papo hapo  
  - **Hali:** Tayari kwa maswali ya utafutaji wa wavuti  

### Njia za Utekelezaji

| Njia | Uwezo wa OpenAI | Nakala za Kontena | Kiwango cha Utafutaji | Redundancy ya Hifadhi | Inafaa Kwa |
|------|-----------------|-------------------|-----------------------|-----------------------|-----------|
| **Ndogo** | 10K-20K TPM | Nakala 0-2 | Msingi | LRS (Mitaa) | Maendeleo/majaribio, kujifunza, dhana ya uthibitisho |
| **Kawaida** | 30K-60K TPM | Nakala 2-5 | Kawaida | ZRS (Eneo) | Uzalishaji, trafiki ya wastani (<10K watumiaji) |
| **Premium** | 80K-150K TPM | Nakala 5-10, redundancy ya eneo | Premium | GRS (Geo) | Biashara, trafiki kubwa (>10K watumiaji), SLA ya 99.99% |

**Athari ya Gharama:**  
- **Ndogo → Kawaida:** ~ongezeko la gharama mara 4 ($100-370/mwezi → $420-1,450/mwezi)  
- **Kawaida → Premium:** ~ongezeko la gharama mara 3 ($420-1,450/mwezi → $1,150-3,500/mwezi)  
- **Chagua kulingana na:** Mzigo unaotarajiwa, mahitaji ya SLA, vikwazo vya bajeti  

**Mipango ya Uwezo:**  
- **TPM (Tokens Per Minute):** Jumla katika utekelezaji wote wa modeli  
- **Nakala za Kontena:** Wigo wa kuongeza kiotomatiki (nakala za chini-juu)  
- **Kiwango cha Utafutaji:** Huathiri utendaji wa maswali na mipaka ya ukubwa wa faharasa  

## 📋 Mahitaji ya Awali

### Zana Zinazohitajika  
1. **Azure CLI** (toleo 2.50.0 au zaidi)  
   ```bash
   az --version  # Angalia toleo
   az login      # Thibitisha
   ```
  
2. **Usajili wa Azure ulio hai** na ufikiaji wa Mmiliki au Mchangiaji  
   ```bash
   az account show  # Thibitisha usajili
   ```
  

### Mahitaji ya Kiwango cha Azure  

Kabla ya utekelezaji, hakikisha viwango vya kutosha katika maeneo yako lengwa:  

```bash
# Angalia upatikanaji wa Azure OpenAI katika eneo lako
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Thibitisha kiwango cha OpenAI (mfano kwa gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Angalia kiwango cha Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```
  
**Viwango vya Kiwango cha Chini Vinavyohitajika:**  
- **Azure OpenAI:** Utekelezaji wa modeli 3-4 katika maeneo  
  - GPT-4o: 20K TPM (Tokens Per Minute)  
  - GPT-4o-mini: 10K TPM  
  - text-embedding-ada-002: 30K TPM  
  - **Kumbuka:** GPT-4o inaweza kuwa na orodha ya kusubiri katika baadhi ya maeneo - angalia [upatikanaji wa modeli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)  
- **Programu za Kontena:** Mazingira yanayosimamiwa + nakala 2-10 za kontena  
- **AI Search:** Kiwango cha kawaida (Msingi hautoshi kwa utafutaji wa vekta)  
- **Cosmos DB:** Uwezo wa kawaida uliotolewa  

**Ikiwa kiwango hakitoshi:**  
1. Nenda kwenye Azure Portal → Quotas → Omba ongezeko  
2. Au tumia Azure CLI:  
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
  
3. Fikiria maeneo mbadala yenye upatikanaji  

## 🚀 Utekelezaji wa Haraka

### Chaguo 1: Kutumia Azure CLI  

```bash
# Nakili au pakua faili za kiolezo
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Fanya hati ya usanidi iweze kutekelezwa
chmod +x deploy.sh

# Sanidi kwa mipangilio ya chaguo-msingi
./deploy.sh -g myResourceGroup

# Sanidi kwa uzalishaji na vipengele vya malipo
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```
  

### Chaguo 2: Kutumia Azure Portal  

[![Peleka kwa Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)  

### Chaguo 3: Kutumia Azure CLI moja kwa moja  

```bash
# Unda kikundi cha rasilimali
az group create --name myResourceGroup --location eastus2

# Peleka kiolezo
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```
  

## ⏱️ Muda wa Utekelezaji  

### Kile Unachotarajia  

| Awamu | Muda | Kinachotokea |  
|-------|------|--------------|  
| **Uthibitishaji wa Kiolezo** | Sekunde 30-60 | Azure inathibitisha sintaksia ya kiolezo cha ARM na vigezo |  
| **Usanidi wa Kikundi cha Rasilimali** | Sekunde 10-20 | Huunda kikundi cha rasilimali (ikiwa kinahitajika) |  
| **Utekelezaji wa OpenAI** | Dakika 5-8 | Huunda akaunti 3-4 za OpenAI na kupeleka modeli |  
| **Programu za Kontena** | Dakika 3-5 | Huunda mazingira na kupeleka kontena za nafasi |  
| **Utafutaji & Hifadhi** | Dakika 2-4 | Hupeleka huduma ya Utafutaji wa AI na akaunti za hifadhi |  
| **Cosmos DB** | Dakika 2-3 | Huunda hifadhidata na kuunda kontena |  
| **Usanidi wa Ufuatiliaji** | Dakika 2-3 | Huanzisha Application Insights na Log Analytics |  
| **Usanidi wa RBAC** | Dakika 1-2 | Huunda vitambulisho vilivyosimamiwa na ruhusa |  
| **Jumla ya Utekelezaji** | **Dakika 15-25** | Miundombinu yote iko tayari |  

**Baada ya Utekelezaji:**  
- ✅ **Miundombinu Iko Tayari:** Huduma zote za Azure zimepelekwa na zinafanya kazi  
- ⏱️ **Maendeleo ya Programu:** Saa 80-120 (jukumu lako)  
- ⏱️ **Usanidi wa Faharasa:** Dakika 15-30 (inahitaji muundo wako)  
- ⏱️ **Upakiaji wa Data:** Inategemea ukubwa wa seti ya data  
- ⏱️ **Upimaji & Uthibitishaji:** Saa 2-4  

---

## ✅ Thibitisha Mafanikio ya Utekelezaji  

### Hatua ya 1: Angalia Upelekaji wa Rasilimali (Dakika 2)  

```bash
# Thibitisha rasilimali zote zimepelekwa kwa mafanikio
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```
  
**Inayotarajiwa:** Jedwali tupu (rasilimali zote zinaonyesha hali ya "Imefanikiwa")  

### Hatua ya 2: Thibitisha Utekelezaji wa Azure OpenAI (Dakika 3)  

```bash
# Orodhesha akaunti zote za OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Angalia usambazaji wa mifano kwa eneo kuu
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```
  
**Inayotarajiwa:**  
- Akaunti 3-4 za OpenAI (maeneo ya msingi, ya pili, ya tatu, ya tathmini)  
- Utekelezaji wa modeli 1-2 kwa kila akaunti (gpt-4o, gpt-4o-mini, text-embedding-ada-002)  

### Hatua ya 3: Jaribu Viingilio vya Miundombinu (Dakika 5)  

```bash
# Pata URL za Programu ya Kontena
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Jaribu mwisho wa router (picha ya nafasi itajibu)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```
  
**Inayotarajiwa:**  
- Programu za Kontena zinaonyesha hali ya "Inafanya kazi"  
- Nginx ya nafasi inajibu na HTTP 200 au 404 (hakuna msimbo wa programu bado)  

### Hatua ya 4: Thibitisha Ufikiaji wa API ya Azure OpenAI (Dakika 3)  

```bash
# Pata mwisho wa OpenAI na ufunguo
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Jaribu usambazaji wa GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```
  
**Inayotarajiwa:** Jibu la JSON na kukamilika kwa mazungumzo (inathibitisha OpenAI inafanya kazi)  

### Kinachofanya Kazi dhidi ya Kisichofanya Kazi  

**✅ Kinachofanya Kazi Baada ya Utekelezaji:**  
- Modeli za Azure OpenAI zimepelekwa na zinakubali miito ya API  
- Huduma ya Utafutaji wa AI inafanya kazi (tupu, hakuna faharasa bado)  
- Programu za Kontena zinafanya kazi (picha za nafasi za nginx)  
- Akaunti za hifadhi zinaweza kufikiwa na ziko tayari kwa upakiaji  
- Cosmos DB iko tayari kwa shughuli za data  
- Application Insights inakusanya telemetry ya miundombinu  
- Key Vault iko tayari kwa hifadhi ya siri  

**❌ Kisichofanya Kazi Bado (Kinahitaji Maendeleo):**  
- Viingilio vya wakala (hakuna msimbo wa programu uliyopelekwa)  
- Utendaji wa mazungumzo (unahitaji utekelezaji wa mbele + nyuma)  
- Maswali ya utafutaji (hakuna faharasa ya utafutaji iliyoundwa bado)  
- Njia ya usindikaji wa nyaraka (hakuna data iliyopakiwa)  
- Telemetry maalum (inahitaji upachikaji wa programu)  

**Hatua Zifuatazo:** Angalia [Usanidi Baada ya Utekelezaji](../../../../examples/retail-multiagent-arm-template) ili kuendeleza na kupeleka programu yako  

---

## ⚙️ Chaguo za Usanidi  

### Vigezo vya Kiolezo  

| Kigezo | Aina | Chaguo-msingi | Maelezo |  
|--------|------|--------------|----------|  
| `projectName` | string | "retail" | Kiambishi awali kwa majina yote ya rasilimali |  
| `location` | string | Eneo la kikundi cha rasilimali | Eneo kuu la utekelezaji |  
| `secondaryLocation` | string | "westus2" | Eneo la pili kwa utekelezaji wa maeneo mengi |  
| `tertiaryLocation` | string | "francecentral" | Eneo la mfano wa embeddings |  
| `environmentName` | string | "dev" | Maelezo ya mazingira (dev/staging/prod) |  
| `deploymentMode` | string | "standard" | Usanidi wa utekelezaji (minimal/standard/premium) |  
| `enableMultiRegion` | bool | true | Wezesha utekelezaji wa maeneo mengi |  
| `enableMonitoring` | bool | true | Wezesha Application Insights na ufuatiliaji |  
| `enableSecurity` | bool | true | Wezesha Key Vault na usalama wa hali ya juu |  

### Kubinafsisha Vigezo  

Hariri `azuredeploy.parameters.json`:  

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
  

## 🏗️ Muhtasari wa Muundo  

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
  

## 📖 Matumizi ya Script ya Utekelezaji  

Script ya `deploy.sh` inatoa uzoefu wa utekelezaji wa maingiliano:  

```bash
# Onyesha msaada
./deploy.sh --help

# Uwekaji wa msingi
./deploy.sh -g myResourceGroup

# Uwekaji wa hali ya juu na mipangilio maalum
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Uwekaji wa maendeleo bila maeneo mengi
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```
  

### Vipengele vya Script  

- ✅ **Uthibitishaji wa mahitaji ya awali** (Azure CLI, hali ya kuingia, faili za kiolezo)  
- ✅ **Usimamizi wa kikundi cha rasilimali** (huunda ikiwa haipo)  
- ✅ **Uthibitishaji wa kiolezo** kabla ya utekelezaji  
- ✅ **Ufuatiliaji wa maendeleo** na matokeo ya rangi  
- ✅ **Onyesho la matokeo ya utekelezaji**  
- ✅ **Mwongozo wa baada ya utekelezaji**  

## 📊 Ufuatiliaji wa Utekelezaji  

### Angalia Hali ya Utekelezaji  

```bash
# Orodhesha utekelezaji
az deployment group list --resource-group myResourceGroup --output table

# Pata maelezo ya utekelezaji
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Tazama maendeleo ya utekelezaji
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```
  

### Matokeo ya Utekelezaji  

Baada ya
> **📝 Muhimu:** Miundombinu imewekwa, lakini unahitaji kuendeleza na kuweka msimbo wa programu.

### Awamu ya 1: Kuendeleza Programu za Wakala (Jukumu Lako)

Kiolezo cha ARM kinaunda **Container Apps tupu** zenye picha za mfano za nginx. Unapaswa:

**Maendeleo Yanayohitajika:**
1. **Utekelezaji wa Wakala** (Saa 30-40)
   - Wakala wa huduma kwa wateja na ujumuishaji wa GPT-4o
   - Wakala wa hesabu na ujumuishaji wa GPT-4o-mini
   - Mantiki ya usambazaji wa wakala

2. **Maendeleo ya Mbele (Frontend)** (Saa 20-30)
   - UI ya mazungumzo (React/Vue/Angular)
   - Utendaji wa kupakia faili
   - Uwasilishaji wa majibu na uundaji

3. **Huduma za Nyuma (Backend)** (Saa 12-16)
   - Router ya FastAPI au Express
   - Middleware ya uthibitishaji
   - Ujumuishaji wa telemetry

**Tazama:** [Mwongozo wa Miundombinu](../retail-scenario.md) kwa mifumo ya utekelezaji wa kina na mifano ya msimbo

### Awamu ya 2: Sanidi Kielezo cha Utafutaji wa AI (Dakika 15-30)

Unda kielezo cha utafutaji kinacholingana na muundo wa data yako:

```bash
# Pata maelezo ya huduma ya utafutaji
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Unda faharasa na mpangilio wako (mfano)
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

**Rasilimali:**
- [Muundo wa Kielezo cha Utafutaji wa AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Usanidi wa Utafutaji wa Vector](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Awamu ya 3: Pakia Data Yako (Muda hutofautiana)

Mara unapokuwa na data ya bidhaa na nyaraka:

```bash
# Pata maelezo ya akaunti ya hifadhi
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Pakia nyaraka zako
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Mfano: Pakia faili moja
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Awamu ya 4: Jenga na Weka Programu Zako (Saa 8-12)

Mara tu unapomaliza kuendeleza msimbo wa wakala:

```bash
# 1. Unda Azure Container Registry (ikiwa inahitajika)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Jenga na sukuma picha ya wakala router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Jenga na sukuma picha ya frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Sasisha Programu za Kontena na picha zako
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Sanidi vigezo vya mazingira
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Awamu ya 5: Jaribu Programu Yako (Saa 2-4)

```bash
# Pata URL ya programu yako
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Jaribu mwisho wa wakala (baada ya msimbo wako kupelekwa)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Angalia kumbukumbu za programu
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Rasilimali za Utekelezaji

**Miundombinu na Ubunifu:**
- 📖 [Mwongozo Kamili wa Miundombinu](../retail-scenario.md) - Mifumo ya utekelezaji wa kina
- 📖 [Mifumo ya Ubunifu wa Wakala Wengi](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Mifano ya Msimbo:**
- 🔗 [Mfano wa Mazungumzo ya Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Muundo wa RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Mfumo wa wakala (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Usimamizi wa wakala (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Mazungumzo ya wakala wengi

**Makadirio ya Jumla ya Juhudi:**
- Uwekaji wa miundombinu: Dakika 15-25 (✅ Imekamilika)
- Maendeleo ya programu: Saa 80-120 (🔨 Kazi Yako)
- Majaribio na uboreshaji: Saa 15-25 (🔨 Kazi Yako)

## 🛠️ Utatuzi wa Shida

### Masuala ya Kawaida

#### 1. Kiwango cha Azure OpenAI Kimezidi

```bash
# Angalia matumizi ya sasa ya mgao
az cognitiveservices usage list --location eastus2

# Omba ongezeko la mgao
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Uwekaji wa Container Apps Umeshindwa

```bash
# Angalia kumbukumbu za programu ya kontena
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Anzisha upya programu ya kontena
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Uanzishaji wa Huduma ya Utafutaji

```bash
# Thibitisha hali ya huduma ya utafutaji
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Jaribu muunganisho wa huduma ya utafutaji
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Uthibitishaji wa Uwekaji

```bash
# Thibitisha rasilimali zote zimeundwa
az resource list \
  --resource-group myResourceGroup \
  --output table

# Angalia afya ya rasilimali
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Masuala ya Usalama

### Usimamizi wa Funguo
- Siri zote zimehifadhiwa kwenye Azure Key Vault (ikiwa imewezeshwa)
- Container apps zinatumia managed identity kwa uthibitishaji
- Akaunti za hifadhi zina mipangilio salama (HTTPS pekee, hakuna ufikiaji wa blob wa umma)

### Usalama wa Mtandao
- Container apps zinatumia mtandao wa ndani inapowezekana
- Huduma ya utafutaji imesanidiwa na chaguo la private endpoints
- Cosmos DB imesanidiwa na ruhusa za chini zinazohitajika

### Usanidi wa RBAC
```bash
# Weka majukumu muhimu kwa utambulisho unaosimamiwa
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Uboreshaji wa Gharama

### Makadirio ya Gharama (Kwa Mwezi, USD)

| Hali | OpenAI | Container Apps | Search | Storage | Jumla ya Makadirio |
|------|--------|----------------|--------|---------|--------------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Ufuatiliaji wa Gharama

```bash
# Weka arifa za bajeti
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Sasisho na Matengenezo

### Sasisho za Kiolezo
- Dhibiti toleo la faili za kiolezo cha ARM
- Jaribu mabadiliko katika mazingira ya maendeleo kwanza
- Tumia hali ya uwekaji wa hatua kwa hatua kwa sasisho

### Sasisho za Rasilimali
```bash
# Sasisha na vigezo vipya
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Hifadhi Nakala na Urejeshaji
- Hifadhi nakala ya moja kwa moja ya Cosmos DB imewezeshwa
- Urejeshaji laini wa Key Vault umewezeshwa
- Marekebisho ya programu ya container yanahifadhiwa kwa urejeshaji

## 📞 Msaada

- **Masuala ya Kiolezo:** [Masuala ya GitHub](https://github.com/microsoft/azd-for-beginners/issues)
- **Msaada wa Azure:** [Portal ya Msaada wa Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Jumuiya:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Tayari kuweka suluhisho lako la wakala wengi?**

Anza na: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->