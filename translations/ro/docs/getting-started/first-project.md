<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-23T17:06:57+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ro"
}
-->
# Primul tău Proiect - Tutorial Practic

**Navigare în Capitol:**
- **📚 Pagina Principală a Cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Bază & Start Rapid
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Configurare](configuration.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect cu Azure Developer CLI! Acest tutorial practic oferă un ghid complet pentru crearea, implementarea și gestionarea unei aplicații full-stack pe Azure folosind azd. Vei lucra cu o aplicație reală de tip todo care include un frontend React, un backend API Node.js și o bază de date MongoDB.

## Obiective de Învățare

Finalizând acest tutorial, vei:
- Stăpâni fluxul de inițializare a proiectului azd folosind șabloane
- Înțelege structura proiectului Azure Developer CLI și fișierele de configurare
- Executa implementarea completă a aplicației pe Azure cu aprovizionarea infrastructurii
- Implementa actualizări ale aplicației și strategii de reimplementare
- Gestiona mai multe medii pentru dezvoltare și testare
- Aplica practici de curățare a resurselor și gestionare a costurilor

## Rezultate de Învățare

La finalizare, vei putea:
- Inițializa și configura independent proiecte azd din șabloane
- Naviga și modifica eficient structurile proiectelor azd
- Implementa aplicații full-stack pe Azure folosind comenzi unice
- Depana probleme comune de implementare și autentificare
- Gestiona mai multe medii Azure pentru diferite etape de implementare
- Implementa fluxuri de implementare continuă pentru actualizări ale aplicației

## Începe

### Listă de Verificare a Prerechizitelor
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](installation.md))
- ✅ Azure CLI instalat și autentificat
- ✅ Git instalat pe sistemul tău
- ✅ Node.js 16+ (pentru acest tutorial)
- ✅ Visual Studio Code (recomandat)

### Verifică Configurația Ta
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

Să începem cu un șablon popular de aplicație todo care include un frontend React și un backend API Node.js.

```bash
# Răsfoiți șabloanele disponibile
azd template list

# Inițializați șablonul aplicației de sarcini
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Urmați instrucțiunile:
# - Introduceți un nume pentru mediu: "dev"
# - Alegeți un abonament (dacă aveți mai multe)
# - Alegeți o regiune: "East US 2" (sau regiunea preferată)
```

### Ce Tocmai S-a Întâmplat?
- Codul șablonului a fost descărcat în directorul tău local
- A fost creat un fișier `azure.yaml` cu definiții de servicii
- Codul infrastructurii a fost configurat în directorul `infra/`
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

## Pasul 3: Personalizează Proiectul Tău (Opțional)

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

Acum vine partea interesantă - implementează totul pe Azure!

```bash
# Implementați infrastructura și aplicația
azd up

# Această comandă va:
# 1. Furniza resurse Azure (App Service, Cosmos DB, etc.)
# 2. Construi aplicația dvs.
# 3. Implementa pe resursele furnizate
# 4. Afișa URL-ul aplicației
```

### Ce Se Întâmplă În Timpul Implementării?

Comanda `azd up` efectuează următorii pași:
1. **Aprovizionare** (`azd provision`) - Creează resursele Azure
2. **Ambalare** - Construiește codul aplicației tale
3. **Implementare** (`azd deploy`) - Implementează codul pe resursele Azure

### Rezultat Așteptat
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
Dă clic pe URL-ul furnizat în rezultatul implementării sau accesează-l oricând:
```bash
# Obține punctele finale ale aplicației
azd show

# Deschide aplicația în browserul tău
azd show --output json | jq -r '.services.web.endpoint'
```

### Testează Aplicația Todo
1. **Adaugă un element todo** - Dă clic pe "Add Todo" și introdu o sarcină
2. **Marchează ca finalizat** - Bifează elementele finalizate
3. **Șterge elemente** - Elimină sarcinile de care nu mai ai nevoie

### Monitorizează Aplicația Ta
```bash
# Deschide portalul Azure pentru resursele tale
azd monitor

# Vizualizează jurnalele aplicației
azd logs
```

## Pasul 6: Fă Schimbări și Reimplementează

Să facem o schimbare și să vedem cât de ușor este să actualizăm:

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

### Implementează Doar Schimbările de Cod
```bash
# Implementați doar codul aplicației (săriți peste infrastructură)
azd deploy

# Acest lucru este mult mai rapid decât 'azd up' deoarece infrastructura există deja
```

## Pasul 7: Gestionează Mai Multe Medii

Creează un mediu de testare pentru a verifica schimbările înainte de producție:

```bash
# Creează un nou mediu de testare
azd env new staging

# Distribuie în mediu de testare
azd up

# Revino la mediul de dezvoltare
azd env select dev

# Listează toate mediile
azd env list
```

### Comparație între Medii
```bash
# Vizualizați mediul de dezvoltare
azd env select dev
azd show

# Vizualizați mediul de testare
azd env select staging
azd show
```

## Pasul 8: Curăță Resursele

Când ai terminat de experimentat, curăță pentru a evita costuri suplimentare:

```bash
# Șterge toate resursele Azure pentru mediul curent
azd down

# Șterge forțat fără confirmare și elimină resursele șterse temporar
azd down --force --purge

# Șterge mediul specific
azd env select staging
azd down --force --purge
```

## Ce Ai Învățat

Felicitări! Ai reușit să:
- ✅ Inițializezi un proiect azd dintr-un șablon
- ✅ Explorezi structura proiectului și fișierele cheie
- ✅ Implementezi o aplicație full-stack pe Azure
- ✅ Faci schimbări de cod și să reimplementezi
- ✅ Gestionezi mai multe medii
- ✅ Cureți resursele

## 🎯 Exerciții de Validare a Abilităților

### Exercițiul 1: Implementează un Alt Șablon (15 minute)
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
- [ ] Toate resursele au fost curățate cu succes

### Exercițiul 2: Personalizează Configurația (20 minute)
**Obiectiv**: Exersează configurarea variabilelor de mediu

```bash
cd my-first-azd-app

# Creează mediu personalizat
azd env new custom-config

# Setează variabile personalizate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifică variabilele
azd env get-values | grep APP_TITLE

# Distribuie cu configurație personalizată
azd up
```

**Criterii de Succes:**
- [ ] Mediu personalizat creat cu succes
- [ ] Variabilele de mediu setate și accesibile
- [ ] Aplicația se implementează cu configurația personalizată
- [ ] Poți verifica setările personalizate în aplicația implementată

### Exercițiul 3: Flux de Lucru cu Mai Multe Medii (25 minute)
**Obiectiv**: Stăpânește gestionarea mediilor și strategiile de implementare

```bash
# Creează mediul de dezvoltare
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notează URL-ul de dezvoltare
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Creează mediul de staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notează URL-ul de staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compară mediile
azd env list

# Testează ambele medii
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Curăță ambele
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
- ✅ Inițializare bazată pe șabloane
- ✅ Aprovizionare resurse Azure
- ✅ Fluxuri de implementare a aplicațiilor
- ✅ Gestionarea mediilor
- ✅ Gestionarea configurațiilor
- ✅ Curățarea resurselor și gestionarea costurilor

**Nivelul Următor**: Ești pregătit pentru [Ghidul de Configurare](configuration.md) pentru a învăța modele avansate de configurare!

## Depanarea Problemelor Comune

### Erori de Autentificare
```bash
# Re-autentificați cu Azure
az login

# Verificați accesul la abonament
az account show
```

### Eșecuri de Implementare
```bash
# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd up --debug

# Vizualizează jurnalele detaliate
azd logs --service api
azd logs --service web
```

### Conflicte de Nume ale Resurselor
```bash
# Utilizați un nume unic pentru mediu
azd env new dev-$(whoami)-$(date +%s)
```

### Probleme de Port/Rețea
```bash
# Verificați dacă porturile sunt disponibile
netstat -an | grep :3000
netstat -an | grep :3100
```

## Pașii Următori

Acum că ai finalizat primul tău proiect, explorează aceste subiecte avansate:

### 1. Personalizează Infrastructura
- [Infrastructură ca și Cod](../deployment/provisioning.md)
- [Adaugă baze de date, stocare și alte servicii](../deployment/provisioning.md#adding-services)

### 2. Configurează CI/CD
- [Integrare GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Cele Mai Bune Practici pentru Producție
- [Configurări de securitate](../deployment/best-practices.md#security)
- [Optimizare performanță](../deployment/best-practices.md#performance)
- [Monitorizare și logare](../deployment/best-practices.md#monitoring)

### 4. Explorează Mai Multe Șabloane
```bash
# Răsfoiți șabloanele după categorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Încercați diferite stive tehnologice
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Resurse Suplimentare

### Materiale de Învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadrul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunitate & Suport
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunitatea Dezvoltatorilor Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Șabloane & Exemple
- [Galeria Oficială de Șabloane](https://azure.github.io/awesome-azd/)
- [Șabloane Comunitare](https://github.com/Azure-Samples/azd-templates)
- [Modele pentru Întreprinderi](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Felicitări pentru finalizarea primului tău proiect azd!** Acum ești pregătit să construiești și să implementezi aplicații uimitoare pe Azure cu încredere.

---

**Navigare în Capitol:**
- **📚 Pagina Principală a Cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 1 - Bază & Start Rapid
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Configurare](configuration.md)
- **🚀 Capitolul Următor**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)
- **Lecția Următoare**: [Ghid de Implementare](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->