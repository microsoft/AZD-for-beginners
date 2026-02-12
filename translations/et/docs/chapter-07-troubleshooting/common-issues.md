# Levinumad probleemid ja lahendused

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine peatükk**: [Peatükk 6: Eelkontrollid](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Järgmine**: [Silumise juhend](debugging.md)
- **🚀 Järgmine peatükk**: [Peatükk 8: Tootmis- ja ettevõtete mustrid](../chapter-08-production/production-ai-practices.md)

## Sissejuhatus

See põhjalik tõrkeotsingu juhend hõlmab Azure Developer CLI kasutamisel kõige sagedamini esinevaid probleeme. Õppige diagnoosima, tõrkeotsingut tegema ja lahendama levinumaid probleeme autentimise, juurutamise, infrastruktuuri loomise ja rakenduse konfiguratsiooni osas. Iga probleemi puhul on toodud üksikasjalikud sümptomid, juurpõhjused ja samm-sammulised lahenduse juhised.

## Õpieesmärgid

Selle juhendi läbimisega:
- omandate diagnostikatehnikad Azure Developer CLI probleemide tuvastamiseks
- mõistate levinumaid autentimise ja õiguste probleeme ning nende lahendusi
- oskate lahendada juurutuse ebaõnnestumisi, infrastruktuuri loomise vigu ja konfiguratsiooniprobleeme
- rakendate proaktiivseid jälgimis- ja silumisstrateegiaid
- kasutate süsteemseid tõrkeotsingu metoodikaid keerukate probleemide puhul
- seadistate korraliku logimise ja jälgimise, et vältida tulevasi probleeme

## Õpitulemused

Pärast juhendi läbimist suudate:
- diagnoosida Azure Developer CLI probleeme sisseehitatud diagnostikavahenditega
- iseseisvalt lahendada autentimise, tellimuse ja õigustega seotud probleeme
- tõrkeotsinguga edukalt toime tulla juurutuse ebaõnnestumiste ja infrastruktuuri loomise vigadega
- siluda rakenduse konfiguratsiooni probleeme ja keskkonnapõhiseid erisusi
- rakendada jälgimist ja häireid, et proaktiivselt tuvastada võimalikke probleeme
- järgida parimaid tavasid logimise, silumise ja probleemilahenduse töövoogude jaoks

## Kiirdiagnostika

Enne konkreetsete probleemide juurde asumist käivitage need käsud diagnostilise teabe kogumiseks:

```bash
# Kontrolli azd versiooni ja seisukorda
azd version
azd config list

# Kontrolli Azure'i autentimist
az account show
az account list

# Kontrolli praegust keskkonda
azd env show
azd env get-values

# Luba silumislogimine
export AZD_DEBUG=true
azd <command> --debug
```

## Autentimise probleemid

### Probleem: "Ebaõnnestus juurdepääsutokeni saamine"
**Sümptomid:**
- `azd up` ebaõnnestub autentimisvigadega
- käsud tagastavad "volitamata" või "juurdepääs keelatud"

**Lahendused:**
```bash
# Logi Azure CLI abil uuesti sisse
az login
az account show

# Tühjenda vahemällu salvestatud autentimisandmed
az account clear
az login

# Kasuta seadme koodi voogu (ilma graafilise kasutajaliideseta süsteemide jaoks)
az login --use-device-code

# Määra konkreetne tellimus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Piisavad õigused puuduvad" juurutamise ajal
**Sümptomid:**
- juurutus ebaõnnestub õigustega seotud vigade tõttu
- teatud Azure'i ressursse ei saa luua

**Lahendused:**
```bash
# 1. Kontrollige oma Azure'i rollimääranguid
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Veenduge, et teil on vajalikud rollid
# - Contributor (ressursside loomiseks)
# - User Access Administrator (rollimäärangute jaoks)

# 3. Võtke oma Azure'i administraatoriga ühendust, et saada vajalikud õigused
```

### Probleem: Mitme üürikontoga (multi-tenant) autentimise probleemid
**Lahendused:**
```bash
# 1. Logi sisse konkreetse üürnikuna
az login --tenant "your-tenant-id"

# 2. Määra üürnik konfiguratsioonis
azd config set auth.tenantId "your-tenant-id"

# 3. Tühjenda üürniku vahemälu, kui vahetad üürnikke
az account clear
```

## 🏗️ Infrastruktuuri loomise vead

### Probleem: Ressursi nime konfliktid
**Sümptomid:**
- veateated "Ressursi nimi on juba olemas"
- juurutus ebaõnnestub ressursi loomisel

**Lahendused:**
```bash
# 1. Kasutage unikaalseid ressursinimesid koos tokenitega
# Teie Bicep-mallis:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Muutke keskkonna nime
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Puhastage olemasolevaid ressursse
azd down --force --purge
```

### Probleem: Asukoht/piirkond pole saadaval
**Sümptomid:**
- "Asukohta 'xyz' ei toetata selle ressursi tüübi jaoks"
- teatud SKU-d pole valitud piirkonnas saadaval

**Lahendused:**
```bash
# 1. Kontrolli ressursitüüpide jaoks saadaolevaid asukohti
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Kasuta laialt kättesaadavaid piirkondi
azd config set defaults.location eastus2
# või
azd env set AZURE_LOCATION eastus2

# 3. Kontrolli teenuse saadavust piirkonniti
# Külastage: https://azure.microsoft.com/global-infrastructure/services/
```

### Probleem: Kvota ületatud
**Sümptomid:**
- "Kvota ületatud ressursitüübi puhul"
- "Maksimaalne lubatud ressursside arv on saavutatud"

**Lahendused:**
```bash
# 1. Kontrolli praegust kvota kasutust
az vm list-usage --location eastus2 -o table

# 2. Taotle kvota suurendamist Azure'i portaali kaudu
# Mine: Tellimused > Kasutus + kvotad

# 3. Arenduseks kasuta väiksemaid SKU-sid
# Failis main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Eemalda kasutamata ressursid
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probleem: Bicep-malli vead
**Sümptomid:**
- malli valideerimise ebaõnnestumised
- süntaksivead Bicep-failides

**Lahendused:**
```bash
# 1. Kontrolli Bicep-süntaksit
az bicep build --file infra/main.bicep

# 2. Kasuta Bicepi linterit
az bicep lint --file infra/main.bicep

# 3. Kontrolli parameetrifaili süntaksit
cat infra/main.parameters.json | jq '.'

# 4. Eelvaata juurutuse muudatusi
azd provision --preview
```

## 🚀 Juurutuse ebaõnnestumised

### Probleem: Buildi (ehituse) vead
**Sümptomid:**
- rakenduse koostamine juurutuse ajal ebaõnnestub
- pakendi installimise vead

**Lahendused:**
```bash
# 1. Kontrolli buildi väljundit koos debug-lipuga
azd deploy --service web --debug

# 2. Vaata juurutatud teenuse olekut
azd show

# 3. Testi buildi lokaalselt
cd src/web
npm install
npm run build

# 3. Kontrolli Node.js/Pythoni versioonide ühilduvust
node --version  # Peab vastama azure.yaml seadetele
python --version

# 4. Tühjenda buildi vahemälu
rm -rf node_modules package-lock.json
npm install

# 5. Kontrolli Dockerfile'i, kui kasutad konteinerit
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Konteinerite juurutuse vead
**Sümptomid:**
- konteinerirakendused ei käivitu
- pildi tõmbamise vead

**Lahendused:**
```bash
# 1. Testi Docker-ehitust lokaalselt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontrolli konteineri logisid Azure CLI abil
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Jälgi rakendust azd kaudu
azd monitor --logs

# 3. Kontrolli konteineriregistri juurdepääsu
az acr login --name myregistry

# 4. Kontrolli konteinerirakenduse konfiguratsiooni
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Andmebaasi ühenduse vead
**Sümptomid:**
- rakendus ei saa andmebaasiga ühendust
- ühenduse ajalõpu vead

**Lahendused:**
```bash
# 1. Kontrolli andmebaasi tulemüüri reegleid
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testi ühenduvust rakendusest
# Lisa oma rakendusse ajutiselt:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Kontrolli ühendusstringi vormingut
azd env get-values | grep DATABASE

# 4. Kontrolli andmebaasiserveri olekut
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfiguratsiooni probleemid

### Probleem: Keskkonnamuutujad ei toimi
**Sümptomid:**
- rakendus ei loe konfiguratsiooni väärtusi
- keskkonnamuutujad tunduvad tühjad

**Lahendused:**
```bash
# 1. Kontrollige, et keskkonnamuutujad on määratud
azd env get-values
azd env get DATABASE_URL

# 2. Kontrollige muutujate nimesid failis azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Taaskäivitage rakendus
azd deploy --service web

# 4. Kontrollige rakendusteenuse konfiguratsiooni
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probleem: SSL/TLS sertifikaadi probleemid
**Sümptomid:**
- HTTPS ei tööta
- sertifikaadi valideerimise vead

**Lahendused:**
```bash
# 1. Kontrolli SSL-sertifikaadi olekut
az webapp config ssl list --resource-group myrg

# 2. Luba ainult HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisa kohandatud domeen (vajadusel)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS-i konfiguratsiooni probleemid
**Sümptomid:**
- frontend ei saa API-d kutsuda
- ristallikapäringud blokeeritud

**Lahendused:**
```bash
# 1. Konfigureeri CORS App Service'i jaoks
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Uuenda API-d, et käsitleda CORS-i
# Express.js-is:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontrolli, kas töötab õigetel URL-idel
azd show
```

## 🌍 Keskkonna haldamise probleemid

### Probleem: Keskkonna vahetamise probleemid
**Sümptomid:**
- kasutatakse vale keskkonda
- konfiguratsioon ei vaheta õigesti

**Lahendused:**
```bash
# 1. Loetle kõik keskkonnad
azd env list

# 2. Eksplitsiitselt vali keskkond
azd env select production

# 3. Kontrolli praegust keskkonda
azd env show

# 4. Loo uus keskkond, kui see on rikutud
azd env new production-new
azd env select production-new
```

### Probleem: Keskkonna rikutus
**Sümptomid:**
- keskkond näitab kehtetut olekut
- ressursid ei vasta konfiguratsioonile

**Lahendused:**
```bash
# 1. Värskenda keskkonna olekut
azd env refresh

# 2. Lähtesta keskkonna konfiguratsioon
azd env new production-reset
# Kopeeri vajalikud keskkonnamuutujad üle
azd env set DATABASE_URL "your-value"

# 3. Impordi olemasolevad ressursid (kui võimalik)
# Uuenda käsitsi .azure/production/config.json ressursi-ID-dega
```

## 🔍 Jõudluse probleemid

### Probleem: Aeglased juurutusaegad
**Sümptomid:**
- juurutused võtavad liiga kaua aega
- juurutuse ajal tekivad ajalõpud

**Lahendused:**
```bash
# 1. Kiiremaks iteratsiooniks juurutage konkreetseid teenuseid
azd deploy --service web
azd deploy --service api

# 2. Kasutage ainult koodi juurutamist, kui infrastruktuur ei muutu
azd deploy  # Kiirem kui azd up

# 3. Optimeerige koostamisprotsessi
# package.json-is:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontrollige ressursside asukohti (kasutage sama regiooni)
azd config set defaults.location eastus2
```

### Probleem: Rakenduse jõudlusprobleemid
**Sümptomid:**
- aeglane reageerimisaeg
- suur ressursikasutus

**Lahendused:**
```bash
# 1. Suurenda ressursse
# Uuenda SKU-d failis main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Lülita Application Insightsi seire sisse
azd monitor --overview

# 3. Kontrolli rakenduse logisid Azure'is
az webapp log tail --name myapp --resource-group myrg
# või Container Appsi jaoks:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Rakenda vahemälu
# Lisa Redis-vahemälu oma infrastruktuuri
```

## 🛠️ Tõrkeotsingu tööriistad ja käsud

### Silumise käsud
```bash
# Põhjalik silumine
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontrolli azd-versiooni
azd version

# Kuva praegune konfiguratsioon
azd config list

# Testi ühenduvust
curl -v https://myapp.azurewebsites.net/health
```

### Logide analüüs
```bash
# Rakenduse logid Azure CLI kaudu
az webapp log tail --name myapp --resource-group myrg

# Jälgi rakendust azd abil
azd monitor --logs
azd monitor --live

# Azure'i ressursilogid
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteinerilogid (Container Apps'i jaoks)
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

## 🆘 Täiendav abi

### Millal eskaleerida
- autentimisprobleemid püsivad pärast kõigi lahenduste proovimist
- infrastruktuuri probleemid Azure'i teenustega
- arvelduse või tellimusega seotud küsimused
- turvalisuse mured või intsidendiga seotud olukorrad

### Tugikanalid
```bash
# 1. Kontrollige Azure teenuste olekut
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Looge Azure tugipilet
# Minge aadressile: https://portal.azure.com -> Abi ja tugi

# 3. Kogukonna ressursid
# - Stack Overflow: silt azure-developer-cli
# - GitHubi teemad: https://github.com/Azure/azure-dev/issues
# - Microsoft Küsimused ja vastused: https://learn.microsoft.com/en-us/answers/
```

### Kogumiseks vajalik teave
Enne toe poole pöördumist koguge:
- `azd version` väljund
- `azd config list` väljund
- `azd show` väljund (praeguse juurutuse staatus)
- veateated (täistekstid)
- sammud vea reprodutseerimiseks
- keskkonna üksikasjad (`azd env show`)
- ajajoon, millal probleem algas

### Logide kogumise skript
```bash
#!/bin/bash
# kogu-silumise-teave.sh

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

## 📊 Probleemide ennetamine

### Eeljuurutuse kontrollnimekiri
```bash
# 1. Kontrolli autentimist
az account show

# 2. Kontrolli kvoote ja piiranguid
az vm list-usage --location eastus2

# 3. Kontrolli malle
az bicep build --file infra/main.bicep

# 4. Testi esmalt lokaalselt
npm run build
npm run test

# 5. Kasuta kuivkäigu juurutusi
azd provision --preview
```

### Jälgimise seadistamine
```bash
# Luba Application Insights
# Lisa main.bicep-faili:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Seadista hoiatused
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regulaarne hooldus
```bash
# Nädalased tervisekontrollid
./scripts/health-check.sh

# Kuu kulude ülevaatus
az consumption usage list --billing-period-name 202401

# Kvartaalne turvalisuse ülevaatus
az security assessment list --resource-group myrg
```

## Seotud ressursid

- [Silumise juhend](debugging.md) - Täiustatud silumise tehnikad
- [Ressursside provisioneerimine](../chapter-04-infrastructure/provisioning.md) - Infrastruktuuri tõrkeotsing
- [Võimsuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Ressursside planeerimise juhised
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - Teenuse taseme soovitused

---

**Näpunäide**: Lisage see juhend järjehoidjatesse ja viitige sellele alati, kui tekib probleeme. Enamik probleeme on juba varem kohatud ja nende jaoks on olemas toimivad lahendused!

---

**Navigeerimine**
- **Eelmine õppetükk**: [Ressursside provisioneerimine](../chapter-04-infrastructure/provisioning.md)
- **Järgmine õppetükk**: [Silumise juhend](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokumendi emakeelset versiooni tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta mis tahes arusaamatuste või valesti tõlgendamise eest, mis tulenevad selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->