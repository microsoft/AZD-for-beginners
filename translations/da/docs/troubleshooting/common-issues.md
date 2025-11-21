<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-21T09:16:35+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "da"
}
-->
# Almindelige Problemer og Løsninger

**Kapitel Navigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige Kapitel**: [Kapitel 6: Forberedelsestjek](../pre-deployment/preflight-checks.md)
- **➡️ Næste**: [Debugging Guide](debugging.md)
- **🚀 Næste Kapitel**: [Kapitel 8: Produktions- & Enterprise Mønstre](../microsoft-foundry/production-ai-practices.md)

## Introduktion

Denne omfattende fejlfindingsguide dækker de mest almindelige problemer, der opstår ved brug af Azure Developer CLI. Lær at diagnosticere, fejlfinde og løse typiske problemer med autentifikation, udrulning, infrastrukturklargøring og applikationskonfiguration. Hvert problem inkluderer detaljerede symptomer, årsager og trin-for-trin løsninger.

## Læringsmål

Ved at gennemføre denne guide vil du:
- Mestre diagnostiske teknikker til Azure Developer CLI problemer
- Forstå almindelige autentifikations- og tilladelsesproblemer samt deres løsninger
- Løse fejl ved udrulning, infrastrukturklargøring og konfigurationsproblemer
- Implementere proaktiv overvågning og debugging-strategier
- Anvende systematiske fejlfindingsmetoder til komplekse problemer
- Konfigurere korrekt logning og overvågning for at forhindre fremtidige problemer

## Læringsresultater

Efter afslutning vil du kunne:
- Diagnosticere Azure Developer CLI problemer ved hjælp af indbyggede diagnostiske værktøjer
- Løse autentifikations-, abonnements- og tilladelsesrelaterede problemer selvstændigt
- Fejlfinde udrulningsfejl og infrastrukturklargøringsproblemer effektivt
- Debugge applikationskonfigurationsproblemer og miljøspecifikke udfordringer
- Implementere overvågning og alarmering for proaktivt at identificere potentielle problemer
- Anvende bedste praksis for logning, debugging og problemløsningsarbejdsgange

## Hurtig Diagnostik

Før du dykker ned i specifikke problemer, kør disse kommandoer for at indsamle diagnostisk information:

```bash
# Kontroller azd-version og sundhed
azd version
azd config list

# Bekræft Azure-autentifikation
az account show
az account list

# Kontroller nuværende miljø
azd env show
azd env get-values

# Aktiver fejlsøgningslogning
export AZD_DEBUG=true
azd <command> --debug
```

## Autentifikationsproblemer

### Problem: "Kunne ikke hente adgangstoken"
**Symptomer:**
- `azd up` fejler med autentifikationsfejl
- Kommandoer returnerer "uautoriseret" eller "adgang nægtet"

**Løsninger:**
```bash
# 1. Godkend igen med Azure CLI
az login
az account show

# 2. Ryd cachelagrede legitimationsoplysninger
az account clear
az login

# 3. Brug enhedskodeflow (til systemer uden hoved)
az login --use-device-code

# 4. Angiv eksplicit abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Utilstrækkelige privilegier" under udrulning
**Symptomer:**
- Udrulning fejler med tilladelsesfejl
- Kan ikke oprette visse Azure ressourcer

**Løsninger:**
```bash
# 1. Kontroller dine Azure-rolle tildelinger
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Sørg for, at du har de nødvendige roller
# - Bidragyder (til ressourceoprettelse)
# - Brugeradgangsadministrator (til rolletildelinger)

# 3. Kontakt din Azure-administrator for de korrekte tilladelser
```

### Problem: Multi-tenant autentifikationsproblemer
**Løsninger:**
```bash
# 1. Log ind med specifik lejer
az login --tenant "your-tenant-id"

# 2. Indstil lejer i konfiguration
azd config set auth.tenantId "your-tenant-id"

# 3. Ryd lejerens cache, hvis der skiftes lejer
az account clear
```

## 🏗️ Infrastrukturklargøringsfejl

### Problem: Konflikter med ressourcenavne
**Symptomer:**
- Fejl "Ressourcenavnet eksisterer allerede"
- Udrulning fejler under ressourceoprettelse

**Løsninger:**
```bash
# 1. Brug unikke ressourcenavne med tokens
# I din Bicep-skabelon:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Skift miljønavn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ryd op i eksisterende ressourcer
azd down --force --purge
```

### Problem: Lokation/Region ikke tilgængelig
**Symptomer:**
- Fejl "Lokationen 'xyz' er ikke tilgængelig for ressource typen"
- Visse SKUs ikke tilgængelige i den valgte region

**Løsninger:**
```bash
# 1. Kontroller tilgængelige placeringer for ressource typer
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Brug almindeligt tilgængelige regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Kontroller tjenestetilgængelighed efter region
# Besøg: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvota overskredet fejl
**Symptomer:**
- Fejl "Kvota overskredet for ressource typen"
- "Maksimalt antal ressourcer nået"

**Løsninger:**
```bash
# 1. Kontroller nuværende kvoteforbrug
az vm list-usage --location eastus2 -o table

# 2. Anmod om kvoteforøgelse via Azure-portalen
# Gå til: Abonnementer > Forbrug + kvoter

# 3. Brug mindre SKUs til udvikling
# I main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Ryd op i ubrugte ressourcer
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep skabelonfejl
**Symptomer:**
- Valideringsfejl i skabeloner
- Syntaksfejl i Bicep filer

**Løsninger:**
```bash
# 1. Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# 2. Brug Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Kontroller parameterfil-syntaks
cat infra/main.parameters.json | jq '.'

# 4. Forhåndsvis ændringer i deployment
azd provision --preview
```

## 🚀 Udrulningsfejl

### Problem: Bygningsfejl
**Symptomer:**
- Applikationen fejler under bygning ved udrulning
- Fejl ved installation af pakker

**Løsninger:**
```bash
# 1. Tjek bygge-logfiler
azd logs --service web
azd deploy --service web --debug

# 2. Test bygningen lokalt
cd src/web
npm install
npm run build

# 3. Tjek Node.js/Python versionskompatibilitet
node --version  # Skal matche azure.yaml-indstillinger
python --version

# 4. Ryd bygge-cache
rm -rf node_modules package-lock.json
npm install

# 5. Tjek Dockerfile, hvis der bruges containere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fejl ved containerudrulning
**Symptomer:**
- Container apps starter ikke
- Fejl ved hentning af billeder

**Løsninger:**
```bash
# 1. Test Docker build lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontroller containerlogfiler
azd logs --service api --follow

# 3. Bekræft adgang til containerregister
az acr login --name myregistry

# 4. Kontroller containerappkonfiguration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Fejl ved databaseforbindelse
**Symptomer:**
- Applikationen kan ikke forbinde til databasen
- Timeout fejl ved forbindelse

**Løsninger:**
```bash
# 1. Kontroller database firewall-regler
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test forbindelsen fra applikationen
# Tilføj midlertidigt til din app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Bekræft formatet på forbindelsesstrengen
azd env get-values | grep DATABASE

# 4. Kontroller status for databaseserveren
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsproblemer

### Problem: Miljøvariabler fungerer ikke
**Symptomer:**
- Appen kan ikke læse konfigurationsværdier
- Miljøvariabler virker tomme

**Løsninger:**
```bash
# 1. Bekræft, at miljøvariabler er indstillet
azd env get-values
azd env get DATABASE_URL

# 2. Kontroller variabelnavne i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Genstart applikationen
azd deploy --service web

# 4. Kontroller app service-konfigurationen
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS certifikatproblemer
**Symptomer:**
- HTTPS fungerer ikke
- Fejl ved certifikatvalidering

**Løsninger:**
```bash
# 1. Kontroller SSL-certifikatstatus
az webapp config ssl list --resource-group myrg

# 2. Aktiver kun HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tilføj brugerdefineret domæne (hvis nødvendigt)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS konfigurationsproblemer
**Symptomer:**
- Frontend kan ikke kalde API
- Cross-origin anmodning blokeret

**Løsninger:**
```bash
# 1. Konfigurer CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Opdater API til at håndtere CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontroller, om der køres på de korrekte URL'er
azd show
```

## 🌍 Miljøstyringsproblemer

### Problem: Problemer med miljøskift
**Symptomer:**
- Forkert miljø bliver brugt
- Konfiguration skifter ikke korrekt

**Løsninger:**
```bash
# 1. Liste alle miljøer
azd env list

# 2. Vælg miljø eksplicit
azd env select production

# 3. Bekræft aktuelt miljø
azd env show

# 4. Opret nyt miljø, hvis det er beskadiget
azd env new production-new
azd env select production-new
```

### Problem: Miljøkorruption
**Symptomer:**
- Miljø viser ugyldig tilstand
- Ressourcer matcher ikke konfigurationen

**Løsninger:**
```bash
# 1. Opdater miljøtilstand
azd env refresh

# 2. Nulstil miljøkonfiguration
azd env new production-reset
# Kopier nødvendige miljøvariabler
azd env set DATABASE_URL "your-value"

# 3. Importer eksisterende ressourcer (hvis muligt)
# Opdater manuelt .azure/production/config.json med ressource-ID'er
```

## 🔍 Ydelsesproblemer

### Problem: Langsom udrulningstid
**Symptomer:**
- Udrulninger tager for lang tid
- Timeouts under udrulning

**Løsninger:**
```bash
# 1. Aktiver parallel udrulning
azd config set deploy.parallelism 5

# 2. Brug inkrementelle udrulninger
azd deploy --incremental

# 3. Optimer byggeprocessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontroller ressourcens placeringer (brug samme region)
azd config set defaults.location eastus2
```

### Problem: Applikationsydelsesproblemer
**Symptomer:**
- Langsomme svartider
- Højt ressourceforbrug

**Løsninger:**
```bash
# 1. Skaler ressourcer op
# Opdater SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktiver Application Insights-overvågning
azd monitor

# 3. Kontroller applikationslogfiler for flaskehalse
azd logs --service api --follow

# 4. Implementer caching
# Tilføj Redis-cache til din infrastruktur
```

## 🛠️ Fejlfinding Værktøjer og Kommandoer

### Debug Kommandoer
```bash
# Omfattende fejlfinding
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontroller systeminfo
azd info

# Valider konfiguration
azd config validate

# Test forbindelsen
curl -v https://myapp.azurewebsites.net/health
```

### Log Analyse
```bash
# Applikationslogfiler
azd logs --service web --follow
azd logs --service api --since 1h

# Azure ressourcelogfiler
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogfiler (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Ressource Undersøgelse
```bash
# Liste alle ressourcer
az resource list --resource-group myrg -o table

# Kontroller ressource status
az webapp show --name myapp --resource-group myrg --query state

# Netværksdiagnostik
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få Yderligere Hjælp

### Hvornår skal man eskalere
- Autentifikationsproblemer fortsætter efter at have prøvet alle løsninger
- Infrastrukturproblemer med Azure tjenester
- Fakturerings- eller abonnementsrelaterede problemer
- Sikkerhedsbekymringer eller hændelser

### Supportkanaler
```bash
# 1. Kontroller Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Opret Azure supportanmodning
# Gå til: https://portal.azure.com -> Hjælp + support

# 3. Fællesskabsressourcer
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Information at Indsamle
Før du kontakter support, indsamle:
- `azd version` output
- `azd info` output
- Fejlmeddelelser (fuld tekst)
- Trin til at genskabe problemet
- Miljødetaljer (`azd env show`)
- Tidslinje for hvornår problemet startede

### Logindsamlingsscript
```bash
#!/bin/bash
# indsamle-fejlfindingsoplysninger.sh

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

## 📊 Forebyggelse af Problemer

### Forberedelsestjekliste
```bash
# 1. Valider autentifikation
az account show

# 2. Kontroller kvoter og grænser
az vm list-usage --location eastus2

# 3. Valider skabeloner
az bicep build --file infra/main.bicep

# 4. Test lokalt først
npm run build
npm run test

# 5. Brug dry-run udrulninger
azd provision --preview
```

### Overvågningsopsætning
```bash
# Aktiver Application Insights
# Tilføj til main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Opsæt alarmer
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelmæssig Vedligeholdelse
```bash
# Ugentlige sundhedstjek
./scripts/health-check.sh

# Månedlig omkostningsgennemgang
az consumption usage list --billing-period-name 202401

# Kvartalsvis sikkerhedsgennemgang
az security assessment list --resource-group myrg
```

## Relaterede Ressourcer

- [Debugging Guide](debugging.md) - Avancerede debugging teknikker
- [Provisioning Resources](../deployment/provisioning.md) - Fejlfinding af infrastruktur
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Vejledning til ressourceplanlægning
- [SKU Selection](../pre-deployment/sku-selection.md) - Anbefalinger til serviceniveauer

---

**Tip**: Gem denne guide som bogmærke og brug den, når du støder på problemer. De fleste problemer er set før og har etablerede løsninger!

---

**Navigation**
- **Forrige Lektion**: [Provisioning Resources](../deployment/provisioning.md)
- **Næste Lektion**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->