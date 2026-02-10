# Vanlige problemer og løsninger

**Kapittelnavigasjon:**
- **📚 Kursforside**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 7 - Feilsøking og debugging
- **⬅️ Forrige kapittel**: [Kapittel 6: Forhåndssjekker](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Neste**: [Feilsøkingsguide](debugging.md)
- **🚀 Neste kapittel**: [Kapittel 8: Produksjon og bedriftsmønstre](../chapter-08-production/production-ai-practices.md)

## Introduksjon

Denne omfattende feilsøkingsveiledningen dekker de mest vanlige problemene ved bruk av Azure Developer CLI. Lær å diagnostisere, feilsøke og løse vanlige problemer med autentisering, distribusjon, infrastrukturprovisjon og applikasjonskonfigurasjon. Hvert problem inkluderer detaljerte symptomer, rotårsaker og trinnvise løsningsprosedyrer.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Beherske diagnostiske teknikker for problemer med Azure Developer CLI
- Forstå vanlige autentiserings- og tilgangsproblemer og deres løsninger
- Løse distribusjonssvikt, feil ved infrastrukturprovisjon og konfigurasjonsproblemer
- Implementere proaktiv overvåking og feilsøkingsstrategier
- Anvende systematiske feilsøkingsmetodikker for komplekse problemer
- Konfigurere riktig logging og overvåking for å forhindre fremtidige problemer

## Læringsutbytte

Etter fullføring vil du kunne:
- Diagnostisere problemer med Azure Developer CLI ved hjelp av innebygde diagnostiske verktøy
- Løse autentiserings-, abonnement- og tillatelsesrelaterte problemer selvstendig
- Feilsøke distribusjonssvikt og feil ved infrastrukturprovisjon effektivt
- Debugge applikasjonskonfigurasjonsproblemer og miljøspesifikke problemer
- Implementere overvåking og varsling for proaktivt å identifisere potensielle problemer
- Anvende beste praksis for logging, debugging og arbeidsflyter for problemløsning

## Rask diagnostikk

Før du går inn i spesifikke problemer, kjør disse kommandoene for å samle diagnostisk informasjon:

```bash
# Sjekk azd-versjon og helsetilstand
azd version
azd config list

# Bekreft Azure-autentisering
az account show
az account list

# Sjekk gjeldende miljø
azd env show
azd env get-values

# Aktiver debug-logging
export AZD_DEBUG=true
azd <command> --debug
```

## Autentiseringsproblemer

### Problem: "Failed to get access token"
**Symptomer:**
- `azd up` feiler med autentiseringsfeil
- Kommandoer returnerer "unauthorized" eller "access denied"

**Løsninger:**
```bash
# 1. Logg inn på nytt med Azure CLI
az login
az account show

# 2. Tøm bufrede legitimasjoner
az account clear
az login

# 3. Bruk enhetskodeflyt (for hodeløse systemer)
az login --use-device-code

# 4. Angi eksplisitt abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" under distribusjon
**Symptomer:**
- Distribusjon feiler med tillatelsesfeil
- Kan ikke opprette visse Azure-ressurser

**Løsninger:**
```bash
# 1. Sjekk dine rolletildelinger i Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Sørg for at du har nødvendige roller
# - Bidragsyter (for opprettelse av ressurser)
# - Brukertilgangsadministrator (for rolletildelinger)

# 3. Kontakt Azure-administratoren din for nødvendige tillatelser
```

### Problem: Multi-tenant autentiseringsproblemer
**Løsninger:**
```bash
# 1. Logg inn med en spesifikk leietaker
az login --tenant "your-tenant-id"

# 2. Sett leietaker i konfigurasjonen
azd config set auth.tenantId "your-tenant-id"

# 3. Tøm leietakerens cache hvis du bytter leietaker
az account clear
```

## 🏗️ Infrastrukturprovisjonsfeil

### Problem: Konflikter med ressursnavn
**Symptomer:**
- "The resource name already exists" feil
- Distribusjon feiler under ressursopprettelse

**Løsninger:**
```bash
# 1. Bruk unike ressursnavn med tokener
# I Bicep-malen din:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Endre miljønavn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Rydd opp i eksisterende ressurser
azd down --force --purge
```

### Problem: Plassering/region ikke tilgjengelig
**Symptomer:**
- "The location 'xyz' is not available for resource type"
- Enkelte SKU-er ikke tilgjengelige i valgt region

**Løsninger:**
```bash
# 1. Sjekk tilgjengelige lokasjoner for ressurstyper
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Bruk regioner som vanligvis er tilgjengelige
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Sjekk tjenestens tilgjengelighet per region
# Besøk: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvote overskredet-feil
**Symptomer:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Løsninger:**
```bash
# 1. Sjekk nåværende kvotabruk
az vm list-usage --location eastus2 -o table

# 2. Be om kvoteøkning via Azure-portalen
# Gå til: Abonnementer > Bruk + kvoter

# 3. Bruk mindre SKU-er for utvikling
# I main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Rydd opp i ubrukte ressurser
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep-malfeil
**Symptomer:**
- Malvalidering mislykkes
- Syntaksfeil i Bicep-filer

**Løsninger:**
```bash
# 1. Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# 2. Bruk Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Sjekk parameterfilens syntaks
cat infra/main.parameters.json | jq '.'

# 4. Forhåndsvis distribusjonsendringer
azd provision --preview
```

## 🚀 Distribusjonssvikt

### Problem: Byggefeil
**Symptomer:**
- Applikasjonen feiler under bygging ved distribusjon
- Feil ved pakkeinstallasjon

**Løsninger:**
```bash
# 1. Sjekk byggeutdata med debug-flagget
azd deploy --service web --debug

# 2. Se status for utrullet tjeneste
azd show

# 3. Test bygg lokalt
cd src/web
npm install
npm run build

# 3. Sjekk kompatibilitet mellom Node.js- og Python-versjoner
node --version  # Bør samsvare med azure.yaml-innstillingene
python --version

# 4. Tøm byggebuffer
rm -rf node_modules package-lock.json
npm install

# 5. Sjekk Dockerfile hvis du bruker containere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Feil ved distribuering av containere
**Symptomer:**
- Containerapper starter ikke
- Feil ved uthenting av image

**Løsninger:**
```bash
# 1. Test Docker-bygget lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sjekk containerloggene ved hjelp av Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Overvåk applikasjonen gjennom azd
azd monitor --logs

# 3. Bekreft tilgang til containerregisteret
az acr login --name myregistry

# 4. Sjekk konfigurasjonen for container-appen
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Feil ved databasetilkobling
**Symptomer:**
- Applikasjonen kan ikke koble til databasen
- Tidsavbruddsfeil ved tilkobling

**Løsninger:**
```bash
# 1. Sjekk brannmurregler for databasen
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test tilkoblingen fra applikasjonen
# Legg midlertidig til i appen din:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Kontroller formatet på tilkoblingsstrengen
azd env get-values | grep DATABASE

# 4. Sjekk statusen til databaseserveren
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurasjonsproblemer

### Problem: Miljøvariabler virker ikke
**Symptomer:**
- Appen kan ikke lese konfigurasjonsverdier
- Miljøvariabler ser tomme ut

**Løsninger:**
```bash
# 1. Bekreft at miljøvariablene er satt
azd env get-values
azd env get DATABASE_URL

# 2. Sjekk variabelnavnene i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Start applikasjonen på nytt
azd deploy --service web

# 4. Sjekk konfigurasjonen for App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS-sertifikatproblemer
**Symptomer:**
- HTTPS fungerer ikke
- Sertifikatvalideringsfeil

**Løsninger:**
```bash
# 1. Sjekk status for SSL-sertifikatet
az webapp config ssl list --resource-group myrg

# 2. Aktiver kun HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Legg til tilpasset domene (hvis nødvendig)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-konfigurasjonsproblemer
**Symptomer:**
- Frontend kan ikke kalle API
- Cross-origin forespørsel blokkert

**Løsninger:**
```bash
# 1. Konfigurer CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Oppdater API-et for å håndtere CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Sjekk om den kjører på riktige URL-er
azd show
```

## 🌍 Problemer med miljøhåndtering

### Problem: Problemer med å bytte miljø
**Symptomer:**
- Feil miljø blir brukt
- Konfigurasjon byttes ikke riktig

**Løsninger:**
```bash
# 1. List opp alle miljøer
azd env list

# 2. Velg miljø eksplisitt
azd env select production

# 3. Bekreft gjeldende miljø
azd env show

# 4. Opprett nytt miljø hvis det er ødelagt
azd env new production-new
azd env select production-new
```

### Problem: Miljøkorrupsjon
**Symptomer:**
- Miljø viser ugyldig tilstand
- Ressurser samsvarer ikke med konfigurasjon

**Løsninger:**
```bash
# 1. Oppdater miljøtilstanden
azd env refresh

# 2. Tilbakestill miljøkonfigurasjonen
azd env new production-reset
# Kopier over nødvendige miljøvariabler
azd env set DATABASE_URL "your-value"

# 3. Importer eksisterende ressurser (hvis mulig)
# Oppdater .azure/production/config.json manuelt med ressurs-IDer
```

## 🔍 Ytelsesproblemer

### Problem: Sakte distribusjonstider
**Symptomer:**
- Distribusjoner tar for lang tid
- Tidsavbrudd under distribusjon

**Løsninger:**
```bash
# 1. Distribuer spesifikke tjenester for raskere iterasjon
azd deploy --service web
azd deploy --service api

# 2. Bruk kun kode-distribusjon når infrastrukturen er uendret
azd deploy  # Raskere enn azd up

# 3. Optimaliser byggeprosessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Sjekk ressursplasseringer (bruk samme region)
azd config set defaults.location eastus2
```

### Problem: Applikasjonsytelsesproblemer
**Symptomer:**
- Sakte responstider
- Høyt ressursforbruk

**Løsninger:**
```bash
# 1. Skaler opp ressurser
# Oppdater SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktiver Application Insights-overvåking
azd monitor --overview

# 3. Sjekk applikasjonslogger i Azure
az webapp log tail --name myapp --resource-group myrg
# eller for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementer caching
# Legg til Redis-cache i infrastrukturen din
```

## 🛠️ Feilsøkingsverktøy og kommandoer

### Feilsøkingskommandoer
```bash
# Omfattende feilsøking
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sjekk azd-versjon
azd version

# Vis gjeldende konfigurasjon
azd config list

# Test tilkobling
curl -v https://myapp.azurewebsites.net/health
```

### Logganalyse
```bash
# Applikasjonslogger via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Overvåk applikasjonen med azd
azd monitor --logs
azd monitor --live

# Azure-ressurslogger
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogger (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Undersøkelse av ressurser
```bash
# List opp alle ressurser
az resource list --resource-group myrg -o table

# Sjekk ressursstatus
az webapp show --name myapp --resource-group myrg --query state

# Nettverksdiagnostikk
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få ytterligere hjelp

### Når du bør eskalere
- Autentiseringsproblemer vedvarer etter å ha prøvd alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Fakturering- eller abonnementrelaterte problemer
- Sikkerhetsbekymringer eller hendelser

### Støttekanaler
```bash
# 1. Sjekk Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Opprett en supportsak i Azure
# Gå til: https://portal.azure.com -> Hjelp og støtte

# 3. Fellesskapsressurser
# - Stack Overflow: taggen 'azure-developer-cli'
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informasjon å samle
Før du kontakter support, samle inn:
- `azd version` output
- `azd config list` output
- `azd show` output (nåværende distribusjonsstatus)
- Feilmeldinger (full tekst)
- Steg for å gjenskape problemet
- Miljødetaljer (`azd env show`)
- Tidslinje for når problemet startet

### Loggsamlingsskript
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

## 📊 Forebygging av problemer

### Sjekkliste før distribusjon
```bash
# 1. Valider autentisering
az account show

# 2. Sjekk kvoter og begrensninger
az vm list-usage --location eastus2

# 3. Valider maler
az bicep build --file infra/main.bicep

# 4. Test lokalt først
npm run build
npm run test

# 5. Bruk prøveutrullinger
azd provision --preview
```

### Oppsett for overvåking
```bash
# Aktiver Application Insights
# Legg til i main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Sett opp varsler
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelmessig vedlikehold
```bash
# Ukentlige helsesjekker
./scripts/health-check.sh

# Månedlig kostnadsgjennomgang
az consumption usage list --billing-period-name 202401

# Kvartalsvis sikkerhetsgjennomgang
az security assessment list --resource-group myrg
```

## Relaterte ressurser

- [Feilsøkingsguide](debugging.md) - Avanserte feilsøkingsteknikker
- [Provisjonering av ressurser](../chapter-04-infrastructure/provisioning.md) - Infrastrukturfeilsøking
- [Kapasitetsplanlegging](../chapter-06-pre-deployment/capacity-planning.md) - Veiledning for ressursplanlegging
- [Valg av SKU](../chapter-06-pre-deployment/sku-selection.md) - Anbefalinger for servicelag

---

**Tips**: Bokmerk denne veiledningen og henvis til den når du støter på problemer. De fleste problemer har blitt observert før og har etablerte løsninger!

---

**Navigasjon**
- **Forrige leksjon**: [Provisjonering av ressurser](../chapter-04-infrastructure/provisioning.md)
- **Neste leksjon**: [Feilsøkingsguide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på sitt opprinnelige språk skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->