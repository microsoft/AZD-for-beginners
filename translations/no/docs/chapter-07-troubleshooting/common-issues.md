# Vanlige problemer og løsninger

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 7 - Feilsøking og Debugging
- **⬅️ Forrige Kapittel**: [Kapittel 6: Pre-flight kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Neste**: [Debugging Guide](debugging.md)
- **🚀 Neste Kapittel**: [Kapittel 8: Produksjon & Enterprise Mønstre](../chapter-08-production/production-ai-practices.md)

## Introduksjon

Denne omfattende feilsøkingsguiden dekker de mest vanlige problemene som oppstår ved bruk av Azure Developer CLI. Lær å diagnostisere, feilsøke og løse vanlige problemer med autentisering, distribusjon, infrastrukturprovisjonering og applikasjonskonfigurasjon. Hvert problem inkluderer detaljerte symptomer, årsaker og trinnvise løsninger.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre diagnostiske teknikker for Azure Developer CLI-problemer
- Forstå vanlige autentiserings- og tillatelsesproblemer og deres løsninger
- Løse distribusjonsfeil, feil ved infrastrukturprovisjonering og konfigurasjonsproblemer
- Implementere proaktive overvåknings- og feilsøkingsstrategier
- Anvende systematiske feilsøkingsmetodikker for komplekse problemer
- Konfigurere riktig logging og overvåking for å forhindre fremtidige problemer

## Læringsutbytte

Etter gjennomføring vil du kunne:
- Diagnostisere Azure Developer CLI-problemer ved hjelp av innebygde diagnostiske verktøy
- Løse autentiserings-, abonnement- og tillatelsesrelaterte problemer på egen hånd
- Feilsøke distribusjonsfeil og feil ved infrastrukturprovisjonering effektivt
- Debugge applikasjonskonfigurasjonsproblemer og miljøspesifikke problemer
- Implementere overvåking og varsling for proaktivt å identifisere potensielle problemer
- Anvende beste praksis for logging, debugging og problemløsningsflyter

## Rask diagnostikk

Før du går inn i spesifikke problemer, kjør disse kommandoene for å samle diagnostisk informasjon:

```bash
# Sjekk azd-versjon og helse
azd version
azd config show

# Verifiser Azure-autentisering
az account show
az account list

# Sjekk gjeldende miljø
azd env list
azd env get-values

# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd <command> --debug
```

## Autentiseringsproblemer

### Problem: "Kunne ikke hente tilgangstoken"
**Symptomer:**
- `azd up` feiler med autentiseringsfeil
- Kommandoer returnerer "unauthorized" eller "access denied"

**Løsninger:**
```bash
# 1. Autentiser på nytt med Azure CLI
az login
az account show

# 2. Tøm bufrede legitimasjoner
az account clear
az login

# 3. Bruk enhetskodeflyt (for systemer uten brukergrensesnitt)
az login --use-device-code

# 4. Sett eksplisitt abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Utilstrekkelige rettigheter" under distribusjon
**Symptomer:**
- Distribusjon feiler med tillatelsesfeil
- Kan ikke opprette visse Azure-ressurser

**Løsninger:**
```bash
# 1. Sjekk dine Azure-rolleoppgaver
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Sørg for at du har nødvendige roller
# - Bidragsyter (for ressursoppretting)
# - Brukertilgangsadministrator (for rolleoppgaver)

# 3. Kontakt din Azure-administrator for riktige tillatelser
```

### Problem: Multi-tenant autentiseringsproblemer
**Løsninger:**
```bash
# 1. Logg inn med spesifikk leietaker
az login --tenant "your-tenant-id"

# 2. Sett leietaker i konfigurasjonen
azd config set auth.tenantId "your-tenant-id"

# 3. Tøm leietakerbuffer ved bytte av leietaker
az account clear
```

## 🏗️ Infrastrukturprovisjonsfeil

### Problem: Konflikter i ressursnavn
**Symptomer:**
- "Ressursnavnet eksisterer allerede" feil
- Distribusjon feiler under ressursopprettelse

**Løsninger:**
```bash
# 1. Bruk unike ressursnavn med tokens
# I Bicep-malen din:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Endre miljønavn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Rydd opp i eksisterende ressurser
azd down --force --purge
```

### Problem: Lokasjon/Region ikke tilgjengelig
**Symptomer:**
- "Lokasjonen 'xyz' er ikke tilgjengelig for ressurs type"
- Visse SKU-er ikke tilgjengelige i valgt region

**Løsninger:**
```bash
# 1. Sjekk tilgjengelige lokasjoner for ressurstyper
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Bruk vanlige tilgjengelige regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Sjekk tjenestens tilgjengelighet etter region
# Besøk: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvote overskredet feil
**Symptomer:**
- "Kvote overskredet for ressurs type"
- "Maksimum antall ressurser er nådd"

**Løsninger:**
```bash
# 1. Sjekk gjeldende kvotebruk
az vm list-usage --location eastus2 -o table

# 2. Be om økning av kvote gjennom Azure-portalen
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
- Valideringsfeil i maler
- Syntaksfeil i Bicep-filer

**Løsninger:**
```bash
# 1. Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# 2. Bruk Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Sjekk syntaks i parameterfil
cat infra/main.parameters.json | jq '.'

# 4. Forhåndsvis endringer i distribusjon
azd provision --preview
```

## 🚀 Distribusjonsfeil

### Problem: Byggefeil
**Symptomer:**
- Applikasjonen feiler under bygging ved distribusjon
- Feil ved pakkeinstallasjon

**Løsninger:**
```bash
# 1. Sjekk byggeutgang med debug-flagget
azd deploy --service web --debug

# 2. Se status for distribuert tjeneste
azd show

# 3. Test bygg lokalt
cd src/web
npm install
npm run build

# 3. Sjekk Node.js/Python versjonskompatibilitet
node --version  # Bør samsvare med azure.yaml-innstillinger
python --version

# 4. Tøm byggebuffer
rm -rf node_modules package-lock.json
npm install

# 5. Sjekk Dockerfile hvis du bruker containere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Containerdistribusjonsfeil
**Symptomer:**
- Container-apper starter ikke
- Feil ved nedlasting av image

**Løsninger:**
```bash
# 1. Test Docker-bygg lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sjekk containerlogger ved hjelp av Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Overvåk applikasjonen gjennom azd
azd monitor --logs

# 3. Verifiser tilgang til containerregister
az acr login --name myregistry

# 4. Sjekk containerapp-konfigurasjon
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Database-tilkoblingsfeil
**Symptomer:**
- Applikasjonen kan ikke koble til database
- Timeout ved tilkobling

**Løsninger:**
```bash
# 1. Sjekk brannmurregler for databasen
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test tilkobling fra applikasjonen
# Legg midlertidig til i appen din:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifiser formatet på tilkoblingsstrengen
azd env get-values | grep DATABASE

# 4. Sjekk status på databaseserveren
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurasjonsproblemer

### Problem: Miljøvariabler fungerer ikke
**Symptomer:**
- App kan ikke lese konfigurasjonsverdier
- Miljøvariabler vises som tomme

**Løsninger:**
```bash
# 1. Bekreft at miljøvariabler er satt
azd env get-values
azd env get DATABASE_URL

# 2. Sjekk variabelnavn i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Start applikasjonen på nytt
azd deploy --service web

# 4. Sjekk app-tjenestekonfigurasjonen
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS sertifikatproblemer
**Symptomer:**
- HTTPS fungerer ikke
- Sertifikatvalideringsfeil

**Løsninger:**
```bash
# 1. Sjekk SSL-sertifikatstatus
az webapp config ssl list --resource-group myrg

# 2. Aktiver kun HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Legg til egendefinert domene (hvis nødvendig)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS konfigurasjonsproblemer
**Symptomer:**
- Frontend kan ikke kalle API
- Kryss-opprinnelsesanmodning blokkert

**Løsninger:**
```bash
# 1. Konfigurer CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Oppdater API for å håndtere CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Sjekk om det kjører på riktige nettadresser
azd show
```

## 🌍 Miljøhåndteringsproblemer

### Problem: Bytte av miljøproblemer
**Symptomer:**
- Feil miljø blir brukt
- Konfigurasjon bytter seg ikke riktig

**Løsninger:**
```bash
# 1. List alle miljøer
azd env list

# 2. Velg miljø eksplisitt
azd env select production

# 3. Verifiser gjeldende miljø
azd env list

# 4. Opprett nytt miljø hvis skadet
azd env new production-new
azd env select production-new
```

### Problem: Miljøkorrupsjon
**Symptomer:**
- Miljø viser ugyldig tilstand
- Ressurser samsvarer ikke med konfigurasjon

**Løsninger:**
```bash
# 1. Oppdater miljøstatus
azd env refresh

# 2. Tilbakestill miljøkonfigurasjon
azd env new production-reset
# Kopier over nødvendige miljøvariabler
azd env set DATABASE_URL "your-value"

# 3. Importer eksisterende ressurser (hvis mulig)
# Oppdater manuelt .azure/production/config.json med ressurs-IDer
```

## 🔍 Ytelsesproblemer

### Problem: Langsomme distribusjonstider
**Symptomer:**
- Distribusjoner tar for lang tid
- Timeout under distribusjon

**Løsninger:**
```bash
# 1. Distribuer spesifikke tjenester for raskere iterasjon
azd deploy --service web
azd deploy --service api

# 2. Bruk kodekun-distribusjon når infrastrukturen er uendret
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
- Trege svartider
- Høy ressursbruk

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

### Debug-kataloger
```bash
# Omfattende feilsøking
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sjekk azd-versjon
azd version

# Vis gjeldende konfigurasjon
azd config show

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

# Azure ressurslogger
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogger (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressursundersøkelser
```bash
# List opp alle ressurser
az resource list --resource-group myrg -o table

# Sjekk ressursstatus
az webapp show --name myapp --resource-group myrg --query state

# Nettverksdiagnostikk
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få ekstra hjelp

### Når skal du eskalere
- Autentiseringsproblemer vedvarer etter å ha prøvd alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Fakturerings- eller abonnementsrelaterte problemer
- Sikkerhetsbekymringer eller hendelser

### Supportkanaler
```bash
# 1. Sjekk Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Opprett en støttesak i Azure
# Gå til: https://portal.azure.com -> Hjelp + støtte

# 3. Fellesskapsressurser
# - Stack Overflow: azure-developer-cli-taggen
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informasjon å samle inn
Før du kontakter support, samle inn:
- `azd version` utdata
- `azd config show` utdata
- `azd show` utdata (nåværende distribusjonsstatus)
- Feilmeldinger (full tekst)
- Steg for å gjenskape problemet
- Miljødetaljer (`azd env get-values`)
- Tidslinje for når problemet startet

### Loggsamlingsskript
```bash
#!/bin/bash
# samle-feilsøkingsinfo.sh

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

## 📊 Problemprevensjon

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

# 5. Bruk "dry-run" distribusjoner
azd provision --preview
```

### Overvåkingsoppsett
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

# Månedlig kostnads gjennomgang
az consumption usage list --billing-period-name 202401

# Kvartalsvis sikkerhetsgjennomgang
az security assessment list --resource-group myrg
```

## Relaterte ressurser

- [Debugging Guide](debugging.md) - Avanserte debuggingteknikker
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Infrastruktur feilsøking
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Veiledning for ressursplanlegging
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Anbefalinger for tjenestenivå

---

**Tips**: Hold denne guiden bokmerket og referer til den når du støter på problemer. De fleste problemene er sett før og har etablerte løsninger!

---

**Navigasjon**
- **Forrige leksjon**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Neste leksjon**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->