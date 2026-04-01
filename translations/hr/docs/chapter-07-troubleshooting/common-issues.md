# Česti problemi i rješenja

**Navigacija poglavljem:**
- **📚 Početna stranica kolegija**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Otklanjanje poteškoća i ispravljanje pogrešaka
- **⬅️ Prethodno poglavlje**: [Poglavlje 6: Provjere prije implementacije](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Sljedeće**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 8: Obrasci za proizvodnju i poduzeće](../chapter-08-production/production-ai-practices.md)

## Uvod

Ovaj sveobuhvatni vodič za otklanjanje poteškoća pokriva najčešće probleme na koje korisnici nailaze prilikom korištenja Azure Developer CLI. Naučite kako dijagnosticirati, otkloniti i riješiti uobičajene probleme s autentifikacijom, implementacijom, osiguravanjem infrastrukture i konfiguracijom aplikacija. Svaki problem uključuje detaljne simptome, osnovne uzroke i postupke korak-po-korak za rješavanje.

## Ciljevi učenja

Nakon što završite ovaj vodič, moći ćete:
- Ovladati tehnikama dijagnostike problema s Azure Developer CLI-jem
- Razumjeti uobičajene probleme s autentifikacijom i dozvolama i njihova rješenja
- Riješiti neuspjehe prilikom implementacije, pogreške u osiguravanju infrastrukture i probleme s konfiguracijom
- Primijeniti proaktivne strategije nadzora i ispravljanja pogrešaka
- Koristiti sustavne metode otklanjanja problema za složene izazove
- Konfigurirati odgovarajuće zapisivanje i nadzor kako biste spriječili buduće probleme

## Ishodi učenja

Po završetku moći ćete:
- Dijagnosticirati probleme s Azure Developer CLI-jem koristeći ugrađene dijagnostičke alate
- Samostalno riješiti probleme s autentifikacijom, pretplatama i dozvolama
- Učinkovito otklanjati neuspjehe implementacije i pogreške u osiguranju infrastrukture
- Ispravljati probleme s konfiguracijom aplikacija i specifične probleme ovisno o okruženju
- Implementirati nadzor i upozorenja za proaktivno otkrivanje potencijalnih problema
- Primijeniti najbolje prakse za zapisivanje, ispravljanje pogrešaka i tijekove rješavanja problema

## Brza dijagnostika

Prije nego što krenete u rješavanje specifičnih problema, pokrenite ove naredbe za prikupljanje dijagnostičkih informacija:

```bash
# Provjeri verziju i stanje azd
azd version
azd config show

# Provjeri Azure autentifikaciju
az account show
az account list

# Provjeri trenutno okruženje
azd env list
azd env get-values

# Omogući zapisivanje debug logova
export AZD_DEBUG=true
azd <command> --debug
```

## Problemi s autentifikacijom

### Problem: "Neuspjeh u dobivanju pristupnog tokena"
**Simptomi:**
- `azd up` ne uspijeva s pogreškama autentifikacije
- Naredbe vraćaju "neautorizirano" ili "pristup odbijen"

**Rješenja:**
```bash
# 1. Ponovno se autentificirajte pomoću Azure CLI-ja
az login
az account show

# 2. Očistite pohranjene vjerodajnice
az account clear
az login

# 3. Koristite tijek koda uređaja (za sustave bez glave)
az login --use-device-code

# 4. Postavite eksplicitnu pretplatu
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Nedostatak privilegija" tijekom implementacije
**Simptomi:**
- Implementacija ne uspijeva zbog pogrešaka s dozvolama
- Nije moguće stvoriti određene Azure resurse

**Rješenja:**
```bash
# 1. Provjerite svoje Azure dodjele uloga
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Osigurajte da imate potrebne uloge
# - Suradnik (za stvaranje resursa)
# - Administrator pristupa korisnika (za dodjele uloga)

# 3. Kontaktirajte svog Azure administratora za odgovarajuće ovlasti
```

### Problem: Problemi s autentifikacijom za više zakupaca
**Rješenja:**
```bash
# 1. Prijavite se s određenim zakupcem
az login --tenant "your-tenant-id"

# 2. Postavite zakupca u konfiguraciji
azd config set auth.tenantId "your-tenant-id"

# 3. Očistite predmemoriju zakupca ako se mijenjaju zakupci
az account clear
```

## 🏗️ Pogreške pri osiguravanju infrastrukture

### Problem: Sukobi naziva resursa
**Simptomi:**
- Pogreške "Naziv resursa već postoji"
- Implementacija ne uspijeva tijekom stvaranja resursa

**Rješenja:**
```bash
# 1. Koristite jedinstvene nazive resursa s tokenima
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
- "Lokacija 'xyz' nije dostupna za tip resursa"
- Određeni SKU-ovi nisu dostupni u odabranoj regiji

**Rješenja:**
```bash
# 1. Provjerite dostupne lokacije za vrste resursa
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Koristite često dostupne regije
azd config set defaults.location eastus2
# ili
azd env set AZURE_LOCATION eastus2

# 3. Provjerite dostupnost usluge prema regiji
# Posjetite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Prekoračenje kvota
**Simptomi:**
- "Prekoračena kvota za tip resursa"
- "Dosegnut maksimalan broj resursa"

**Rješenja:**
```bash
# 1. Provjerite trenutno korištenje kvote
az vm list-usage --location eastus2 -o table

# 2. Zatražite povećanje kvote putem Azure portala
# Idite na: Pretplate > Korištenje + kvote

# 3. Koristite manje SKU-ove za razvoj
# U main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Očistite nekorištene resurse
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Pogreške u Bicep predlošku
**Simptomi:**
- Neuspješna validacija predloška
- Sintaksne pogreške u Bicep datotekama

**Rješenja:**
```bash
# 1. Validirajte Bicep sintaksu
az bicep build --file infra/main.bicep

# 2. Koristite Bicep linter
az bicep lint --file infra/main.bicep

# 3. Provjerite sintaksu datoteke s parametrima
cat infra/main.parameters.json | jq '.'

# 4. Pregledajte promjene u implementaciji
azd provision --preview
```

## 🚀 Neuspjesi implementacije

### Problem: Neuspjesi prilikom izrade (build)
**Simptomi:**
- Aplikacija ne uspijeva izgraditi se tijekom implementacije
- Pogreške pri instalaciji paketa

**Rješenja:**
```bash
# 1. Provjerite izlaz gradnje s uključenim debug zastavicom
azd deploy --service web --debug

# 2. Pogledajte status postavljene usluge
azd show

# 3. Testirajte gradnju lokalno
cd src/web
npm install
npm run build

# 3. Provjerite kompatibilnost verzija Node.js/Python
node --version  # Trebalo bi odgovarati postavkama azure.yaml
python --version

# 4. Očistite predmemoriju gradnje
rm -rf node_modules package-lock.json
npm install

# 5. Provjerite Dockerfile ako koristite kontejnere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Neuspjesi u implementaciji kontejnera
**Simptomi:**
- Container aplikacije ne uspijevaju pokrenuti se
- Pogreške prilikom preuzimanja slika

**Rješenja:**
```bash
# 1. Testirajte Docker izgradnju lokalno
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Provjerite zapise kontejnera pomoću Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Pratite aplikaciju putem azd
azd monitor --logs

# 3. Provjerite pristup registru kontejnera
az acr login --name myregistry

# 4. Provjerite konfiguraciju aplikacije kontejnera
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Neuspjesi povezivanja na bazu podataka
**Simptomi:**
- Aplikacija se ne može spojiti na bazu podataka
- Pogreške isteka veze

**Rješenja:**
```bash
# 1. Provjerite pravila vatrozida baze podataka
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testirajte povezivost iz aplikacije
# Privremeno dodajte u svoju aplikaciju:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Provjerite format veze stringa
azd env get-values | grep DATABASE

# 4. Provjerite status poslužitelja baze podataka
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemi s konfiguracijom

### Problem: Varijable okruženja ne rade
**Simptomi:**
- Aplikacija ne može pročitati vrijednosti konfiguracije
- Varijable okruženja izgledaju prazne

**Rješenja:**
```bash
# 1. Provjerite jesu li varijable okruženja postavljene
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
- Pogreške provjere certifikata

**Rješenja:**
```bash
# 1. Provjerite status SSL certifikata
az webapp config ssl list --resource-group myrg

# 2. Omogući samo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodajte prilagođenu domenu (ako je potrebno)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemi s konfiguracijom CORS-a
**Simptomi:**
- Frontend ne može pozvati API
- Zahtjev s drugog podrijetla blokiran

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

## 🌍 Problemi upravljanja okruženjem

### Problem: Problemi sa skakanjem između okruženja
**Simptomi:**
- Koristi se pogrešno okruženje
- Konfiguracija se ne mijenja pravilno

**Rješenja:**
```bash
# 1. Nabrojite sva okruženja
azd env list

# 2. Izričito odaberite okruženje
azd env select production

# 3. Provjerite trenutno okruženje
azd env list

# 4. Kreirajte novo okruženje ako je oštećeno
azd env new production-new
azd env select production-new
```

### Problem: Oštećenje okruženja
**Simptomi:**
- Okruženje prikazuje nevažeće stanje
- Resursi se ne podudaraju s konfiguracijom

**Rješenja:**
```bash
# 1. Osvježi stanje okoline
azd env refresh

# 2. Resetiraj konfiguraciju okoline
azd env new production-reset
# Kopiraj potrebne varijable okoline
azd env set DATABASE_URL "your-value"

# 3. Uvezi postojeće resurse (ako je moguće)
# Ručno ažuriraj .azure/production/config.json s ID-ovima resursa
```

## 🔍 Problemi s performansama

### Problem: Sporo vrijeme implementacije
**Simptomi:**
- Implementacije traju predugo
- Vrijeme prekida prilikom implementacije

**Rješenja:**
```bash
# 1. Implementirajte specifične usluge za bržu iteraciju
azd deploy --service web
azd deploy --service api

# 2. Koristite implementaciju samo koda kada se infrastruktura ne mijenja
azd deploy  # Brže od azd up

# 3. Optimizirajte proces izgradnje
# U package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Provjerite lokacije resursa (koristite isti regija)
azd config set defaults.location eastus2
```

### Problem: Problemi s performansama aplikacije
**Simptomi:**
- Spori odgovori
- Visoka potrošnja resursa

**Rješenja:**
```bash
# 1. Povećajte resurse
# Ažurirajte SKU u main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Omogućite nadzor Application Insights
azd monitor --overview

# 3. Provjerite zapisnike aplikacije u Azureu
az webapp log tail --name myapp --resource-group myrg
# ili za Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementirajte keširanje
# Dodajte Redis keš u vašu infrastrukturu
```

## 🛠️ Alati i naredbe za otklanjanje poteškoća

### Naredbe za ispravljanje pogrešaka
```bash
# Sveobuhvatno otklanjanje pogrešaka
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Provjerite verziju azd
azd version

# Prikaži trenutnu konfiguraciju
azd config show

# Testiraj povezanost
curl -v https://myapp.azurewebsites.net/health
```

### Analiza dnevnika
```bash
# Dnevnici aplikacije putem Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Nadzirite aplikaciju pomoću azd
azd monitor --logs
azd monitor --live

# Dnevnici Azure resursa
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dnevnici kontejnera (za Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Istraživanje resursa
```bash
# Nabroji sve resurse
az resource list --resource-group myrg -o table

# Provjeri status resursa
az webapp show --name myapp --resource-group myrg --query state

# Mrežna dijagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dobivanje dodatne pomoći

### Kada eskalirati
- Problemi s autentifikacijom traju nakon isprobavanja svih rješenja
- Problemi s infrastrukturom kod Azure usluga
- Problemi vezani uz naplatu ili pretplate
- Sigurnosni problemi ili incidenti

### Kanali podrške
```bash
# 1. Provjerite zdravlje Azure usluge
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Kreirajte Azure zahtjev za podršku
# Idite na: https://portal.azure.com -> Pomoć + podrška

# 3. Resursi zajednice
# - Stack Overflow: oznaka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Pitanja i odgovori: https://learn.microsoft.com/en-us/answers/
```

### Podaci za prikupljanje
Prije kontaktiranja podrške prikupite:
- izlaz `azd version`
- izlaz `azd config show`
- izlaz `azd show` (trenutni status implementacije)
- poruke o pogrešci (puni tekst)
- korake za reprodukciju problema
- detalje o okruženju (`azd env get-values`)
- vremenski tijek početka problema

### Skripta za prikupljanje dnevnika
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

## 📊 Prevencija problema

### Popis prije implementacije
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

# 5. Koristite suho pokretanje implementacija
azd provision --preview
```

### Postavljanje nadzora
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

# Tromjesečni sigurnosni pregled
az security assessment list --resource-group myrg
```

## Povezani resursi

- [Vodič za ispravljanje pogrešaka](debugging.md) - Napredne tehnike ispravljanja pogrešaka
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Otklanjanje problema s infrastrukturom
- [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md) - Smjernice za planiranje resursa
- [Odabir SKU-a](../chapter-06-pre-deployment/sku-selection.md) - Preporuke razina usluge

---

**Savjet**: Ovaj vodič imajte označen u pregledniku i koristite ga kad god naiđete na probleme. Većina problema je već viđena i imaju uspostavljena rješenja!

---

**Navigacija**
- **Prethodna lekcija**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Sljedeća lekcija**: [Vodič za ispravljanje pogrešaka](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument preveden je korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati službenim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->