# Almindelige problemer og løsninger

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 7 - Fejlfinding & debugging
- **⬅️ Forrige kapitel**: [Kapitel 6: Forudgående tjek](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Næste**: [Fejlfinding](debugging.md)
- **🚀 Næste kapitel**: [Kapitel 8: Produktions- og virksomhedsmønstre](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denne omfattende fejlfindingguide dækker de mest almindeligt forekommende problemer ved brug af Azure Developer CLI. Lær at diagnosticere, fejlfinde og løse almindelige problemer med autentificering, udrulning, infrastrukturprovisionering og applikationskonfiguration. Hvert problem indeholder detaljerede symptomer, grundårsager og trin-for-trin løsningsprocedurer.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre diagnostiske teknikker til Azure Developer CLI-problemer
- Forstå almindelige autentificerings- og rettighedsproblemer og deres løsninger
- Løse udrulningsfejl, fejl ved infrastrukturprovisionering og konfigurationsproblemer
- Implementere proaktive overvågnings- og fejlsøgningsstrategier
- Anvende systematiske fejlfindingmetodologier til komplekse problemer
- Konfigurere korrekt logging og overvågning for at forebygge fremtidige problemer

## Læringsudbytte

Efter gennemførelsen vil du kunne:
- Diagnosticere Azure Developer CLI-problemer ved hjælp af indbyggede diagnostiske værktøjer
- Løse autentificerings-, abonnement- og rettighedsrelaterede problemer selvstændigt
- Fejlsøge udrulningsfejl og fejl ved infrastrukturprovisionering effektivt
- Debugge applikationskonfigurationsproblemer og miljøspecifikke problemer
- Implementere overvågning og alarmering for proaktivt at identificere potentielle problemer
- Anvende bedste praksis for logging, debugging og arbejdsgange til problemhåndtering

## Hurtig diagnostik

Før du dykker ned i specifikke problemer, kør disse kommandoer for at indsamle diagnostisk information:

```bash
# Kontroller azd-version og tilstand
azd version
azd config show

# Bekræft Azure-autentificering
az account show
az account list

# Kontroller det aktuelle miljø
azd env list
azd env get-values

# Aktiver debug-logning
export AZD_DEBUG=true
azd <command> --debug
```

## Autentificeringsproblemer

### Problem: "Kunne ikke hente adgangstoken"
**Symptomer:**
- `azd up` fejler med autentificeringsfejl
- Kommandoer returnerer "unauthorized" eller "access denied"

**Løsninger:**
```bash
# 1. Genautentificer med Azure CLI
az login
az account show

# 2. Ryd cachede legitimationsoplysninger
az account clear
az login

# 3. Brug device code-flow (til headless-systemer)
az login --use-device-code

# 4. Angiv eksplicit abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Utilstrækkelige rettigheder" under udrulning
**Symptomer:**
- Udrulning fejler med tilladelsesfejl
- Kan ikke oprette bestemte Azure-ressourcer

**Løsninger:**
```bash
# 1. Kontroller dine Azure-rolle-tildelinger
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Sørg for, at du har de nødvendige roller
# - Contributor (til oprettelse af ressourcer)
# - User Access Administrator (til tildeling af roller)

# 3. Kontakt din Azure-administrator for de nødvendige tilladelser
```

### Problem: Problemer med multi-tenant autentificering
**Løsninger:**
```bash
# 1. Log ind med en specifik lejer
az login --tenant "your-tenant-id"

# 2. Indstil lejer i konfigurationen
azd config set auth.tenantId "your-tenant-id"

# 3. Ryd lejerens cache, hvis du skifter mellem lejere
az account clear
```

## 🏗️ Fejl ved provisioning af infrastruktur

### Problem: Konflikter i ressourcenavne
**Symptomer:**
- "The resource name already exists" fejl
- Udrulning fejler under oprettelse af ressourcer

**Løsninger:**
```bash
# 1. Brug unikke ressourcenavne med tokener
# I din Bicep-skabelon:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Skift miljøets navn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ryd op i eksisterende ressourcer
azd down --force --purge
```

### Problem: Placering/region ikke tilgængelig
**Symptomer:**
- "The location 'xyz' is not available for resource type"
- Visse SKUs ikke tilgængelige i den valgte region

**Løsninger:**
```bash
# 1. Kontroller tilgængelige placeringer for ressourcetyper
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Brug almindeligt tilgængelige regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Kontroller tjenesters tilgængelighed efter region
# Besøg: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvote overskredet
**Symptomer:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Løsninger:**
```bash
# 1. Kontroller nuværende kvoteforbrug
az vm list-usage --location eastus2 -o table

# 2. Anmod om kvoteforhøjelse via Azure-portalen
# Gå til: Abonnementer > Forbrug + kvoter

# 3. Brug mindre SKU'er til udvikling
# I main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Ryd op i ubrugte ressourcer
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep-skabelonfejl
**Symptomer:**
- Skabelonvalideringsfejl
- Syntaksfejl i Bicep-filer

**Løsninger:**
```bash
# 1. Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# 2. Brug Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Kontroller parameterfilens syntaks
cat infra/main.parameters.json | jq '.'

# 4. Forhåndsvis ændringer i udrulningen
azd provision --preview
```

## 🚀 Udrulningsfejl

### Problem: Build-fejl
**Symptomer:**
- Applikationen kan ikke bygges under udrulning
- Fejl ved installation af pakker

**Løsninger:**
```bash
# 1. Kontroller build-output med debug-flag
azd deploy --service web --debug

# 2. Se status for den udrullede tjeneste
azd show

# 3. Test build lokalt
cd src/web
npm install
npm run build

# 3. Kontroller kompatibiliteten mellem Node.js- og Python-versioner
node --version  # Skal matche indstillingerne i azure.yaml
python --version

# 4. Ryd build-cache
rm -rf node_modules package-lock.json
npm install

# 5. Tjek Dockerfile, hvis du bruger containere
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fejl ved container-udrulning
**Symptomer:**
- Containerapps starter ikke
- Fejl ved pull af image

**Løsninger:**
```bash
# 1. Test Docker-build lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Tjek container-logfiler ved hjælp af Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Overvåg applikationen via azd
azd monitor --logs

# 3. Bekræft adgang til containerregistret
az acr login --name myregistry

# 4. Tjek containerappens konfiguration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Databaseforbindelsesfejl
**Symptomer:**
- Applikationen kan ikke forbinde til databasen
- Forbindelsestimeouts

**Løsninger:**
```bash
# 1. Kontroller firewallreglerne for databasen
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test forbindelsen fra applikationen
# Tilføj midlertidigt til din app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Bekræft formatet på forbindelsesstrengen
azd env get-values | grep DATABASE

# 4. Kontroller databaseserverens status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsproblemer

### Problem: Miljøvariabler virker ikke
**Symptomer:**
- App kan ikke læse konfigurationsværdier
- Miljøvariabler fremstår tomme

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

### Problem: SSL/TLS-certifikatproblemer
**Symptomer:**
- HTTPS virker ikke
- Certifikatvalideringsfejl

**Løsninger:**
```bash
# 1. Kontroller SSL-certifikatets status
az webapp config ssl list --resource-group myrg

# 2. Aktivér kun HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tilføj et tilpasset domæne (hvis nødvendigt)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-konfigurationsproblemer
**Symptomer:**
- Frontend kan ikke kalde API
- Cross-origin request blokeret

**Løsninger:**
```bash
# 1. Konfigurer CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Opdater API'en for at håndtere CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontroller om det kører på de korrekte URL'er
azd show
```

## 🌍 Problemer med miljøstyring

### Problem: Problemer med skift af miljø
**Symptomer:**
- Forkert miljø bliver brugt
- Konfiguration skifter ikke korrekt

**Løsninger:**
```bash
# 1. Vis alle miljøer
azd env list

# 2. Vælg eksplicit miljø
azd env select production

# 3. Bekræft det aktuelle miljø
azd env list

# 4. Opret nyt miljø, hvis det er beskadiget
azd env new production-new
azd env select production-new
```

### Problem: Korrupteret miljø
**Symptomer:**
- Miljø viser ugyldig tilstand
- Ressourcer matcher ikke konfiguration

**Løsninger:**
```bash
# 1. Opdater miljøets tilstand
azd env refresh

# 2. Nulstil miljøkonfigurationen
azd env new production-reset
# Kopier de nødvendige miljøvariabler
azd env set DATABASE_URL "your-value"

# 3. Importer eksisterende ressourcer (hvis muligt)
# Opdater manuelt .azure/production/config.json med ressource-ID'er
```

## 🔍 Ydeevneproblemer

### Problem: Langsomme udrulningstider
**Symptomer:**
- Udrulninger tager for lang tid
- Timeouts under udrulning

**Løsninger:**
```bash
# 1. Udrul specifikke tjenester for hurtigere iteration
azd deploy --service web
azd deploy --service api

# 2. Brug kun kodeudrulning når infrastrukturen er uændret
azd deploy  # Hurtigere end azd up

# 3. Optimer byggeprocessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontroller ressourceplaceringer (brug samme region)
azd config set defaults.location eastus2
```

### Problem: Problemer med applikationens ydeevne
**Symptomer:**
- Langsomme svartider
- Højt ressourceforbrug

**Løsninger:**
```bash
# 1. Øg ressourcerne
# Opdater SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktivér Application Insights-overvågning
azd monitor --overview

# 3. Tjek applikationslogfiler i Azure
az webapp log tail --name myapp --resource-group myrg
# eller for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementer caching
# Tilføj Redis-cache til din infrastruktur
```

## 🛠️ Fejlfindingværktøjer og kommandoer

### Debug-kommandoer
```bash
# Omfattende fejlfinding
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Tjek azd-versionen
azd version

# Vis den aktuelle konfiguration
azd config show

# Test forbindelsen
curl -v https://myapp.azurewebsites.net/health
```

### Loganalyse
```bash
# Applikationslogfiler via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Overvåg applikationen med azd
azd monitor --logs
azd monitor --live

# Azure-ressourcelogfiler
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogfiler (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Undersøgelse af ressourcer
```bash
# Vis alle ressourcer
az resource list --resource-group myrg -o table

# Kontroller ressourcestatus
az webapp show --name myapp --resource-group myrg --query state

# Netværksdiagnostik
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få yderligere hjælp

### Hvornår du skal eskalere
- Autentificeringsproblemer fortsætter efter afprøvning af alle løsninger
- Infrastrukturelle problemer med Azure-tjenester
- Fakturerings- eller abonnementsrelaterede problemer
- Sikkerhedsbekymringer eller hændelser

### Supportkanaler
```bash
# 1. Kontroller Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Opret en Azure-supportanmodning
# Gå til: https://portal.azure.com -> Hjælp + support

# 3. Fællesskabsressourcer
# - Stack Overflow: taggen azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Oplysninger der skal indsamles
Før du kontakter support, indsamle:
- `azd version` output
- `azd config show` output
- `azd show` output (nuværende udrulningstilstand)
- Fejlmeddelelser (fuld tekst)
- Trin til at reproducere problemet
- Miljødetaljer (`azd env get-values`)
- Tidslinje for hvornår problemet startede

### Script til logindsamling
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

## 📊 Forebyggelse af problemer

### Tjekliste før udrulning
```bash
# 1. Valider autentificering
az account show

# 2. Kontroller kvoter og grænser
az vm list-usage --location eastus2

# 3. Valider skabeloner
az bicep build --file infra/main.bicep

# 4. Test lokalt først
npm run build
npm run test

# 5. Brug dry-run-udrulninger
azd provision --preview
```

### Opsætning af overvågning
```bash
# Aktivér Application Insights
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

### Regelmæssig vedligeholdelse
```bash
# Ugentlige sundhedstjek
./scripts/health-check.sh

# Månedlig omkostningsgennemgang
az consumption usage list --billing-period-name 202401

# Kvartalsvis sikkerhedsgennemgang
az security assessment list --resource-group myrg
```

## Relaterede ressourcer

- [Fejlfinding](debugging.md) - Avancerede fejlsøgningsteknikker
- [Provisionering af ressourcer](../chapter-04-infrastructure/provisioning.md) - Fejlfinding af infrastruktur
- [Kapacitetsplanlægning](../chapter-06-pre-deployment/capacity-planning.md) - Vejledning i ressourceplanlægning
- [SKU-valg](../chapter-06-pre-deployment/sku-selection.md) - Anbefalinger til servicelag

---

**Tip**: Gem denne vejledning i bogmærker og henvis til den, når du støder på problemer. De fleste problemer er set før og har etablerede løsninger!

---

**Navigation**
- **Forrige lektion**: [Provisionering af ressourcer](../chapter-04-infrastructure/provisioning.md)
- **Næste lektion**: [Fejlfinding](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Mens vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på sit oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->