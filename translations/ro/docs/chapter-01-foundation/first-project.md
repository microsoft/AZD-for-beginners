# Primul tău proiect - Tutorial practic

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Fundament & Pornire rapidă
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Configurare](configuration.md)
- **🚀 Capitolul următor**: [Capitolul 2: Dezvoltare orientată spre AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect Azure Developer CLI! Acest tutorial practic cuprinzător oferă un parcurs complet pentru crearea, implementarea și gestionarea unei aplicații full-stack pe Azure folosind azd. Vei lucra cu o aplicație reală todo care include un frontend React, un backend API Node.js și o bază de date MongoDB.

## Obiective de învățare

Parcurgând acest tutorial, vei:
- Stăpâni fluxul de inițializare al proiectelor azd folosind șabloane
- Înțelege structura proiectului Azure Developer CLI și fișierele de configurare
- Executa implementarea completă a aplicației pe Azure cu provisioning de infrastructură
- Implementa strategii de actualizare și reimplementare a aplicației
- Gestionează medii multiple pentru dezvoltare și staging
- Aplica practici de curățare a resurselor și gestionare a costurilor

## Rezultate ale învățării

La final, vei putea:
- Inițializa și configura proiecte azd din șabloane independent
- Naviga și modifica structurile proiectelor azd eficient
- Implementa aplicații full-stack pe Azure folosind comenzi unice
- Depana probleme comune de implementare și autentificare
- Gestionează mai multe medii Azure pentru diferite etape de implementare
- Implementa fluxuri de lucru de deploy continuu pentru actualizările aplicației

## Început

### Lista de verificare - Cerințe prealabile
- ✅ Azure Developer CLI instalat ([Ghid de instalare](installation.md))
- ✅ Azure CLI instalat și autentificat
- ✅ Git instalat pe sistemul tău
- ✅ Node.js 16+ (pentru acest tutorial)
- ✅ Visual Studio Code (recomandat)

### Verifică configurația
```bash
# Verifică instalarea azd
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

## Pasul 1: Alege și inițializează un șablon

Să începem cu un șablon popular de aplicație todo care include un frontend React și un backend API Node.js.

```bash
# Răsfoiți șabloanele disponibile
azd template list

# Inițializați șablonul aplicației todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Urmați instrucțiunile:
# - Introduceți un nume pentru mediu: "dev"
# - Alegeți un abonament (dacă aveți mai multe)
# - Alegeți o regiune: "East US 2" (sau regiunea preferată)
```

### Ce s-a întâmplat?
- Descărcat codul șablonului în directorul local
- Creat fișierul `azure.yaml` cu definițiile serviciilor
- Configurat codul pentru infrastructură în directorul `infra/`
- Creat o configurație de mediu

## Pasul 2: Explorează structura proiectului

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

### Fișiere cheie de înțeles

**azure.yaml** - Inima proiectului azd:
```bash
# Vizualizează configurația proiectului
cat azure.yaml
```

**infra/main.bicep** - Definiția infrastructurii:
```bash
# Vizualizați codul infrastructurii
head -30 infra/main.bicep
```

## Pasul 3: Personalizează proiectul tău (Opțional)

Înainte de implementare, poți personaliza aplicația:

### Modifică frontend-ul
```bash
# Deschide componenta aplicației React
code src/web/src/App.tsx
```

Fă o schimbare simplă:
```typescript
// Găsește titlul și schimbă-l
<h1>My Awesome Todo App</h1>
```

### Configurează variabilele de mediu
```bash
# Setați variabile de mediu personalizate
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vizualizați toate variabilele de mediu
azd env get-values
```

## Pasul 4: Implementare în Azure

Acum partea interesantă — implementează totul în Azure!

```bash
# Desfășurați infrastructura și aplicația
azd up

# Această comandă va:
# 1. Creează resurse Azure (App Service, Cosmos DB, etc.)
# 2. Construiește aplicația
# 3. Desfășoară aplicația pe resursele create
# 4. Afișează URL-ul aplicației
```

### Ce se întâmplă în timpul implementării?

Comanda `azd up` execută acești pași:
1. **Provision** (`azd provision`) - Creează resurse Azure
2. **Package** - Construiește codul aplicației tale
3. **Deploy** (`azd deploy`) - Publică codul în resursele Azure

### Ieșire așteptată
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Pasul 5: Testează aplicația ta

### Accesează aplicația ta
Dă clic pe URL-ul furnizat în rezultatul implementării, sau obține-l oricând:
```bash
# Obține endpoint-urile aplicației
azd show

# Deschide aplicația în browserul tău
azd show --output json | jq -r '.services.web.endpoint'
```

### Testează aplicația Todo
1. **Adaugă un element todo** - Click "Adaugă Todo" și introduce o sarcină
2. **Marchează ca finalizat** - Bifează elementele finalizate
3. **Șterge elemente** - Elimină todos pe care nu le mai dorești

### Monitorizează aplicația ta
```bash
# Deschide portalul Azure pentru resursele tale
azd monitor

# Vizualizează jurnalele aplicației
azd monitor --logs

# Vizualizează metrici în timp real
azd monitor --live
```

## Pasul 6: Fă modificări și reimplementează

Să facem o modificare și să vedem cât de ușor este să actualizăm:

### Modifică API-ul
```bash
# Editează codul API
code src/api/src/routes/lists.js
```

Adaugă un antet de răspuns personalizat:
```javascript
// Găsește un handler de rută și adaugă:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Publică doar modificările de cod
```bash
# Desfășurați doar codul aplicației (omiteți infrastructura)
azd deploy

# Acest lucru este mult mai rapid decât 'azd up' deoarece infrastructura există deja
```

## Pasul 7: Gestionează medii multiple

Creează un mediu de staging pentru a testa modificările înainte de producție:

```bash
# Creați un nou mediu de staging
azd env new staging

# Implementați în mediul de staging
azd up

# Comutați înapoi la mediul de dezvoltare
azd env select dev

# Listați toate mediile
azd env list
```

### Compararea mediilor
```bash
# Vizualizați mediul de dezvoltare
azd env select dev
azd show

# Vizualizați mediul de staging
azd env select staging
azd show
```

## Pasul 8: Curăță resursele

Când ai terminat experimentele, curăță resursele pentru a evita costuri continue:

```bash
# Șterge toate resursele Azure pentru mediul curent
azd down

# Forțează ștergerea fără confirmare și elimină definitiv resursele marcate ca șterse
azd down --force --purge

# Șterge un mediu specific
azd env select staging
azd down --force --purge
```

## Ce ai învățat

Felicitări! Ai reușit:
- ✅ Inițializat un proiect azd dintr-un șablon
- ✅ Explorată structura proiectului și fișierele cheie
- ✅ Implementată o aplicație full-stack pe Azure
- ✅ Efectuate modificări de cod și reimplementate
- ✅ Gestionate medii multiple
- ✅ Curățate resursele

## 🎯 Exerciții pentru validarea competențelor

### Exercițiul 1: Implementă un șablon diferit (15 minute)
**Scop**: Demonstrează stăpânirea fluxului de lucru azd init și implementare

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

**Criterii de succes:**
- [ ] Aplicația se implementează fără erori
- [ ] Poți accesa URL-ul aplicației în browser
- [ ] Aplicația funcționează corect (adaugă/șterge todos)
- [ ] Curățat cu succes toate resursele

### Exercițiul 2: Personalizează configurația (20 minute)
**Scop**: Exersează configurarea variabilelor de mediu

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

# Desfășoară cu configurație personalizată
azd up
```

**Criterii de succes:**
- [ ] Mediu personalizat creat cu succes
- [ ] Variabilele de mediu setate și recuperabile
- [ ] Aplicația se implementează cu configurație personalizată
- [ ] Poți verifica setările personalizate în aplicația implementată

### Exercițiul 3: Flux de lucru multi-mediu (25 minute)
**Scop**: Stăpânește gestionarea mediilor și strategiile de implementare

```bash
# Creează mediul de dezvoltare
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notează URL-ul mediului de dezvoltare
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Creează mediul de staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notează URL-ul mediului de staging
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

**Criterii de succes:**
- [ ] Două medii create cu configurații diferite
- [ ] Ambele medii implementate cu succes
- [ ] Poți comuta între medii folosind `azd env select`
- [ ] Variabilele de mediu diferă între medii
- [ ] Curățat cu succes ambele medii

## 📊 Progresul tău

**Timp investit**: ~60-90 minute  
**Competențe dobândite**:
- ✅ Inițializare proiect bazată pe șabloane
- ✅ Provisionare resurse Azure
- ✅ Fluxuri de lucru pentru implementarea aplicațiilor
- ✅ Gestionarea mediilor
- ✅ Administrarea configurațiilor
- ✅ Curățarea resurselor și gestionarea costurilor

**Următorul nivel**: Ești pregătit pentru [Ghidul de configurare](configuration.md) pentru a învăța modele avansate de configurare!

## Depanare - Probleme comune

### Erori de autentificare
```bash
# Reautentifică-te în Azure
az login

# Verifică accesul la abonament
az account show
```

### Eșecuri la implementare
```bash
# Activați jurnalizarea de depanare
export AZD_DEBUG=true
azd up --debug

# Vizualizați jurnalele aplicației în Azure
azd monitor --logs

# Pentru Container Apps, utilizați Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflicte de nume ale resurselor
```bash
# Utilizați un nume de mediu unic
azd env new dev-$(whoami)-$(date +%s)
```

### Probleme de port/rețea
```bash
# Verifică dacă porturile sunt disponibile
netstat -an | grep :3000
netstat -an | grep :3100
```

## Pașii următori

Acum că ai finalizat primul tău proiect, explorează aceste subiecte avansate:

### 1. Personalizează infrastructura
- [Infrastructură ca cod](../chapter-04-infrastructure/provisioning.md)
- [Adaugă baze de date, stocare și alte servicii](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurează CI/CD
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md) - Fluxuri CI/CD complete
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurarea pipeline-ului

### 3. Practici recomandate pentru producție
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md) - Securitate, performanță și monitorizare

### 4. Explorează mai multe șabloane
```bash
# Răsfoiește șabloane după categorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Încearcă diferite stack-uri tehnologice
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Resurse suplimentare

### Materiale de învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunitate și suport
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Șabloane și exemple
- [Ghidul oficial de șabloane](https://azure.github.io/awesome-azd/)
- [Șabloane comunitare](https://github.com/Azure-Samples/azd-templates)
- [Modele enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

Felicitări pentru finalizarea primului tău proiect azd! Acum ești gata să construiești și să implementezi aplicații uimitoare pe Azure cu încredere.

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Fundament & Pornire rapidă
- **⬅️ Anterior**: [Instalare & Configurare](installation.md)
- **➡️ Următor**: [Configurare](configuration.md)
- **🚀 Capitolul următor**: [Capitolul 2: Dezvoltare orientată spre AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Următoarea lecție**: [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări eronate care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->