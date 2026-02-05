# Levinumad probleemid ja lahendused

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine peatükk**: [Peatükk 6: Eelkontrollid](../pre-deployment/preflight-checks.md)
- **➡️ Järgmine**: [Silumisjuhend](debugging.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Tootmine ja ettevõtte mustrid](../microsoft-foundry/production-ai-practices.md)

## Sissejuhatus

See põhjalik tõrkeotsingu juhend käsitleb kõige sagedamini esinevaid probleeme Azure Developer CLI kasutamisel. Õpi tuvastama, lahendama ja ennetama probleeme, mis on seotud autentimise, juurutamise, infrastruktuuri loomise ja rakenduse seadistamisega. Iga probleemi juures on toodud sümptomid, põhjused ja samm-sammuline lahendus.

## Õppimise eesmärgid

Selle juhendi läbimise järel:
- Oskad kasutada diagnostikatehnikaid Azure Developer CLI probleemide lahendamiseks
- Mõistad autentimise ja õigustega seotud probleemide põhjuseid ja lahendusi
- Lahendad juurutamise tõrkeid, infrastruktuuri loomise vigu ja seadistamisprobleeme
- Rakendad ennetavat monitooringut ja silumisstrateegiaid
- Kasutad süsteemset tõrkeotsingu metoodikat keeruliste probleemide lahendamiseks
- Seadistad korrektse logimise ja monitooringu, et vältida tulevasi probleeme

## Õpitulemused

Pärast juhendi läbimist suudad:
- Tuvastada Azure Developer CLI probleeme sisseehitatud diagnostikavahendite abil
- Lahendada autentimise, tellimuste ja õigustega seotud probleeme iseseisvalt
- Tõhusalt tõrkeotsingut teha juurutamise ja infrastruktuuri loomise vigade korral
- Siluda rakenduse seadistamise ja keskkonnaspetsiifilisi probleeme
- Rakendada monitooringut ja häireid, et ennetada võimalikke probleeme
- Kasutada parimaid tavasid logimise, silumise ja probleemide lahendamise töövoogude jaoks

## Kiirdiagnostika

Enne konkreetsete probleemide juurde asumist käivita need käsud, et koguda diagnostilist teavet:

```bash
# Kontrolli azd versiooni ja tervist
azd version
azd config list

# Kinnita Azure autentimine
az account show
az account list

# Kontrolli praegust keskkonda
azd env show
azd env get-values

# Luba silumise logimine
export AZD_DEBUG=true
azd <command> --debug
```

## Autentimise probleemid

### Probleem: "Ei õnnestunud saada juurdepääsuluba"
**Sümptomid:**
- `azd up` ebaõnnestub autentimisvigadega
- Käsud tagastavad "volitamata" või "juurdepääs keelatud"

**Lahendused:**
```bash
# 1. Autendi uuesti Azure CLI-ga
az login
az account show

# 2. Tühjenda vahemällu salvestatud mandaadid
az account clear
az login

# 3. Kasuta seadme koodi voogu (peata süsteemide jaoks)
az login --use-device-code

# 4. Määra konkreetne tellimus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Ebapiisavad õigused" juurutamise ajal
**Sümptomid:**
- Juurutamine ebaõnnestub õiguste vigade tõttu
- Ei saa luua teatud Azure'i ressursse

**Lahendused:**
```bash
# 1. Kontrollige oma Azure'i rollide määramisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Veenduge, et teil on vajalikud rollid
# - Kaastööline (ressursside loomiseks)
# - Kasutaja juurdepääsu administraator (rollide määramiseks)

# 3. Võtke ühendust oma Azure'i administraatoriga, et saada sobivad õigused
```

### Probleem: Multi-tenant autentimise probleemid
**Lahendused:**
```bash
# 1. Logi sisse konkreetse rentnikuga
az login --tenant "your-tenant-id"

# 2. Määra rentnik konfiguratsioonis
azd config set auth.tenantId "your-tenant-id"

# 3. Tühjenda rentniku vahemälu, kui rentnikke vahetatakse
az account clear
```

## 🏗️ Infrastruktuuri loomise vead

### Probleem: Ressursi nimede konfliktid
**Sümptomid:**
- "Ressursi nimi on juba olemas" vead
- Juurutamine ebaõnnestub ressursside loomise ajal

**Lahendused:**
```bash
# 1. Kasuta unikaalseid ressursinimesid koos tokenitega
# Oma Bicep mallis:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Muuda keskkonna nime
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Puhasta olemasolevad ressursid
azd down --force --purge
```

### Probleem: Asukoht/piirkond pole saadaval
**Sümptomid:**
- "Asukoht 'xyz' pole saadaval ressursitüübi jaoks"
- Teatud SKU-d pole valitud piirkonnas saadaval

**Lahendused:**
```bash
# 1. Kontrolli ressurssitüüpide jaoks saadaolevaid asukohti
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Kasuta tavaliselt saadaolevaid piirkondi
azd config set defaults.location eastus2
# või
azd env set AZURE_LOCATION eastus2

# 3. Kontrolli teenuse saadavust piirkonna järgi
# Külastage: https://azure.microsoft.com/global-infrastructure/services/
```

### Probleem: Kvoodi ületamise vead
**Sümptomid:**
- "Kvoot ületatud ressursitüübi jaoks"
- "Ressursside maksimaalne arv saavutatud"

**Lahendused:**
```bash
# 1. Kontrolli praegust kvoodi kasutust
az vm list-usage --location eastus2 -o table

# 2. Taotle kvoodi suurendamist Azure portaalis
# Mine: Tellimused > Kasutus + kvoodid

# 3. Kasuta arenduseks väiksemaid SKU-sid
# Failis main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Puhasta kasutamata ressursid
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probleem: Bicep-mallide vead
**Sümptomid:**
- Malli valideerimise vead
- Sünaksivead Bicep-failides

**Lahendused:**
```bash
# 1. Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep

# 2. Kasuta Bicep linterit
az bicep lint --file infra/main.bicep

# 3. Kontrolli parameetrifaili süntaksit
cat infra/main.parameters.json | jq '.'

# 4. Vaata üle juurutamise muudatused
azd provision --preview
```

## 🚀 Juurutamise tõrked

### Probleem: Ehituse vead
**Sümptomid:**
- Rakenduse ehitamine ebaõnnestub juurutamise ajal
- Pakettide installimise vead

**Lahendused:**
```bash
# 1. Kontrolli ehituse logisid
azd logs --service web
azd deploy --service web --debug

# 2. Testi ehitust lokaalselt
cd src/web
npm install
npm run build

# 3. Kontrolli Node.js/Pythoni versiooni ühilduvust
node --version  # Peaks vastama azure.yaml seadetele
python --version

# 4. Tühjenda ehituse vahemälu
rm -rf node_modules package-lock.json
npm install

# 5. Kontrolli Dockerfile'i, kui kasutad konteinereid
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Konteineri juurutamise vead
**Sümptomid:**
- Konteinerirakendused ei käivitu
- Kujutise tõmbamise vead

**Lahendused:**
```bash
# 1. Testi Dockeri ehitust kohapeal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontrolli konteineri logisid
azd logs --service api --follow

# 3. Kinnita konteineri registri juurdepääs
az acr login --name myregistry

# 4. Kontrolli konteineri rakenduse konfiguratsiooni
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Andmebaasi ühenduse vead
**Sümptomid:**
- Rakendus ei saa andmebaasiga ühendust
- Ühenduse ajalõpu vead

**Lahendused:**
```bash
# 1. Kontrolli andmebaasi tulemüüri reegleid
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testi ühenduvust rakendusest
# Lisa oma rakendusse ajutiselt:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Kinnita ühenduse stringi formaat
azd env get-values | grep DATABASE

# 4. Kontrolli andmebaasi serveri olekut
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Seadistamise probleemid

### Probleem: Keskkonnamuutujad ei tööta
**Sümptomid:**
- Rakendus ei loe konfiguratsiooniväärtusi
- Keskkonnamuutujad tunduvad tühjad

**Lahendused:**
```bash
# 1. Kontrolli, et keskkonnamuutujad on seadistatud
azd env get-values
azd env get DATABASE_URL

# 2. Kontrolli muutuja nimesid failis azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Taaskäivita rakendus
azd deploy --service web

# 4. Kontrolli rakenduse teenuse konfiguratsiooni
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probleem: SSL/TLS sertifikaadi probleemid
**Sümptomid:**
- HTTPS ei tööta
- Sertifikaadi valideerimise vead

**Lahendused:**
```bash
# 1. Kontrolli SSL-sertifikaadi olekut
az webapp config ssl list --resource-group myrg

# 2. Luba ainult HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisa kohandatud domeen (kui vaja)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS-i konfiguratsiooni probleemid
**Sümptomid:**
- Frontend ei saa API-d kutsuda
- Ristpäritolu päring blokeeritud

**Lahendused:**
```bash
# 1. Konfigureeri CORS App Service jaoks
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Uuenda API, et käsitleda CORS-i
# Express.js-is:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontrolli, kas töötab õigete URL-ide peal
azd show
```

## 🌍 Keskkonna haldamise probleemid

### Probleem: Keskkonna vahetamise probleemid
**Sümptomid:**
- Kasutatakse valet keskkonda
- Konfiguratsioon ei vahetu õigesti

**Lahendused:**
```bash
# 1. Loetle kõik keskkonnad
azd env list

# 2. Vali keskkond selgesõnaliselt
azd env select production

# 3. Kontrolli praegust keskkonda
azd env show

# 4. Loo uus keskkond, kui see on rikutud
azd env new production-new
azd env select production-new
```

### Probleem: Keskkonna rikutus
**Sümptomid:**
- Keskkond näitab kehtetut olekut
- Ressursid ei vasta konfiguratsioonile

**Lahendused:**
```bash
# 1. Värskenda keskkonna olekut
azd env refresh

# 2. Lähtesta keskkonna konfiguratsioon
azd env new production-reset
# Kopeeri vajalikud keskkonnamuutujad
azd env set DATABASE_URL "your-value"

# 3. Impordi olemasolevad ressursid (kui võimalik)
# Uuenda käsitsi .azure/production/config.json ressursi ID-dega
```

## 🔍 Jõudlusprobleemid

### Probleem: Aeglased juurutusajad
**Sümptomid:**
- Juurutused võtavad liiga kaua aega
- Ajalõpud juurutamise ajal

**Lahendused:**
```bash
# 1. Luba paralleelne juurutamine
azd config set deploy.parallelism 5

# 2. Kasuta järk-järgulist juurutamist
azd deploy --incremental

# 3. Optimeeri ehitusprotsessi
# Failis package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontrolli ressursside asukohti (kasuta sama piirkonda)
azd config set defaults.location eastus2
```

### Probleem: Rakenduse jõudlusprobleemid
**Sümptomid:**
- Aeglased vastusajad
- Kõrge ressursikasutus

**Lahendused:**
```bash
# 1. Suurenda ressursside mahtu
# Uuenda SKU failis main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Luba Application Insights monitooring
azd monitor

# 3. Kontrolli rakenduse logisid kitsaskohtade leidmiseks
azd logs --service api --follow

# 4. Rakenda vahemälu
# Lisa Redis vahemälu oma infrastruktuuri
```

## 🛠️ Tõrkeotsingu tööriistad ja käsud

### Silumiskäsud
```bash
# Põhjalik silumine
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontrolli süsteemi infot
azd info

# Kinnita konfiguratsioon
azd config validate

# Testi ühenduvust
curl -v https://myapp.azurewebsites.net/health
```

### Logide analüüs
```bash
# Rakenduse logid
azd logs --service web --follow
azd logs --service api --since 1h

# Azure'i ressursi logid
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteineri logid (konteinerrakenduste jaoks)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressursside uurimine
```bash
# Loetle kõik ressursid
az resource list --resource-group myrg -o table

# Kontrolli ressursi olekut
az webapp show --name myapp --resource-group myrg --query state

# Võrgu diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Lisainfo saamine

### Millal eskaleerida
- Autentimisprobleemid püsivad pärast kõigi lahenduste proovimist
- Infrastruktuuriprobleemid Azure'i teenustega
- Arveldus- või tellimusega seotud probleemid
- Turvalisuse probleemid või intsidendid

### Tugikanalid
```bash
# 1. Kontrolli Azure'i teenuse tervist
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Loo Azure'i tugipilet
# Mine: https://portal.azure.com -> Abi + tugi

# 3. Kogukonna ressursid
# - Stack Overflow: azure-developer-cli silt
# - GitHubi probleemid: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Kogutav teave
Enne toe poole pöördumist kogu:
- `azd version` väljund
- `azd info` väljund
- Veateated (täistekst)
- Sammud probleemi taastootmiseks
- Keskkonna üksikasjad (`azd env show`)
- Ajakava, millal probleem algas

### Logide kogumise skript
```bash
#!/bin/bash
# kogu-veaotsingu-info.sh

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

## 📊 Probleemide ennetamine

### Eeljuurutamise kontrollnimekiri
```bash
# 1. Kinnita autentimine
az account show

# 2. Kontrolli kvoote ja piiranguid
az vm list-usage --location eastus2

# 3. Kinnita mallid
az bicep build --file infra/main.bicep

# 4. Testi esmalt kohapeal
npm run build
npm run test

# 5. Kasuta kuivkäivituse juurutusi
azd provision --preview
```

### Monitooringu seadistamine
```bash
# Luba Application Insights
# Lisa main.bicep faili:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Seadista teavitused
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regulaarne hooldus
```bash
# Iganädalased tervisekontrollid
./scripts/health-check.sh

# Igakuine kulude ülevaade
az consumption usage list --billing-period-name 202401

# Kvartaalne turvalisuse ülevaade
az security assessment list --resource-group myrg
```

## Seotud ressursid

- [Silumisjuhend](debugging.md) - Täiustatud silumistehnikad
- [Ressursside loomine](../deployment/provisioning.md) - Infrastruktuuri tõrkeotsing
- [Mahutavuse planeerimine](../pre-deployment/capacity-planning.md) - Ressursside planeerimise juhend
- [SKU valik](../pre-deployment/sku-selection.md) - Teenuse tasemete soovitused

---

**Nõuanne**: Hoia see juhend järjehoidjates ja kasuta seda alati, kui tekib probleeme. Enamik probleeme on varem esinenud ja neil on olemas lahendused!

---

**Navigeerimine**
- **Eelmine õppetund**: [Ressursside loomine](../deployment/provisioning.md)
- **Järgmine õppetund**: [Silumisjuhend](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->