# Primul Tău Proiect - Tutorial Practic

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Bază & Start Rapid
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Adu-ți Propria Aplicație](bring-your-own-app.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect Azure Developer CLI! Vei implementa o aplicație todo cu frontend React, API Node.js și Azure Cosmos DB. Șablonul păstrează numele istoric `todo-nodejs-mongo`; infrastructura curentă folosește Cosmos DB pentru NoSQL, așa că verifică README-ul descărcat și `infra/` în loc să deduci API-ul bazei de date din nume.

> Revizuit conform `azd 1.37.2` și șablonului public în noiembrie 2026. Exemplele de mai jos folosesc Bash; extragerea JSON necesită și `jq`. Implementările Azure implică costuri și nu au fost executate în această revizuire.

## Obiective de Învățare

Prin finalizarea acestui tutorial, vei:
- Stăpâni fluxul de inițializare a proiectelor azd folosind șabloane
- Înțelege structura proiectului Azure Developer CLI și fișierele de configurare
- Executa implementarea completă a aplicației în Azure cu provizionare de infrastructură
- Implementa strategii de actualizare și reimplementare a aplicației
- Administra medii multiple pentru dezvoltare și testare
- Aplica practici de curățare a resurselor și gestionare a costurilor

## Rezultate de Învățare

După finalizare, vei putea:
- Inițializa și configura proiecte azd din șabloane în mod independent
- Naviga și modifica structurile proiectelor azd eficient
- Implementa aplicații full-stack pe Azure folosind comenzi unice
- Depana probleme comune de implementare și autentificare
- Administra medii Azure multiple pentru etape diferite de implementare
- Implementa fluxuri de lucru de implementare continuă pentru actualizări aplicații

## Începem

### Lista de Verificare Preliminară
- ✅ Azure Developer CLI instalat ([Ghid Instalare](installation.md))
- ✅ Autentificare AZD completată cu `azd auth login`
- ✅ Git instalat pe sistemul tău
- ✅ Node.js 22 LTS (sau o versiune suportată necesară de șablonul descărcat)
- ✅ Visual Studio Code (recomandat)

Înainte să continui, rulează validatorul de configurare din rădăcina depozitului:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifică Configurarea Ta
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifică autentificarea opțională Azure CLI

```bash
az account show
```

### Verifică versiunea Node.js
```bash
node --version
```

## Pasul 1: Alege și Inițializează un Șablon

Să începem cu un șablon popular pentru aplicația todo care include frontend React și backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Ce S-a Întâmplat Tocmai?
- Codul șablonului a fost descărcat în directorul local
- A fost creat un fișier `azure.yaml` cu definiții ale serviciului
- Codul infrastructurii a fost configurat în directorul `infra/`
- A fost creată o configurație de mediu

## Pasul 2: Explorează Structura Proiectului

Să examinăm ce a creat azd pentru noi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Ar trebui să vezi:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fișiere Cheie de Înțeles

**azure.yaml** - Inima proiectului tău azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definiția infrastructurii:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Pasul 3: Personalizează Proiectul Tău (Opțional)

Înainte de implementare, poți personaliza aplicația:

### Modifică Frontend-ul
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Fă o schimbare simplă:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configurează Variabilele de Mediu
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Aceste două valori personalizate demonstrează doar stocare locală. Șablonul standard nu consumă `WEBSITE_TITLE` sau `API_VERSION`, deci nu modifică aplicația. Editarea explicită de mai sus schimbă titlul afișat.

## Pasul 4: Implementare în Azure

Acum partea interesantă - implementează totul în Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Ce Se Întâmplă în Timpul Implementării?

Fluxul de lucru provizionează infrastructura și împachetează/implementează codul. Ordinea exactă poate fi personalizată prin `workflows.up` în `azure.yaml`; acest șablon specifică provisionarea urmată de implementare. Nu te baza pe o ordine universală pentru toate șabloanele.

### Rezultatul Așteptat
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Pasul 5: Testează Aplicația Ta

### Accesează Aplicația Ta
Dă click pe URL-ul furnizat în ieșirea implementării, sau obține-l oricând:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testează Aplicația Todo
1. **Adaugă un item todo** - Click pe "Add Todo" și introdu o sarcină
2. **Marchează ca finalizat** - Bifează itemele finalizate
3. **Șterge iteme** - Elimină todo-uri de care nu mai ai nevoie

### Monitorizează Aplicația Ta
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifică Implementarea Ta

Înainte să continui, parcurge rapid această listă pentru a confirma că totul funcționează efectiv - nu presupune că „implementarea a reușit” înseamnă „aplicația funcționează”:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Implementarea este verificată când:**
- ✅ `azd show` listează un URL endpoint accesibil
- ✅ URL-ul se deschide în browser fără erori
- ✅ Funcționalitățile principale funcționează (adaugă/finalizează/șterge un todo)
- ✅ `azd monitor --logs` arată cererile care sosesc fără erori neașteptate

Dacă vreun punct eșuează, sari la [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md).

## Pasul 6: Fă Modificări și Reimpune

Să facem o schimbare și să vedem cât de ușor este să actualizezi:

### Modifică API-ul
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Adaugă un header de răspuns personalizat:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementă doar schimbările de cod
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Pasul 7: Administrează Medii Multiple

Creează un mediu de testare pentru a încerca modificările înainte de producție:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Compararea Mediilor
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Pasul 8: Curăță Resursele

Când termini de experimentat, curăță resursele pentru a evita costuri continue:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Aplicație Clasică vs. Aplicație AI: Același Flux de Lucru

Tocmai ai implementat o aplicație web tradițională. Dar dacă ai vrea să implementezi o aplicație AI, de exemplu un chat bazat pe Microsoft Foundry Models?

Vestea bună: **fluxul este identic.**

| Pas | Aplicație Todo Clasică | Aplicație Chat AI |
|------|-----------------|-------------|
| Inițializează (director gol) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentifică | `azd auth login` | `azd auth login` |
| Implementează | `azd up` | `azd up` |
| Monitorizează | `azd monitor` | `azd monitor` |
| Curăță | `azd down --force --purge` | `azd down --force --purge` |

Comenzile lifecycle sunt aceleași, dar prerechizitele sunt diferite. Un șablon AI poate necesita acces la modele, cotă regională, ingestie date și configurare suplimentară. Citește README-ul înainte implementării; `azd up` nu poate furniza permisiuni sau cotă lipsă.

Acesta este principiul de bază al azd: **un flux de lucru, orice tip de sarcină.** Abilitățile practicate în acest tutorial — inițializare, implementare, monitorizare, reimplementare și curățare — se aplică la fel pentru aplicații și agenți AI.

---

## Ce Ai Înțeles

Felicitări! Ai reușit să:
- ✅ Inițializezi un proiect azd dintr-un șablon
- ✅ Explorezi structura proiectului și fișierele cheie
- ✅ Implementezi o aplicație full-stack pe Azure
- ✅ Faci modificări de cod și reimplementezi
- ✅ Administrezi medii multiple
- ✅ Cureți resursele

## 🎯 Exerciții de Validare a Abilităților

### Exercițiul 1: Implementează un Alt Șablon (15 minute)
**Obiectiv**: Demonstrează stăpânirea inițializării azd și fluxului de implementare

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Criterii de Succes:**
- [ ] Aplicația se implementează fără erori
- [ ] Se poate accesa URL-ul aplicației în browser
- [ ] Aplicația funcționează corect (adaugă/șterge todo-uri)
- [ ] Toate resursele au fost curățate cu succes

### Exercițiul 2: Personalizează Configurația (20 minute)
**Obiectiv**: Exersează stocarea valorilor locale de mediu fără a le confunda cu configurația de runtime

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Criterii de Succes:**
- [ ] Mediu personalizat creat cu succes
- [ ] Variabilele de mediu setate și accesibile
- [ ] `azd env get-value APP_TITLE` afișează `My Custom Todo App`
- [ ] Poți explica de ce aceste valori nu schimbă aplicația standard decât dacă codul/infrastructura le folosesc

### Exercițiul 3: Flux de Lucru Multi-Mediu (25 minute)
**Obiectiv**: Stăpânește administrarea mediilor și strategiile de implementare

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criterii de Succes:**
- [ ] Două medii create cu configurații diferite
- [ ] Ambele medii implementate cu succes
- [ ] Poți comuta între medii folosind `azd env select`
- [ ] Variabilele de mediu diferă între medii
- [ ] Ambele medii au fost curățate cu succes

## 📊 Progresul Tău

**Timp Investit**: ~60-90 minute  
**Abilități Dobândite**:
- ✅ Inițializarea proiectelor bazate pe șabloane
- ✅ Provizionarea resurselor Azure
- ✅ Fluxuri de implementare a aplicațiilor
- ✅ Administrarea mediilor
- ✅ Managementul configurației
- ✅ Curățarea resurselor și gestionarea costurilor

**Următorul Nivel**: Ești gata pentru [Ghidul de Configurare](../chapter-03-configuration/configuration.md) pentru a învăța modele avansate de configurare!

## Depanarea Problemelor Comune

### Erori de Autentificare
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Eșecuri la Implementare
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflicte de Nume Resursă
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Probleme cu Port / Rețea
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Pașii Următori

Acum că ai finalizat primul proiect, explorează aceste subiecte avansate:

### 1. Personalizează Infrastructura
- [Infrastructură ca Cod](../chapter-04-infrastructure/provisioning.md)
- [Adaugă infrastructură de bază de date](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configurează CI/CD
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Fluxuri complete CI/CD
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurare pipeline

### 3. Practici Optime de Producție
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Securitate, performanță și monitorizare

### 4. Explorează Mai Multe Șabloane
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Resurse Suplimentare

### Materiale de Învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadrul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunitate & Suport
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunitatea Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Șabloane & Exemple
- [Galeria Oficială de Șabloane](https://azure.github.io/awesome-azd/)
- [Contribuții Comunitare la Șabloane](https://github.com/Azure/awesome-azd)
- [Sursa Șablonului Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Felicitări pentru finalizarea primului proiect azd!** Acum ești pregătit să construiești și să implementezi aplicații uimitoare pe Azure cu încredere.

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Bază & Start Rapid
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Adu-ți Propria Aplicație](bring-your-own-app.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->