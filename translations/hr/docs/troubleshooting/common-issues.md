# Uobičajeni problemi i rješenja

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i otklanjanje pogrešaka
- **⬅️ Prethodno poglavlje**: [Poglavlje 6: Provjere prije implementacije](../pre-deployment/preflight-checks.md)
- **➡️ Sljedeće**: [Vodič za otklanjanje pogrešaka](debugging.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 8: Proizvodni i poslovni obrasci](../microsoft-foundry/production-ai-practices.md)

## Uvod

Ovaj sveobuhvatni vodič za rješavanje problema pokriva najčešće probleme s kojima se možete susresti pri korištenju Azure Developer CLI-a. Naučite kako dijagnosticirati, riješiti i otkloniti uobičajene probleme s autentifikacijom, implementacijom, postavljanjem infrastrukture i konfiguracijom aplikacija. Svaki problem uključuje detaljne simptome, uzroke i korake za rješavanje.

## Ciljevi učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati tehnikama dijagnostike za probleme s Azure Developer CLI-jem
- Razumjeti uobičajene probleme s autentifikacijom i dozvolama te njihova rješenja
- Riješiti neuspjele implementacije, pogreške u postavljanju infrastrukture i probleme s konfiguracijom
- Primijeniti proaktivne strategije praćenja i otklanjanja pogrešaka
- Koristiti sustavne metode rješavanja složenih problema
- Postaviti odgovarajuće zapisivanje i praćenje kako biste spriječili buduće probleme

## Ishodi učenja

Po završetku, moći ćete:
- Dijagnosticirati probleme s Azure Developer CLI-jem koristeći ugrađene alate za dijagnostiku
- Samostalno riješiti probleme s autentifikacijom, pretplatama i dozvolama
- Učinkovito otkloniti neuspjele implementacije i pogreške u postavljanju infrastrukture
- Otkloniti probleme s konfiguracijom aplikacija i specifične probleme okruženja
- Implementirati praćenje i upozorenja za proaktivno prepoznavanje potencijalnih problema
- Primijeniti najbolje prakse za zapisivanje, otklanjanje pogrešaka i tijekove rješavanja problema

## Brza dijagnostika

Prije nego što se upustite u specifične probleme, pokrenite ove naredbe za prikupljanje dijagnostičkih informacija:

```bash
# Provjeri azd verziju i stanje
azd version
azd config list

# Provjeri Azure autentifikaciju
az account show
az account list

# Provjeri trenutno okruženje
azd env show
azd env get-values

# Omogući zapisivanje za debugiranje
export AZD_DEBUG=true
azd <command> --debug
```

## Problemi s autentifikacijom

### Problem: "Nije uspjelo dobivanje pristupnog tokena"
**Simptomi:**
- `azd up` ne uspijeva s pogreškama autentifikacije
- Naredbe vraćaju "neautorizirano" ili "pristup odbijen"

**Rješenja:**
```bash
# 1. Ponovno se autentificirajte pomoću Azure CLI
az login
az account show

# 2. Očistite predmemorirane vjerodajnice
az account clear
az login

# 3. Koristite tok koda uređaja (za sustave bez glave)
az login --use-device-code

# 4. Postavite eksplicitnu pretplatu
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Nedovoljne privilegije" tijekom implementacije
**Simptomi:**
- Implementacija ne uspijeva s pogreškama dozvola
- Nemogućnost stvaranja određenih Azure resursa

**Rješenja:**
```bash
# 1. Provjerite svoje Azure dodjele uloga
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Osigurajte da imate potrebne uloge
# - Suradnik (za stvaranje resursa)
# - Administrator korisničkog pristupa (za dodjelu uloga)

# 3. Kontaktirajte svog Azure administratora za odgovarajuće dozvole
```

### Problem: Problemi s autentifikacijom u više tenanata
**Rješenja:**
```bash
# 1. Prijavite se s određenim zakupcem
az login --tenant "your-tenant-id"

# 2. Postavite zakupca u konfiguraciji
azd config set auth.tenantId "your-tenant-id"

# 3. Očistite predmemoriju zakupca ako mijenjate zakupce
az account clear
```

## 🏗️ Pogreške u postavljanju infrastrukture

### Problem: Sukobi u nazivima resursa
**Simptomi:**
- Pogreške "Naziv resursa već postoji"
- Implementacija ne uspijeva tijekom stvaranja resursa

**Rješenja:**
```bash
# 1. Koristite jedinstvena imena resursa s tokenima
# U vašem Bicep predlošku:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Promijenite naziv okruženja
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Očistite postojeće resurse
azd down --force --purge
```

### Problem: Lokacija/regija nije dostupna
**Simptomi:**
- "Lokacija 'xyz' nije dostupna za vrstu resursa"
- Određeni SKU-ovi nisu dostupni u odabranoj regiji

**Rješenja:**
```bash
# 1. Provjerite dostupne lokacije za vrste resursa
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Koristite uobičajeno dostupne regije
azd config set defaults.location eastus2
# ili
azd env set AZURE_LOCATION eastus2

# 3. Provjerite dostupnost usluge po regijama
# Posjetite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Pogreške prekoračenja kvote
**Simptomi:**
- "Prekoračena kvota za vrstu resursa"
- "Dosegnut maksimalan broj resursa"

**Rješenja:**
```bash
# 1. Provjerite trenutnu upotrebu kvote
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
- Neuspjeh validacije predloška
- Sintaktičke pogreške u Bicep datotekama

**Rješenja:**
```bash
# 1. Provjerite sintaksu Bicep-a
az bicep build --file infra/main.bicep

# 2. Koristite Bicep linter
az bicep lint --file infra/main.bicep

# 3. Provjerite sintaksu datoteke parametara
cat infra/main.parameters.json | jq '.'

# 4. Pregledajte promjene implementacije
azd provision --preview
```

## 🚀 Neuspjele implementacije

### Problem: Pogreške u izgradnji
**Simptomi:**
- Aplikacija ne uspijeva izgraditi tijekom implementacije
- Pogreške pri instalaciji paketa

**Rješenja:**
```bash
# 1. Provjerite zapisnike izgradnje
azd logs --service web
azd deploy --service web --debug

# 2. Testirajte izgradnju lokalno
cd src/web
npm install
npm run build

# 3. Provjerite kompatibilnost verzije Node.js/Python
node --version  # Treba odgovarati postavkama u azure.yaml
python --version

# 4. Očistite predmemoriju izgradnje
rm -rf node_modules package-lock.json
npm install

# 5. Provjerite Dockerfile ako koristite kontejnere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Neuspjele implementacije kontejnera
**Simptomi:**
- Kontejnerske aplikacije ne uspijevaju pokrenuti
- Pogreške pri povlačenju slike

**Rješenja:**
```bash
# 1. Testiraj lokalnu izgradnju Dockera
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Provjeri logove kontejnera
azd logs --service api --follow

# 3. Provjeri pristup registru kontejnera
az acr login --name myregistry

# 4. Provjeri konfiguraciju aplikacije kontejnera
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Pogreške u povezivanju s bazom podataka
**Simptomi:**
- Aplikacija se ne može povezati s bazom podataka
- Pogreške vremenskog isteka veze

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
- Varijable okruženja se čine praznima

**Rješenja:**
```bash
# 1. Provjerite jesu li postavljene varijable okruženja
azd env get-values
azd env get DATABASE_URL

# 2. Provjerite nazive varijabli u azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Ponovno pokrenite aplikaciju
azd deploy --service web

# 4. Provjerite konfiguraciju usluge aplikacije
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemi s SSL/TLS certifikatima
**Simptomi:**
- HTTPS ne radi
- Pogreške validacije certifikata

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
- Blokiran zahtjev zbog cross-origin pravila

**Rješenja:**
```bash
# 1. Konfigurirajte CORS za App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Ažurirajte API za rukovanje CORS-om
# U Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Provjerite radi li na ispravnim URL-ovima
azd show
```

## 🌍 Problemi s upravljanjem okruženjem

### Problem: Problemi s prebacivanjem okruženja
**Simptomi:**
- Koristi se pogrešno okruženje
- Konfiguracija se ne prebacuje ispravno

**Rješenja:**
```bash
# 1. Popis svih okruženja
azd env list

# 2. Izričito odabrati okruženje
azd env select production

# 3. Provjeriti trenutno okruženje
azd env show

# 4. Stvoriti novo okruženje ako je oštećeno
azd env new production-new
azd env select production-new
```

### Problem: Korupcija okruženja
**Simptomi:**
- Okruženje pokazuje nevažeće stanje
- Resursi ne odgovaraju konfiguraciji

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
- Vremenska ograničenja tijekom implementacije

**Rješenja:**
```bash
# 1. Omogući paralelno postavljanje
azd config set deploy.parallelism 5

# 2. Koristi inkrementalna postavljanja
azd deploy --incremental

# 3. Optimiziraj proces izgradnje
# U package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Provjeri lokacije resursa (koristi istu regiju)
azd config set defaults.location eastus2
```

### Problem: Problemi s performansama aplikacije
**Simptomi:**
- Sporo vrijeme odziva
- Visoka potrošnja resursa

**Rješenja:**
```bash
# 1. Povećajte resurse
# Ažurirajte SKU u main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Omogućite praćenje Application Insights
azd monitor

# 3. Provjerite zapisnike aplikacije za uska grla
azd logs --service api --follow

# 4. Implementirajte predmemoriranje
# Dodajte Redis predmemoriju u svoju infrastrukturu
```

## 🛠️ Alati i naredbe za otklanjanje pogrešaka

### Naredbe za otklanjanje pogrešaka
```bash
# Sveobuhvatno ispravljanje pogrešaka
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Provjeri informacije o sustavu
azd info

# Potvrdi konfiguraciju
azd config validate

# Testiraj povezivost
curl -v https://myapp.azurewebsites.net/health
```

### Analiza logova
```bash
# Dnevnici aplikacije
azd logs --service web --follow
azd logs --service api --since 1h

# Dnevnici resursa Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dnevnici kontejnera (za aplikacije u kontejnerima)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Istraživanje resursa
```bash
# Popis svih resursa
az resource list --resource-group myrg -o table

# Provjeri status resursa
az webapp show --name myapp --resource-group myrg --query state

# Dijagnostika mreže
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dodatna pomoć

### Kada eskalirati
- Problemi s autentifikacijom traju nakon svih pokušaja rješavanja
- Problemi s infrastrukturom Azure usluga
- Problemi vezani uz naplatu ili pretplatu
- Sigurnosni problemi ili incidenti

### Kanali podrške
```bash
# 1. Provjerite Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Kreirajte Azure podršku tiket
# Idite na: https://portal.azure.com -> Pomoć + podrška

# 3. Resursi zajednice
# - Stack Overflow: oznaka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacije koje treba prikupiti
Prije kontaktiranja podrške, prikupite:
- Izlaz `azd version`
- Izlaz `azd info`
- Poruke o pogreškama (cijeli tekst)
- Korake za reprodukciju problema
- Detalje o okruženju (`azd env show`)
- Vremenski okvir kada je problem započeo

### Skripta za prikupljanje logova
```bash
#!/bin/bash
# prikupi-debug-info.sh

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

## 📊 Prevencija problema

### Popis za provjeru prije implementacije
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

# 5. Koristite implementacije probnog pokretanja
azd provision --preview
```

### Postavljanje praćenja
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
# Tjedni zdravstveni pregledi
./scripts/health-check.sh

# Mjesečni pregled troškova
az consumption usage list --billing-period-name 202401

# Tromjesečni pregled sigurnosti
az security assessment list --resource-group myrg
```

## Povezani resursi

- [Vodič za otklanjanje pogrešaka](debugging.md) - Napredne tehnike otklanjanja pogrešaka
- [Postavljanje resursa](../deployment/provisioning.md) - Rješavanje problema s infrastrukturom
- [Planiranje kapaciteta](../pre-deployment/capacity-planning.md) - Smjernice za planiranje resursa
- [Odabir SKU-a](../pre-deployment/sku-selection.md) - Preporuke za razine usluga

---

**Savjet**: Ovaj vodič držite označenim i koristite ga kad god naiđete na probleme. Većina problema već je viđena i ima utvrđena rješenja!

---

**Navigacija**
- **Prethodna lekcija**: [Postavljanje resursa](../deployment/provisioning.md)
- **Sljedeća lekcija**: [Vodič za otklanjanje pogrešaka](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->