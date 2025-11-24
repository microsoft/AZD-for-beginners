<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-23T21:26:50+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sl"
}
-->
# Pogoste težave in rešitve

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje poglavje**: [Poglavje 6: Predhodni pregledi](../pre-deployment/preflight-checks.md)
- **➡️ Naslednje**: [Vodnik za razhroščevanje](debugging.md)
- **🚀 Naslednje poglavje**: [Poglavje 8: Proizvodni in podjetniški vzorci](../microsoft-foundry/production-ai-practices.md)

## Uvod

Ta obsežen vodnik za odpravljanje težav zajema najpogostejše težave pri uporabi Azure Developer CLI. Naučite se diagnosticirati, odpravljati in reševati pogoste težave, povezane z avtentikacijo, uvajanjem, zagotavljanjem infrastrukture in konfiguracijo aplikacij. Vsaka težava vključuje podrobne simptome, osnovne vzroke in postopke za rešitev korak za korakom.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali diagnostične tehnike za težave z Azure Developer CLI
- Razumeli pogoste težave z avtentikacijo in dovoljenji ter njihove rešitve
- Reševali napake pri uvajanju, napake pri zagotavljanju infrastrukture in težave s konfiguracijo
- Uvedli proaktivne strategije za spremljanje in razhroščevanje
- Uporabili sistematične metodologije za odpravljanje kompleksnih težav
- Konfigurirali ustrezno beleženje in spremljanje za preprečevanje prihodnjih težav

## Rezultati učenja

Po zaključku boste sposobni:
- Diagnosticirati težave z Azure Developer CLI z uporabo vgrajenih diagnostičnih orodij
- Samostojno reševati težave, povezane z avtentikacijo, naročninami in dovoljenji
- Učinkovito odpravljati napake pri uvajanju in zagotavljanju infrastrukture
- Razhroščevati težave s konfiguracijo aplikacij in specifične težave okolja
- Uvesti spremljanje in opozarjanje za proaktivno prepoznavanje potencialnih težav
- Uporabiti najboljše prakse za beleženje, razhroščevanje in delovne tokove za reševanje težav

## Hitre diagnostike

Preden se lotite specifičnih težav, za zbiranje diagnostičnih informacij zaženite te ukaze:

```bash
# Preveri različico in stanje azd
azd version
azd config list

# Preveri avtentikacijo Azure
az account show
az account list

# Preveri trenutno okolje
azd env show
azd env get-values

# Omogoči beleženje odpravljanja napak
export AZD_DEBUG=true
azd <command> --debug
```

## Težave z avtentikacijo

### Težava: "Ni uspelo pridobiti dostopnega žetona"
**Simptomi:**
- `azd up` ne uspe z napakami pri avtentikaciji
- Ukazi vračajo "neavtorizirano" ali "dostop zavrnjen"

**Rešitve:**
```bash
# 1. Ponovno se prijavite z Azure CLI
az login
az account show

# 2. Počistite predpomnjene poverilnice
az account clear
az login

# 3. Uporabite tok kode naprave (za sisteme brez glave)
az login --use-device-code

# 4. Nastavite eksplicitno naročnino
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Težava: "Nezadostna dovoljenja" med uvajanjem
**Simptomi:**
- Uvajanje ne uspe z napakami dovoljenj
- Ne morete ustvariti določenih Azure virov

**Rešitve:**
```bash
# 1. Preverite svoje dodelitve vlog v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Prepričajte se, da imate zahtevane vloge
# - Sodelavec (za ustvarjanje virov)
# - Uporabniški skrbnik dostopa (za dodelitve vlog)

# 3. Obrnite se na svojega skrbnika Azure za ustrezna dovoljenja
```

### Težava: Težave z avtentikacijo v večnajemniškem okolju
**Rešitve:**
```bash
# 1. Prijava s specifičnim najemnikom
az login --tenant "your-tenant-id"

# 2. Nastavi najemnika v konfiguraciji
azd config set auth.tenantId "your-tenant-id"

# 3. Počisti predpomnilnik najemnika, če preklapljate najemnike
az account clear
```

## 🏗️ Napake pri zagotavljanju infrastrukture

### Težava: Konflikti imen virov
**Simptomi:**
- Napake "Ime vira že obstaja"
- Uvajanje ne uspe med ustvarjanjem virov

**Rešitve:**
```bash
# 1. Uporabite edinstvena imena virov s žetoni
# V vaši Bicep predlogi:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Spremenite ime okolja
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Očistite obstoječe vire
azd down --force --purge
```

### Težava: Lokacija/regija ni na voljo
**Simptomi:**
- "Lokacija 'xyz' ni na voljo za vrsto vira"
- Določeni SKU-ji niso na voljo v izbrani regiji

**Rešitve:**
```bash
# 1. Preverite razpoložljive lokacije za vrste virov
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Uporabite splošno dostopne regije
azd config set defaults.location eastus2
# ali
azd env set AZURE_LOCATION eastus2

# 3. Preverite razpoložljivost storitev po regijah
# Obiščite: https://azure.microsoft.com/global-infrastructure/services/
```

### Težava: Napake zaradi preseženih kvot
**Simptomi:**
- "Kvote presežene za vrsto vira"
- "Doseženo največje število virov"

**Rešitve:**
```bash
# 1. Preverite trenutno uporabo kvote
az vm list-usage --location eastus2 -o table

# 2. Zahtevajte povečanje kvote prek portala Azure
# Pojdite na: Naročnine > Uporaba + kvote

# 3. Uporabite manjše SKU-je za razvoj
# V main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Očistite neuporabljene vire
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Težava: Napake v Bicep predlogah
**Simptomi:**
- Napake pri validaciji predlog
- Sintaktične napake v Bicep datotekah

**Rešitve:**
```bash
# 1. Preveri sintakso Bicep
az bicep build --file infra/main.bicep

# 2. Uporabi Bicep linter
az bicep lint --file infra/main.bicep

# 3. Preveri sintakso datoteke s parametri
cat infra/main.parameters.json | jq '.'

# 4. Predogled sprememb uvajanja
azd provision --preview
```

## 🚀 Napake pri uvajanju

### Težava: Napake pri gradnji
**Simptomi:**
- Aplikacija ne uspe zgraditi med uvajanjem
- Napake pri nameščanju paketov

**Rešitve:**
```bash
# 1. Preveri dnevnik gradnje
azd logs --service web
azd deploy --service web --debug

# 2. Preizkusi gradnjo lokalno
cd src/web
npm install
npm run build

# 3. Preveri združljivost različic Node.js/Python
node --version  # Naj se ujema z nastavitvami v azure.yaml
python --version

# 4. Počisti predpomnilnik gradnje
rm -rf node_modules package-lock.json
npm install

# 5. Preveri Dockerfile, če uporabljaš kontejnere
docker build -t test-image .
docker run --rm test-image
```

### Težava: Napake pri uvajanju kontejnerjev
**Simptomi:**
- Kontejnerske aplikacije se ne zaženejo
- Napake pri pridobivanju slik

**Rešitve:**
```bash
# 1. Preizkusite lokalno gradnjo Dockerja
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Preverite dnevnike kontejnerja
azd logs --service api --follow

# 3. Preverite dostop do registra kontejnerjev
az acr login --name myregistry

# 4. Preverite konfiguracijo aplikacije kontejnerja
az containerapp show --name my-app --resource-group my-rg
```

### Težava: Napake pri povezavi z bazo podatkov
**Simptomi:**
- Aplikacija se ne more povezati z bazo podatkov
- Napake pri časovnem izteku povezave

**Rešitve:**
```bash
# 1. Preverite pravila požarnega zidu baze podatkov
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Preizkusite povezljivost iz aplikacije
# Dodajte začasno v svojo aplikacijo:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Preverite format povezovalnega niza
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
# 1. Preverite, ali so okoljske spremenljivke nastavljene
azd env get-values
azd env get DATABASE_URL

# 2. Preverite imena spremenljivk v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Znova zaženite aplikacijo
azd deploy --service web

# 4. Preverite konfiguracijo storitve aplikacije
az webapp config appsettings list --name myapp --resource-group myrg
```

### Težava: Težave s SSL/TLS certifikati
**Simptomi:**
- HTTPS ne deluje
- Napake pri validaciji certifikata

**Rešitve:**
```bash
# 1. Preverite stanje SSL certifikata
az webapp config ssl list --resource-group myrg

# 2. Omogočite samo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Dodajte prilagojeno domeno (če je potrebno)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Težava: Težave s konfiguracijo CORS
**Simptomi:**
- Frontend ne more klicati API-ja
- Blokirana zahteva med izvoroma

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

# 3. Preverite, ali se izvaja na pravilnih URL-jih
azd show
```

## 🌍 Težave z upravljanjem okolja

### Težava: Težave pri preklapljanju okolij
**Simptomi:**
- Uporablja se napačno okolje
- Konfiguracija se ne preklopi pravilno

**Rešitve:**
```bash
# 1. Naštej vsa okolja
azd env list

# 2. Izrecno izberi okolje
azd env select production

# 3. Preveri trenutno okolje
azd env show

# 4. Ustvari novo okolje, če je poškodovano
azd env new production-new
azd env select production-new
```

### Težava: Poškodba okolja
**Simptomi:**
- Okolje prikazuje neveljavno stanje
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
# Ročno posodobi .azure/production/config.json z ID-ji virov
```

## 🔍 Težave z zmogljivostjo

### Težava: Počasni časi uvajanja
**Simptomi:**
- Uvajanja trajajo predolgo
- Časovne omejitve med uvajanjem

**Rešitve:**
```bash
# 1. Omogoči vzporedno uvajanje
azd config set deploy.parallelism 5

# 2. Uporabi inkrementalna uvajanja
azd deploy --incremental

# 3. Optimiziraj proces gradnje
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Preveri lokacije virov (uporabi isto regijo)
azd config set defaults.location eastus2
```

### Težava: Težave z zmogljivostjo aplikacije
**Simptomi:**
- Počasni odzivni časi
- Visoka poraba virov

**Rešitve:**
```bash
# 1. Povečajte vire
# Posodobite SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Omogočite spremljanje Application Insights
azd monitor

# 3. Preverite dnevniške datoteke aplikacije za ozka grla
azd logs --service api --follow

# 4. Uvedite predpomnjenje
# Dodajte Redis predpomnilnik v svojo infrastrukturo
```

## 🛠️ Orodja in ukazi za odpravljanje težav

### Ukazi za razhroščevanje
```bash
# Celovito odpravljanje napak
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Preveri informacije o sistemu
azd info

# Preveri konfiguracijo
azd config validate

# Preizkusi povezljivost
curl -v https://myapp.azurewebsites.net/health
```

### Analiza dnevnikov
```bash
# Dnevniški zapisi aplikacije
azd logs --service web --follow
azd logs --service api --since 1h

# Dnevniški zapisi virov Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Dnevniški zapisi kontejnerjev (za aplikacije kontejnerjev)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Preiskava virov
```bash
# Naštej vse vire
az resource list --resource-group myrg -o table

# Preveri stanje vira
az webapp show --name myapp --resource-group myrg --query state

# Diagnostika omrežja
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Dodatna pomoč

### Kdaj eskalirati
- Težave z avtentikacijo vztrajajo po preizkusu vseh rešitev
- Težave z infrastrukturo pri Azure storitvah
- Težave, povezane z obračunavanjem ali naročninami
- Varnostni pomisleki ali incidenti

### Kanali za podporo
```bash
# 1. Preverite stanje storitve Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Ustvarite podporno vozovnico za Azure
# Pojdite na: https://portal.azure.com -> Pomoč + podpora

# 3. Skupnostni viri
# - Stack Overflow: oznaka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informacije, ki jih je treba zbrati
Preden se obrnete na podporo, zberite:
- Izhod `azd version`
- Izhod `azd info`
- Sporočila o napakah (celotno besedilo)
- Korake za reprodukcijo težave
- Podrobnosti o okolju (`azd env show`)
- Časovnico, kdaj se je težava začela

### Skripta za zbiranje dnevnikov
```bash
#!/bin/bash
# zbiranje-debug-informacij.sh

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

## 📊 Preprečevanje težav

### Seznam za preverjanje pred uvajanjem
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

# 5. Uporabi testne namestitve
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

# Četrtletni pregled varnosti
az security assessment list --resource-group myrg
```

## Sorodni viri

- [Vodnik za razhroščevanje](debugging.md) - Napredne tehnike razhroščevanja
- [Zagotavljanje virov](../deployment/provisioning.md) - Odpravljanje težav z infrastrukturo
- [Načrtovanje zmogljivosti](../pre-deployment/capacity-planning.md) - Smernice za načrtovanje virov
- [Izbira SKU](../pre-deployment/sku-selection.md) - Priporočila za izbiro storitvenih nivojev

---

**Nasvet**: Shranite ta vodnik med zaznamke in se nanj obrnite, kadar naletite na težave. Večina težav je že bila opažena in ima uveljavljene rešitve!

---

**Navigacija**
- **Prejšnja lekcija**: [Zagotavljanje virov](../deployment/provisioning.md)
- **Naslednja lekcija**: [Vodnik za razhroščevanje](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI prevajanja [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->