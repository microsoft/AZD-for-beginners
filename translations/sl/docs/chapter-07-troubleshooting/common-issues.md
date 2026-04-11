# Pogoste težave in rešitve

**Navigacija po poglavju:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje poglavje**: [Poglavje 6: Predzagonske preveritve](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Naslednje**: [Debugging Guide](debugging.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Uvod

Ta obsežen vodič za odpravljanje težav zajema najpogostejše težave pri uporabi Azure Developer CLI. Naučite se diagnosticirati, odpravljati in reševati pogoste težave z avtentikacijo, uvajanjem, zagotavljanjem infrastrukture in konfiguracijo aplikacij. Vsaka težava vsebuje podrobne simptome, osnovne vzroke in postopne postopke za rešitev.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Obvladali diagnostične tehnike za težave z Azure Developer CLI
- Razumeli pogoste težave z avtentikacijo in dovoljenji ter njihove rešitve
- Reševali neuspehe uvajanja, napake pri zagotavljanju infrastrukture in težave s konfiguracijo
- Uvedli proaktivne strategije spremljanja in razhroščevanja
- Uporabljali sistematične metode odpravljanja napak pri kompleksnih problemih
- Konfigurirali ustrezno beleženje in spremljanje za preprečevanje prihodnjih težav

## Rezultati učenja

Po zaključku boste sposobni:
- Diagnosticirati težave z Azure Developer CLI z uporabo vgrajenih diagnostičnih orodij
- Samostojno reševati težave z avtentikacijo, naročnino in dovoljenji
- Učinkovito odpravljati neuspehe uvajanja in napake pri zagotavljanju infrastrukture
- Razhroščevati težave s konfiguracijo aplikacij in težave, specifične za okolje
- Uvesti spremljanje in opozorila za proaktivno odkrivanje potencialnih težav
- Uporabljati najboljše prakse za beleženje, razhroščevanje in delovne postopke za reševanje problemov

## Hitra diagnostika

Preden se poglobite v specifične težave, za zbirkoinformacij zaženite te ukaze:

```bash
# Preveri različico in stanje azd
azd version
azd config show

# Preveri overjanje za Azure
az account show
az account list

# Preveri trenutno okolje
azd env list
azd env get-values

# Omogoči beleženje za odpravljanje napak
export AZD_DEBUG=true
azd <command> --debug
```

## Težave z avtentikacijo

### Težava: "Failed to get access token"
**Simptomi:**
- `azd up` spodleti z napakami avtentikacije
- Ukazi vračajo "nepooblaščen" ali "dostop zavrnjen"

**Rešitve:**
```bash
# 1. Ponovno se prijavite z Azure CLI
az login
az account show

# 2. Počistite predpomnjene poverilnice
az account clear
az login

# 3. Uporabite postopek s kodo naprave (za brezglavne sisteme)
az login --use-device-code

# 4. Nastavite eksplicitno naročnino
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Težava: "Insufficient privileges" med uvajanjem
**Simptomi:**
- Uvajanje spodleti z napakami dovoljenj
- Ne more ustvariti določenih Azure virov

**Rešitve:**
```bash
# 1. Preverite svoje dodelitve vlog v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Poskrbite, da imate potrebne vloge
# - Contributor (za ustvarjanje virov)
# - User Access Administrator (za dodeljevanje vlog)

# 3. Kontaktirajte svojega Azure skrbnika za ustrezna dovoljenja
```

### Težava: Težave z večnajemniško avtentikacijo
**Rešitve:**
```bash
# 1. Prijavite se z določenim najemnikom
az login --tenant "your-tenant-id"

# 2. Nastavite najemnika v konfiguraciji
azd config set auth.tenantId "your-tenant-id"

# 3. Počistite predpomnilnik najemnika, če preklapljate med najemniki
az account clear
```

## 🏗️ Napake pri zagotavljanju infrastrukture

### Težava: Spori imen virov
**Simptomi:**
- Napake "The resource name already exists"
- Uvajanje spodleti med ustvarjanjem virov

**Rešitve:**
```bash
# 1. Uporabite edinstvena imena virov z uporabo tokenov
# V svojem Bicep predlogu:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Spremenite ime okolja
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Odstranite obstoječe vire
azd down --force --purge
```

### Težava: Lokacija/regija ni na voljo
**Simptomi:**
- "The location 'xyz' is not available for resource type"
- Določeni SKU-ji niso na voljo v izbrani regiji

**Rešitve:**
```bash
# 1. Preverite razpoložljive lokacije za vrste virov
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Uporabite pogosto razpoložljive regije
azd config set defaults.location eastus2
# ali
azd env set AZURE_LOCATION eastus2

# 3. Preverite razpoložljivost storitev po regijah
# Obiščite: https://azure.microsoft.com/global-infrastructure/services/
```

### Težava: Napake zaradi prekoračitve kvote
**Simptomi:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Rešitve:**
```bash
# 1. Preverite trenutno porabo kvote
az vm list-usage --location eastus2 -o table

# 2. Zahtevajte povečanje kvote prek Azure portala
# Pojdite na: Naročnine > Poraba in kvote

# 3. Za razvoj uporabite manjše SKU-je
# V main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Odstranite neuporabljene vire
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Težava: Napake v Bicep predlogah
**Simptomi:**
- Neveljavnost predloge
- Sintaktične napake v Bicep datotekah

**Rešitve:**
```bash
# 1. Preverite sintakso Bicep
az bicep build --file infra/main.bicep

# 2. Uporabite linter za Bicep
az bicep lint --file infra/main.bicep

# 3. Preverite sintakso datoteke z parametri
cat infra/main.parameters.json | jq '.'

# 4. Predogled sprememb pri uvajanju
azd provision --preview
```

## 🚀 Neuspehi pri uvajanju

### Težava: Napake pri gradnji
**Simptomi:**
- Aplikacija ne uspe zgraditi med uvajanjem
- Napake pri nameščanju paketov

**Rešitve:**
```bash
# 1. Preverite izhod gradnje z zastavico za odpravljanje napak
azd deploy --service web --debug

# 2. Preverite stanje nameščene storitve
azd show

# 3. Preizkusite gradnjo lokalno
cd src/web
npm install
npm run build

# 3. Preverite združljivost različic Node.js in Python
node --version  # Naj se ujema z nastavitvami v azure.yaml
python --version

# 4. Počistite predpomnilnik gradnje
rm -rf node_modules package-lock.json
npm install

# 5. Preverite Dockerfile, če uporabljate kontejnerje
docker build -t test-image .
docker run --rm test-image
```

### Težava: Neuspehi pri uvajanju kontejnerjev
**Simptomi:**
- Container apps ne začnejo delovati
- Napake pri potegnitvi slike

**Rešitve:**
```bash
# 1. Preizkusi lokalno gradnjo Docker slike
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Preveri dnevnike vsebnika z uporabo Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Spremljaj aplikacijo prek azd
azd monitor --logs

# 3. Preveri dostop do registra vsebnikov
az acr login --name myregistry

# 4. Preveri konfiguracijo aplikacije v vsebniku
az containerapp show --name my-app --resource-group my-rg
```

### Težava: Napake pri povezavi z bazo podatkov
**Simptomi:**
- Aplikacija se ne more povezati z bazo podatkov
- Časovne omejitve pri vzpostavitvi povezave

**Rešitve:**
```bash
# 1. Preverite pravila požarnega zidu za bazo podatkov
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Preizkusite povezljivost iz aplikacije
# Začasno dodajte v svojo aplikacijo:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Preverite obliko niza za povezavo
azd env get-values | grep DATABASE

# 4. Preverite stanje strežnika baze podatkov
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Težave s konfiguracijo

### Težava: Okoljske spremenljivke ne delujejo
**Simptomi:**
- Aplikacija ne more prebrati vrednosti konfiguracije
- Okoljske spremenljivke se zdijo prazne

**Rešitve:**
```bash
# 1. Preverite, ali so nastavljene spremenljivke okolja
azd env get-values
azd env get DATABASE_URL

# 2. Preverite imena spremenljivk v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Znova zaženite aplikacijo
azd deploy --service web

# 4. Preverite konfiguracijo App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Težava: Težave s SSL/TLS certifikati
**Simptomi:**
- HTTPS ne deluje
- Napake pri preverjanju certifikata

**Rešitve:**
```bash
# 1. Preverite stanje SSL potrdila
az webapp config ssl list --resource-group myrg

# 2. Omogočite samo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodajte lastno domeno (če je potrebno)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Težava: Težave s konfiguracijo CORS
**Simptomi:**
- Frontend ne more klicati API-ja
- Zahteva iz drugega izvora je blokirana

**Rešitve:**
```bash
# 1. Konfigurirajte CORS za App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Posodobite API za obravnavo CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Preverite, ali teče na pravilnih URL-jih
azd show
```

## 🌍 Težave pri upravljanju okolij

### Težava: Težave pri preklapljanju okolij
**Simptomi:**
- Uporablja se napačno okolje
- Konfiguracija se ne preklopi pravilno

**Rešitve:**
```bash
# 1. Prikaži vsa okolja
azd env list

# 2. Jasno izberi okolje
azd env select production

# 3. Preveri trenutno okolje
azd env list

# 4. Ustvari novo okolje, če je poškodovano
azd env new production-new
azd env select production-new
```

### Težava: Poškodovano okolje
**Simptomi:**
- Okolje kaže neveljavno stanje
- Viri se ne ujemajo s konfiguracijo

**Rešitve:**
```bash
# 1. Osveži stanje okolja
azd env refresh

# 2. Ponastavi konfiguracijo okolja
azd env new production-reset
# Kopiraj potrebne spremenljivke okolja
azd env set DATABASE_URL "your-value"

# 3. Uvozi obstoječe vire (če je mogoče)
# Ročno posodobite .azure/production/config.json z ID-ji virov
```

## 🔍 Težave z zmogljivostjo

### Težava: Počasni časi uvajanja
**Simptomi:**
- Uvajanja trajajo predolgo
- Časovne omejitve med uvajanjem

**Rešitve:**
```bash
# 1. Namestite določene storitve za hitrejše iteracije
azd deploy --service web
azd deploy --service api

# 2. Uporabite nameščanje samo kode, če infrastruktura ni spremenjena
azd deploy  # Hitreje kot azd up

# 3. Optimizirajte postopek gradnje
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Preverite lokacije virov (uporabite isto regijo)
azd config set defaults.location eastus2
```

### Težava: Težave z zmogljivostjo aplikacije
**Simptomi:**
- Počasni odzivi
- Visoka poraba virov

**Rešitve:**
```bash
# 1. Povečajte vire
# Posodobite SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Omogočite spremljanje Application Insights
azd monitor --overview

# 3. Preverite dnevniške zapise aplikacije v Azure
az webapp log tail --name myapp --resource-group myrg
# ali za Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Uvedite predpomnilnik
# Dodajte Redis predpomnilnik v vašo infrastrukturo
```

## 🛠️ Orodja in ukazi za odpravljanje težav

### Ukazi za razhroščevanje
```bash
# Celovito odpravljanje napak
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Preveri različico azd
azd version

# Prikaži trenutno konfiguracijo
azd config show

# Preizkusi povezljivost
curl -v https://myapp.azurewebsites.net/health
```

### Analiza dnevnikov
```bash
# Dnevniki aplikacije prek Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Spremljajte aplikacijo z azd
azd monitor --logs
azd monitor --live

# Dnevniki virov Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dnevniki kontejnerjev (za Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Preiskava virov
```bash
# Prikaži vse vire
az resource list --resource-group myrg -o table

# Preveri stanje vira
az webapp show --name myapp --resource-group myrg --query state

# Omrežna diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Iskanje dodatne pomoči

### Kdaj eskalirati
- Težave z avtentikacijo vztrajajo po preizkusu vseh rešitev
- Težave z infrastrukturo pri Azure storitvah
- Težave z obračunavanjem ali naročnino
- Varnostne pomisleke ali incidenti

### Kanali podpore
```bash
# 1. Preverite Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Ustvarite podporni zahtevek za Azure
# Pojdite na: https://portal.azure.com -> Pomoč + podpora

# 3. Viri skupnosti
# - Stack Overflow: oznaka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacije za zbiranje
Preden kontaktirate podporo, zberite:
- `azd version` output
- `azd config show` output
- `azd show` output (trenutni status uvajanja)
- Sporočila o napakah (celotno besedilo)
- Koraki za ponovitev težave
- Podrobnosti o okolju (`azd env get-values`)
- Časovni okvir, kdaj se je težava začela

### Skripta za zbiranje dnevnikov
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

## 📊 Preprečevanje težav

### Kontrolni seznam pred uvajanjem
```bash
# 1. Preveri overjanje
az account show

# 2. Preveri kvote in omejitve
az vm list-usage --location eastus2

# 3. Preveri predloge
az bicep build --file infra/main.bicep

# 4. Najprej preizkusi lokalno
npm run build
npm run test

# 5. Uporabi poskusne razmestitve
azd provision --preview
```

### Nastavitev spremljanja
```bash
# Omogoči Application Insights
# Dodaj v main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Nastavi opozorila
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Redno vzdrževanje
```bash
# Tedenski zdravstveni pregledi
./scripts/health-check.sh

# Mesečni pregled stroškov
az consumption usage list --billing-period-name 202401

# Četrtletni varnostni pregled
az security assessment list --resource-group myrg
```

## Povezani viri

- [Debugging Guide](debugging.md) - Napredne tehnike razhroščevanja
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Odpravljanje težav z infrastrukturo
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Smernice za načrtovanje virov
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Priporočila za razrede storitev

---

**Namig**: Ta vodič si shranite med zaznamke in ga uporabite, kadar naletite na težave. Večina problemov se je že pojavila in zanje obstajajo uveljavljene rešitve!

---

**Navigacija**
- **Prejšnja lekcija**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Naslednja lekcija**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, prosimo upoštevajte, da samodejni prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni prevod s strani človeka. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->