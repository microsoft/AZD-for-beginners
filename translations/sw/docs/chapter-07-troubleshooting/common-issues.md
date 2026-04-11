# Masuala ya Kawaida na Suluhisho

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 7 - Utatuzi & Urekebishaji wa Hitilafu
- **⬅️ Sura Iliyotangulia**: [Sura 6: Ukaguzi wa Kabla ya Usambazaji](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Ifuatayo**: [Mwongozo wa Urekebishaji Hitilafu](debugging.md)
- **🚀 Sura Inayofuata**: [Sura 8: Mifumo ya Uzalishaji na Biashara](../chapter-08-production/production-ai-practices.md)

## Utangulizi

Mwongozo huu kamili wa utatuzi unashughulikia masuala yanayotokea mara kwa mara wakati wa kutumia Azure Developer CLI. Jifunze jinsi ya kugundua, kutatua, na kusuluhisha matatizo ya kawaida yanayohusiana na uthibitisho, usambazaji, utoaji wa miundombinu, na usanidi wa programu. Kila tatizo linajumuisha dalili za kina, sababu za msingi, na taratibu za hatua kwa hatua za utatuzi.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utajifunza:
- Kubobea mbinu za uchanganuzi kwa matatizo ya Azure Developer CLI
- Elewa matatizo ya kawaida ya uthibitisho na ruhusa na suluhisho zao
- Suluhisha kushindwa kwa usambazaji, makosa ya utoaji miundombinu, na matatizo ya usanidi
- Tekeleza mikakati ya ufuatiliaji wa kuzuia na urekebishaji
- Tumia mbinu za kimfumo za utatuzi kwa matatizo tata
- Sanidi upigaji kumbukumbu na ufuatiliaji sahihi ili kuzuia matatizo yajayo

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Gundua matatizo ya Azure Developer CLI kwa kutumia zana za uchunguzi zilizojengewa ndani
- Suluhisha matatizo yanayohusiana na uthibitisho, usajili, na ruhusa kwa kujitegemea
- Tatua kwa ufanisi kushindwa kwa usambazaji na makosa ya utoaji miundombinu
- Rekebisha hitilafu za usanidi wa programu na matatizo maalum ya mazingira
- Tekeleza ufuatiliaji na utoaji arifa ili kubaini matatizo yanayoweza kutokea kabla hayajatokea
- Tumia mbinu bora za upigaji kumbukumbu, urekebishaji hitilafu, na michakato ya utatuzi wa matatizo

## Uchunguzi wa Haraka

Kabla ya kuingia kwenye matatizo maalum, endesha amri hizi ili kukusanya taarifa za uchunguzi:

```bash
# Kagua toleo na hali ya afya ya azd
azd version
azd config show

# Thibitisha uthibitishaji wa Azure
az account show
az account list

# Kagua mazingira ya sasa
azd env list
azd env get-values

# Washa kurekodi kumbukumbu za debug
export AZD_DEBUG=true
azd <command> --debug
```

## Matatizo ya Uthibitisho

### Tatizo: "Failed to get access token"
**Dalili:**
- `azd up` inashindwa kwa makosa ya uthibitisho
- Amri zinarudisha "unauthorized" au "access denied"

**Suluhisho:**
```bash
# 1. Thibitisha tena kwa Azure CLI
az login
az account show

# 2. Ondoa nyaraka za uthibitisho zilizohifadhiwa
az account clear
az login

# 3. Tumia mtiririko wa nambari ya kifaa (kwa mifumo bila kiolesura)
az login --use-device-code

# 4. Weka usajili wazi
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Tatizo: "Insufficient privileges" wakati wa usambazaji
**Dalili:**
- Usambazaji unashindwa kwa makosa ya ruhusa
- Haiwezi kuunda rasilimali fulani za Azure

**Suluhisho:**
```bash
# 1. Angalia ugawaji wa majukumu yako ya Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Hakikisha una majukumu zinazohitajika
# - Contributor (kwa ajili ya kuunda rasilimali)
# - User Access Administrator (kwa ajili ya ugawaji wa majukumu)

# 3. Wasiliana na msimamizi wako wa Azure ili kupata ruhusa zinazofaa
```

### Tatizo: Matatizo ya uthibitisho ya multi-tenant
**Suluhisho:**
```bash
# 1. Ingia kwa mpangaji maalum
az login --tenant "your-tenant-id"

# 2. Weka mpangaji katika usanidi
azd config set auth.tenantId "your-tenant-id"

# 3. Futa kache ya mpangaji ikiwa unabadilisha wapangaji
az account clear
```

## 🏗️ Makosa ya Utoaji Miundombinu

### Tatizo: Migogoro ya majina ya rasilimali
**Dalili:**
- Makosa ya "The resource name already exists"
- Usambazaji unashindwa wakati wa uundaji wa rasilimali

**Suluhisho:**
```bash
# 1. Tumia majina ya rasilimali ya kipekee kwa kutumia vitambulisho
# Katika kiolezo chako cha Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Badilisha jina la mazingira
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ondoa rasilimali zilizopo
azd down --force --purge
```

### Tatizo: Eneo/Mkoa haupatikani
**Dalili:**
- "The location 'xyz' is not available for resource type"
- SKU fulani hazipatikani katika mkoa ulioteuliwa

**Suluhisho:**
```bash
# 1. Angalia maeneo yanayopatikana kwa aina za rasilimali
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Tumia mikoa inayopatikana kwa kawaida
azd config set defaults.location eastus2
# au
azd env set AZURE_LOCATION eastus2

# 3. Angalia upatikanaji wa huduma kwa mkoa
# Tembelea: https://azure.microsoft.com/global-infrastructure/services/
```

### Tatizo: Makosa ya kuzidi kikomo cha rasilimali
**Dalili:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Suluhisho:**
```bash
# 1. Angalia matumizi ya ukomo wa sasa
az vm list-usage --location eastus2 -o table

# 2. Omba ongezeko la ukomo kupitia portal ya Azure
# Nenda kwa: Usajili > Matumizi + ukomo

# 3. Tumia SKU ndogo kwa maendeleo
# Katika main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Ondoa rasilimali zisizotumika
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Tatizo: Makosa ya templati za Bicep
**Dalili:**
- Kushindwa kwa uthibitishaji wa templati
- Makosa ya sintaksia kwenye faili za Bicep

**Suluhisho:**
```bash
# 1. Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# 2. Tumia linter ya Bicep
az bicep lint --file infra/main.bicep

# 3. Kagua sintaksia ya faili ya vigezo
cat infra/main.parameters.json | jq '.'

# 4. Pitia mabadiliko ya utekelezaji
azd provision --preview
```

## 🚀 Kushindwa kwa Usambazaji

### Tatizo: Kushindwa kwa ujenzi
**Dalili:**
- Programu inashindwa kujengwa wakati wa usambazaji
- Makosa ya usakinishaji wa vifurushi

**Suluhisho:**
```bash
# 1. Angalia matokeo ya ujenzi kwa bendera ya debug
azd deploy --service web --debug

# 2. Tazama hali ya huduma iliyowekwa
azd show

# 3. Jaribu ujenzi kwa mashine yako
cd src/web
npm install
npm run build

# 3. Angalia ulinganifu wa matoleo ya Node.js/Python
node --version  # Inapaswa kuendana na mipangilio ya azure.yaml
python --version

# 4. Futa cache ya ujenzi
rm -rf node_modules package-lock.json
npm install

# 5. Angalia Dockerfile ikiwa unatumia makontena
docker build -t test-image .
docker run --rm test-image
```

### Tatizo: Kushindwa kwa usambazaji wa kontena
**Dalili:**
- Programu za kontena zinashindwa kuanza
- Makosa ya kuvuta picha

**Suluhisho:**
```bash
# 1. Jaribu kujenga image ya Docker kwa kutumia kompyuta yako
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Angalia logi za kontena kwa kutumia Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Fuatilia programu kupitia azd
azd monitor --logs

# 3. Thibitisha ufikiaji wa rejista ya kontena
az acr login --name myregistry

# 4. Angalia usanidi wa programu ya kontena
az containerapp show --name my-app --resource-group my-rg
```

### Tatizo: Kushindwa kwa muunganisho wa hifadhidata
**Dalili:**
- Programu haiwezi kuungana na hifadhidata
- Makosa ya muda wa kusubiri muunganisho

**Suluhisho:**
```bash
# 1. Angalia kanuni za firewall za hifadhidata
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Jaribu muunganisho kutoka kwa programu
# Ongeza kwa programu yako kwa muda mfupi:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Thibitisha muundo wa msururu wa muunganisho
azd env get-values | grep DATABASE

# 4. Angalia hali ya seva ya hifadhidata
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Masuala ya Usanidi

### Tatizo: Vigezo vya mazingira havifanyi kazi
**Dalili:**
- Programu haiwezi kusoma thamani za usanidi
- Vigezo vya mazingira vinaonekana kuwa tupu

**Suluhisho:**
```bash
# 1. Thibitisha vigezo vya mazingira vimewekwa
azd env get-values
azd env get DATABASE_URL

# 2. Angalia majina ya vigezo katika azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Anzisha upya programu
azd deploy --service web

# 4. Angalia usanidi wa huduma ya programu
az webapp config appsettings list --name myapp --resource-group myrg
```

### Tatizo: Matatizo ya vyeti vya SSL/TLS
**Dalili:**
- HTTPS haifanyi kazi
- Makosa ya uthibitishaji wa cheti

**Suluhisho:**
```bash
# 1. Angalia hali ya cheti cha SSL
az webapp config ssl list --resource-group myrg

# 2. Washa HTTPS pekee
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Ongeza kikoa maalum (ikiwa inahitajika)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Tatizo: Matatizo ya usanidi wa CORS
**Dalili:**
- Sehemu ya mbele hawezi kuita API
- Ombi la kutoka asili tofauti limezuiwa

**Suluhisho:**
```bash
# 1. Sanidi CORS kwa App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Sasisha API ili kushughulikia CORS
# Katika Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Angalia ikiwa inakimbia kwenye URL sahihi
azd show
```

## 🌍 Masuala ya Usimamizi wa Mazingira

### Tatizo: Matatizo ya kubadilisha mazingira
**Dalili:**
- Mazingira yasiyo sahihi yanatumiwa
- Usanidi haukubadiliki ipasavyo

**Suluhisho:**
```bash
# 1. Orodhesha mazingira yote
azd env list

# 2. Chagua mazingira waziwazi
azd env select production

# 3. Thibitisha mazingira ya sasa
azd env list

# 4. Unda mazingira mapya ikiwa yameharibika
azd env new production-new
azd env select production-new
```

### Tatizo: Uharibifu wa mazingira
**Dalili:**
- Mazingira yanaonyesha hali isiyo halali
- Rasilimali hazilingani na usanidi

**Suluhisho:**
```bash
# 1. Sasisha hali ya mazingira
azd env refresh

# 2. Weka upya usanidi wa mazingira
azd env new production-reset
# Nakili vigezo vya mazingira vinavyohitajika
azd env set DATABASE_URL "your-value"

# 3. Ingiza rasilimali zilizopo (ikiwa inawezekana)
# Sasisha kwa mkono .azure/production/config.json na vitambulisho vya rasilimali
```

## 🔍 Masuala ya Utendaji

### Tatizo: Nyakati ndefu za usambazaji
**Dalili:**
- Usambazaji unachukua muda mrefu sana
- Muda wa kusubiri unamalizika wakati wa usambazaji

**Suluhisho:**
```bash
# 1. Weka huduma maalum kwa mzunguko wa haraka
azd deploy --service web
azd deploy --service api

# 2. Tumia utoaji wa msimbo tu wakati miundombinu haijabadilika
azd deploy  # Haraka kuliko azd up

# 3. Boresha mchakato wa kujenga
# Katika package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Angalia maeneo ya rasilimali (tumia mkoa uleule)
azd config set defaults.location eastus2
```

### Tatizo: Matatizo ya utendaji wa programu
**Dalili:**
- Muda mrefu wa majibu
- Matumizi makubwa ya rasilimali

**Suluhisho:**
```bash
# 1. Ongeza rasilimali
# Sasisha SKU katika main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Washa ufuatiliaji wa Application Insights
azd monitor --overview

# 3. Angalia kumbukumbu za programu katika Azure
az webapp log tail --name myapp --resource-group myrg
# au kwa Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Tekeleza uhifadhi wa muda (caching)
# Ongeza cache ya Redis katika miundombinu yako
```

## 🛠️ Zana za Utatuzi na Amri

### Amri za Urekebishaji
```bash
# Uchambuzi wa makosa kwa kina
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Angalia toleo la azd
azd version

# Tazama usanidi wa sasa
azd config show

# Pima muunganisho
curl -v https://myapp.azurewebsites.net/health
```

### Uchambuzi wa Logi
```bash
# Logi za programu kupitia Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Fuatilia programu kwa kutumia azd
azd monitor --logs
azd monitor --live

# Logi za rasilimali za Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Logi za kontena (kwa Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Uchunguzi wa Rasilimali
```bash
# Orodhesha rasilimali zote
az resource list --resource-group myrg -o table

# Kagua hali ya rasilimali
az webapp show --name myapp --resource-group myrg --query state

# Uchunguzi wa mtandao
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Kupata Msaada Zaidi

### Wakati wa Kupeleka Juu
- Matatizo ya uthibitisho yanaendelea baada ya kujaribu suluhisho zote
- Matatizo ya miundombinu na huduma za Azure
- Masuala yanayohusiana na bili au usajili (subscription)
- Masuala ya usalama au matukio ya kivunjaji usalama

### Njia za Msaada
```bash
# 1. Angalia afya ya huduma za Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Unda tiketi ya msaada ya Azure
# Nenda kwa: https://portal.azure.com -> Msaada + usaidizi

# 3. Rasilimali za jamii
# - Stack Overflow: tagi azure-developer-cli
# - Masuala ya GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Maswali na Majibu: https://learn.microsoft.com/en-us/answers/
```

### Taarifa za Kukusanya
Kabla ya kuwasiliana na msaada, ukusanye:
- `azd version` output
- `azd config show` output
- `azd show` output (hali ya sasa ya usambazaji)
- Ujumbe za makosa (nakala kamili)
- Hatua za kurudisha tatizo
- Maelezo ya mazingira (`azd env get-values`)
- Mfululizo wa wakati tatizo lilipoanza

### Skripti ya Ukusanyaji wa Magogo
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Kuzuia Matatizo

### Orodha ya Ukaguzi Kabla ya Usambazaji
```bash
# Thibitisha uthibitishaji
az account show

# Kagua vikwazo na mipaka
az vm list-usage --location eastus2

# Thibitisha violezo
az bicep build --file infra/main.bicep

# Jaribu kwanza kwenye kompyuta ya ndani
npm run build
npm run test

# Tumia utekelezaji wa jaribio usioathiri
azd provision --preview
```

### Usanidi wa Ufuatiliaji
```bash
# Washa Application Insights
# Ongeza kwenye main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Sanidi arifa
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Matengenezo ya Mara kwa Mara
```bash
# Ukaguzi wa kiafya wa kila wiki
./scripts/health-check.sh

# Mapitio ya gharama ya kila mwezi
az consumption usage list --billing-period-name 202401

# Mapitio ya usalama ya kila robo ya mwaka
az security assessment list --resource-group myrg
```

## Rasilimali Zinazohusiana

- [Mwongozo wa Urekebishaji Hitilafu](debugging.md) - Mbinu za juu za urekebishaji hitilafu
- [Kutoa Rasilimali](../chapter-04-infrastructure/provisioning.md) - Utatuzi wa miundombinu
- [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md) - Mwongozo wa upangaji rasilimali
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Mapendekezo ya ngazi za huduma

---

**Kidokezo**: Weka mwongozo huu kwenye alama za kivinjari na urudie kuutembelea kila ukikutana na matatizo. Matatizo mengi yamewahi kutokea hapo awali na yana suluhisho zilizowekwa!

---

**Uvinjari**
- **Somo lililotangulia**: [Kutoa Rasilimali](../chapter-04-infrastructure/provisioning.md)
- **Somo lifuatalo**: [Mwongozo wa Urekebishaji Hitilafu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya mtafsiri mtaalamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->