# Probleme comune și soluții

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 7 - Rezolvarea problemelor și depanare
- **⬅️ Previous Chapter**: [Capitolul 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Ghid de depanare](debugging.md)
- **🚀 Next Chapter**: [Capitolul 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător de depanare acoperă cele mai frecvente probleme întâlnite atunci când utilizați Azure Developer CLI. Învățați să diagnosticați, să depanați și să rezolvați probleme comune legate de autentificare, implementare, aprovizionarea infrastructurii și configurarea aplicațiilor. Fiecare problemă include simptome detaliate, cauze rădăcină și proceduri pas cu pas pentru rezolvare.

## Obiective de învățare

După parcurgerea acestui ghid, veți:
- Stăpâni tehnici de diagnostic pentru problemele Azure Developer CLI
- Înțelege problemele comune de autentificare și permisiuni și soluțiile acestora
- Rezolva eșecurile de implementare, erorile de aprovizionare a infrastructurii și problemele de configurare
- Implementa strategii proactive de monitorizare și depanare
- Aplica metodologii sistematice de depanare pentru probleme complexe
- Configura jurnalizare și monitorizare corespunzătoare pentru a preveni probleme viitoare

## Rezultate ale învățării

La final, veți putea:
- Diagnostica problemele Azure Developer CLI folosind instrumentele de diagnostic încorporate
- Rezolva independent probleme legate de autentificare, abonament și permisiuni
- Depana eficient eșecurile de implementare și erorile de aprovizionare a infrastructurii
- Depana problemele de configurare a aplicațiilor și probleme specifice mediului
- Implementa monitorizare și alertare pentru a identifica proactiv potențiale probleme
- Aplica bune practici pentru jurnalizare, depanare și fluxuri de lucru pentru rezolvarea problemelor

## Diagnostic rapid

Înainte de a intra în probleme specifice, rulați aceste comenzi pentru a colecta informații de diagnostic:

```bash
# Verifică versiunea și starea azd
azd version
azd config list

# Verifică autentificarea Azure
az account show
az account list

# Verifică mediul curent
azd env show
azd env get-values

# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug
```

## Probleme de autentificare

### Problemă: "Failed to get access token"
**Simptome:**
- `azd up` eșuează cu erori de autentificare
- Comenzile returnează "unauthorized" sau "access denied"

**Soluții:**
```bash
# 1. Reautentifică-te cu Azure CLI
az login
az account show

# 2. Șterge acreditările din cache
az account clear
az login

# 3. Folosește fluxul de cod al dispozitivului (pentru sisteme fără interfață grafică)
az login --use-device-code

# 4. Setează un abonament explicit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problemă: "Insufficient privileges" during deployment
**Simptome:**
- Implementarea eșuează cu erori de permisiuni
- Nu se pot crea anumite resurse Azure

**Soluții:**
```bash
# 1. Verificați atribuțiile dvs. de rol în Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Asigurați-vă că aveți rolurile necesare
# - Contributor (pentru crearea resurselor)
# - User Access Administrator (pentru atribuirea rolurilor)

# 3. Contactați administratorul Azure pentru permisiunile adecvate
```

### Problemă: Multi-tenant authentication problems
**Soluții:**
```bash
# 1. Autentificare cu un tenant specific
az login --tenant "your-tenant-id"

# 2. Setează tenantul în configurație
azd config set auth.tenantId "your-tenant-id"

# 3. Curăță cache-ul tenantului dacă schimbi tenantul
az account clear
```

## 🏗️ Erori la aprovizionarea infrastructurii

### Problemă: Resource name conflicts
**Simptome:**
- "The resource name already exists" errors
- Implementarea eșuează în timpul creării resurselor

**Soluții:**
```bash
# 1. Utilizați nume unice de resurse cu tokenuri
# În șablonul Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Schimbați numele mediului
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Curățați resursele existente
azd down --force --purge
```

### Problemă: Location/Region not available
**Simptome:**
- "The location 'xyz' is not available for resource type"
- Anumite SKU-uri nu sunt disponibile în regiunea selectată

**Soluții:**
```bash
# 1. Verificați locațiile disponibile pentru tipurile de resurse
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Utilizați regiuni frecvent disponibile
azd config set defaults.location eastus2
# sau
azd env set AZURE_LOCATION eastus2

# 3. Verificați disponibilitatea serviciilor pe regiune
# Vizitați: https://azure.microsoft.com/global-infrastructure/services/
```

### Problemă: Quota exceeded errors
**Simptome:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluții:**
```bash
# 1. Verifică utilizarea curentă a cotei
az vm list-usage --location eastus2 -o table

# 2. Solicită creșterea cotei prin portalul Azure
# Accesează: Abonamente > Utilizare + cote

# 3. Folosește SKU-uri mai mici pentru dezvoltare
# În main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Elimină resursele neutilizate
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problemă: Bicep template errors
**Simptome:**
- Template validation failures
- Syntax errors in Bicep files

**Soluții:**
```bash
# 1. Validați sintaxa Bicep
az bicep build --file infra/main.bicep

# 2. Utilizați linterul Bicep
az bicep lint --file infra/main.bicep

# 3. Verificați sintaxa fișierului de parametri
cat infra/main.parameters.json | jq '.'

# 4. Previzualizați modificările de implementare
azd provision --preview
```

## 🚀 Eșecuri la implementare

### Problemă: Build failures
**Simptome:**
- Aplicația nu se construiește în timpul implementării
- Erori la instalarea pachetelor

**Soluții:**
```bash
# 1. Verifică ieșirea build-ului cu flag-ul de debug
azd deploy --service web --debug

# 2. Vizualizează starea serviciului implementat
azd show

# 3. Testează build-ul local
cd src/web
npm install
npm run build

# 3. Verifică compatibilitatea versiunilor Node.js/Python
node --version  # Ar trebui să corespundă setărilor din azure.yaml
python --version

# 4. Șterge cache-ul de build
rm -rf node_modules package-lock.json
npm install

# 5. Verifică Dockerfile dacă folosești containere
docker build -t test-image .
docker run --rm test-image
```

### Problemă: Container deployment failures
**Simptome:**
- Aplicațiile containerizate nu pornesc
- Erori la extragerea imaginilor

**Soluții:**
```bash
# 1. Testează construirea imaginii Docker local
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verifică jurnalele containerului folosind Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorizează aplicația prin azd
azd monitor --logs

# 3. Verifică accesul la registrul de containere
az acr login --name myregistry

# 4. Verifică configurația aplicației container
az containerapp show --name my-app --resource-group my-rg
```

### Problemă: Database connection failures
**Simptome:**
- Aplicația nu se poate conecta la baza de date
- Erori de tip timeout la conectare

**Soluții:**
```bash
# 1. Verificați regulile firewall ale bazei de date
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testați conectivitatea din aplicație
# Adăugați temporar în aplicația dvs.:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verificați formatul șirului de conexiune
azd env get-values | grep DATABASE

# 4. Verificați starea serverului bazei de date
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Probleme de configurare

### Problemă: Environment variables not working
**Simptome:**
- Aplicația nu poate citi valorile de configurare
- Variabilele de mediu par goale

**Soluții:**
```bash
# 1. Verificați dacă variabilele de mediu sunt setate
azd env get-values
azd env get DATABASE_URL

# 2. Verificați numele variabilelor din azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reporniți aplicația
azd deploy --service web

# 4. Verificați configurația serviciului App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problemă: SSL/TLS certificate problems
**Simptome:**
- HTTPS nu funcționează
- Erori de validare a certificatelor

**Soluții:**
```bash
# 1. Verificați starea certificatului SSL
az webapp config ssl list --resource-group myrg

# 2. Activați numai HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adăugați domeniu personalizat (dacă este necesar)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problemă: CORS configuration problems
**Simptome:**
- Frontend-ul nu poate apela API-ul
- Cerere cross-origin blocată

**Soluții:**
```bash
# 1. Configurează CORS pentru App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Actualizează API-ul pentru a gestiona CORS
# În Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verifică dacă rulează pe URL-urile corecte
azd show
```

## 🌍 Probleme de gestionare a mediilor

### Problemă: Environment switching problems
**Simptome:**
- Se folosește mediul greșit
- Configurația nu se schimbă corect

**Soluții:**
```bash
# 1. Listează toate mediile
azd env list

# 2. Selectează explicit mediul
azd env select production

# 3. Verifică mediul curent
azd env show

# 4. Creează un mediu nou dacă este corupt
azd env new production-new
azd env select production-new
```

### Problemă: Environment corruption
**Simptome:**
- Mediul afișează un statut invalid
- Resursele nu corespund configurației

**Soluții:**
```bash
# 1. Reîmprospătează starea mediului
azd env refresh

# 2. Resetează configurația mediului
azd env new production-reset
# Copiază variabilele de mediu necesare
azd env set DATABASE_URL "your-value"

# 3. Importă resursele existente (dacă este posibil)
# Actualizează manual .azure/production/config.json cu ID-urile resurselor
```

## 🔍 Probleme de performanță

### Problemă: Slow deployment times
**Simptome:**
- Implementările durează prea mult
- Timeout-uri în timpul implementării

**Soluții:**
```bash
# 1. Desfășurați servicii specifice pentru iterații mai rapide
azd deploy --service web
azd deploy --service api

# 2. Folosiți implementarea doar a codului când infrastructura nu s-a schimbat
azd deploy  # Mai rapid decât azd up

# 3. Optimizați procesul de construire
# În package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verificați locațiile resurselor (folosiți aceeași regiune)
azd config set defaults.location eastus2
```

### Problemă: Application performance problems
**Simptome:**
- Timpi de răspuns lenți
- Utilizare ridicată a resurselor

**Soluții:**
```bash
# 1. Creșteți resursele
# Actualizați SKU în main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Activați monitorizarea Application Insights
azd monitor --overview

# 3. Verificați jurnalele aplicației în Azure
az webapp log tail --name myapp --resource-group myrg
# sau pentru Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementați cache
# Adăugați un cache Redis în infrastructura dvs.
```

## 🛠️ Instrumente și comenzi pentru depanare

### Comenzi de depanare
```bash
# Depanare cuprinzătoare
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verifică versiunea azd
azd version

# Vizualizează configurația curentă
azd config list

# Testează conectivitatea
curl -v https://myapp.azurewebsites.net/health
```

### Analiza jurnalelor
```bash
# Jurnale ale aplicației prin Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorizarea aplicației cu azd
azd monitor --logs
azd monitor --live

# Jurnale ale resurselor Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Jurnale ale containerelor (pentru Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigarea resurselor
```bash
# Listează toate resursele
az resource list --resource-group myrg -o table

# Verifică starea resursei
az webapp show --name myapp --resource-group myrg --query state

# Diagnostice de rețea
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obținerea de ajutor suplimentar

### Când să escaladezi
- Probleme de autentificare persistă după încercarea tuturor soluțiilor
- Probleme de infrastructură cu serviciile Azure
- Probleme legate de facturare sau abonament
- Probleme de securitate sau incidente

### Canale de suport
```bash
# 1. Verificați starea serviciilor Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Creați un tichet de asistență Azure
# Accesați: https://portal.azure.com -> Ajutor + asistență

# 3. Resurse comunitare
# - Stack Overflow: eticheta azure-developer-cli
# - Probleme GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informații de colectat
Înainte de a contacta suportul, colectați:
- `azd version` output
- `azd config list` output
- `azd show` output (current deployment status)
- Mesaje de eroare (textul complet)
- Pașii pentru a reproduce problema
- Detalii despre mediu (`azd env show`)
- Cronologia când a început problema

### Script de colectare a jurnalelor
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

## 📊 Prevenirea problemelor

### Listă de verificări înainte de implementare
```bash
# 1. Validați autentificarea
az account show

# 2. Verificați cotele și limitele
az vm list-usage --location eastus2

# 3. Validați șabloanele
az bicep build --file infra/main.bicep

# 4. Testați local mai întâi
npm run build
npm run test

# 5. Folosiți implementări de probă
azd provision --preview
```

### Configurare monitorizare
```bash
# Activați Application Insights
# Adăugați în main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configurați alertele
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Întreținere regulată
```bash
# Verificări săptămânale ale stării de sănătate
./scripts/health-check.sh

# Revizuire lunară a costurilor
az consumption usage list --billing-period-name 202401

# Revizuire trimestrială a securității
az security assessment list --resource-group myrg
```

## Resurse conexe

- [Ghid de depanare](debugging.md) - Tehnici avansate de depanare
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Depanare infrastructură
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Ghid pentru planificarea resurselor
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Recomandări pentru niveluri de serviciu

---

**Sfat**: Salvați acest ghid la marcaje și consultați-l ori de câte ori întâmpinați probleme. Majoritatea problemelor au fost întâlnite anterior și au soluții stabilite!

---

**Navigare**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Ghid de depanare](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere realizată de un traducător uman profesionist. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->