# Primul Tău Proiect - Tutorial Practic

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Fundament și Pornire Rapidă
- **⬅️ Anterior**: [Instalare și Configurare](installation.md)
- **➡️ Următor**: [Configurare](configuration.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect Azure Developer CLI! Acest tutorial practic cuprinzător oferă un ghid complet pentru crearea, implementarea și gestionarea unei aplicații full-stack pe Azure folosind azd. Vei lucra cu o aplicație reală de tip todo care include un frontend React, un backend API Node.js și o bază de date MongoDB.

## Obiective de Învățare

Parcurgând acest tutorial, vei:
- Stăpâni fluxul de inițializare a proiectului azd folosind șabloane
- Înțelege structura proiectului Azure Developer CLI și fișierele de configurare
- Executa implementarea completă a aplicației pe Azure cu aprovizionarea infrastructurii
- Implementa strategii de actualizare și reimplementare a aplicației
- Gestiona multiple medii pentru dezvoltare și staging
- Aplica practici de curățare a resurselor și gestionare a costurilor

## Rezultate de Învățare

După finalizare, vei putea:
- Inițializa și configura proiecte azd din șabloane în mod independent
- Naviga și modifica structurile proiectului azd eficient
- Implementa aplicații full-stack pe Azure folosind comenzi unice
- Depana probleme comune de implementare și autentificare
- Gestiona multiple medii Azure pentru diferite etape de implementare
- Implementa fluxuri continue de implementare pentru actualizările aplicației

## Începutul Lucrului

### Lista de Verificare a Precondițiilor
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](installation.md))
- ✅ Autentificare AZD finalizată cu `azd auth login`
- ✅ Git instalat pe sistemul tău
- ✅ Node.js 16+ (pentru acest tutorial)
- ✅ Visual Studio Code (recomandat)

Înainte de a continua, rulează validatorul de configurare din directorul rădăcină al depozitului:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifică Configurarea
```bash
# Verifică instalarea azd
azd version

# Verifică autentificarea AZD
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

Să începem cu un șablon popular pentru aplicația todo care include un frontend React și un backend API Node.js.

```bash
# Răsfoiește modelele disponibile
azd template list

# Inițializează șablonul aplicației todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Urmează indicațiile:
# - Introdu un nume pentru mediu: "dev"
# - Alege un abonament (dacă ai mai multe)
# - Alege o regiune: "East US 2" (sau regiunea ta preferată)
```

### Ce S-a Întâmplat Chiar Acum?
- Codul șablonului a fost descărcat în directorul local
- A fost creat fișierul `azure.yaml` cu definițiile serviciilor
- S-a configurat codul infrastructurii în directorul `infra/`
- A fost creată o configurare pentru mediu

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

## Pasul 4: Implementează pe Azure

Acum partea interesantă - implementează totul pe Azure!

```bash
# Implementați infrastructura și aplicația
azd up

# Această comandă va:
# 1. Furniza resurse Azure (App Service, Cosmos DB, etc.)
# 2. Compila aplicația ta
# 3. Implementa pe resursele furnizate
# 4. Afișa URL-ul aplicației
```

### Ce Se Întâmplă în Timpul Implementării?

Comanda `azd up` efectuează acești pași:
1. **Provisionare** (`azd provision`) - Creează resurse Azure
2. **Pachetare** - Compilarea codului aplicației tale
3. **Implementare** (`azd deploy`) - Implementează codul pe resursele Azure

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
Click pe URL-ul furnizat în rezultatul implementării sau accesează-l oricând:
```bash
# Obțineți punctele finale ale aplicației
azd show

# Deschide aplicația în browserul tău
azd show --output json | jq -r '.services.web.endpoint'
```

### Testează Aplicația Todo
1. **Adaugă o sarcină todo** - Click pe „Add Todo” și introdu o sarcină
2. **Marchează ca finalizată** - Bifează sarcinile finalizate
3. **Șterge sarcinile** - Elimină todo-urile de care nu mai ai nevoie

### Monitorizează Aplicația Ta
```bash
# Deschide portalul Azure pentru resursele tale
azd monitor

# Vizualizează jurnalul aplicației
azd monitor --logs

# Vizualizează metrici în timp real
azd monitor --live
```

### ✅ Verifică Implementarea

Înainte să continui, parcurge rapid această listă de verificare pentru a confirma că totul funcționează efectiv — nu presupune că „implementarea a reușit” înseamnă „aplicația funcționează”:

```bash
# 1. Confirmă că endpoint-ul există și este accesibil
azd show

# 2. Testează rapid endpoint-ul (așteaptă HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Verifică endpoint-ul de sănătate dacă aplicația ta expune unul
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Implementarea este verificată când:**
- ✅ `azd show` afișează un URL endpoint accesibil
- ✅ URL-ul se deschide în browser fără erori
- ✅ Funcționalitățile de bază funcționează (adaugă/finalizează/șterge o sarcină)
- ✅ `azd monitor --logs` afișează cereri sosind fără erori neașteptate

Dacă vreun punct nu este validat, mergi la [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md).

## Pasul 6: Fă Modificări și Reimplementează

Hai să facem o modificare și să vedem cât de simplu este să actualizezi:

### Modifică API-ul
```bash
# Editează codul API
code src/api/src/routes/lists.js
```

Adaugă un header de răspuns personalizat:
```javascript
// Găsiți un handler de rută și adăugați:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementează Doar Modificările de Cod
```bash
# Distribuiți doar codul aplicației (săriți peste infrastructură)
azd deploy

# Aceasta este mult mai rapidă decât 'azd up' deoarece infrastructura există deja
```

## Pasul 7: Gestionează Mai Multe Medii

Creează un mediu de staging pentru a testa modificările înainte de producție:

```bash
# Creează un nou mediu de testare
azd env new staging

# Desfășoară în mediul de testare
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

# Vizualizează mediul de testare
azd env select staging
azd show
```

## Pasul 8: Curăță Resursele

Când ai terminat de experimentat, curăță pentru a evita costurile continue:

```bash
# Șterge toate resursele Azure pentru mediul curent
azd down

# Forțează ștergerea fără confirmare și elimină resursele șterse în mod soft
azd down --force --purge

# Șterge un mediu specific
azd env select staging
azd down --force --purge
```

## Aplicație Clasică vs. Aplicație AI: Același Flux de Lucru

Tocmai ai implementat o aplicație web tradițională. Dar ce-ar fi dacă ai vrea să implementezi o aplicație AI — să zicem, o aplicație de chat susținută de Microsoft Foundry Models?

Vestea bună: **fluxul de lucru este identic.**

| Pas | Aplicație Todo Clasică  | Aplicație AI de Chat |
|------|-----------------|-------------|
| Inițializează | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentifică | `azd auth login` | `azd auth login` |
| Implementează | `azd up` | `azd up` |
| Monitorizează | `azd monitor` | `azd monitor` |
| Curăță | `azd down --force --purge` | `azd down --force --purge` |

Singura diferență este **șablonul** de la care începi. Un șablon AI include infrastructură suplimentară (cum ar fi un obiect Microsoft Foundry Models sau un index AI Search), dar azd gestionează totul pentru tine. Nu trebuie să înveți comenzi noi, să adopți un alt instrument sau să schimbi modul în care gândești implementarea.

Acesta este principiul de bază al azd: **un singur flux, orice tip de sarcină.** Abilitățile pe care le-ai exersat în acest tutorial — inițializare, implementare, monitorizare, reimplementare și curățare — se aplică la fel de bine aplicațiilor și agenților AI.

---

## Ce Ai Învățat

Felicitări! Ai reușit să:
- ✅ Inițializezi un proiect azd dintr-un șablon
- ✅ Explorezi structura proiectului și fișierele cheie
- ✅ Implementezi o aplicație full-stack pe Azure
- ✅ Faci modificări de cod și reimplementezi
- ✅ Gestionezi multiple medii
- ✅ Cureți resursele

## 🎯 Exerciții de Validare a Competențelor

### Exercițiul 1: Implementează un Șablon Diferit (15 minute)
**Obiectiv**: Demonstrează stăpânirea fluxului de inițializare și implementare azd

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
- [ ] Aplicația funcționează corect (adaugă/șterge todo-uri)
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

# Deployment cu configurație personalizată
azd up
```

**Criterii de Succes:**
- [ ] Mediu personalizat creat cu succes
- [ ] Variabilele de mediu setate și accesibile
- [ ] Aplicația se implementează cu configurație personalizată
- [ ] Poți verifica setările personalizate în aplicația implementată

### Exercițiul 3: Flux de Lucru Multi-Mediu (25 minute)
**Obiectiv**: Stăpânește gestionarea mediilor și strategiile de implementare

```bash
# Creează mediu de dezvoltare
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notează URL-ul pentru dezvoltare
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Creează mediu de testare
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notează URL-ul pentru testare
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
- ✅ Fluxuri de implementare aplicații
- ✅ Gestionare medii
- ✅ Gestionare configurare
- ✅ Curățare resurse și control costuri

**Nivelul Următor**: Ești pregătit pentru [Ghidul de Configurare](configuration.md) pentru a învăța modele avansate de configurare!

## Depanare Probleme Comune

### Erori de Autentificare
```bash
# Reautentificare cu Azure
az login

# Verifică accesul la abonament
az account show
```

### Eșecuri de Implementare
```bash
# Activează înregistrarea jurnalelor de depanare
export AZD_DEBUG=true
azd up --debug

# Vizualizează jurnalele aplicației în Azure
azd monitor --logs

# Pentru Container Apps, folosește Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflicte de Nume de Resurse
```bash
# Folosiți un nume de mediu unic
azd env new dev-$(whoami)-$(date +%s)
```

### Probleme de Port/Network
```bash
# Verifică dacă porturile sunt disponibile
netstat -an | grep :3000
netstat -an | grep :3100
```

## Pașii Următori

Acum că ți-ai finalizat primul proiect, explorează aceste subiecte avansate:

### 1. Personalizează Infrastructura
- [Infrastructură ca și Cod](../chapter-04-infrastructure/provisioning.md)
- [Adaugă baze de date, stocare și alte servicii](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurează CI/CD
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Fluxuri CI/CD complete
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurare pipeline

### 3. Practici Optime pentru Producție
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md) - Securitate, performanță și monitorizare

### 4. Explorează Mai Multe Șabloane
```bash
# Răsfoiește șabloane după categorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Încearcă diferite stive tehnologice
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
- [Galeria Oficială de Șabloane](https://azure.github.io/awesome-azd/)
- [Șabloane Comunitare](https://github.com/Azure-Samples/azd-templates)
- [Modele Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Felicitări pentru finalizarea primului tău proiect azd!** Acum ești pregătit să construiești și să implementezi aplicații uimitoare pe Azure cu încredere.

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Fundament și Pornire Rapidă
- **⬅️ Anterior**: [Instalare și Configurare](installation.md)
- **➡️ Următor**: [Folosește-ți Propria Aplicație](bring-your-own-app.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->