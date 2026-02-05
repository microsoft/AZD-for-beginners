# Probleme Comune și Soluții

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Capitol Anterior**: [Capitolul 6: Verificări Preliminare](../pre-deployment/preflight-checks.md)
- **➡️ Următor**: [Ghid de Debugging](debugging.md)
- **🚀 Capitol Următor**: [Capitolul 8: Modele de Producție și Enterprise](../microsoft-foundry/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător de depanare acoperă cele mai frecvente probleme întâlnite în utilizarea Azure Developer CLI. Învață să diagnostichezi, să depanezi și să rezolvi probleme comune legate de autentificare, implementare, furnizarea infrastructurii și configurarea aplicațiilor. Fiecare problemă include simptome detaliate, cauze principale și proceduri pas cu pas pentru rezolvare.

## Obiective de Învățare

După parcurgerea acestui ghid, vei:
- Stăpâni tehnici de diagnosticare pentru problemele Azure Developer CLI
- Înțelege problemele comune de autentificare și permisiuni și soluțiile acestora
- Rezolva eșecurile de implementare, erorile de furnizare a infrastructurii și problemele de configurare
- Implementa strategii proactive de monitorizare și debugging
- Aplica metodologii sistematice de depanare pentru probleme complexe
- Configura logare și monitorizare adecvate pentru a preveni problemele viitoare

## Rezultate de Învățare

La final, vei putea:
- Diagnostica problemele Azure Developer CLI folosind instrumentele de diagnosticare integrate
- Rezolva independent problemele de autentificare, abonament și permisiuni
- Depana eficient eșecurile de implementare și erorile de furnizare a infrastructurii
- Debugga problemele de configurare a aplicațiilor și problemele specifice mediului
- Implementa monitorizare și alerte pentru a identifica proactiv problemele potențiale
- Aplica cele mai bune practici pentru logare, debugging și fluxuri de rezolvare a problemelor

## Diagnosticare Rapidă

Înainte de a intra în probleme specifice, rulează aceste comenzi pentru a colecta informații de diagnosticare:

```bash
# Verifica versiunea azd și sănătatea
azd version
azd config list

# Verifica autentificarea Azure
az account show
az account list

# Verifica mediul curent
azd env show
azd env get-values

# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug
```

## Probleme de Autentificare

### Problemă: "Failed to get access token"
**Simptome:**
- `azd up` eșuează cu erori de autentificare
- Comenzile returnează "neautorizat" sau "acces refuzat"

**Soluții:**
```bash
# 1. Re-autentificați cu Azure CLI
az login
az account show

# 2. Ștergeți acreditările memorate în cache
az account clear
az login

# 3. Utilizați fluxul de cod al dispozitivului (pentru sisteme fără interfață grafică)
az login --use-device-code

# 4. Setați abonamentul explicit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problemă: "Insufficient privileges" în timpul implementării
**Simptome:**
- Implementarea eșuează cu erori de permisiuni
- Nu se pot crea anumite resurse Azure

**Soluții:**
```bash
# 1. Verificați atribuțiile de rol Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Asigurați-vă că aveți rolurile necesare
# - Contributor (pentru crearea resurselor)
# - Administrator Acces Utilizator (pentru atribuțiile de rol)

# 3. Contactați administratorul Azure pentru permisiunile corespunzătoare
```

### Problemă: Probleme de autentificare multi-tenant
**Soluții:**
```bash
# 1. Autentificare cu un chiriaș specific
az login --tenant "your-tenant-id"

# 2. Setează chiriașul în configurație
azd config set auth.tenantId "your-tenant-id"

# 3. Șterge memoria cache a chiriașului dacă se schimbă chiriașii
az account clear
```

## 🏗️ Erori de Furnizare a Infrastructurii

### Problemă: Conflicte de nume ale resurselor
**Simptome:**
- Erori "The resource name already exists"
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

### Problemă: Locația/Regiunea nu este disponibilă
**Simptome:**
- "The location 'xyz' is not available for resource type"
- Anumite SKU-uri nu sunt disponibile în regiunea selectată

**Soluții:**
```bash
# 1. Verificați locațiile disponibile pentru tipurile de resurse
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Utilizați regiunile disponibile în mod obișnuit
azd config set defaults.location eastus2
# sau
azd env set AZURE_LOCATION eastus2

# 3. Verificați disponibilitatea serviciului pe regiune
# Vizitați: https://azure.microsoft.com/global-infrastructure/services/
```

### Problemă: Erori de depășire a cotei
**Simptome:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluții:**
```bash
# 1. Verificați utilizarea actuală a cotei
az vm list-usage --location eastus2 -o table

# 2. Solicitați creșterea cotei prin portalul Azure
# Accesați: Abonamente > Utilizare + cote

# 3. Utilizați SKUs mai mici pentru dezvoltare
# În main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Curățați resursele neutilizate
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problemă: Erori în template-ul Bicep
**Simptome:**
- Eșecuri de validare a template-ului
- Erori de sintaxă în fișierele Bicep

**Soluții:**
```bash
# 1. Validați sintaxa Bicep
az bicep build --file infra/main.bicep

# 2. Utilizați linter-ul Bicep
az bicep lint --file infra/main.bicep

# 3. Verificați sintaxa fișierului de parametri
cat infra/main.parameters.json | jq '.'

# 4. Previzualizați modificările de implementare
azd provision --preview
```

## 🚀 Eșecuri de Implementare

### Problemă: Eșecuri de build
**Simptome:**
- Aplicația eșuează la build în timpul implementării
- Erori de instalare a pachetelor

**Soluții:**
```bash
# 1. Verificați jurnalele de compilare
azd logs --service web
azd deploy --service web --debug

# 2. Testați compilarea local
cd src/web
npm install
npm run build

# 3. Verificați compatibilitatea versiunilor Node.js/Python
node --version  # Ar trebui să se potrivească cu setările din azure.yaml
python --version

# 4. Goliți memoria cache de compilare
rm -rf node_modules package-lock.json
npm install

# 5. Verificați Dockerfile dacă utilizați containere
docker build -t test-image .
docker run --rm test-image
```

### Problemă: Eșecuri de implementare a containerelor
**Simptome:**
- Aplicațiile container eșuează la pornire
- Erori de pull pentru imagini

**Soluții:**
```bash
# 1. Testați compilarea Docker local
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificați jurnalele containerului
azd logs --service api --follow

# 3. Verificați accesul la registrul containerului
az acr login --name myregistry

# 4. Verificați configurația aplicației containerului
az containerapp show --name my-app --resource-group my-rg
```

### Problemă: Eșecuri de conectare la baza de date
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

# 4. Verificați statusul serverului bazei de date
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Probleme de Configurare

### Problemă: Variabilele de mediu nu funcționează
**Simptome:**
- Aplicația nu poate citi valorile de configurare
- Variabilele de mediu apar goale

**Soluții:**
```bash
# 1. Verificați dacă variabilele de mediu sunt setate
azd env get-values
azd env get DATABASE_URL

# 2. Verificați numele variabilelor în azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reporniți aplicația
azd deploy --service web

# 4. Verificați configurația serviciului aplicației
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problemă: Probleme cu certificatele SSL/TLS
**Simptome:**
- HTTPS nu funcționează
- Erori de validare a certificatelor

**Soluții:**
```bash
# 1. Verificați starea certificatului SSL
az webapp config ssl list --resource-group myrg

# 2. Activați doar HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adăugați un domeniu personalizat (dacă este necesar)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problemă: Probleme de configurare CORS
**Simptome:**
- Frontend-ul nu poate apela API-ul
- Cererea cross-origin este blocată

**Soluții:**
```bash
# 1. Configurați CORS pentru App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Actualizați API-ul pentru a gestiona CORS
# În Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verificați dacă rulează pe URL-urile corecte
azd show
```

## 🌍 Probleme de Gestionare a Mediului

### Problemă: Probleme la schimbarea mediului
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

### Problemă: Coruperea mediului
**Simptome:**
- Mediul apare într-o stare invalidă
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

## 🔍 Probleme de Performanță

### Problemă: Timpuri lungi de implementare
**Simptome:**
- Implementările durează prea mult
- Timeout-uri în timpul implementării

**Soluții:**
```bash
# 1. Activează implementarea paralelă
azd config set deploy.parallelism 5

# 2. Utilizează implementări incrementale
azd deploy --incremental

# 3. Optimizează procesul de construire
# În package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verifică locațiile resurselor (folosește aceeași regiune)
azd config set defaults.location eastus2
```

### Problemă: Probleme de performanță ale aplicației
**Simptome:**
- Timpuri de răspuns lente
- Utilizare ridicată a resurselor

**Soluții:**
```bash
# 1. Măriți resursele
# Actualizați SKU în main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Activați monitorizarea Application Insights
azd monitor

# 3. Verificați jurnalele aplicației pentru blocaje
azd logs --service api --follow

# 4. Implementați caching
# Adăugați cache Redis la infrastructura dvs.
```

## 🛠️ Instrumente și Comenzi de Depanare

### Comenzi de Debugging
```bash
# Depanare cuprinzătoare
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verifică informațiile sistemului
azd info

# Validează configurația
azd config validate

# Testează conectivitatea
curl -v https://myapp.azurewebsites.net/health
```

### Analiza Logurilor
```bash
# Jurnale de aplicație
azd logs --service web --follow
azd logs --service api --since 1h

# Jurnale de resurse Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Jurnale de containere (pentru Aplicații Container)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigația Resurselor
```bash
# Listează toate resursele
az resource list --resource-group myrg -o table

# Verifică starea resursei
az webapp show --name myapp --resource-group myrg --query state

# Diagnosticare rețea
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obținerea Ajutorului Suplimentar

### Când să Escalezi
- Problemele de autentificare persistă după ce ai încercat toate soluțiile
- Probleme de infrastructură cu serviciile Azure
- Probleme legate de facturare sau abonament
- Probleme de securitate sau incidente

### Canale de Suport
```bash
# 1. Verificați sănătatea serviciului Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Creați un tichet de suport Azure
# Accesați: https://portal.azure.com -> Ajutor + suport

# 3. Resurse comunitare
# - Stack Overflow: eticheta azure-developer-cli
# - Probleme GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informații de Colectat
Înainte de a contacta suportul, colectează:
- Output-ul `azd version`
- Output-ul `azd info`
- Mesajele de eroare (text complet)
- Pașii pentru reproducerea problemei
- Detalii despre mediu (`azd env show`)
- Cronologia când problema a început

### Script de Colectare a Logurilor
```bash
#!/bin/bash
# colectează-info-debug.sh

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

## 📊 Prevenirea Problemelor

### Lista de Verificare Pre-implementare
```bash
# 1. Validați autentificarea
az account show

# 2. Verificați cotele și limitele
az vm list-usage --location eastus2

# 3. Validați șabloanele
az bicep build --file infra/main.bicep

# 4. Testați mai întâi local
npm run build
npm run test

# 5. Utilizați implementările de tip dry-run
azd provision --preview
```

### Configurarea Monitorizării
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

### Mentenanță Regulată
```bash
# Verificări săptămânale de sănătate
./scripts/health-check.sh

# Revizuire lunară a costurilor
az consumption usage list --billing-period-name 202401

# Revizuire trimestrială a securității
az security assessment list --resource-group myrg
```

## Resurse Asociate

- [Ghid de Debugging](debugging.md) - Tehnici avansate de debugging
- [Furnizarea Resurselor](../deployment/provisioning.md) - Depanarea infrastructurii
- [Planificarea Capacității](../pre-deployment/capacity-planning.md) - Ghid pentru planificarea resurselor
- [Selecția SKU](../pre-deployment/sku-selection.md) - Recomandări pentru nivelurile de servicii

---

**Sfat**: Păstrează acest ghid la îndemână și consultă-l ori de câte ori întâmpini probleme. Cele mai multe probleme au fost întâlnite anterior și au soluții stabilite!

---

**Navigare**
- **Lecția Anterioară**: [Furnizarea Resurselor](../deployment/provisioning.md)
- **Lecția Următoare**: [Ghid de Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->