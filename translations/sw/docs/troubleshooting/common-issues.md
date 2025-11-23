<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-23T09:52:01+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sw"
}
-->
# Masuala ya Kawaida na Suluhisho

**Ukurasa wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 7 - Utatuzi wa Matatizo & Ufuatiliaji
- **⬅️ Sura Iliyopita**: [Sura ya 6: Ukaguzi Kabla ya Utekelezaji](../pre-deployment/preflight-checks.md)
- **➡️ Inayofuata**: [Mwongozo wa Ufuatiliaji](debugging.md)
- **🚀 Sura Inayofuata**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../microsoft-foundry/production-ai-practices.md)

## Utangulizi

Mwongozo huu wa kina wa utatuzi wa matatizo unashughulikia masuala yanayokutana mara kwa mara wakati wa kutumia Azure Developer CLI. Jifunze jinsi ya kugundua, kutatua, na kushughulikia matatizo ya kawaida yanayohusiana na uthibitishaji, utekelezaji, utoaji wa miundombinu, na usanidi wa programu. Kila tatizo lina dalili za kina, sababu za msingi, na hatua za utatuzi.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kumiliki mbinu za uchunguzi wa matatizo ya Azure Developer CLI
- Kuelewa matatizo ya kawaida ya uthibitishaji na ruhusa pamoja na suluhisho zake
- Kutatua matatizo ya utekelezaji, makosa ya utoaji wa miundombinu, na matatizo ya usanidi
- Kutekeleza mikakati ya ufuatiliaji na ufuatiliaji wa matatizo kwa njia ya kujihami
- Kutumia mbinu za utatuzi wa matatizo kwa mifumo changamano
- Kuseti ufuatiliaji na ukaguzi sahihi ili kuzuia matatizo ya baadaye

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kugundua matatizo ya Azure Developer CLI kwa kutumia zana za uchunguzi zilizojengwa ndani
- Kutatua matatizo yanayohusiana na uthibitishaji, usajili, na ruhusa kwa kujitegemea
- Kushughulikia matatizo ya utekelezaji na makosa ya utoaji wa miundombinu kwa ufanisi
- Kutatua matatizo ya usanidi wa programu na matatizo maalum ya mazingira
- Kutekeleza ufuatiliaji na tahadhari ili kutambua matatizo yanayoweza kutokea mapema
- Kutumia mbinu bora za ukaguzi, ufuatiliaji, na utatuzi wa matatizo

## Uchunguzi wa Haraka

Kabla ya kuingia kwenye matatizo maalum, tumia amri hizi kukusanya taarifa za uchunguzi:

```bash
# Angalia toleo la azd na afya
azd version
azd config list

# Thibitisha uthibitisho wa Azure
az account show
az account list

# Angalia mazingira ya sasa
azd env show
azd env get-values

# Washa ufuatiliaji wa hitilafu
export AZD_DEBUG=true
azd <command> --debug
```

## Masuala ya Uthibitishaji

### Tatizo: "Imeshindwa kupata tokeni ya ufikiaji"
**Dalili:**
- `azd up` inashindwa na makosa ya uthibitishaji
- Amri zinarudisha "haijathibitishwa" au "ufikiaji umekataliwa"

**Suluhisho:**
```bash
# 1. Thibitisha tena na Azure CLI
az login
az account show

# 2. Futa hati za kuingia zilizohifadhiwa
az account clear
az login

# 3. Tumia mtiririko wa msimbo wa kifaa (kwa mifumo isiyo na kichwa)
az login --use-device-code

# 4. Weka usajili maalum
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Tatizo: "Ruhusa haitoshi" wakati wa utekelezaji
**Dalili:**
- Utekelezaji unashindwa na makosa ya ruhusa
- Huwezi kuunda rasilimali fulani za Azure

**Suluhisho:**
```bash
# 1. Angalia mgawo wako wa majukumu ya Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Hakikisha una majukumu yanayohitajika
# - Mchangiaji (kwa uundaji wa rasilimali)
# - Msimamizi wa Ufikiaji wa Mtumiaji (kwa mgawo wa majukumu)

# 3. Wasiliana na msimamizi wako wa Azure kwa ruhusa sahihi
```

### Tatizo: Matatizo ya uthibitishaji wa wateja wengi
**Suluhisho:**
```bash
# 1. Ingia na mpangaji maalum
az login --tenant "your-tenant-id"

# 2. Weka mpangaji katika usanidi
azd config set auth.tenantId "your-tenant-id"

# 3. Futa hifadhi ya mpangaji ikiwa unabadilisha wapangaji
az account clear
```

## 🏗️ Makosa ya Utoaji wa Miundombinu

### Tatizo: Migongano ya majina ya rasilimali
**Dalili:**
- Makosa ya "Jina la rasilimali tayari lipo"
- Utekelezaji unashindwa wakati wa uundaji wa rasilimali

**Suluhisho:**
```bash
# 1. Tumia majina ya rasilimali ya kipekee na tokeni
# Katika kiolezo chako cha Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Badilisha jina la mazingira
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Safisha rasilimali zilizopo
azd down --force --purge
```

### Tatizo: Eneo/Sehemu haipatikani
**Dalili:**
- "Eneo 'xyz' halipatikani kwa aina ya rasilimali"
- SKUs fulani hazipatikani katika eneo lililochaguliwa

**Suluhisho:**
```bash
# 1. Angalia maeneo yanayopatikana kwa aina za rasilimali
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Tumia maeneo yanayopatikana kwa kawaida
azd config set defaults.location eastus2
# au
azd env set AZURE_LOCATION eastus2

# 3. Angalia upatikanaji wa huduma kwa eneo
# Tembelea: https://azure.microsoft.com/global-infrastructure/services/
```

### Tatizo: Makosa ya kiwango cha juu
**Dalili:**
- "Kiwango cha juu kimezidi kwa aina ya rasilimali"
- "Idadi ya juu ya rasilimali imefikiwa"

**Suluhisho:**
```bash
# 1. Angalia matumizi ya sasa ya kiwango
az vm list-usage --location eastus2 -o table

# 2. Omba ongezeko la kiwango kupitia portal ya Azure
# Nenda kwa: Usajili > Matumizi + viwango

# 3. Tumia SKUs ndogo kwa maendeleo
# Katika main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Safisha rasilimali zisizotumika
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Tatizo: Makosa ya templeti ya Bicep
**Dalili:**
- Makosa ya uthibitishaji wa templeti
- Makosa ya sintaksia katika faili za Bicep

**Suluhisho:**
```bash
# 1. Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep

# 2. Tumia linter ya Bicep
az bicep lint --file infra/main.bicep

# 3. Angalia sintaksia ya faili ya parameta
cat infra/main.parameters.json | jq '.'

# 4. Onyesha mabadiliko ya upelekaji
azd provision --preview
```

## 🚀 Kushindwa kwa Utekelezaji

### Tatizo: Kushindwa kwa ujenzi
**Dalili:**
- Programu inashindwa kujengwa wakati wa utekelezaji
- Makosa ya usakinishaji wa kifurushi

**Suluhisho:**
```bash
# 1. Angalia kumbukumbu za ujenzi
azd logs --service web
azd deploy --service web --debug

# 2. Jaribu ujenzi kwa ndani
cd src/web
npm install
npm run build

# 3. Angalia utangamano wa toleo la Node.js/Python
node --version  # Inapaswa kulingana na mipangilio ya azure.yaml
python --version

# 4. Futa akiba ya ujenzi
rm -rf node_modules package-lock.json
npm install

# 5. Angalia Dockerfile ikiwa unatumia kontena
docker build -t test-image .
docker run --rm test-image
```

### Tatizo: Kushindwa kwa utekelezaji wa kontena
**Dalili:**
- Programu za kontena zinashindwa kuanza
- Makosa ya kuvuta picha

**Suluhisho:**
```bash
# 1. Jaribu kujenga Docker kwa ndani
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Angalia kumbukumbu za kontena
azd logs --service api --follow

# 3. Thibitisha ufikiaji wa rejista ya kontena
az acr login --name myregistry

# 4. Angalia usanidi wa programu ya kontena
az containerapp show --name my-app --resource-group my-rg
```

### Tatizo: Kushindwa kwa muunganisho wa hifadhidata
**Dalili:**
- Programu haiwezi kuunganishwa na hifadhidata
- Makosa ya muda wa muunganisho

**Suluhisho:**
```bash
# 1. Angalia sheria za firewall za hifadhidata
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Jaribu muunganisho kutoka kwa programu
# Ongeza kwenye programu yako kwa muda:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Thibitisha muundo wa kamba ya muunganisho
azd env get-values | grep DATABASE

# 4. Angalia hali ya seva ya hifadhidata
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Masuala ya Usanidi

### Tatizo: Mabadiliko ya mazingira hayafanyi kazi
**Dalili:**
- Programu haiwezi kusoma maadili ya usanidi
- Mabadiliko ya mazingira yanaonekana tupu

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

### Tatizo: Matatizo ya cheti cha SSL/TLS
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
- Sehemu ya mbele haiwezi kupiga API
- Ombi la asili tofauti limezuiwa

**Suluhisho:**
```bash
# 1. Sanidi CORS kwa Huduma ya App
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Sasisha API kushughulikia CORS
# Katika Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Hakikisha ikiwa inaendesha kwenye URL sahihi
azd show
```

## 🌍 Masuala ya Usimamizi wa Mazingira

### Tatizo: Matatizo ya kubadilisha mazingira
**Dalili:**
- Mazingira yasiyo sahihi yanatumika
- Usanidi haujabadilika ipasavyo

**Suluhisho:**
```bash
# 1. Orodhesha mazingira yote
azd env list

# 2. Chagua mazingira waziwazi
azd env select production

# 3. Thibitisha mazingira ya sasa
azd env show

# 4. Unda mazingira mapya ikiwa yameharibika
azd env new production-new
azd env select production-new
```

### Tatizo: Uharibifu wa mazingira
**Dalili:**
- Mazingira yanaonyesha hali isiyo sahihi
- Rasilimali hazilingani na usanidi

**Suluhisho:**
```bash
# 1. Sasisha hali ya mazingira
azd env refresh

# 2. Weka upya usanidi wa mazingira
azd env new production-reset
# Nakili vigezo vya mazingira vinavyohitajika
azd env set DATABASE_URL "your-value"

# 3. Leta rasilimali zilizopo (ikiwezekana)
# Sasisha kwa mkono .azure/production/config.json na vitambulisho vya rasilimali
```

## 🔍 Masuala ya Utendaji

### Tatizo: Muda mrefu wa utekelezaji
**Dalili:**
- Utekelezaji unachukua muda mrefu
- Muda wa utekelezaji unazidi

**Suluhisho:**
```bash
# 1. Washa usambazaji sambamba
azd config set deploy.parallelism 5

# 2. Tumia usambazaji wa hatua kwa hatua
azd deploy --incremental

# 3. Boresha mchakato wa ujenzi
# Katika package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Angalia maeneo ya rasilimali (tumia eneo moja)
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
azd monitor

# 3. Angalia kumbukumbu za programu kwa vizuizi
azd logs --service api --follow

# 4. Tekeleza uhifadhi wa kumbukumbu
# Ongeza uhifadhi wa Redis kwenye miundombinu yako
```

## 🛠️ Zana na Amri za Utatuzi

### Amri za Ufuatiliaji
```bash
# Ufuatiliaji wa kina wa hitilafu
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Angalia taarifa za mfumo
azd info

# Thibitisha usanidi
azd config validate

# Jaribu muunganisho
curl -v https://myapp.azurewebsites.net/health
```

### Uchambuzi wa Magogo
```bash
# Magogo ya programu
azd logs --service web --follow
azd logs --service api --since 1h

# Magogo ya rasilimali za Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Magogo ya kontena (kwa Programu za Kontena)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Uchunguzi wa Rasilimali
```bash
# Orodhesha rasilimali zote
az resource list --resource-group myrg -o table

# Angalia hali ya rasilimali
az webapp show --name myapp --resource-group myrg --query state

# Uchunguzi wa mtandao
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Kupata Msaada Zaidi

### Wakati wa Kupeleka Tatizo
- Masuala ya uthibitishaji yanaendelea baada ya kujaribu suluhisho zote
- Matatizo ya miundombinu na huduma za Azure
- Masuala yanayohusiana na malipo au usajili
- Wasiwasi wa usalama au matukio

### Njia za Msaada
```bash
# 1. Angalia Afya ya Huduma ya Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Unda tiketi ya msaada ya Azure
# Nenda kwa: https://portal.azure.com -> Msaada + msaada

# 3. Rasilimali za jamii
# - Stack Overflow: lebo ya azure-developer-cli
# - Masuala ya GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Taarifa za Kukusanya
Kabla ya kuwasiliana na msaada, kusanya:
- Matokeo ya `azd version`
- Matokeo ya `azd info`
- Ujumbe wa makosa (maandishi kamili)
- Hatua za kurudia tatizo
- Maelezo ya mazingira (`azd env show`)
- Muda wa kuanza kwa tatizo

### Script ya Kukusanya Magogo
```bash
#!/bin/bash
# kukusanya-maelezo-ya-kibug.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Kuzuia Matatizo

### Orodha ya Ukaguzi Kabla ya Utekelezaji
```bash
# 1. Thibitisha uthibitisho
az account show

# 2. Angalia viwango na mipaka
az vm list-usage --location eastus2

# 3. Thibitisha templeti
az bicep build --file infra/main.bicep

# 4. Jaribu kwanza kwa ndani
npm run build
npm run test

# 5. Tumia usambazaji wa majaribio
azd provision --preview
```

### Usanidi wa Ufuatiliaji
```bash
# Washa Uelewa wa Maombi
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

### Matengenezo ya Kawaida
```bash
# Ukaguzi wa afya wa kila wiki
./scripts/health-check.sh

# Mapitio ya gharama ya kila mwezi
az consumption usage list --billing-period-name 202401

# Mapitio ya usalama ya kila robo mwaka
az security assessment list --resource-group myrg
```

## Rasilimali Zinazohusiana

- [Mwongozo wa Ufuatiliaji](debugging.md) - Mbinu za hali ya juu za ufuatiliaji
- [Utoaji wa Rasilimali](../deployment/provisioning.md) - Utatuzi wa miundombinu
- [Mipango ya Uwezo](../pre-deployment/capacity-planning.md) - Mwongozo wa upangaji wa rasilimali
- [Uchaguzi wa SKU](../pre-deployment/sku-selection.md) - Mapendekezo ya viwango vya huduma

---

**Kidokezo**: Weka mwongozo huu kwenye alama za kurasa na rejea kila unapokutana na matatizo. Matatizo mengi yamewahi kutokea na yana suluhisho zilizowekwa tayari!

---

**Ukurasa**
- **Somo Lililopita**: [Utoaji wa Rasilimali](../deployment/provisioning.md)
- **Somo Linalofuata**: [Mwongozo wa Ufuatiliaji](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->