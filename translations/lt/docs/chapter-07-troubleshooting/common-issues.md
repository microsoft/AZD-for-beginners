# Dažnos problemos ir sprendimai

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius – trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis skyrius**: [6 skyrius: Priešdiegančiosios patikros](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Kitas**: [Derinimo vadovas](debugging.md)
- **🚀 Kitas skyrius**: [8 skyrius: Gamybos ir verslo modeliai](../chapter-08-production/production-ai-practices.md)

## Įvadas

Ši išsami trikčių šalinimo vadovas apima dažniausiai pasitaikančias problemas naudojant Azure Developer CLI. Sužinokite, kaip diagnozuoti, šalinti ir spręsti dažniausiai pasitaikančias autentifikavimo, diegimo, infrastruktūros diegimo ir programos konfigūracijos problemas. Kiekviena problema apima detalius simptomus, priežastis ir žingsnis po žingsnio sprendimo procedūras.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite diagnostikos metodus Azure Developer CLI problemoms
- Suprasite dažniausias autentifikacijos ir leidimų problemas bei jų sprendimus
- Spręsite diegimo klaidas, infrastruktūros diegimo problemas ir konfigūracijos neatitikimus
- Įgyvendinsite proaktyvų stebėjimą ir derinimo strategijas
- Taikysite sistemingas trikčių šalinimo metodikas sudėtingoms problemoms
- Konfigūruosite tinkamą žurnalo vedimą ir stebėjimą, kad išvengtumėte ateities problemų

## Mokymosi rezultatai

Baigę suprasite, kaip:
- Diagnostikuoti Azure Developer CLI problemas naudojant įmontuotus diagnostikos įrankius
- Savarankiškai spręsti autentifikacijos, prenumeratos ir leidimų problemas
- Efektyviai šalinti diegimo klaidas ir infrastruktūros diegimo problemas
- Derinti programos konfigūracijos problemas ir aplinkai būdingas klaidas
- Įgyvendinti stebėjimą ir įspėjimus, kad proaktyviai nustatytumėte galimas problemas
- Taikyti geriausias praktikas žurnalų vedimui, derinimui ir problemų sprendimo procesams

## Greitos diagnostikos komandos

Prieš pereidami prie konkrečių problemų, paleiskite šias komandas diagnostikos informacijai surinkti:

```bash
# Patikrinkite azd versiją ir būklę
azd version
azd config show

# Patvirtinkite Azure autentifikavimą
az account show
az account list

# Patikrinkite dabartinę aplinką
azd env list
azd env get-values

# Įjunkite derinimo žurnalus
export AZD_DEBUG=true
azd <command> --debug
```

## Autentifikacijos problemos

### Problema: „Nepavyko gauti prieigos rakto“
**Simptomai:**
- `azd up` nepavyksta dėl autentifikacijos klaidų
- Komandos grąžina „neautorizuota“ arba „prieiga uždrausta“

**Sprendimai:**
```bash
# 1. Iš naujo autentifikuokitės su Azure CLI
az login
az account show

# 2. Išvalykite talpykloje saugomus prisijungimo duomenis
az account clear
az login

# 3. Naudokite įrenginio kodo srautą (be galvutės sistemoms)
az login --use-device-code

# 4. Nustatykite aiškią prenumeratą
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: „Nepakankamos privilegijos“ diegimo metu
**Simptomai:**
- Diegimas nepavyksta dėl leidimų klaidų
- Negalima sukurti tam tikrų Azure išteklių

**Sprendimai:**
```bash
# 1. Patikrinkite savo Azure vaidmenų priskyrimus
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Įsitikinkite, kad turite reikiamus vaidmenis
# - Dalyvis (resursų kūrimui)
# - Vartotojo prieigos administratorius (vaidmenų priskyrimams)

# 3. Susisiekite su savo Azure administratoriumi dėl tinkamų leidimų
```

### Problema: Daugiaklientė autentifikacija
**Sprendimai:**
```bash
# 1. Prisijunkite su konkrečiu nuomininku
az login --tenant "your-tenant-id"

# 2. Nustatykite nuomininką konfigūracijoje
azd config set auth.tenantId "your-tenant-id"

# 3. Išvalykite nuomininko talpyklą, jei keičiami nuomininkai
az account clear
```

## 🏗️ Infrastruktūros diegimo klaidos

### Problema: Išteklių pavadinimų konfliktai
**Simptomai:**
- „Išteklių pavadinimas jau egzistuoja“ klaidos
- Diegimas nepavyksta kuriant išteklius

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

### Problema: Vietovė/regionas nepasiekiamas
**Simptomai:**
- „Vietovė 'xyz' nepasiekiama šio tipo ištekliui“ klaida
- Kai kurie SKU nesuteikiami pasirinktoje regione

**Sprendimai:**
```bash
# 1. Patikrinkite, kokios vietovės yra prieinamos resursų tipams
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Naudokite dažniausiai prieinamas sritis
azd config set defaults.location eastus2
# arba
azd env set AZURE_LOCATION eastus2

# 3. Patikrinkite paslaugos prieinamumą pagal sritį
# Apsilankykite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Viršytos kvotos klaidos
**Simptomai:**
- „Viršyta kvota šiam išteklių tipui“ klaida
- „Pasiektas maksimalus išteklių kiekis“

**Sprendimai:**
```bash
# 1. Patikrinkite esamą kvotos naudojimą
az vm list-usage --location eastus2 -o table

# 2. Prašykite kvotos padidinimo per Azure portalą
# Eikite į: Prenumeratos > Naudojimas + kvotos

# 3. Naudokite mažesnius SKU kūrimui
# Faile main.parameters.json:
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
- Šablonų patikros klaidos
- Sintaksės klaidos Bicep failuose

**Sprendimai:**
```bash
# 1. Patvirtinkite Bicep sintaksę
az bicep build --file infra/main.bicep

# 2. Naudokite Bicep linter'į
az bicep lint --file infra/main.bicep

# 3. Patikrinkite parametro failo sintaksę
cat infra/main.parameters.json | jq '.'

# 4. Peržiūrėkite diegimo pakeitimus
azd provision --preview
```

## 🚀 Diegimo klaidos

### Problema: Kūrimo klaidos
**Simptomai:**
- Programa nepavyksta sukurti diegimo metu
- Paketo diegimo klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite kūrimo rezultatą su derinimo žymekliu
azd deploy --service web --debug

# 2. Peržiūrėkite išdiegto serviso būseną
azd show

# 3. Testuokite kūrimą lokaliai
cd src/web
npm install
npm run build

# 3. Patikrinkite Node.js/Python versijų suderinamumą
node --version  # Turi atitikti azure.yaml nustatymus
python --version

# 4. Išvalykite kūrimo talpyklą
rm -rf node_modules package-lock.json
npm install

# 5. Patikrinkite Dockerfile, jei naudojate konteinerius
docker build -t test-image .
docker run --rm test-image
```

### Problema: Konteinerio diegimo klaidos
**Simptomai:**
- Konteinerių programos nepaleidžiamos
- Klaidos traukiant atvaizdą

**Sprendimai:**
```bash
# 1. Išbandykite Docker kūrimą lokaliai
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Patikrinkite konteinerio žurnalus naudodami Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Stebėkite programą per azd
azd monitor --logs

# 3. Patikrinkite prieigą prie konteinerių registro
az acr login --name myregistry

# 4. Patikrinkite konteinerių programos konfigūraciją
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Duomenų bazės ryšio klaidos
**Simptomai:**
- Programa negali prisijungti prie duomenų bazės
- Ryšio laiko išeigos klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite duomenų bazės ugniasienės taisykles
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Patikrinkite ryšį iš programos
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
# 1. Patikrinkite, ar nustatytos aplinkos kintamųjų reikšmės
azd env get-values
azd env get DATABASE_URL

# 2. Patikrinkite kintamųjų pavadinimus faile azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Perkraukite programą
azd deploy --service web

# 4. Patikrinkite programos paslaugos konfigūraciją
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: SSL/TLS sertifikatų problemos
**Simptomai:**
- HTTPS neveikia
- Sertifikato patikros klaidos

**Sprendimai:**
```bash
# 1. Patikrinkite SSL sertifikato būseną
az webapp config ssl list --resource-group myrg

# 2. Įjungti tik HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridėti pasirinktinius domenus (jei reikia)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: CORS konfigūracijos problemos
**Simptomai:**
- Frontendas negali kviesti API
- Blokuojamas tarp kilmės prašymas

**Sprendimai:**
```bash
# 1. Sukonfigūruokite CORS App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atnaujinkite API, kad palaikytų CORS
# Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Patikrinkite, ar veikia tinkamuose URL adresuose
azd show
```

## 🌍 Aplinkos valdymo problemos

### Problema: Aplinkos perjungimo problemos
**Simptomai:**
- Naudojama neteisinga aplinka
- Konfigūracija nepereinama tinkamai

**Sprendimai:**
```bash
# 1. Išvardinti visas aplinkas
azd env list

# 2. Aiškiai pasirinkti aplinką
azd env select production

# 3. Patikrinti esamą aplinką
azd env list

# 4. Sukurti naują aplinką, jei sugadinta
azd env new production-new
azd env select production-new
```

### Problema: Aplinkos sugadinimas
**Simptomai:**
- Aplinka rodo neteisingą būseną
- Ištekliai neatitinka konfiguracijos

**Sprendimai:**
```bash
# 1. Atnaujinti aplinkos būseną
azd env refresh

# 2. Atstatyti aplinkos konfigūraciją
azd env new production-reset
# Nukopijuoti reikiamus aplinkos kintamuosius
azd env set DATABASE_URL "your-value"

# 3. Importuoti esamus išteklius (jei įmanoma)
# Rankiniu būdu atnaujinti .azure/production/config.json su išteklių ID
```

## 🔍 Veikimo problemos

### Problema: Lėti diegimo laikai
**Simptomai:**
- Diegimai trunka per ilgai
- Diegimo metu laiko išeigos

**Sprendimai:**
```bash
# 1. Diegti specifines paslaugas greitesniam iteravimui
azd deploy --service web
azd deploy --service api

# 2. Naudokite tik kodo diegimą, kai infrastruktūra nesikeičia
azd deploy  # Greičiau nei azd up

# 3. Optimizuoti kūrimo procesą
# Faile package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Patikrinti išteklių vietas (naudoti tą patį regioną)
azd config set defaults.location eastus2
```

### Problema: Programos veikimo problemos
**Simptomai:**
- Lėti atsako laikai
- Didelis išteklių naudojimas

**Sprendimai:**
```bash
# 1. Padidinkite išteklius
# Atnaujinkite SKU faile main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Įgalinkite Application Insights stebėjimą
azd monitor --overview

# 3. Patikrinkite programos žurnalus Azure
az webapp log tail --name myapp --resource-group myrg
# arba konteinerių programoms:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Įgyvendinkite kešavimą
# Pridėkite Redis kešą į savo infrastruktūrą
```

## 🛠️ Trikčių šalinimo įrankiai ir komandos

### Derinimo komandos
```bash
# Išsamus derinimas
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Patikrinti azd versiją
azd version

# Peržiūrėti esamą konfigūraciją
azd config show

# Patikrinti ryšį
curl -v https://myapp.azurewebsites.net/health
```

### Žurnalų analizė
```bash
# Programos žurnalai per Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Stebėkite programą su azd
azd monitor --logs
azd monitor --live

# Azure išteklių žurnalai
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteinerio žurnalai (konteinerių programoms)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Išteklių tyrimas
```bash
# Išvardinkite visus išteklius
az resource list --resource-group myrg -o table

# Patikrinkite ištekliaus būseną
az webapp show --name myapp --resource-group myrg --query state

# Tinklo diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Papildoma pagalba

### Kada eskaluoti
- Autentifikacijos problemos išlieka po visų sprendimų bandymo
- Infrastruktūros problemos su Azure paslaugomis
- Mokėjimų ar prenumeratos problemos
- Saugumo klausimai ar incidentai

### Pagalbos kanalai
```bash
# 1. Patikrinkite Azure paslaugų būklę
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Sukurkite Azure palaikymo užklausą
# Eikite į: https://portal.azure.com -> Pagalba + palaikymas

# 3. Bendruomenės ištekliai
# - Stack Overflow: azure-developer-cli žyma
# - GitHub klausimai: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacija, kurią surinkti
Prieš kreipiantis į pagalbą, surinkite:
- `azd version` išvestį
- `azd config show` išvestį
- `azd show` išvestį (dabartinės diegimo būsenos)
- Klaidų pranešimus (visą tekstą)
- Žingsnius problemos atkartojimui
- Aplinkos duomenis (`azd env get-values`)
- Laiko juostą, kada problema prasidėjo

### Žurnalų rinkimo scenarijus
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

## 📊 Problemų prevencija

### Priešdiegančių patikrinimo sąrašas
```bash
# 1. Patikrinti autentifikaciją
az account show

# 2. Patikrinti kvotas ir ribas
az vm list-usage --location eastus2

# 3. Patikrinti šablonus
az bicep build --file infra/main.bicep

# 4. Iš pradžių išbandyti lokaliai
npm run build
npm run test

# 5. Naudoti „sauso paleidimo“ diegimus
azd provision --preview
```

### Stebėjimo konfigūracija
```bash
# Įgalinti Application Insights
# Pridėti prie main.bicep:
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

### Reguliarus priežiūra
```bash
# Savaitinės sveikatos patikros
./scripts/health-check.sh

# Mėnesio sąnaudų peržiūra
az consumption usage list --billing-period-name 202401

# Ketvirtinės saugumo peržiūros
az security assessment list --resource-group myrg
```

## Susiję ištekliai

- [Derinimo vadovas](debugging.md) – pažangios derinimo technikos
- [Išteklių diegimas](../chapter-04-infrastructure/provisioning.md) – infrastruktūros trikčių šalinimas
- [Talpos planavimas](../chapter-06-pre-deployment/capacity-planning.md) – išteklių planavimo gairės
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) – paslaugų lygio rekomendacijos

---

**Patartina**: Išsaugokite šį vadovą žymėje ir naudokitės juo susidūrę su problemomis. Dauguma klaidų jau yra žinomos ir turi įprastus sprendimus!

---

**Naršymas**
- **Ankstesnė pamoka**: [Išteklių diegimas](../chapter-04-infrastructure/provisioning.md)
- **Kita pamoka**: [Derinimo vadovas](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama pasitelkti profesionalų žmogaus vertimą. Mes neatsakome už bet kokius nesusipratimus ar klaidingus aiškinimus, kilusius naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->