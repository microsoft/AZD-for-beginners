# Įprastos problemos ir sprendimai

**Skirsnio navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis skyrius**: [6 skyrius: Parengiamieji patikrinimai](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Toliau**: [Derinimo vadovas](debugging.md)
- **🚀 Sekantis skyrius**: [8 skyrius: Produkcijos ir įmonės modeliai](../chapter-08-production/production-ai-practices.md)

## Įvadas

Šis išsamus trikčių šalinimo vadovas apima dažniausiai pasitaikančias problemas naudojant Azure Developer CLI. Išmokite diagnozuoti, šalinti gedimus ir spręsti įprastas problemas, susijusias su autentifikavimu, diegimu, infrastruktūros teikimu ir programų konfigūracija. Kiekviena problema apima simptomus, pagrindines priežastis ir žingsnis po žingsnio sprendimo procedūras.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Išmoksite diagnostikos metodų Azure Developer CLI problemoms
- Suprasite dažnas autentifikavimo ir leidimų problemas bei jų sprendimus
- Išspręsite diegimo klaidas, infrastruktūros teikimo problemas ir konfigūracijos sutrikimus
- Įgyvendinsite proaktyvų stebėjimą ir derinimo strategijas
- Taikysite sistemines trikčių šalinimo metodikas sudėtingoms problemoms
- Suconfiguruosite tinkamą žurnalavimą ir stebėjimą, kad išvengtumėte ateities problemų

## Mokymosi rezultatai

Baigę mokymą gebėsite:
- Diagnozuoti Azure Developer CLI problemas naudojant įmontuotus diagnostikos įrankius
- Savarankiškai spręsti autentifikavimo, prenumeratos ir leidimų problemas
- Efektyviai šalinti diegimo klaidas ir infrastruktūros teikimo klaidas
- Derinti programų konfigūracijos problemas ir aplinkai būdingus sutrikimus
- Įdiegti stebėjimą ir įspėjimus, kad proaktyviai nustatytumėte galimas problemas
- Taikyti geriausias žurnalavimo, derinimo ir problemų sprendimo darbo eigas

## Greita diagnostika

Prieš pereinant prie konkrečių problemų, paleiskite šias komandas, kad surinktumėte diagnostinę informaciją:

```bash
# Patikrinti azd versiją ir būklę
azd version
azd config list

# Patikrinti Azure autentifikaciją
az account show
az account list

# Patikrinti dabartinę aplinką
azd env show
azd env get-values

# Įgalinti derinimo žurnalavimą
export AZD_DEBUG=true
azd <command> --debug
```

## Autentifikavimo problemos

### Problema: "Failed to get access token"
**Simptomai:**
- `azd up` nepavyksta dėl autentifikavimo klaidų
- Komandos grąžina "unauthorized" arba "access denied"

**Sprendimai:**
```bash
# 1. Prisijungti iš naujo naudojant Azure CLI
az login
az account show

# 2. Išvalyti talpykloje esančius kredencialus
az account clear
az login

# 3. Naudoti įrenginio kodo srautą (skirta sistemoms be grafinės aplinkos)
az login --use-device-code

# 4. Nustatyti konkrečią prenumeratą
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Insufficient privileges" diegimo metu
**Simptomai:**
- Diegimas nepavyksta dėl leidimų klaidų
- Negalite sukurti tam tikrų Azure resursų

**Sprendimai:**
```bash
# 1. Patikrinkite savo Azure vaidmenų priskyrimus
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Įsitikinkite, kad turite reikiamus vaidmenis
# - Contributor (resursų kūrimui)
# - User Access Administrator (vaidmenų priskyrimams)

# 3. Susisiekite su savo Azure administratoriumi dėl tinkamų teisių
```

### Problema: Daugnuominės (multi-tenant) autentifikavimo problemos
**Sprendimai:**
```bash
# 1. Prisijunkite su konkrečiu nuomininku
az login --tenant "your-tenant-id"

# 2. Nustatykite nuomininką konfigūracijoje
azd config set auth.tenantId "your-tenant-id"

# 3. Išvalykite nuomininko talpyklą, jei perjungiate nuomininkus
az account clear
```

## 🏗️ Infrastruktūros teikimo klaidos

### Problema: Resursų pavadinimų konfliktai
**Simptomai:**
- "The resource name already exists" klaidos
- Diegimas nepavyksta kuriant resursus

**Sprendimai:**
```bash
# 1. Naudokite unikalius išteklių pavadinimus su žetonais
# Jūsų Bicep šablone:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Pakeiskite aplinkos pavadinimą
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Išvalykite esamus išteklius
azd down --force --purge
```

### Problema: Vieta/regionas nepasiekiamas
**Simptomai:**
- "The location 'xyz' is not available for resource type"
- Tam tikri SKU neprieinami pasirinktoje regione

**Sprendimai:**
```bash
# 1. Patikrinkite prieinamas vietas pagal išteklių tipus
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Naudokite dažniausiai prieinamus regionus
azd config set defaults.location eastus2
# arba
azd env set AZURE_LOCATION eastus2

# 3. Patikrinkite paslaugų prieinamumą pagal regionus
# Apsilankykite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Kvotos viršijimo klaidos
**Simptomai:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Sprendimai:**
```bash
# 1. Patikrinkite dabartinį kvotos naudojimą
az vm list-usage --location eastus2 -o table

# 2. Prašykite kvotos padidinimo per Azure portalą
# Go to: Prenumeratos > Naudojimas ir kvotos

# 3. Vystymui naudokite mažesnius SKU
# Faile main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Pašalinkite nenaudojamus išteklius
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Bicep šablono klaidos
**Simptomai:**
- Šablono validacijos klaidos
- Sintaksės klaidos Bicep failuose

**Sprendimai:**
```bash
# 1. Patikrinti Bicep sintaksę
az bicep build --file infra/main.bicep

# 2. Naudoti Bicep linterį
az bicep lint --file infra/main.bicep

# 3. Patikrinti parametrų failo sintaksę
cat infra/main.parameters.json | jq '.'

# 4. Peržiūrėti diegimo pakeitimus
azd provision --preview
```

## 🚀 Diegimo klaidos

### Problema: Kūrimo klaidos
**Simptomai:**
- Programa nepavyksta sugeneruoti diegimo metu
- Paketų įdiegimo klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite kūrimo išvestį su derinimo žyme
azd deploy --service web --debug

# 2. Peržiūrėkite išdiegtos paslaugos būseną
azd show

# 3. Išbandykite kūrimą lokaliai
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

### Problema: Talpyklos (container) diegimo klaidos
**Simptomai:**
- Container apps nepaleidžiami
- Klaidos traukiant paveikslėlį (image pull errors)

**Sprendimai:**
```bash
# 1. Išbandykite Docker build lokaliai
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Patikrinkite konteinerio žurnalus naudodami Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Stebėkite programą naudodami azd
azd monitor --logs

# 3. Patikrinkite prieigą prie konteinerių registro
az acr login --name myregistry

# 4. Patikrinkite konteinerio programos konfigūraciją
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Duomenų bazės prisijungimo klaidos
**Simptomai:**
- Programa negali prisijungti prie duomenų bazės
- Prisijungimo laiko išeigos klaidos (connection timeout errors)

**Sprendimai:**
```bash
# 1. Patikrinkite duomenų bazės ugniasienės taisykles
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Patikrinkite ryšį iš programos
# Laikinai pridėkite į savo programą:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Patikrinkite prisijungimo eilutės formatą
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

# 2. Patikrinkite kintamųjų pavadinimus faile azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Paleiskite programą iš naujo
azd deploy --service web

# 4. Patikrinkite programos paslaugos konfigūraciją
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: SSL/TLS sertifikatų problemos
**Simptomai:**
- HTTPS neveikia
- Sertifikato validacijos klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite SSL sertifikato būseną
az webapp config ssl list --resource-group myrg

# 2. Įgalinkite tik HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridėkite pasirinktinį domeną (jei reikia)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: CORS konfigūracijos problemos
**Simptomai:**
- Frontendas negali kviesti API
- Cross-origin užklausa blokuojama

**Sprendimai:**
```bash
# 1. Konfigūruokite CORS App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atnaujinkite API, kad tvarkytų CORS
# Express.js aplinkoje:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Patikrinkite, ar veikia teisinguose URL adresuose
azd show
```

## 🌍 Aplinkos valdymo problemos

### Problema: Aplinkos keitimosi problemos
**Simptomai:**
- Naudojama neteisinga aplinka
- Konfigūracija nesikeičia tinkamai

**Sprendimai:**
```bash
# 1. Išvardinti visas aplinkas
azd env list

# 2. Aiškiai pasirinkti aplinką
azd env select production

# 3. Patikrinti dabartinę aplinką
azd env show

# 4. Sukurti naują aplinką, jei ji sugadinta
azd env new production-new
azd env select production-new
```

### Problema: Aplinkos sugadinimas
**Simptomai:**
- Aplinka rodo neleistiną būseną
- Resursai neatitinka konfigūracijos

**Sprendimai:**
```bash
# 1. Atnaujinti aplinkos būseną
azd env refresh

# 2. Atstatyti aplinkos konfigūraciją
azd env new production-reset
# Nukopijuoti reikalingus aplinkos kintamuosius
azd env set DATABASE_URL "your-value"

# 3. Importuoti esamus išteklius (jei įmanoma)
# Rankiniu būdu atnaujinkite .azure/production/config.json su išteklių ID
```

## 🔍 Veikimo problemos

### Problema: Lėti diegimo laikai
**Simptomai:**
- Diegimai užtrunka per ilgai
- Laiko išeigos diegimo metu

**Sprendimai:**
```bash
# 1. Diegti konkrečias paslaugas greitesniam iteravimui
azd deploy --service web
azd deploy --service api

# 2. Naudokite tik kodo diegimą, kai infrastruktūra nepasikeitė
azd deploy  # Greičiau nei azd up

# 3. Optimizuokite kūrimo procesą
# Faile package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Patikrinkite išteklių vietas (naudokite tą patį regioną)
azd config set defaults.location eastus2
```

### Problema: Programos veikimo sutrikimai
**Simptomai:**
- Lėtas atsakymo laikas
- Aukštas resursų panaudojimas

**Sprendimai:**
```bash
# 1. Padidinti išteklius
# Atnaujinkite SKU faile main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Įgalinti Application Insights stebėjimą
azd monitor --overview

# 3. Patikrinkite programos žurnalus Azure
az webapp log tail --name myapp --resource-group myrg
# arba Container Apps atvejui:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Įdiegti kešavimą
# Pridėkite Redis talpyklą prie savo infrastruktūros
```

## 🛠️ Trikčių šalinimo įrankiai ir komandos

### Derinimo komandos
```bash
# Išsamus derinimas
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Patikrinti azd versiją
azd version

# Peržiūrėti dabartinę konfigūraciją
azd config list

# Patikrinti ryšį
curl -v https://myapp.azurewebsites.net/health
```

### Žurnalų analizė
```bash
# Programos žurnalai per Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Stebėkite programą naudodami azd
azd monitor --logs
azd monitor --live

# Azure išteklių žurnalai
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteinerių žurnalai (Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resursų tyrimas
```bash
# Išvardinti visus išteklius
az resource list --resource-group myrg -o table

# Patikrinti išteklių būseną
az webapp show --name myapp --resource-group myrg --query state

# Tinklo diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Papildoma pagalba

### Kada eskaluoti
- Autentifikavimo problemos neišsprendžiamos pasinaudojus visais sprendimais
- Infrastruktūros problemos su Azure paslaugomis
- Sąskaitų arba prenumeratos susijusios problemos
- Saugumo klausimai arba incidentai

### Palaikymo kanalai
```bash
# 1. Patikrinkite Azure paslaugų būklę
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Sukurkite Azure palaikymo užklausą
# Eikite į: https://portal.azure.com -> Pagalba ir palaikymas

# 3. Bendruomenės ištekliai
# - Stack Overflow: žyma azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacija, kurią reikia surinkti
Prieš kreipiantis į palaikymą, surinkite:
- `azd version` išvestis
- `azd config list` išvestis
- `azd show` išvestis (dabartinė diegimo būsena)
- Klaidų pranešimai (pilnas tekstas)
- Veiksmų sekos, kaip atkurti problemą
- Aplinkos detalės (`azd env show`)
- Laiko juosta, kada problema prasidėjo

### Žurnalų rinkimo skriptas
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Problemų prevencija

### Priešdiegimo kontrolinis sąrašas
```bash
# 1. Patikrinti autentifikaciją
az account show

# 2. Patikrinti kvotas ir ribas
az vm list-usage --location eastus2

# 3. Patikrinti šablonus
az bicep build --file infra/main.bicep

# 4. Pirmiausia išbandykite lokaliai
npm run build
npm run test

# 5. Naudoti bandomuosius diegimus
azd provision --preview
```

### Stebėjimo nustatymas
```bash
# Įjungti Application Insights
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
- [Resursų teikimas](../chapter-04-infrastructure/provisioning.md) - Infrastruktūros trikčių šalinimas
- [Talpos planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Gairės resursų planavimui
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) - Paslaugų lygio rekomendacijos

---

**Patarimas**: Laikykite šį vadovą pažymėtą ir kreipkitės į jį kiekvieną kartą, kai susiduriate su problemomis. Dauguma problemų jau buvo matytos anksčiau ir turi nustatytus sprendimus!

---

**Navigacija**
- **Ankstesnis pamokas**: [Resursų teikimas](../chapter-04-infrastructure/provisioning.md)
- **Tolimesnė pamoka**: [Derinimo vadovas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->