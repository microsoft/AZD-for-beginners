<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-21T14:53:47+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "no"
}
-->
# Vanlige Problemer og Løsninger

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 7 - Feilsøking og Debugging
- **⬅️ Forrige Kapittel**: [Kapittel 6: Forberedende Sjekker](../pre-deployment/preflight-checks.md)
- **➡️ Neste**: [Debugging Guide](debugging.md)
- **🚀 Neste Kapittel**: [Kapittel 8: Produksjon og Enterprise Mønstre](../microsoft-foundry/production-ai-practices.md)

## Introduksjon

Denne omfattende feilsøkingsguiden dekker de mest vanlige problemene som oppstår ved bruk av Azure Developer CLI. Lær å diagnostisere, feilsøke og løse vanlige problemer knyttet til autentisering, distribusjon, infrastrukturprovisjonering og applikasjonskonfigurasjon. Hvert problem inkluderer detaljerte symptomer, årsaker og trinnvise løsninger.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre diagnostiske teknikker for problemer med Azure Developer CLI
- Forstå vanlige autentiserings- og tillatelsesproblemer og deres løsninger
- Løse distribusjonsfeil, feil i infrastrukturprovisjonering og konfigurasjonsproblemer
- Implementere proaktiv overvåking og debugging-strategier
- Bruke systematiske feilsøkingsmetoder for komplekse problemer
- Konfigurere riktig logging og overvåking for å forhindre fremtidige problemer

## Læringsutbytte

Etter fullføring vil du kunne:
- Diagnostisere problemer med Azure Developer CLI ved hjelp av innebygde diagnostiske verktøy
- Løse autentiserings-, abonnement- og tillatelsesrelaterte problemer selvstendig
- Feilsøke distribusjonsfeil og feil i infrastrukturprovisjonering effektivt
- Debugge applikasjonskonfigurasjonsproblemer og miljøspesifikke utfordringer
- Implementere overvåking og varsling for å identifisere potensielle problemer proaktivt
- Bruke beste praksis for logging, debugging og problemløsningsarbeidsflyter

## Rask Diagnostikk

Før du dykker ned i spesifikke problemer, kjør disse kommandoene for å samle diagnostisk informasjon:

```bash
# Sjekk azd-versjon og helse
azd version
azd config list

# Verifiser Azure-autentisering
az account show
az account list

# Sjekk nåværende miljø
azd env show
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
# 1. Re-autentiser med Azure CLI
az login
az account show

# 2. Fjern bufrede legitimasjoner
az account clear
az login

# 3. Bruk enhetskodeflyt (for systemer uten skjerm)
az login --use-device-code

# 4. Angi eksplisitt abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Utilstrekkelige privilegier" under distribusjon
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

### Problem: Problemer med multi-tenant autentisering
**Løsninger:**
```bash
# 1. Logg inn med spesifikk leietaker
az login --tenant "your-tenant-id"

# 2. Sett leietaker i konfigurasjonen
azd config set auth.tenantId "your-tenant-id"

# 3. Tøm leietakerens cache hvis du bytter leietakere
az account clear
```

## 🏗️ Feil i Infrastrukturprovisjonering

### Problem: Konflikter med ressursnavn
**Symptomer:**
- Feil som "The resource name already exists"
- Distribusjon feiler under ressursopprettelse

**Løsninger:**
```bash
# 1. Bruk unike ressursnavn med tokens
# I din Bicep-mal:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Endre miljønavn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Rydd opp i eksisterende ressurser
azd down --force --purge
```

### Problem: Lokasjon/Region ikke tilgjengelig
**Symptomer:**
- "The location 'xyz' is not available for resource type"
- Enkelte SKUs er ikke tilgjengelige i valgt region

**Løsninger:**
```bash
# 1. Sjekk tilgjengelige lokasjoner for ressurs typer
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Bruk vanlig tilgjengelige regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Sjekk tjenestetilgjengelighet etter region
# Besøk: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvotebegrensninger overskredet
**Symptomer:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Løsninger:**
```bash
# 1. Sjekk nåværende kvotabruk
az vm list-usage --location eastus2 -o table

# 2. Be om kvoteøkning via Azure-portalen
# Gå til: Abonnementer > Bruk + kvoter

# 3. Bruk mindre SKUs for utvikling
# I main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Rydd opp i ubrukte ressurser
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Feil i Bicep-maler
**Symptomer:**
- Valideringsfeil i maler
- Syntaksfeil i Bicep-filer

**Løsninger:**
```bash
# 1. Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# 2. Bruk Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Sjekk syntaksen for parameterfilen
cat infra/main.parameters.json | jq '.'

# 4. Forhåndsvis endringer i distribusjonen
azd provision --preview
```

## 🚀 Distribusjonsfeil

### Problem: Byggefeil
**Symptomer:**
- Applikasjonen feiler under bygging i distribusjon
- Feil ved installasjon av pakker

**Løsninger:**
```bash
# 1. Sjekk bygge logger
azd logs --service web
azd deploy --service web --debug

# 2. Test bygg lokalt
cd src/web
npm install
npm run build

# 3. Sjekk Node.js/Python versjonskompatibilitet
node --version  # Bør samsvare med azure.yaml-innstillinger
python --version

# 4. Tøm byggebufferen
rm -rf node_modules package-lock.json
npm install

# 5. Sjekk Dockerfile hvis du bruker containere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Feil ved containerdistribusjon
**Symptomer:**
- Container-applikasjoner starter ikke
- Feil ved henting av bilder

**Løsninger:**
```bash
# 1. Test Docker-build lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Sjekk containerlogger
azd logs --service api --follow

# 3. Verifiser tilgang til containerregister
az acr login --name myregistry

# 4. Sjekk containerapp-konfigurasjon
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Feil ved databaseforbindelse
**Symptomer:**
- Applikasjonen kan ikke koble til databasen
- Tidsavbrudd ved tilkobling

**Løsninger:**
```bash
# 1. Sjekk brannmurregler for databasen
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test tilkobling fra applikasjonen
# Legg til i appen din midlertidig:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifiser formatet på tilkoblingsstrengen
azd env get-values | grep DATABASE

# 4. Sjekk status for databaseserveren
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurasjonsproblemer

### Problem: Miljøvariabler fungerer ikke
**Symptomer:**
- Applikasjonen kan ikke lese konfigurasjonsverdier
- Miljøvariabler virker tomme

**Løsninger:**
```bash
# 1. Verifiser at miljøvariabler er satt
azd env get-values
azd env get DATABASE_URL

# 2. Sjekk variabelnavn i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Start applikasjonen på nytt
azd deploy --service web

# 4. Sjekk konfigurasjonen for app-tjenesten
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problemer med SSL/TLS-sertifikater
**Symptomer:**
- HTTPS fungerer ikke
- Feil ved validering av sertifikater

**Løsninger:**
```bash
# 1. Sjekk SSL-sertifikatstatus
az webapp config ssl list --resource-group myrg

# 2. Aktiver kun HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Legg til egendefinert domene (hvis nødvendig)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problemer med CORS-konfigurasjon
**Symptomer:**
- Frontend kan ikke kalle API
- Forespørsel blokkert på grunn av kryss-opprinnelse

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

# 3. Sjekk om kjører på riktige URL-er
azd show
```

## 🌍 Miljøhåndteringsproblemer

### Problem: Problemer med miljøbytte
**Symptomer:**
- Feil miljø blir brukt
- Konfigurasjon bytter ikke riktig

**Løsninger:**
```bash
# 1. List alle miljøer
azd env list

# 2. Velg miljø eksplisitt
azd env select production

# 3. Verifiser nåværende miljø
azd env show

# 4. Opprett nytt miljø hvis ødelagt
azd env new production-new
azd env select production-new
```

### Problem: Korrupsjon i miljø
**Symptomer:**
- Miljøet viser ugyldig tilstand
- Ressurser samsvarer ikke med konfigurasjonen

**Løsninger:**
```bash
# 1. Oppdater miljøtilstand
azd env refresh

# 2. Tilbakestill miljøkonfigurasjon
azd env new production-reset
# Kopier over nødvendige miljøvariabler
azd env set DATABASE_URL "your-value"

# 3. Importer eksisterende ressurser (hvis mulig)
# Oppdater manuelt .azure/production/config.json med ressurs-IDer
```

## 🔍 Ytelsesproblemer

### Problem: Langsom distribusjonstid
**Symptomer:**
- Distribusjoner tar for lang tid
- Tidsavbrudd under distribusjon

**Løsninger:**
```bash
# 1. Aktiver parallell distribusjon
azd config set deploy.parallelism 5

# 2. Bruk inkrementelle distribusjoner
azd deploy --incremental

# 3. Optimaliser byggeprosessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Sjekk ressurslokasjoner (bruk samme region)
azd config set defaults.location eastus2
```

### Problem: Problemer med applikasjonsytelse
**Symptomer:**
- Langsom responstid
- Høyt ressursforbruk

**Løsninger:**
```bash
# 1. Skaler opp ressurser
# Oppdater SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktiver Application Insights-overvåking
azd monitor

# 3. Sjekk applikasjonslogger for flaskehalser
azd logs --service api --follow

# 4. Implementer caching
# Legg til Redis-cache i infrastrukturen din
```

## 🛠️ Feilsøkingsverktøy og Kommandoer

### Debug-kommandoer
```bash
# Omfattende feilsøking
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sjekk systeminformasjon
azd info

# Valider konfigurasjon
azd config validate

# Test tilkobling
curl -v https://myapp.azurewebsites.net/health
```

### Logganalyse
```bash
# Applikasjonslogger
azd logs --service web --follow
azd logs --service api --since 1h

# Azure ressurslogger
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogger (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressursundersøkelse
```bash
# Liste alle ressurser
az resource list --resource-group myrg -o table

# Sjekk ressursstatus
az webapp show --name myapp --resource-group myrg --query state

# Nettverksdiagnostikk
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få Ytterligere Hjelp

### Når Eskalere
- Autentiseringsproblemer vedvarer etter å ha prøvd alle løsninger
- Infrastrukturproblemer med Azure-tjenester
- Problemer relatert til fakturering eller abonnement
- Sikkerhetsproblemer eller hendelser

### Støttekanaler
```bash
# 1. Sjekk Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Opprett Azure supportforespørsel
# Gå til: https://portal.azure.com -> Hjelp + støtte

# 3. Fellesskapsressurser
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informasjon å Samle
Før du kontakter støtte, samle:
- Utdata fra `azd version`
- Utdata fra `azd info`
- Feilmeldinger (full tekst)
- Trinn for å reprodusere problemet
- Miljødetaljer (`azd env show`)
- Tidslinje for når problemet startet

### Skript for Logginnsamling
```bash
#!/bin/bash
# samle-feilrettingsinformasjon.sh

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

## 📊 Forebygging av Problemer

### Sjekkliste før Distribusjon
```bash
# 1. Valider autentisering
az account show

# 2. Sjekk kvoter og grenser
az vm list-usage --location eastus2

# 3. Valider maler
az bicep build --file infra/main.bicep

# 4. Test lokalt først
npm run build
npm run test

# 5. Bruk dry-run distribusjoner
azd provision --preview
```

### Oppsett for Overvåking
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

### Regelmessig Vedlikehold
```bash
# Ukentlige helsesjekker
./scripts/health-check.sh

# Månedlig kostnadsgjennomgang
az consumption usage list --billing-period-name 202401

# Kvartalsvis sikkerhetsgjennomgang
az security assessment list --resource-group myrg
```

## Relaterte Ressurser

- [Debugging Guide](debugging.md) - Avanserte debugging-teknikker
- [Provisioning Resources](../deployment/provisioning.md) - Feilsøking av infrastruktur
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Veiledning for ressursplanlegging
- [SKU Selection](../pre-deployment/sku-selection.md) - Anbefalinger for tjenestenivå

---

**Tips**: Bokmerk denne guiden og bruk den som referanse når du støter på problemer. De fleste problemer har blitt sett før og har etablerte løsninger!

---

**Navigasjon**
- **Forrige Leksjon**: [Provisioning Resources](../deployment/provisioning.md)
- **Neste Leksjon**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->