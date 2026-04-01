# Levinumad probleemid ja lahendused

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: 7. peatükk - Tõrkeotsing ja silumine
- **⬅️ Eelmine peatükk**: [6. peatükk: Eelpäringud](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Järgmine**: [Silumise juhend](debugging.md)
- **🚀 Järgmine peatükk**: [8. peatükk: Tootmise ja ettevõtte mustrid](../chapter-08-production/production-ai-practices.md)

## Sissejuhatus

See põhjalik tõrkeotsingu juhend käsitleb kõige sagedamini esinevaid probleeme Azure Developer CLI kasutamisel. Õppige diagnoosima, tõrkeotsingut tegema ja lahendama tavalisi tõrkeid autentimise, juurutamise, infrastruktuuri loomise ja rakenduse seadistamise valdkonnas. Iga probleem sisaldab üksikasjalikke sümptomeid, juurpõhjuseid ja samm-sammult lahenduskäiku.

## Õpieesmärgid

Selle juhendi lõpetamisel:
- Valdate diagnostikatehnikaid Azure Developer CLI probleemide lahendamiseks
- Mõistate tavalisi autentimise ja õiguste probleeme ning nende lahendusi
- Lahendate juurutamise ebaõnnestumised, infrastruktuuri loomise vead ja seadistusprobleemid
- Rakendate proaktiivset jälgimist ja silumist
- Kasutate süsteemseid tõrkeotsingu metoodikaid keerukate probleemide puhul
- Konfigureerite korraliku logimise ja jälgimise, et tulevasi probleeme vältida

## Õpitulemused

Pärast juhendi lõpetamist saate:
- Diagnoosida Azure Developer CLI probleeme sisseehitatud diagnostikavahendeid kasutades
- Lahendada autentimise, tellimuse ja õiguste seotud probleeme iseseisvalt
- Tõrkeotsinguga lahendada juurutuste ebaõnnestumisi ja infrastruktuuri loomise vigu tõhusalt
- Siluda rakenduse seadistusprobleeme ja keskkonnispetsiifilisi tõrkeid
- Rakendada jälgimist ja teavitusi, et proaktiivselt võimalikke probleeme tuvastada
- Kasutada parimaid tavasid logimiseks, silumiseks ja probleemide lahendamiseks

## Kiirdiagnostika

Enne konkreetsete probleemide juurde asumist käivitage need käsud diagnostiliste andmete kogumiseks:

```bash
# Kontrolli azd versiooni ja tervist
azd version
azd config show

# Kontrolli Azure autentimist
az account show
az account list

# Kontrolli praegust keskkonda
azd env list
azd env get-values

# Luba silumislogimine
export AZD_DEBUG=true
azd <command> --debug
```

## Autentimisprobleemid

### Probleem: "Ei saanud juurdepääsutokenit"
**Sümptomid:**
- `azd up` tõrked autentimisel
- Käsud annavad vastuseks "loata" või "juurdepääs keelatud"

**Lahendused:**
```bash
# 1. Tuvasta Azure CLI-ga uuesti
az login
az account show

# 2. Puhasta vahemällu salvestatud mandaadid
az account clear
az login

# 3. Kasuta seadmekoodivoolu (peaksiteemata süsteemide jaoks)
az login --use-device-code

# 4. Määra otsene tellimus
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Ebapiisavad õigused" juurutamisel
**Sümptomid:**
- Juurutamine ebaõnnestub õiguste vigade tõttu
- Ei saa luua mõningaid Azure ressursse

**Lahendused:**
```bash
# 1. Kontrollige oma Azure rolli määramisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Veenduge, et teil on vajalikud rollid
# - Kaastöötaja (ressursside loomiseks)
# - Kasutajate juurdepääsu administraator (rolli määramiste jaoks)

# 3. Võtke õiguste saamiseks ühendust oma Azure administraatoriga
```

### Probleem: Mitme üürnikuga autentimise probleemid
**Lahendused:**
```bash
# 1. Logi sisse konkreetse üürnikuga
az login --tenant "your-tenant-id"

# 2. Määra üürnik konfiguratsioonis
azd config set auth.tenantId "your-tenant-id"

# 3. Tühjenda üürniku vahemälu, kui üürnikke vahetatakse
az account clear
```

## 🏗️ Infrastruktuuri loomise vead

### Probleem: Ressursi nime konfliktid
**Sümptomid:**
- Veateated "Ressursi nimi on juba olemas"
- Juurutamine ebaõnnestub ressursi loomisel

**Lahendused:**
```bash
# 1. Kasutage unikaalseid ressursinimesid koos tokenitega
# Teie Bicep-mallil:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Muutke keskkonna nime
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Puhastage olemasolevad ressursid
azd down --force --purge
```

### Probleem: Asukoht/piirkond pole saadaval
**Sümptomid:**
- "Asukoht 'xyz' pole selle ressursitüübi jaoks saadaval"
- Teatud SKU-d pole valitud piirkonnas saadaval

**Lahendused:**
```bash
# 1. Kontrolli ressursitüüpide saadavalolevaid asukohti
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Kasuta tavaliselt saadaval olevaid piirkondi
azd config set defaults.location eastus2
# või
azd env set AZURE_LOCATION eastus2

# 3. Kontrolli teenuse kättesaadavust piirkonna kaupa
# Külasta: https://azure.microsoft.com/global-infrastructure/services/
```

### Probleem: Kvoodi ületamise vead
**Sümptomid:**
- "Kvooti ületatud ressursitüübile"
- "Maksimaalne ressursside arv on jõutud"

**Lahendused:**
```bash
# 1. Kontrolli praegust kvota kasutust
az vm list-usage --location eastus2 -o table

# 2. Taotle kvota suurendamist Azure portaali kaudu
# Mine: Tellimused > Kasutus + kvotad

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

### Probleem: Bicep malle vead
**Sümptomid:**
- Malli valideerimise ebaõnnestumised
- Süntaksivead Bicep failides

**Lahendused:**
```bash
# 1. Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep

# 2. Kasuta Bicep linterit
az bicep lint --file infra/main.bicep

# 3. Kontrolli parameetrite faili süntaksit
cat infra/main.parameters.json | jq '.'

# 4. Eelvaade juurutamise muudatustest
azd provision --preview
```

## 🚀 Juurutamise ebaõnnestumised

### Probleem: Ehitusvead
**Sümptomid:**
- Rakendus ei ehitu juurutamise ajal
- Pakettide installi vead

**Lahendused:**
```bash
# 1. Kontrolli ehituse väljundit silumislipuga
azd deploy --service web --debug

# 2. Vaata juurutatud teenuse staatust
azd show

# 3. Testi ehitust lokaalselt
cd src/web
npm install
npm run build

# 3. Kontrolli Node.js/Pythoni versioonide ühilduvust
node --version  # Peaks vastama azure.yaml seadetele
python --version

# 4. Tühjenda ehituse vahemälu
rm -rf node_modules package-lock.json
npm install

# 5. Kontrolli Dockerfile'i konteinerite kasutamisel
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Kasti juurutamise vead
**Sümptomid:**
- Kasti rakendused ei käivitu
- Pildi tõmbamise vead

**Lahendused:**
```bash
# 1. Testi Docker build kohalikult
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontrolli konteineri logisid Azure CLI abil
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Jälgi rakendust läbi azd
azd monitor --logs

# 3. Kontrolli konteineri registri juurdepääsu
az acr login --name myregistry

# 4. Kontrolli konteineri rakenduse seadistust
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Andmebaasi ühenduse vead
**Sümptomid:**
- Rakendus ei saa andmebaasiga ühendust
- Ühenduse ajapiirangud

**Lahendused:**
```bash
# 1. Kontrolli andmebaasi tulemüüri reegleid
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testi ühenduvust rakendusest
# Lisa oma rakendusse ajutiselt:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Kinnita ühendusstringi formaat
azd env get-values | grep DATABASE

# 4. Kontrolli andmebaasi serveri olekut
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Seadistusprobleemid

### Probleem: Keskkonnamuutujad ei tööta
**Sümptomid:**
- Rakendus ei loe seadistuse väärtusi
- Keskkonnamuutujad tunduvad tühjad

**Lahendused:**
```bash
# 1. Kontrolli, et keskkonnamuutujad oleksid määratud
azd env get-values
azd env get DATABASE_URL

# 2. Kontrolli muutujate nimesid azure.yaml failis
cat azure.yaml | grep -A 5 env:

# 3. Taaskäivita rakendus
azd deploy --service web

# 4. Kontrolli rakenduse teenuse konfiguratsiooni
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probleem: SSL/TLS sertifikaatide probleemid
**Sümptomid:**
- HTTPS ei tööta
- Sertifikaadi valideerimise vead

**Lahendused:**
```bash
# 1. Kontrolli SSL-sertifikaadi olekut
az webapp config ssl list --resource-group myrg

# 2. Luba ainult HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lisa kohandatud domeen (vajadusel)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS seadistuse probleemid
**Sümptomid:**
- Frontend ei saa API-d kutsuda
- Ristorigini päring blokeeritud

**Lahendused:**
```bash
# 1. Konfigureeri CORS-i App Service jaoks
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Uuenda API-d CORS-i käsitlemiseks
# Express.js-is:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontrolli, kas töötab õigetel URL-del
azd show
```

## 🌍 Keskkonna halduse probleemid

### Probleem: Keskkonna vahetamise probleemid
**Sümptomid:**
- Kasutatakse vale keskkonda
- Seadistus ei vaheta korralikult

**Lahendused:**
```bash
# 1. Loetle kõik keskkonnad
azd env list

# 2. Vali keskkond selgesõnaliselt
azd env select production

# 3. Kontrolli praegust keskkonda
azd env list

# 4. Loo uus keskkond, kui praegune on rikutud
azd env new production-new
azd env select production-new
```

### Probleem: Keskkonna riknemine
**Sümptomid:**
- Keskkond näitab kehtetut olekut
- Ressursid ei vasta seadistusele

**Lahendused:**
```bash
# 1. Värskenda keskkonna olekut
azd env refresh

# 2. Lähtesta keskkonna konfiguratsioon
azd env new production-reset
# Kopeeri vajalikud keskkonnamuutujad üle
azd env set DATABASE_URL "your-value"

# 3. Impordi olemasolevad ressursid (kui võimalik)
# Uuenda käsitsi .azure/production/config.json ressursi ID-sid
```

## 🔍 Jõudluse probleemid

### Probleem: Aeglane juurutusaeg
**Sümptomid:**
- Juurutused võtavad liiga kaua aega
- Ajapiirangud juurutamise ajal

**Lahendused:**
```bash
# 1. Kasuta kiiremaks iteratsiooniks spetsiifilisi teenuseid
azd deploy --service web
azd deploy --service api

# 2. Kasuta ainult koodi juurutamist, kui infrastruktuur on muutumatult
azd deploy  # Kiirem kui azd up

# 3. Optimeeri ehitusprotsess
# Failis package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontrolli ressursi asukohti (kasuta sama regioon)
azd config set defaults.location eastus2
```

### Probleem: Rakenduse jõudlusprobleemid
**Sümptomid:**
- Aeglane reageerimine
- Kõrge ressursikasutus

**Lahendused:**
```bash
# 1. Skaala ressursid üles
# Uuenda SKU-d failis main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Luba Application Insights monitooring
azd monitor --overview

# 3. Kontrolli rakenduse logisid Azure'is
az webapp log tail --name myapp --resource-group myrg
# või Container Apps puhul:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Rakenda vahemällu salvestamine
# Lisa Redis vahemälu oma infrastruktuuri
```

## 🛠️ Tõrkeotsingu tööriistad ja käsud

### Silumiskäsud
```bash
# Põhjalik silumine
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontrolli azd versiooni
azd version

# Vaata praegust konfiguratsiooni
azd config show

# Testi ühenduvust
curl -v https://myapp.azurewebsites.net/health
```

### Logianalüüs
```bash
# Rakenduse logid Azure CLI kaudu
az webapp log tail --name myapp --resource-group myrg

# Jälgi rakendust azd abil
azd monitor --logs
azd monitor --live

# Azure'i ressursi logid
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteineri logid (Container Appside jaoks)
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

## 🆘 Täiendava abi saamine

### Millal eskaleerida
- Autentimisprobleemid jätkuvad pärast kõigi lahenduste proovimist
- Infrastruktuuri probleemid Azure teenustega
- Arveldus- või tellimusega seotud küsimused
- Turvalisusega seotud kahtlused või intsidentide juhtumid

### Tugikanalid
```bash
# 1. Kontrolli Azure teenuste tervist
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Loo Azure tugipilet
# Mine aadressile: https://portal.azure.com -> Abi + tugi

# 3. Kogukonna ressursid
# - Stack Overflow: azure-developer-cli silt
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Kogutav info
Enne toe poole pöördumist koguge:
- `azd version` väljund
- `azd config show` väljund
- `azd show` väljund (praeguse juurutamise staatus)
- Veateadete täistekstid
- Sammud probleemi kordamiseks
- Keskkonna detailid (`azd env get-values`)
- Ajatelg probleemi algusest

### Logikogumise skript
```bash
#!/bin/bash
# kogu-silumisinfo.sh

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

## 📊 Probleemide ennetamine

### Eeljärjekontrollide nimekiri
```bash
# 1. Autentimise valideerimine
az account show

# 2. Kontrolli kvotasid ja piiranguid
az vm list-usage --location eastus2

# 3. Põhjamallide valideerimine
az bicep build --file infra/main.bicep

# 4. Testi esmalt kohapeal
npm run build
npm run test

# 5. Kasuta kuivkäigu juurutusi
azd provision --preview
```

### Jälgimise seadistamine
```bash
# Luba Application Insights
# Lisa main.bicep faili:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Sea üles hoiatused
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

# Kvartali turvauurimus
az security assessment list --resource-group myrg
```

## Seotud ressursid

- [Silumise juhend](debugging.md) - Täiustatud silumistehnikad
- [Ressursside loomine](../chapter-04-infrastructure/provisioning.md) - Infrastruktuuri tõrkeotsing
- [Mahuvajaduse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Ressursside planeerimise juhend
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - Teenuse tasemete soovitused

---

**Näpunäide**: Hoidke see juhend järjehoidjas ja pöörduge selle poole igal korral, kui probleemiga kokku puutute. Enamik probleeme on varemgi nähtud ja neil on kinnistunud lahendused!

---

**Navigeerimine**
- **Eelmine õppetükk**: [Ressursside loomine](../chapter-04-infrastructure/provisioning.md)
- **Järgmine õppetükk**: [Silumise juhend](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüdleme täpsuse poole, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada usaldusväärseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega kaasnevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->