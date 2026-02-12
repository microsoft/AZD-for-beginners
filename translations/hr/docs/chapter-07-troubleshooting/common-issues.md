# Uobičajeni problemi i rješenja

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Otklanjanje poteškoća i ispravljanje pogrešaka
- **⬅️ Prethodno poglavlje**: [Poglavlje 6: Pre-flight provjere](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Sljedeće**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 8: Produkcijski i enterprise obrasci](../chapter-08-production/production-ai-practices.md)

## Uvod

Ovaj sveobuhvatni vodič za otklanjanje poteškoća pokriva najčešće probleme pri korištenju Azure Developer CLI. Naučite dijagnosticirati, otklanjati i rješavati uobičajene probleme s autentifikacijom, implementacijom, postavljanjem infrastrukture i konfiguracijom aplikacija. Svaki problem uključuje detaljne simptome, uzroke i korake za rješavanje.

## Ciljevi učenja

Nakon završetka ovog vodiča, moći ćete:
- Ovladati tehnikama dijagnostike za probleme s Azure Developer CLI
- Razumjeti uobičajene probleme s autentifikacijom i dopuštenjima te njihova rješenja
- Riješiti neuspjehe implementacije, pogreške pri postavljanju infrastrukture i probleme s konfiguracijom
- Implementirati proaktivne strategije nadgledanja i otklanjanja pogrešaka
- Primijeniti sustavne metodologije za otklanjanje poteškoća kod složenih problema
- Konfigurirati ispravno evidentiranje i nadgledanje kako biste spriječili buduće probleme

## Ishodi učenja

Po završetku, moći ćete:
- Dijagnosticirati probleme Azure Developer CLI pomoću ugrađenih dijagnostičkih alata
- Samostalno riješiti probleme vezane uz autentifikaciju, pretplate i dopuštenja
- Učinkovito otklanjati neuspjehe implementacije i pogreške pri postavljanju infrastrukture
- Ispravljati probleme konfiguracije aplikacija i specifične probleme u okruženju
- Implementirati nadgledanje i upozorenja za proaktivno prepoznavanje potencijalnih problema
- Primijeniti najbolje prakse za evidentiranje, ispravljanje pogrešaka i tijekove rješavanja problema

## Brza dijagnostika

Prije nego što prijeđete na specifične probleme, pokrenite ove naredbe za prikupljanje dijagnostičkih informacija:

```bash
# Provjeri verziju i stanje azd
azd version
azd config list

# Provjeri Azure autentifikaciju
az account show
az account list

# Provjeri trenutno okruženje
azd env show
azd env get-values

# Omogući zapisivanje za otklanjanje pogrešaka
export AZD_DEBUG=true
azd <command> --debug
```

## Problemi s autentifikacijom

### Problem: "Failed to get access token"
**Simptomi:**
- `azd up` ne uspijeva zbog pogrešaka autentifikacije
- Naredbe vraćaju "unauthorized" ili "access denied"

**Rješenja:**
```bash
# 1. Ponovno se prijavite pomoću Azure CLI
az login
az account show

# 2. Očistite predmemorirane vjerodajnice
az account clear
az login

# 3. Koristite tok s kodom uređaja (za sustave bez sučelja)
az login --use-device-code

# 4. Postavite eksplicitnu pretplatu
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" tijekom implementacije
**Simptomi:**
- Implementacija ne uspijeva zbog pogrešaka s dopuštenjima
- Ne možete stvoriti određene Azure resurse

**Rješenja:**
```bash
# 1. Provjerite dodjele uloga u Azureu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Osigurajte da imate potrebne uloge
# - Contributor (za stvaranje resursa)
# - User Access Administrator (za dodjeljivanje uloga)

# 3. Obratite se svom Azure administratoru za odgovarajuće dozvole
```

### Problem: Problemi s autentifikacijom za više najamnika
**Rješenja:**
```bash
# 1. Prijavite se kao određeni najmoprimac
az login --tenant "your-tenant-id"

# 2. Postavite najmoprimca u konfiguraciji
azd config set auth.tenantId "your-tenant-id"

# 3. Očistite predmemoriju najmoprimca pri prebacivanju između najmoprimaca
az account clear
```

## 🏗️ Pogreške pri postavljanju infrastrukture

### Problem: Sukobi imena resursa
**Simptomi:**
- Poruke "The resource name already exists"
- Implementacija ne uspijeva tijekom stvaranja resursa

**Rješenja:**
```bash
# 1. Koristite jedinstvena imena resursa s tokenima
# U vašem Bicep predlošku:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Promijenite ime okruženja
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Očistite postojeće resurse
azd down --force --purge
```

### Problem: Lokacija/regija nije dostupna
**Simptomi:**
- Poruka "The location 'xyz' is not available for resource type"
- Određeni SKU-i nisu dostupni u odabranoj regiji

**Rješenja:**
```bash
# 1. Provjerite dostupne lokacije za vrste resursa
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Koristite uobičajeno dostupne regije
azd config set defaults.location eastus2
# ili
azd env set AZURE_LOCATION eastus2

# 3. Provjerite dostupnost usluga po regiji
# Posjetite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Pogreške zbog prekoračenja kvota
**Simptomi:**
- Poruka "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Rješenja:**
```bash
# 1. Provjerite trenutno korištenje kvote
az vm list-usage --location eastus2 -o table

# 2. Zatražite povećanje kvote putem Azure portala
# Idite na: Pretplate > Upotreba + kvote

# 3. Koristite manje SKU-ove za razvoj
# U main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Očistite neiskorištene resurse
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Pogreške u Bicep predlošcima
**Simptomi:**
- Neuspjesi pri provjeri valjanosti predloška
- Sintaksne pogreške u Bicep datotekama

**Rješenja:**
```bash
# 1. Provjerite sintaksu Bicep
az bicep build --file infra/main.bicep

# 2. Koristite Bicep linter
az bicep lint --file infra/main.bicep

# 3. Provjerite sintaksu datoteke s parametrima
cat infra/main.parameters.json | jq '.'

# 4. Pregledajte promjene implementacije
azd provision --preview
```

## 🚀 Neuspjesi implementacije

### Problem: Neuspjesi izgradnje
**Simptomi:**
- Aplikacija ne uspijeva izgraditi se tijekom implementacije
- Pogreške pri instalaciji paketa

**Rješenja:**
```bash
# 1. Provjerite izlaz builda s debug zastavicom
azd deploy --service web --debug

# 2. Pogledajte status implementirane usluge
azd show

# 3. Testirajte izgradnju lokalno
cd src/web
npm install
npm run build

# 3. Provjerite kompatibilnost verzija Node.js i Pythona
node --version  # Treba odgovarati postavkama u azure.yaml
python --version

# 4. Očistite predmemoriju izgradnje
rm -rf node_modules package-lock.json
npm install

# 5. Provjerite Dockerfile ako koristite kontejnere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Neuspjesi implementacije kontejnera
**Simptomi:**
- Aplikacije u kontejnerima ne uspijevaju pokrenuti
- Pogreške pri povlačenju slike

**Rješenja:**
```bash
# 1. Testirajte Docker izgradnju lokalno
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Provjerite dnevnike kontejnera pomoću Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Nadzirajte aplikaciju putem azd
azd monitor --logs

# 3. Provjerite pristup registru kontejnera
az acr login --name myregistry

# 4. Provjerite konfiguraciju aplikacije kontejnera
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Problemi s vezom na bazu podataka
**Simptomi:**
- Aplikacija se ne može povezati s bazom podataka
- Pogreške zbog isteka vremenskog ograničenja veze

**Rješenja:**
```bash
# 1. Provjerite pravila vatrozida baze podataka
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testirajte povezivost iz aplikacije
# Privremeno dodajte u svoju aplikaciju:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Provjerite format niza za povezivanje
azd env get-values | grep DATABASE

# 4. Provjerite status poslužitelja baze podataka
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemi s konfiguracijom

### Problem: Varijable okruženja ne rade
**Simptomi:**
- Aplikacija ne može pročitati vrijednosti konfiguracije
- Varijable okruženja izgledaju prazno

**Rješenja:**
```bash
# 1. Provjerite jesu li varijable okruženja postavljene
azd env get-values
azd env get DATABASE_URL

# 2. Provjerite nazive varijabli u azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Ponovno pokrenite aplikaciju
azd deploy --service web

# 4. Provjerite konfiguraciju usluge App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemi sa SSL/TLS certifikatima
**Simptomi:**
- HTTPS ne radi
- Pogreške pri provjeri valjanosti certifikata

**Rješenja:**
```bash
# 1. Provjerite status SSL certifikata
az webapp config ssl list --resource-group myrg

# 2. Omogućite samo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodajte prilagođenu domenu (ako je potrebno)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemi s CORS konfiguracijom
**Simptomi:**
- Frontend ne može pozvati API
- Zahtjev iz drugog podrijetla blokiran

**Rješenja:**
```bash
# Konfigurirajte CORS za App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# Ažurirajte API da obrađuje CORS
# U Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Provjerite radi li na ispravnim URL-ovima
azd show
```

## 🌍 Problemi u upravljanju okruženjima

### Problem: Problemi pri prelasku između okruženja
**Simptomi:**
- Koristi se pogrešno okruženje
- Konfiguracija se ne prebacuje ispravno

**Rješenja:**
```bash
# 1. Navedite sva okruženja
azd env list

# 2. Izričito odaberite okruženje
azd env select production

# 3. Provjerite trenutno okruženje
azd env show

# 4. Stvorite novo okruženje ako je oštećeno
azd env new production-new
azd env select production-new
```

### Problem: Oštećenje okruženja
**Simptomi:**
- Okruženje prikazuje neispravno stanje
- Resursi se ne podudaraju s konfiguracijom

**Rješenja:**
```bash
# 1. Osvježi stanje okruženja
azd env refresh

# 2. Resetiraj konfiguraciju okruženja
azd env new production-reset
# Kopiraj potrebne varijable okruženja
azd env set DATABASE_URL "your-value"

# 3. Uvezi postojeće resurse (ako je moguće)
# Ručno ažuriraj .azure/production/config.json s ID-ovima resursa
```

## 🔍 Problemi s performansama

### Problem: Sporo vrijeme implementacije
**Simptomi:**
- Implementacije traju predugo
- Isteći vremenski ograničenja tijekom implementacije

**Rješenja:**
```bash
# 1. Rasporedite određene usluge za bržu iteraciju
azd deploy --service web
azd deploy --service api

# 2. Koristite samo implementaciju koda kada se infrastruktura nije promijenila
azd deploy  # Brže od azd up

# 3. Optimizirajte proces izgradnje
# U package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Provjerite lokacije resursa (koristite istu regiju)
azd config set defaults.location eastus2
```

### Problem: Problemi s performansama aplikacije
**Simptomi:**
- Spori odzivi
- Visoka iskorištenost resursa

**Rješenja:**
```bash
# 1. Povećajte resurse
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Omogućite praćenje u Application Insights
azd monitor --overview

# 3. Provjerite zapise aplikacije u Azureu
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementirajte keširanje
# Dodajte Redis predmemoriju u svoju infrastrukturu
```

## 🛠️ Alati i naredbe za otklanjanje poteškoća

### Naredbe za otklanjanje pogrešaka
```bash
# Sveobuhvatno otklanjanje pogrešaka
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Provjeri verziju azd-a
azd version

# Prikaži trenutnu konfiguraciju
azd config list

# Testiraj povezivost
curl -v https://myapp.azurewebsites.net/health
```

### Analiza dnevnika
```bash
# Dnevnici aplikacije putem Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Nadzor aplikacije pomoću azd
azd monitor --logs
azd monitor --live

# Dnevnici resursa Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dnevnici kontejnera (za Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Istraga resursa
```bash
# Prikaži sve resurse
az resource list --resource-group myrg -o table

# Provjeri status resursa
az webapp show --name myapp --resource-group myrg --query state

# Mrežna dijagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dobivanje dodatne pomoći

### Kada eskalirati
- Problemi s autentifikacijom se nastave nakon pokušaja svih rješenja
- Problemi s infrastrukturom kod Azure usluga
- Problemi vezani uz naplatu ili pretplatu
- Sigurnosne zabrinutosti ili incidenti

### Kanali podrške
```bash
# 1. Provjerite Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Otvorite zahtjev za Azure podršku
# Idite na: https://portal.azure.com -> Pomoć i podrška

# 3. Resursi zajednice
# - Stack Overflow: oznaka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacije koje treba prikupiti
Prije kontaktiranja podrške, prikupite:
- `azd version` output
- `azd config list` output
- `azd show` output (trenutni status implementacije)
- Poruke o pogreškama (cijeli tekst)
- Koraci za ponavljanje problema
- Detalji okruženja (`azd env show`)
- Vremenski okvir kada je problem započeo

### Skript za prikupljanje dnevnika
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

## 📊 Prevencija problema

### Kontrolna lista prije implementacije
```bash
# 1. Provjerite autentifikaciju
az account show

# 2. Provjerite kvote i ograničenja
az vm list-usage --location eastus2

# 3. Provjerite predloške
az bicep build --file infra/main.bicep

# 4. Prvo testirajte lokalno
npm run build
npm run test

# 5. Koristite probna razmještanja (dry-run)
azd provision --preview
```

### Postavljanje nadgledanja
```bash
# Omogući Application Insights
# Dodaj u main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Postavi upozorenja
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Redovito održavanje
```bash
# Tjedne provjere zdravlja
./scripts/health-check.sh

# Mjesečni pregled troškova
az consumption usage list --billing-period-name 202401

# Tromjesečni pregled sigurnosti
az security assessment list --resource-group myrg
```

## Povezani izvori

- [Vodič za ispravljanje pogrešaka](debugging.md) - Napredne tehnike ispravljanja pogrešaka
- [Postavljanje resursa](../chapter-04-infrastructure/provisioning.md) - Otklanjanje problema s infrastrukturom
- [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md) - Smjernice za planiranje resursa
- [Odabir SKU-a](../chapter-06-pre-deployment/sku-selection.md) - Preporuke za razine usluge

---

**Savjet**: Zabilježite ovaj vodič u oznakama i savjetujte mu se kad god naiđete na probleme. Većina problema je već viđena i ima utvrđena rješenja!

---

**Navigacija**
- **Prethodna lekcija**: [Postavljanje resursa](../chapter-04-infrastructure/provisioning.md)
- **Sljedeća lekcija**: [Vodič za ispravljanje pogrešaka](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj je dokument preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod obavljen od strane ljudskog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz uporabe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->