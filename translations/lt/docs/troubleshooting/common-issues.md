<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-24T09:27:57+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "lt"
}
-->
# Dažniausios problemos ir sprendimai

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis skyrius**: [6 skyrius: Priešskrydžio patikrinimai](../pre-deployment/preflight-checks.md)
- **➡️ Toliau**: [Derinimo vadovas](debugging.md)
- **🚀 Kitas skyrius**: [8 skyrius: Gamybos ir įmonių modeliai](../microsoft-foundry/production-ai-practices.md)

## Įvadas

Šis išsamus trikčių šalinimo vadovas apima dažniausiai pasitaikančias problemas naudojant Azure Developer CLI. Sužinokite, kaip diagnozuoti, šalinti ir spręsti problemas, susijusias su autentifikacija, diegimu, infrastruktūros kūrimu ir programų konfigūracija. Kiekviena problema pateikiama su išsamiais simptomais, pagrindinėmis priežastimis ir žingsnis po žingsnio sprendimo procedūromis.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite diagnostikos technikas Azure Developer CLI problemoms spręsti
- Suprasite dažniausias autentifikacijos ir leidimų problemas bei jų sprendimus
- Išspręsite diegimo klaidas, infrastruktūros kūrimo klaidas ir konfigūracijos problemas
- Įgyvendinsite proaktyvų stebėjimą ir derinimo strategijas
- Taikysite sistemingus trikčių šalinimo metodus sudėtingoms problemoms
- Konfigūruosite tinkamą žurnalų ir stebėjimo sistemą, kad išvengtumėte būsimų problemų

## Mokymosi rezultatai

Baigę šį vadovą, jūs galėsite:
- Diagnozuoti Azure Developer CLI problemas naudojant įmontuotus diagnostikos įrankius
- Savarankiškai spręsti autentifikacijos, prenumeratos ir leidimų problemas
- Efektyviai šalinti diegimo klaidas ir infrastruktūros kūrimo problemas
- Derinti programų konfigūracijos ir aplinkos specifines problemas
- Įgyvendinti stebėjimą ir įspėjimus, kad proaktyviai nustatytumėte galimas problemas
- Taikyti geriausias praktikas žurnalų, derinimo ir problemų sprendimo procesuose

## Greita diagnostika

Prieš gilindamiesi į konkrečias problemas, paleiskite šias komandas, kad surinktumėte diagnostinę informaciją:

```bash
# Patikrinkite azd versiją ir būklę
azd version
azd config list

# Patvirtinkite Azure autentifikaciją
az account show
az account list

# Patikrinkite dabartinę aplinką
azd env show
azd env get-values

# Įjunkite derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug
```

## Autentifikacijos problemos

### Problema: „Nepavyko gauti prieigos žetono“
**Simptomai:**
- `azd up` nepavyksta dėl autentifikacijos klaidų
- Komandos grąžina „neautorizuota“ arba „prieiga uždrausta“

**Sprendimai:**
```bash
# 1. Iš naujo autentifikuokite naudodami Azure CLI
az login
az account show

# 2. Išvalykite talpykloje saugomus kredencialus
az account clear
az login

# 3. Naudokite įrenginio kodo srautą (be galvos sistemoms)
az login --use-device-code

# 4. Nustatykite aiškų prenumeratą
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: „Nepakanka privilegijų“ diegimo metu
**Simptomai:**
- Diegimas nepavyksta dėl leidimų klaidų
- Nepavyksta sukurti tam tikrų Azure išteklių

**Sprendimai:**
```bash
# 1. Patikrinkite savo Azure vaidmenų priskyrimus
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Įsitikinkite, kad turite reikiamus vaidmenis
# - Bendradarbis (išteklių kūrimui)
# - Vartotojo prieigos administratorius (vaidmenų priskyrimui)

# 3. Susisiekite su savo Azure administratoriumi dėl tinkamų leidimų
```

### Problema: Autentifikacijos problemos kelių nuomininkų aplinkoje
**Sprendimai:**
```bash
# 1. Prisijunkite su konkrečiu nuomininku
az login --tenant "your-tenant-id"

# 2. Nustatykite nuomininką konfigūracijoje
azd config set auth.tenantId "your-tenant-id"

# 3. Išvalykite nuomininko talpyklą, jei keičiate nuomininkus
az account clear
```

## 🏗️ Infrastruktūros kūrimo klaidos

### Problema: Išteklių pavadinimų konfliktai
**Simptomai:**
- Klaidos „Išteklių pavadinimas jau egzistuoja“
- Diegimas nepavyksta kuriant išteklius

**Sprendimai:**
```bash
# 1. Naudokite unikalius išteklių pavadinimus su žetonais
# Savo Bicep šablone:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Pakeiskite aplinkos pavadinimą
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Išvalykite esamus išteklius
azd down --force --purge
```

### Problema: Vietovė/regionas nepasiekiamas
**Simptomai:**
- Klaida „Vietovė 'xyz' nepasiekiama šio tipo ištekliams“
- Tam tikri SKU nepasiekiami pasirinktoje vietovėje

**Sprendimai:**
```bash
# 1. Patikrinkite galimas vietas išteklių tipams
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Naudokite dažniausiai prieinamus regionus
azd config set defaults.location eastus2
# arba
azd env set AZURE_LOCATION eastus2

# 3. Patikrinkite paslaugų prieinamumą pagal regioną
# Apsilankykite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Viršytos kvotos klaidos
**Simptomai:**
- „Viršyta kvota šio tipo ištekliams“
- „Pasiektas maksimalus išteklių skaičius“

**Sprendimai:**
```bash
# 1. Patikrinkite dabartinį kvotos naudojimą
az vm list-usage --location eastus2 -o table

# 2. Prašykite kvotos padidinimo per Azure portalą
# Eikite į: Prenumeratos > Naudojimas + kvotos

# 3. Naudokite mažesnius SKUs kūrimui
# Pagrindiniame.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Išvalykite nenaudojamus išteklius
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Bicep šablonų klaidos
**Simptomai:**
- Šablonų patvirtinimo klaidos
- Sintaksės klaidos Bicep failuose

**Sprendimai:**
```bash
# 1. Patvirtinti Bicep sintaksę
az bicep build --file infra/main.bicep

# 2. Naudoti Bicep linterį
az bicep lint --file infra/main.bicep

# 3. Patikrinti parametro failo sintaksę
cat infra/main.parameters.json | jq '.'

# 4. Peržiūrėti diegimo pakeitimus
azd provision --preview
```

## 🚀 Diegimo klaidos

### Problema: Kūrimo klaidos
**Simptomai:**
- Programa nepavyksta sukurti diegimo metu
- Paketų diegimo klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite kūrimo žurnalus
azd logs --service web
azd deploy --service web --debug

# 2. Išbandykite kūrimą vietoje
cd src/web
npm install
npm run build

# 3. Patikrinkite Node.js/Python versijų suderinamumą
node --version  # Turėtų atitikti azure.yaml nustatymus
python --version

# 4. Išvalykite kūrimo talpyklą
rm -rf node_modules package-lock.json
npm install

# 5. Patikrinkite Dockerfile, jei naudojate konteinerius
docker build -t test-image .
docker run --rm test-image
```

### Problema: Konteinerių diegimo klaidos
**Simptomai:**
- Konteinerių programos nepavyksta paleisti
- Klaidos traukiant atvaizdus

**Sprendimai:**
```bash
# 1. Išbandykite Docker kūrimą vietoje
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Patikrinkite konteinerio žurnalus
azd logs --service api --follow

# 3. Patikrinkite prieigą prie konteinerio registro
az acr login --name myregistry

# 4. Patikrinkite konteinerio programos konfigūraciją
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Duomenų bazės ryšio klaidos
**Simptomai:**
- Programa negali prisijungti prie duomenų bazės
- Ryšio laiko limitų klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite duomenų bazės ugniasienės taisykles
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Išbandykite ryšį iš programos
# Laikinai pridėkite prie savo programos:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Patikrinkite ryšio eilutės formatą
azd env get-values | grep DATABASE

# 4. Patikrinkite duomenų bazės serverio būseną
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigūracijos problemos

### Problema: Aplinkos kintamieji neveikia
**Simptomai:**
- Programa negali nuskaityti konfigūracijos reikšmių
- Aplinkos kintamieji atrodo tušti

**Sprendimai:**
```bash
# 1. Patikrinkite, ar aplinkos kintamieji nustatyti
azd env get-values
azd env get DATABASE_URL

# 2. Patikrinkite kintamųjų pavadinimus azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Paleiskite programą iš naujo
azd deploy --service web

# 4. Patikrinkite programos paslaugos konfigūraciją
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: SSL/TLS sertifikato problemos
**Simptomai:**
- HTTPS neveikia
- Sertifikato patvirtinimo klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite SSL sertifikato būseną
az webapp config ssl list --resource-group myrg

# 2. Įgalinkite tik HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridėkite pasirinktą domeną (jei reikia)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: CORS konfigūracijos problemos
**Simptomai:**
- Frontend negali kviesti API
- Užblokuoti užklausos iš kitų šaltinių

**Sprendimai:**
```bash
# 1. Konfigūruoti CORS App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atnaujinti API, kad palaikytų CORS
# Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Patikrinti, ar veikia tinkamuose URL
azd show
```

## 🌍 Aplinkos valdymo problemos

### Problema: Aplinkos perjungimo problemos
**Simptomai:**
- Naudojama neteisinga aplinka
- Konfigūracija netinkamai persijungia

**Sprendimai:**
```bash
# 1. Išvardykite visas aplinkas
azd env list

# 2. Aiškiai pasirinkite aplinką
azd env select production

# 3. Patikrinkite dabartinę aplinką
azd env show

# 4. Sukurkite naują aplinką, jei ji sugadinta
azd env new production-new
azd env select production-new
```

### Problema: Aplinkos sugadinimas
**Simptomai:**
- Aplinka rodo neteisingą būseną
- Ištekliai neatitinka konfigūracijos

**Sprendimai:**
```bash
# 1. Atnaujinti aplinkos būseną
azd env refresh

# 2. Atstatyti aplinkos konfigūraciją
azd env new production-reset
# Nukopijuoti reikalingus aplinkos kintamuosius
azd env set DATABASE_URL "your-value"

# 3. Importuoti esamus išteklius (jei įmanoma)
# Rankiniu būdu atnaujinti .azure/production/config.json su išteklių ID
```

## 🔍 Našumo problemos

### Problema: Lėtas diegimo laikas
**Simptomai:**
- Diegimai užtrunka per ilgai
- Laiko limitų klaidos diegimo metu

**Sprendimai:**
```bash
# 1. Įgalinti lygiagretų diegimą
azd config set deploy.parallelism 5

# 2. Naudoti inkrementinius diegimus
azd deploy --incremental

# 3. Optimizuoti kūrimo procesą
# Pakete.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Patikrinti išteklių vietas (naudoti tą patį regioną)
azd config set defaults.location eastus2
```

### Problema: Programos našumo problemos
**Simptomai:**
- Lėtas atsako laikas
- Didelis išteklių naudojimas

**Sprendimai:**
```bash
# 1. Padidinkite išteklius
# Atnaujinkite SKU faile main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Įgalinkite Application Insights stebėjimą
azd monitor

# 3. Patikrinkite programos žurnalus dėl kliūčių
azd logs --service api --follow

# 4. Įgyvendinkite talpyklą
# Pridėkite Redis talpyklą prie savo infrastruktūros
```

## 🛠️ Trikčių šalinimo įrankiai ir komandos

### Derinimo komandos
```bash
# Išsamus derinimas
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Patikrinti sistemos informaciją
azd info

# Patvirtinti konfigūraciją
azd config validate

# Patikrinti ryšį
curl -v https://myapp.azurewebsites.net/health
```

### Žurnalų analizė
```bash
# Programos žurnalai
azd logs --service web --follow
azd logs --service api --since 1h

# Azure išteklių žurnalai
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteinerių žurnalai (skirti konteinerių programoms)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Išteklių tyrimas
```bash
# Išvardykite visus išteklius
az resource list --resource-group myrg -o table

# Patikrinkite išteklių būseną
az webapp show --name myapp --resource-group myrg --query state

# Tinklo diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Papildoma pagalba

### Kada eskaluoti
- Autentifikacijos problemos išlieka po visų sprendimų išbandymo
- Infrastruktūros problemos su Azure paslaugomis
- Klausimai, susiję su sąskaitomis ar prenumeratomis
- Saugumo problemos ar incidentai

### Pagalbos kanalai
```bash
# 1. Patikrinkite Azure paslaugų būklę
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Sukurkite Azure palaikymo bilietą
# Eikite į: https://portal.azure.com -> Pagalba + palaikymas

# 3. Bendruomenės ištekliai
# - Stack Overflow: azure-developer-cli žyma
# - GitHub problemos: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacija, kurią reikia surinkti
Prieš kreipdamiesi į pagalbą, surinkite:
- `azd version` išvestį
- `azd info` išvestį
- Klaidos pranešimus (pilną tekstą)
- Žingsnius, kaip atkurti problemą
- Aplinkos detales (`azd env show`)
- Laiko juostą, kada problema prasidėjo

### Žurnalų rinkimo scenarijus
```bash
#!/bin/bash
# surinkti-derinimo-informacija.sh

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

## 📊 Problemų prevencija

### Prieš diegimą kontrolinis sąrašas
```bash
# 1. Patvirtinti autentifikaciją
az account show

# 2. Patikrinti kvotas ir limitus
az vm list-usage --location eastus2

# 3. Patvirtinti šablonus
az bicep build --file infra/main.bicep

# 4. Pirmiausia išbandyti vietoje
npm run build
npm run test

# 5. Naudoti bandomuosius diegimus
azd provision --preview
```

### Stebėjimo nustatymas
```bash
# Įgalinti „Application Insights“
# Pridėti į main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Nustatyti įspėjimus
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Reguliari priežiūra
```bash
# Savaitiniai sveikatos patikrinimai
./scripts/health-check.sh

# Mėnesinė išlaidų peržiūra
az consumption usage list --billing-period-name 202401

# Ketvirtinė saugumo peržiūra
az security assessment list --resource-group myrg
```

## Susiję ištekliai

- [Derinimo vadovas](debugging.md) - Išplėstinės derinimo technikos
- [Išteklių kūrimas](../deployment/provisioning.md) - Infrastruktūros trikčių šalinimas
- [Talpos planavimas](../pre-deployment/capacity-planning.md) - Išteklių planavimo gairės
- [SKU pasirinkimas](../pre-deployment/sku-selection.md) - Paslaugų lygių rekomendacijos

---

**Patarimas**: Išsaugokite šį vadovą ir naudokitės juo, kai tik susidursite su problemomis. Dauguma problemų jau buvo spręstos anksčiau ir turi nustatytus sprendimus!

---

**Navigacija**
- **Ankstesnė pamoka**: [Išteklių kūrimas](../deployment/provisioning.md)
- **Kita pamoka**: [Derinimo vadovas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->