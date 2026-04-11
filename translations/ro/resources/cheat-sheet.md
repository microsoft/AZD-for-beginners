# Fișă de Comenzi - Comenzi esențiale AZD

**Referință rapidă pentru toate capitolele**
- **📚 Pagina cursului**: [AZD For Beginners](../README.md)
- **📖 Pornire rapidă**: [Capitolul 1: Fundament și Pornire rapidă](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă completă oferă o referință rapidă pentru cele mai utilizate comenzi Azure Developer CLI, organizate pe categorii și cu exemple practice. Ideală pentru consultări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiecte azd.

## Obiective de învățare

Folosind această fișă, vei:
- Avea acces instant la comenzile esențiale Azure Developer CLI și la sintaxă
- Înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi de depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru gestionarea mediilor și fluxuri de lucru multi-mediu

## Rezultate ale învățării

Consultând în mod regulat această fișă, vei fi capabil să:
- Execuți comenzi azd cu încredere fără a mai consulta documentația completă
- Rezolvi rapid probleme comune folosind comenzi diagnostice adecvate
- Gestionezi eficient mai multe medii și scenarii de implementare
- Aplici funcționalități avansate azd și opțiuni de configurare după necesitate
- Depanezi probleme de implementare folosind secvențe de comenzi sistematice
- Optimizezi fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi de pornire

### Autentificare
```bash
# Conectare la Azure prin AZD
azd auth login

# Conectare la Azure CLI (AZD folosește acest lucru în fundal)
az login

# Verifică contul curent
az account show

# Setează abonamentul implicit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Deconectare din AZD
azd auth logout

# Deconectare din Azure CLI
az logout
```

### Inițializarea proiectului
```bash
# Răsfoiește șabloanele disponibile
azd template list

# Inițializează dintr-un șablon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inițializează în directorul curent
azd init .

# Inițializează cu un nume personalizat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comenzi principale de implementare

### Flux complet de implementare
```bash
# Desfășoară totul (provisionare + implementare)
azd up

# Desfășoară fără solicitări de confirmare
azd up --confirm-with-no-prompt

# Desfășoară către un mediu specific
azd up --environment production

# Desfășoară cu parametri personalizați
azd up --parameter location=westus2
```

### Doar infrastructura
```bash
# Provisionare resurse Azure
azd provision

# 🧪 Previzualizează modificările infrastructurii
azd provision --preview
# Afișează o vizualizare de tip dry-run a resurselor care ar fi create/modificate/șterse
# Similar cu 'terraform plan' sau 'bicep what-if' - sigur de rulat, nu se aplică nicio modificare
```

### Doar aplicația
```bash
# Desfășurați codul aplicației
azd deploy

# Desfășurați serviciul specific
azd deploy --service web
azd deploy --service api

# Desfășurați toate serviciile
azd deploy --all
```

### Construire și împachetare
```bash
# Construiește aplicații
azd package

# Construiește un serviciu specific
azd package --service api
```

## 🌍 Gestionarea mediilor

### Operațiuni pentru medii
```bash
# Listează toate mediile
azd env list

# Creează un mediu nou
azd env new development
azd env new staging --location westus2

# Selectează un mediu
azd env select production

# Afișează mediile disponibile
azd env list

# Reîmprospătează starea mediului
azd env refresh
```

### Variabile de mediu
```bash
# Setează variabila de mediu
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obține variabila de mediu
azd env get API_KEY

# Listează toate variabilele de mediu
azd env get-values

# Elimină variabila de mediu
azd env unset DEBUG
```

## ⚙️ Comenzi de configurare

### Configurare globală
```bash
# Listează toate configurațiile
azd config show

# Setează valorile implicite globale
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Elimină configurația
azd config unset defaults.location

# Resetează toate configurațiile
azd config reset
```

### Configurare proiect
```bash
# Validează fișierul azure.yaml
azd config validate

# Afișează informațiile despre proiect
azd show

# Obține punctele finale ale serviciului
azd show --output json
```

## 📊 Monitorizare și diagnostic

### Tablou de bord de monitorizare
```bash
# Deschide tabloul de bord de monitorizare din portalul Azure
azd monitor

# Deschide măsurătorile în timp real din Application Insights
azd monitor --live

# Deschide panoul de jurnale din Application Insights
azd monitor --logs

# Deschide prezentarea generală din Application Insights
azd monitor --overview
```

### Vizualizarea jurnalelor containerelor
```bash
# Vizualizați jurnalele prin Azure CLI (pentru Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Urmăriți jurnalele în timp real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vizualizați jurnalele din Azure Portal
azd monitor --logs
```

### Interogări Log Analytics
```bash
# Accesați Log Analytics prin portalul Azure
azd monitor --logs

# Interogați jurnalele folosind Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comenzi de întreținere

### Curățare
```bash
# Eliminați toate resursele Azure
azd down

# Ștergere forțată fără confirmare
azd down --force

# Eliminare definitivă a resurselor marcate ca șterse (soft-deleted)
azd down --purge

# Curățare completă
azd down --force --purge
```

### Actualizări
```bash
# Verifică actualizări pentru azd
azd version

# Obține versiunea curentă
azd version

# Vizualizează configurația curentă
azd config show
```

## 🔧 Comenzi avansate

### Pipeline și CI/CD
```bash
# Configurează GitHub Actions
azd pipeline config

# Configurează Azure DevOps
azd pipeline config --provider azdo

# Afișează configurația pipeline-ului
azd pipeline show
```

### Gestionare infrastructură
```bash
# Generează șabloane de infrastructură
azd infra generate

# 🧪 Previzualizare și planificare a infrastructurii
azd provision --preview
# Simulează aprovizionarea infrastructurii fără a o implementa
# Analizează șabloane Bicep/Terraform și afișează:
# - Resurse care vor fi adăugate (verde +)
# - Resurse care vor fi modificate (galben ~)
# - Resurse care vor fi șterse (roșu -)
# Sigur de rulat - nu se fac modificări reale în mediul Azure

# Sintezează infrastructura din azure.yaml
azd infra synth
```

### Informații proiect
```bash
# Afișează starea proiectului și punctele finale
azd show

# Afișează informații detaliate despre proiect în format JSON
azd show --output json

# Obține punctele finale ale serviciului
azd show --output json | jq '.services'
```

## 🤖 Comenzi AI și extensii

### Extensii AZD
```bash
# Listează toate extensiile disponibile (inclusiv AI)
azd extension list

# Instalează extensia Foundry Agents
azd extension install azure.ai.agents

# Instalează extensia pentru ajustare fină
azd extension install azure.ai.finetune

# Instalează extensia pentru modele personalizate
azd extension install azure.ai.models

# Actualizează toate extensiile instalate
azd extension upgrade --all
```

### Comenzi agent AI
```bash
# Inițializează un proiect de agent dintr-un manifest
azd ai agent init -m <manifest-path-or-uri>

# Vizează un proiect Foundry specific
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specifică directorul sursă al agentului
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Alege o destinație de găzduire
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Server MCP (Alpha)
```bash
# Pornește serverul MCP pentru proiectul tău
azd mcp start

# Gestionează consimțământul instrumentului pentru operațiunile MCP
azd copilot consent list
```

### Generare infrastructură
```bash
# Generează fișiere IaC din definiția proiectului tău
azd infra generate

# Sintetizează infrastructura din azure.yaml
azd infra synth
```

---

## 🎯 Fluxuri de lucru rapide

### Flux de lucru pentru dezvoltare
```bash
# Începe un nou proiect
azd init --template todo-nodejs-mongo
cd my-project

# Publică în mediul de dezvoltare
azd env new dev
azd up

# Fă modificări și publică din nou
azd deploy

# Deschide panoul de monitorizare
azd monitor --live
```

### Flux de lucru pentru medii multiple
```bash
# Configurați mediile
azd env new dev
azd env new staging  
azd env new production

# Implementați în dev
azd env select dev
azd up

# Testați și promovați în staging
azd env select staging
azd up

# Implementați în producție
azd env select production
azd up
```

### Flux de depanare
```bash
# Activează modul de depanare
export AZD_DEBUG=true

# Verifică starea implementării
azd show

# Validează configurația
azd config show

# Deschide tabloul de bord de monitorizare pentru jurnale
azd monitor --logs

# Verifică starea resursei
azd show --output json
```

## 🔍 Comenzi de depanare

### Informații de depanare
```bash
# Activează afișarea mesajelor de depanare
export AZD_DEBUG=true
azd <command> --debug

# Dezactivează telemetria pentru o ieșire mai curată
export AZD_DISABLE_TELEMETRY=true

# Verifică configurația curentă
azd config show

# Verifică starea autentificării
az account show
```

### Depanare șabloane
```bash
# Listează șabloanele disponibile cu detalii
azd template list --output json

# Afișează informațiile despre șablon
azd template show <template-name>

# Validează șablonul înainte de inițializare
azd template validate <template-name>
```

## 📁 Comenzi pentru fișiere și directoare

### Structura proiectului
```bash
# Afișează structura directorului curent
tree /f  # Windows
find . -type f  # Linux/macOS

# Navighează la rădăcina proiectului azd
cd $(azd root)

# Afișează directorul de configurare azd
echo $AZD_CONFIG_DIR  # De obicei ~/.azd
```

## 🎨 Formatarea ieșirii

### Ieșire JSON
```bash
# Obține ieșire JSON pentru scripting
azd show --output json
azd env list --output json
azd config show --output json

# Analizează cu jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Ieșire tabel
```bash
# Formatează ca tabel
azd env list --output table

# Vizualizează serviciile implementate
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații comune de comenzi

### Script de verificare a stării
```bash
#!/bin/bash
# Verificare rapidă a stării de sănătate
azd show
azd env get-values
azd monitor --logs
```

### Validarea implementării
```bash
#!/bin/bash
# Validare înainte de implementare
azd show
azd provision --preview  # Previzualizați modificările înainte de implementare
az account show
```

### Comparare medii
```bash
#!/bin/bash
# Compară mediile
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de curățare a resurselor
```bash
#!/bin/bash
# Curățați mediile vechi
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabile de mediu

### Variabile de mediu comune
```bash
# Configurare Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configurare AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configurare aplicație
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comenzi de urgență

### Remedieri rapide
```bash
# Resetează autentificarea
az account clear
az login

# Forțează reîmprospătarea mediului
azd env refresh

# Reimplementează toate serviciile
azd deploy

# Verifică starea implementării
azd show --output json
```

### Comenzi de recuperare
```bash
# Recuperează după o implementare eșuată - curăță și reimplementează
azd down --force --purge
azd up

# Reprovisionează doar infrastructura
azd provision

# Reimplementează doar aplicația
azd deploy
```

## 💡 Sfaturi utile

### Aliasuri pentru un flux de lucru mai rapid
```bash
# Adaugă în fișierul tău .bashrc sau .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături pentru funcții
```bash
# Comutare rapidă între medii
azd-env() {
    azd env select $1 && azd show
}

# Implementare rapidă cu monitorizare
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Starea mediului
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajutor și documentație

### Obținerea ajutorului
```bash
# Ajutor general
azd --help
azd help

# Ajutor specific comenzii
azd up --help
azd env --help
azd config --help

# Afișează informații despre versiune și build
azd version
azd version --output json
```

### Legături către documentație
```bash
# Deschide documentația în browser
azd docs

# Afișează documentația șablonului
azd template show <template-name> --docs
```

---

**Sfat**: Salvează această fișă în marcaje și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția anterioară**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Următoarea lecție**: [Glosar](glossary.md)

---

> **💡 Vrei ajutor cu comenzile Azure în editorul tău?** Instalează [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cu `npx skills add microsoft/github-copilot-for-azure` — 37 de skilluri pentru AI, Foundry, implementare, diagnostic și altele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm nicio răspundere pentru eventuale neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->