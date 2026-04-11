# Probleme comune și soluții

**Chapter Navigation:**
- **📚 Course Home**: [AZD pentru Începători](../../README.md)
- **📖 Current Chapter**: Capitolul 7 - Depanare și debugging
- **⬅️ Previous Chapter**: [Capitolul 6: Verificări prealabile](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Ghid de depanare](debugging.md)
- **🚀 Next Chapter**: [Capitolul 8: Modele pentru producție și întreprinderi](../chapter-08-production/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător de depanare acoperă cele mai frecvente probleme întâlnite la utilizarea Azure Developer CLI. Învață să diagnostichezi, să remediați și să rezolvi probleme comune legate de autentificare, implementare, provisionarea infrastructurii și configurarea aplicațiilor. Fiecare problemă include simptome detaliate, cauze fundamentale și proceduri pas cu pas pentru rezolvare.

## Obiective de învățare

După parcurgerea acestui ghid, veți:
- Stăpâni tehnici de diagnostic pentru problemele Azure Developer CLI
- Înțelege probleme comune de autentificare și permisiuni și soluțiile lor
- Rezolva eșecurile de implementare, erorile de provisionare a infrastructurii și problemele de configurare
- Implementa strategii proactive de monitorizare și depanare
- Aplica metodologii sistematice de depanare pentru probleme complexe
- Configura logging și monitorizare adecvate pentru a preveni probleme viitoare

## Rezultate de învățare

La final, veți putea:
- Diagnostica probleme Azure Developer CLI utilizând instrumentele de diagnostic încorporate
- Rezolva probleme legate de autentificare, abonament și permisiuni în mod independent
- Depana eșecurile de implementare și erorile de provisionare a infrastructurii eficient
- Depana probleme de configurare a aplicațiilor și probleme specifice mediului
- Implementa monitorizare și alertare pentru a identifica proactiv posibile probleme
- Aplica bune practici pentru logging, depanare și fluxuri de lucru pentru rezolvarea problemelor

## Diagnostic rapid

Înainte de a intra în probleme specifice, executați aceste comenzi pentru a colecta informații de diagnostic:

```bash
# Verifică versiunea și starea azd
azd version
azd config show

# Verifică autentificarea Azure
az account show
az account list

# Verifică mediul curent
azd env list
azd env get-values

# Activează înregistrarea de depanare
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
# Reautentifică-te cu Azure CLI
az login
az account show

# Șterge credențialele din cache
az account clear
az login

# Folosește fluxul de cod al dispozitivului (pentru sisteme fără interfață)
az login --use-device-code

# Setează abonamentul în mod explicit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problemă: "Insufficient privileges" during deployment
**Simptome:**
- Implementarea eșuează cu erori de permisiuni
- Nu se pot crea anumite resurse Azure

**Soluții:**
```bash
# 1. Verificați atribuirea rolurilor în Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Asigurați-vă că aveți rolurile necesare
# - Contributor (pentru crearea resurselor)
# - User Access Administrator (pentru atribuirea rolurilor)

# 3. Contactați administratorul Azure pentru permisiunile necesare
```

### Problemă: Multi-tenant authentication problems
**Soluții:**
```bash
# 1. Autentifică-te cu un tenant specific
az login --tenant "your-tenant-id"

# 2. Setează tenantul în configurație
azd config set auth.tenantId "your-tenant-id"

# 3. Șterge cache-ul tenantului dacă schimbi tenantul
az account clear
```

## 🏗️ Erori la provisionarea infrastructurii

### Problemă: Resource name conflicts
**Simptome:**
- "The resource name already exists" errors
- Implementarea eșuează în timpul creării resurselor

**Soluții:**
```bash
# 1. Utilizați nume de resurse unice cu token-uri
# În șablonul dvs. Bicep:
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
# 1. Verifică locațiile disponibile pentru tipurile de resurse
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Folosește regiunile disponibile în mod obișnuit
azd config set defaults.location eastus2
# sau
azd env set AZURE_LOCATION eastus2

# 3. Verifică disponibilitatea serviciilor în funcție de regiune
# Vizitează: https://azure.microsoft.com/global-infrastructure/services/
```

### Problemă: Quota exceeded errors
**Simptome:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluții:**
```bash
# 1. Verificați utilizarea curentă a cotei
az vm list-usage --location eastus2 -o table

# 2. Solicitați creșterea cotei prin portalul Azure
# Mergeți la: Abonamente > Utilizare + cote

# 3. Folosiți SKU-uri mai mici pentru dezvoltare
# În main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Curățați resursele neutilizate
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problemă: Bicep template errors
**Simptome:**
- Template validation failures
- Syntax errors in Bicep files

**Soluții:**
```bash
# 1. Validează sintaxa Bicep
az bicep build --file infra/main.bicep

# 2. Folosește linterul Bicep
az bicep lint --file infra/main.bicep

# 3. Verifică sintaxa fișierului de parametri
cat infra/main.parameters.json | jq '.'

# 4. Previzualizează modificările de implementare
azd provision --preview
```

## 🚀 Eșecuri la implementare

### Problemă: Build failures
**Simptome:**
- Aplicația nu poate fi construită în timpul implementării
- Erori la instalarea pachetelor

**Soluții:**
```bash
# 1. Verificați ieșirea build-ului cu flagul de depanare
azd deploy --service web --debug

# 2. Vizualizați starea serviciului implementat
azd show

# 3. Testați build-ul local
cd src/web
npm install
npm run build

# 3. Verificați compatibilitatea versiunilor Node.js și Python
node --version  # Ar trebui să corespundă setărilor din azure.yaml
python --version

# 4. Goliți cache-ul build-ului
rm -rf node_modules package-lock.json
npm install

# 5. Verificați Dockerfile-ul dacă utilizați containere
docker build -t test-image .
docker run --rm test-image
```

### Problemă: Container deployment failures
**Simptome:**
- Container apps nu pornesc
- Image pull errors

**Soluții:**
```bash
# 1. Testează construirea imaginii Docker local
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verifică jurnalele containerului folosind Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorizează aplicația folosind azd
azd monitor --logs

# 3. Verifică accesul la registrul de containere
az acr login --name myregistry

# 4. Verifică configurația aplicației container
az containerapp show --name my-app --resource-group my-rg
```

### Problemă: Database connection failures
**Simptome:**
- Aplicația nu se poate conecta la baza de date
- Erori de timeout la conectare

**Soluții:**
```bash
# 1. Verificați regulile firewall-ului bazei de date
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
- Aplicația nu citește valorile de configurare
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

# 4. Verificați configurația serviciului de aplicații
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problemă: SSL/TLS certificate problems
**Simptome:**
- HTTPS nu funcționează
- Erori de validare a certificatului

**Soluții:**
```bash
# 1. Verifică starea certificatului SSL
az webapp config ssl list --resource-group myrg

# 2. Activează doar HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adaugă domeniu personalizat (dacă este necesar)
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
- Este folosit mediul greșit
- Configurația nu se schimbă corespunzător

**Soluții:**
```bash
# 1. Listează toate mediile
azd env list

# 2. Selectează explicit mediul
azd env select production

# 3. Verifică mediul curent
azd env list

# 4. Creează un mediu nou dacă este corupt
azd env new production-new
azd env select production-new
```

### Problemă: Environment corruption
**Simptome:**
- Mediul afișează o stare invalidă
- Resursele nu corespund configurației

**Soluții:**
```bash
# 1. Reîmprospătați starea mediului
azd env refresh

# 2. Resetați configurația mediului
azd env new production-reset
# Copiați variabilele de mediu necesare
azd env set DATABASE_URL "your-value"

# 3. Importați resursele existente (dacă este posibil)
# Actualizați manual .azure/production/config.json cu ID-urile resurselor
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

# 2. Folosiți implementarea doar a codului când infrastructura rămâne neschimbată
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
- Timp de răspuns lent
- Utilizare ridicată a resurselor

**Soluții:**
```bash
# 1. Măriți resursele
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

# 4. Implementați memorarea în cache
# Adăugați un cache Redis la infrastructura dvs.
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
azd config show

# Testează conectivitatea
curl -v https://myapp.azurewebsites.net/health
```

### Analiza jurnalelor
```bash
# Jurnalele aplicației prin Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorizați aplicația cu azd
azd monitor --logs
azd monitor --live

# Jurnalele resurselor Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Jurnalele containerelor (pentru Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigația resurselor
```bash
# Listează toate resursele
az resource list --resource-group myrg -o table

# Verifică starea resursei
az webapp show --name myapp --resource-group myrg --query state

# Diagnostic de rețea
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obținerea de ajutor suplimentar

### Când să escaladați
- Probleme de autentificare persistă după încercarea tuturor soluțiilor
- Probleme de infrastructură cu serviciile Azure
- Probleme legate de facturare sau abonament
- Probleme de securitate sau incidente

### Canale de suport
```bash
# 1. Verificați starea serviciilor Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Creați un tichet de suport Azure
# Accesați: https://portal.azure.com -> Ajutor și asistență

# 3. Resurse ale comunității
# - Stack Overflow: eticheta azure-developer-cli
# - Probleme pe GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Întrebări și Răspunsuri: https://learn.microsoft.com/en-us/answers/
```

### Informații de colectat
Înainte de a contacta suportul, colectați:
- `azd version` output
- `azd config show` output
- `azd show` output (starea curentă a implementării)
- Mesaje de eroare (textul complet)
- Pași pentru a reproduce problema
- Detalii despre mediu (`azd env get-values`)
- Cronologia momentului în care a început problema

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenirea problemelor

### Listă de verificare înainte de implementare
```bash
# 1. Validează autentificarea
az account show

# 2. Verifică cotele și limitele
az vm list-usage --location eastus2

# 3. Validează șabloanele
az bicep build --file infra/main.bicep

# 4. Testează mai întâi local
npm run build
npm run test

# 5. Folosește implementări de probă
azd provision --preview
```

### Configurare monitorizare
```bash
# Activează Application Insights
# Adaugă în main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configurează alertele
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
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Recomandări pentru nivelul serviciilor

---

**Sfat**: Păstrați acest ghid la favorite și consultați-l ori de câte ori întâmpinați probleme. Majoritatea problemelor au fost întâlnite înainte și au soluții bine stabilite!

---

**Navigare**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Ghid de depanare](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->