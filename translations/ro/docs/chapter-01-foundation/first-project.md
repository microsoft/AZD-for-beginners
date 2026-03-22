# Primul Tău Proiect - Tutorial Practic

**Navigare capitole:**  
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)  
- **📖 Capitol Curent**: Capitolul 1 - Fundamente & Start Rapid  
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)  
- **➡️ Următor**: [Configurare](configuration.md)  
- **🚀 Capitol Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect Azure Developer CLI! Acest tutorial practic cuprinzător oferă un parcurs complet pentru crearea, implementarea și gestionarea unei aplicații full-stack pe Azure folosind azd. Vei lucra cu o aplicație reală de tip todo care include un frontend React, backend API Node.js și o bază de date MongoDB.

## Obiective de Învățare

Parcurgând acest tutorial, vei:  
- Stăpâni fluxul de inițializare a proiectului azd folosind șabloane  
- Înțelege structura proiectului Azure Developer CLI și fișierele de configurare  
- Executa implementarea completă a aplicației pe Azure cu aprovizionare infrastructură  
- Implementa actualizări ale aplicației și strategii de redeploy  
- Gestione multiple medii pentru dezvoltare și staging  
- Aplica bune practici de curățare a resurselor și gestionare a costurilor

## Rezultate de Învățare

La final vei putea:  
- Inițializa și configura proiecte azd din șabloane independent  
- Naviga și modifica structuri de proiect azd eficient  
- Implementa aplicații full-stack pe Azure cu comenzi unice  
- Depana probleme comune de implementare și autentificare  
- Gestione multiple medii Azure pentru etape de implementare diferite  
- Implementa fluxuri de implementare continuă pentru actualizări

## Începutul

### Listă Verificare Cerințe Prealabile  
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](installation.md))  
- ✅ Azure CLI instalat și autentificat  
- ✅ Git instalat pe sistemul tău  
- ✅ Node.js 16+ (pentru acest tutorial)  
- ✅ Visual Studio Code (recomandat)

### Verifică Configurarea Ta  
```bash
# Verificați instalarea azd
azd version
```
### Verifică autentificarea Azure

```bash
az account show
```
  
### Verifică versiunea Node.js  
```bash
node --version
```
  
## Pasul 1: Alege și Inițializează un Șablon

Începem cu un șablon popular de aplicație todo care include un frontend React și backend API Node.js.

```bash
# Răsfoiește template-urile disponibile
azd template list

# Inițializează template-ul aplicației todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Urmează instrucțiunile:
# - Introdu un nume pentru mediu: "dev"
# - Alege un abonament (dacă ai mai multe)
# - Alege o regiune: "East US 2" (sau regiunea preferată)
```
  
### Ce s-a întâmplat?  
- Codul șablonului a fost descărcat în directorul local  
- A fost creat un fișier `azure.yaml` cu definiții de servicii  
- S-a configurat codul infrastructurii în directorul `infra/`  
- A fost creată o configurație de mediu

## Pasul 2: Explorează Structura Proiectului

Să examinăm ce a creat azd pentru noi:

```bash
# Vizualizați structura proiectului
tree /f   # Windows
# sau
find . -type f | head -20   # macOS/Linux
```
  
Ar trebui să vezi:  
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```
  
### Fișiere Cheie de Înțeles

**azure.yaml** - Inima proiectului tău azd:  
```bash
# Vizualizați configurația proiectului
cat azure.yaml
```
  
**infra/main.bicep** - Definiția infrastructurii:  
```bash
# Vizualizați codul infrastructurii
head -30 infra/main.bicep
```
  
## Pasul 3: Personalizează Proiectul (Opțional)

Înainte de implementare, poți personaliza aplicația:

### Modifică Frontend-ul  
```bash
# Deschide componenta aplicației React
code src/web/src/App.tsx
```
  
Fă o schimbare simplă:  
```typescript
// Găsiți titlul și schimbați-l
<h1>My Awesome Todo App</h1>
```
  
### Configurează Variabilele de Mediu  
```bash
# Setează variabile de mediu personalizate
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vizualizează toate variabilele de mediu
azd env get-values
```
  
## Pasul 4: Implementare pe Azure

Acum partea interesantă - implementează totul pe Azure!

```bash
# Implementați infrastructura și aplicația
azd up

# Această comandă va:
# 1. Furniza resurse Azure (App Service, Cosmos DB, etc.)
# 2. Compila aplicația dvs.
# 3. Implementați pe resursele furnizate
# 4. Afișați URL-ul aplicației
```
  
### Ce se întâmplă în timpul implementării?

Comanda `azd up` realizează următorii pași:  
1. **Provisionare** (`azd provision`) - Creează resurse Azure  
2. **Ambalare** - Compilează codul aplicației  
3. **Implementare** (`azd deploy`) - Depune codul în resurse Azure

### Ieșire Așteptată  
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```
  
## Pasul 5: Testează Aplicația

### Accesează Aplicația  
Dă click pe URL-ul oferit în rezultatul implementării sau obține-l oricând:  
```bash
# Obține punctele finale ale aplicației
azd show

# Deschide aplicația în browserul tău
azd show --output json | jq -r '.services.web.endpoint'
```
  
### Testează Aplicația Todo  
1. **Adaugă un element todo** - Apasă "Add Todo" și introdu o sarcină  
2. **Marchează ca finalizat** - Bifează elementele realizate  
3. **Șterge elemente** - Elimină todo-urile de care nu mai ai nevoie

### Monitorizează Aplicația  
```bash
# Deschide portalul Azure pentru resursele tale
azd monitor

# Vizualizează jurnalele aplicației
azd monitor --logs

# Vizualizează metrici live
azd monitor --live
```
  
## Pasul 6: Fă Modificări și Redeploy

Hai să facem o schimbare și să vedem cât de ușor este să actualizezi:

### Modifică API-ul  
```bash
# Editează codul API
code src/api/src/routes/lists.js
```
  
Adaugă un header personalizat în răspuns:  
```javascript
// Găsiți un handler pentru rută și adăugați:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### Implementare Doar a Codului Modificat  
```bash
# Desfășurați doar codul aplicației (săriți peste infrastructură)
azd deploy

# Acest lucru este mult mai rapid decât 'azd up' deoarece infrastructura există deja
```
  
## Pasul 7: Gestionează Multiple Medii

Creează un mediu staging pentru a testa modificările înainte de producție:

```bash
# Creează un nou mediu de testare
azd env new staging

# Distribuie în mediul de testare
azd up

# Revino la mediul de dezvoltare
azd env select dev

# Listează toate mediile
azd env list
```
  
### Compararea Mediilor  
```bash
# Vizualizează mediul de dezvoltare
azd env select dev
azd show

# Vizualizează mediul de pre-producție
azd env select staging
azd show
```
  
## Pasul 8: Curăță Resursele

Când termini cu experimentele, curăță resursele ca să eviți costuri continue:

```bash
# Șterge toate resursele Azure pentru mediul curent
azd down

# Ștergere forțată fără confirmare și curățare a resurselor șterse soft
azd down --force --purge

# Șterge mediul specificat
azd env select staging
azd down --force --purge
```
  
## Aplicație Clasică vs. Aplicație AI: Același Flux de Lucru

Tocmai ai implementat o aplicație web tradițională. Dar dacă ai vrea să implementezi în schimb o aplicație AI—să zicem, o aplicație de chat bazată pe Microsoft Foundry Models?

Vestea bună: **fluxul de lucru este identic.**

| Pas | Aplicație Todo Clasică | Aplicație Chat AI |  
|------|-----------------------|-------------------|  
| Inițializează | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |  
| Autentificare | `azd auth login` | `azd auth login` |  
| Implementare | `azd up` | `azd up` |  
| Monitorizare | `azd monitor` | `azd monitor` |  
| Curățare | `azd down --force --purge` | `azd down --force --purge` |

Singura diferență este șablonul de pornire. Un șablon AI include infrastructură suplimentară (cum ar fi un resource Microsoft Foundry Models sau un index AI Search), dar azd gestionează totul pentru tine. Nu trebuie să înveți comenzi noi, să adopți unelte diferite sau să modifici modul în care gândești despre implementare.

Acesta este principiul de bază al azd: **un singur flux, orice tip de sarcină.** Abilitățile exersate în acest tutorial—inițializare, implementare, monitorizare, redeploy și curățare—se aplică în egală măsură aplicațiilor AI și agenților.

---

## Ce Ai Învățat

Felicitări! Ai reușit să:  
- ✅ Inițializezi un proiect azd dintr-un șablon  
- ✅ Explorezi structura proiectului și fișierele cheie  
- ✅ Implementezi o aplicație full-stack pe Azure  
- ✅ Faci modificări de cod și redeploy  
- ✅ Gestionezi multiple medii  
- ✅ Cureți resursele

## 🎯 Exerciții pentru Validarea Abilităților

### Exercițiul 1: Implementează un Șablon Diferit (15 minute)  
**Obiectiv**: Demonstrează stăpânirea fluxului azd init și implementare

```bash
# Încearcă stiva Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifică implementarea
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Curăță
azd down --force --purge
```
  
**Criterii de Succes:**  
- [ ] Aplicația se implementează fără erori  
- [ ] Poți accesa URL-ul aplicației în browser  
- [ ] Aplicația funcționează corect (adăugare/ștergere todos)  
- [ ] Ai curățat cu succes toate resursele

### Exercițiul 2: Personalizează Configurația (20 minute)  
**Obiectiv**: Exersează configurarea variabilelor de mediu

```bash
cd my-first-azd-app

# Creează un mediu personalizat
azd env new custom-config

# Setează variabile personalizate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifică variabilele
azd env get-values | grep APP_TITLE

# Deplasează cu configurație personalizată
azd up
```
  
**Criterii de Succes:**  
- [ ] Mediu personalizat creat cu succes  
- [ ] Variabilele de mediu setate și accesibile  
- [ ] Aplicația se implementează cu configurația personalizată  
- [ ] Poți verifica setările personalizate în aplicația implementată

### Exercițiul 3: Flux Multi-Mediu (25 minute)  
**Obiectiv**: Stăpânește gestionarea mediilor și strategii de implementare

```bash
# Creează mediul de dezvoltare
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notează URL-ul de dezvoltare
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Creează mediul de testare
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notează URL-ul de testare
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compară mediile
azd env list

# Testează ambele medii
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Curăță ambele medii
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```
  
**Criterii de Succes:**  
- [ ] Două medii create cu configurații diferite  
- [ ] Ambele medii implementate cu succes  
- [ ] Poți comuta între medii folosind `azd env select`  
- [ ] Variabilele de mediu diferă între medii  
- [ ] Ai curățat cu succes ambele medii

## 📊 Progresul Tău

**Timp Investit**: ~60-90 minute  
**Competențe Dobândite**:  
- ✅ Inițializare proiect bazată pe șabloane  
- ✅ Aprovizionare resurse Azure  
- ✅ Fluxuri de implementare a aplicației  
- ✅ Gestionarea mediilor  
- ✅ Gestionare configurație  
- ✅ Curățare resurse și gestionare costuri

**Nivel Următor**: Ești pregătit pentru [Ghid de Configurare](configuration.md) pentru a învăța pattern-uri avansate de configurare!

## Depanare Probleme Comune

### Erori de Autentificare  
```bash
# Reautentificare cu Azure
az login

# Verifică accesul abonamentului
az account show
```
  
### Eșecuri la Implementare  
```bash
# Activează înregistrarea jurnalului de depanare
export AZD_DEBUG=true
azd up --debug

# Vizualizează jurnalele aplicației în Azure
azd monitor --logs

# Pentru Container Apps, folosește Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### Conflicte de Nume Resurse  
```bash
# Folosiți un nume unic pentru mediu
azd env new dev-$(whoami)-$(date +%s)
```
  
### Probleme cu Porturi/Rețea  
```bash
# Verifică dacă porturile sunt disponibile
netstat -an | grep :3000
netstat -an | grep :3100
```
  
## Pașii Următori

Acum că ai finalizat primul proiect, explorează aceste subiecte avansate:

### 1. Personalizează Infrastructura  
- [Infrastructură ca și Cod](../chapter-04-infrastructure/provisioning.md)  
- [Adaugă baze de date, storage și alte servicii](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurează CI/CD  
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Fluxuri complete CI/CD  
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurare pipeline

### 3. Bune Practici pentru Producție  
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Securitate, performanță și monitorizare

### 4. Explorează Mai Multe Șabloane  
```bash
# Răsfoiește șabloanele pe categorii
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Încearcă diferite seturi de tehnologii
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```
  
## Resurse Suplimentare

### Materiale de Învățare  
- [Documentație Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunitate & Suport  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Comunitatea Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Șabloane & Exemple  
- [Galerie Oficială Șabloane](https://azure.github.io/awesome-azd/)  
- [Șabloane Comunitare](https://github.com/Azure-Samples/azd-templates)  
- [Modele Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Felicitări pentru finalizarea primului tău proiect azd!** Acum ești pregătit să construiești și să implementezi aplicații extraordinare pe Azure cu încredere.

---

**Navigare capitole:**  
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)  
- **📖 Capitol Curent**: Capitolul 1 - Fundamente & Start Rapid  
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)  
- **➡️ Următor**: [Configurare](configuration.md)  
- **🚀 Capitol Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **Următoarea Lecție**: [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un expert uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->