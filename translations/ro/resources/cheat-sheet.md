# Fișă de Comenzi - Comenzi Esențiale AZD

**Referință Rapidă pentru Toate Capitolele**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Început Rapid**: [Capitolul 1: Fundament & Început Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructură ca și Cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă de comenzi cuprinzătoare oferă referință rapidă pentru cele mai frecvent utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru căutări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiectele azd.

## Obiective de Învățare

Folosind această fișă de comenzi, vei:
- Avea acces instant la comenzi și sintaxă esențiale Azure Developer CLI
- Înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi pentru depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru gestionarea mediilor și fluxuri de lucru multi-mediu

## Rezultate ale Învățării

Cu referință regulată la această fișă, vei putea să:
- Executi comenzi azd cu încredere fără a consulta documentația completă
- Rezolvi rapid probleme comune utilizând comenzile diagnostice potrivite
- Gestionezi eficient medii multiple și scenarii de implementare
- Aplici funcționalități și opțiuni avansate azd după necesitate
- Depanezi probleme de implementare folosind secvențe sistematice de comenzi
- Optimizezi fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi De Pornire

### Autentificare
```bash
# Autentificare în Azure prin AZD
azd auth login

# Autentificare în Azure CLI (AZD folosește acest lucru în fundal)
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

### Inițializare Proiect
```bash
# Răsfoiți șabloanele disponibile
azd template list

# Inițializați din șablon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inițializați în directorul curent
azd init .

# Inițializați cu nume personalizat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comenzi De Bază Pentru Implementare

### Flux Complet De Implementare
```bash
# Desfășurați totul (provisionare + desfășurare)
azd up

# Desfășurați cu solicitările de confirmare dezactivate
azd up --confirm-with-no-prompt

# Desfășurați într-un mediu specific
azd up --environment production

# Desfășurați cu parametri personalizați
azd up --parameter location=westus2
```

### Numai Infrastructură
```bash
# Provisionați resurse Azure
azd provision

# 🧪 Previzualizați modificările infrastructurii
azd provision --preview
# Arată o vizualizare în gol a resurselor care ar fi create/modificate/șterse
# Similar cu 'terraform plan' sau 'bicep what-if' - sigur de rulat, fără modificări aplicate
```

### Numai Aplicație
```bash
# Implementați codul aplicației
azd deploy

# Implementați serviciul specific
azd deploy --service web
azd deploy --service api

# Implementați toate serviciile
azd deploy --all
```

### Compilare și Pachetare
```bash
# Construiește aplicații
azd package

# Construiește serviciul specific
azd package --service api
```

## 🌍 Managementul Mediului

### Operațiuni Mediu
```bash
# Listează toate mediile
azd env list

# Creează un mediu nou
azd env new development
azd env new staging --location westus2

# Selectează mediul
azd env select production

# Afișează mediul curent
azd env show

# Reîmprospătează starea mediului
azd env refresh
```

### Variabile Mediu
```bash
# Setează variabila de mediu
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obține variabila de mediu
azd env get API_KEY

# Listează toate variabilele de mediu
azd env get-values

# Șterge variabila de mediu
azd env unset DEBUG
```

## ⚙️ Comenzi De Configurare

### Configurare Globală
```bash
# Listează toată configurația
azd config list

# Setează valorile implicite globale
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Elimină configurația
azd config unset defaults.location

# Resetează toată configurația
azd config reset
```

### Configurare Proiect
```bash
# Validează azure.yaml
azd config validate

# Afișează informații despre proiect
azd show

# Obține punctele finale ale serviciului
azd show --output json
```

## 📊 Monitorizare și Diagnostic

### Panou De Monitorizare
```bash
# Deschide tabloul de bord pentru monitorizarea portalului Azure
azd monitor

# Deschide metricele live din Application Insights
azd monitor --live

# Deschide panoul de jurnale din Application Insights
azd monitor --logs

# Deschide previzualizarea Application Insights
azd monitor --overview
```

### Vizualizare Jurnale Container
```bash
# Vizualizați jurnalele prin Azure CLI (pentru aplicații container)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Urmăriți jurnalele în timp real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vizualizați jurnalele din Portalul Azure
azd monitor --logs
```

### Interogări Log Analytics
```bash
# Accesați Log Analytics prin Azure Portal
azd monitor --logs

# Interogați jurnalele folosind Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comenzi De Mentenanță

### Curățare
```bash
# Elimină toate resursele Azure
azd down

# Ștergere forțată fără confirmare
azd down --force

# Curăță resursele șterse temporar
azd down --purge

# Curățare completă
azd down --force --purge
```

### Actualizări
```bash
# Verifică pentru actualizări azd
azd version

# Obține versiunea curentă
azd version

# Vizualizează configurația curentă
azd config list
```

## 🔧 Comenzi Avansate

### Pipeline și CI/CD
```bash
# Configurează GitHub Actions
azd pipeline config

# Configurează Azure DevOps
azd pipeline config --provider azdo

# Afișează configurarea pipeline-ului
azd pipeline show
```

### Management Infrastructură
```bash
# Generează șabloane de infrastructură
azd infra generate

# 🧪 Previziune și planificare infrastructură
azd provision --preview
# Simulează aprovizionarea infrastructurii fără a implementa
# Analizează șabloane Bicep/Terraform și afișează:
# - Resurse ce urmează a fi adăugate (verde +)
# - Resurse ce urmează a fi modificate (galben ~)
# - Resurse ce urmează a fi șterse (roșu -)
# Sigur de rulat - nu se fac modificări efective în mediul Azure

# Synthesizează infrastructura din azure.yaml
azd infra synth
```

### Informații Proiect
```bash
# Afișați starea proiectului și punctele finale
azd show

# Afișați informații detaliate despre proiect în format JSON
azd show --output json

# Obțineți punctele finale ale serviciului
azd show --output json | jq '.services'
```

## 🤖 Comenzi AI & Extensii

### Extensii AZD
```bash
# Listează toate extensiile disponibile (inclusiv AI)
azd extension list

# Instalează extensia agenților Foundry
azd extension install azure.ai.agents

# Instalează extensia pentru ajustare fină
azd extension install azure.ai.finetune

# Instalează extensia pentru modele personalizate
azd extension install azure.ai.models

# Actualizează toate extensiile instalate
azd extension upgrade --all
```

### Comenzi Agent AI
```bash
# Inițializează un proiect agent dintr-un manifest
azd ai agent init -m <manifest-path-or-uri>

# Țintește un proiect Foundry specific
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specifică directorul sursă al agentului
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Alege o țintă de găzduire
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Server MCP (Alfa)
```bash
# Porniți serverul MCP pentru proiectul dvs.
azd mcp start

# Gestionați consimțământul instrumentului pentru operațiunile MCP
azd mcp consent
```

### Generare Infrastructură
```bash
# Generează fișiere IaC din definiția proiectului tău
azd infra generate

# Sintetizează infrastructura din azure.yaml
azd infra synth
```

---

## 🎯 Fluxuri Rapide

### Flux Dezvoltare
```bash
# Începe proiect nou
azd init --template todo-nodejs-mongo
cd my-project

# Deploiază în dezvoltare
azd env new dev
azd up

# Fă modificări și redeploiază
azd deploy

# Deschide panoul de monitorizare
azd monitor --live
```

### Flux Multi-Mediu
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

### Flux Depanare
```bash
# Activează modul de depanare
export AZD_DEBUG=true

# Verifică starea implementării
azd show

# Validează configurația
azd config list

# Deschide tabloul de bord de monitorizare pentru jurnale
azd monitor --logs

# Verifică starea resurselor
azd show --output json
```

## 🔍 Comenzi De Debug

### Informații Debug
```bash
# Activează ieșirea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Dezactivează telemetria pentru o ieșire mai curată
export AZD_DISABLE_TELEMETRY=true

# Verifică configurația curentă
azd config list

# Verifică starea autentificării
az account show
```

### Debug Șabloane
```bash
# Listează șabloanele disponibile cu detalii
azd template list --output json

# Afișează informații despre șablon
azd template show <template-name>

# Validează șablonul înainte de inițializare
azd template validate <template-name>
```

## 📁 Comenzi Fişiere și Directoare

### Structură Proiect
```bash
# Afișează structura directorului curent
tree /f  # Windows
find . -type f  # Linux/macOS

# Navighează la rădăcina proiectului azd
cd $(azd root)

# Afișează directorul de configurație azd
echo $AZD_CONFIG_DIR  # De obicei ~/.azd
```

## 🎨 Formatare Ieșire

### Ieșire JSON
```bash
# Obțineți ieșirea JSON pentru scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parcurgeți cu jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Ieșire Tabel
```bash
# Formatează ca tabel
azd env list --output table

# Vizualizează serviciile implementate
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații Comune De Comenzi

### Script Verificare Sănătate
```bash
#!/bin/bash
# Verificare rapidă a stării de sănătate
azd show
azd env show
azd monitor --logs
```

### Validare Implementare
```bash
#!/bin/bash
# Validare pre-implementare
azd show
azd provision --preview  # Previzualizare modificări înainte de implementare
az account show
```

### Comparare Medii
```bash
#!/bin/bash
# Compară mediile de lucru
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script Curățare Resurse
```bash
#!/bin/bash
# Curăță mediile vechi
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabile Mediului

### Variabile Comune De Mediu
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

## 🚨 Comenzi De Urgență

### Remedieri Rapide
```bash
# Resetează autentificarea
az account clear
az login

# Forțează reîmprospătarea mediului
azd env refresh

# Redeplează toate serviciile
azd deploy

# Verifică starea implementării
azd show --output json
```

### Comenzi Recuperare
```bash
# Recuperare după o implementare eșuată - curățați și reimplementați
azd down --force --purge
azd up

# Reprovisonați doar infrastructura
azd provision

# Reimplementați doar aplicația
azd deploy
```

## 💡 Sfaturi Pro

### Aliasuri Pentru Fluxuri Mai Rapide
```bash
# Adaugă în fișierul tău .bashrc sau .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături Funcții
```bash
# Comutare rapidă a mediului
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajutor și Documentație

### Obținere Ajutor
```bash
# Ajutor general
azd --help
azd help

# Ajutor specific pentru comandă
azd up --help
azd env --help
azd config --help

# Afișează versiunea și informațiile despre compilare
azd version
azd version --output json
```

### Legături Documentație
```bash
# Deschide documentația în browser
azd docs

# Afișează documentația șablonului
azd template show <template-name> --docs
```

---

**Sfat**: Adaugă această fișă în semne de carte și folosește `Ctrl+F` pentru a găsi rapid comenzile necesare!

---

**Navigare**
- **Lecția Anterioară**: [Verificări Preliminare](../docs/pre-deployment/preflight-checks.md)
- **Lecția Următoare**: [Glosar](glossary.md)

---

> **💡 Vrei ajutor cu comenzile Azure în editorul tău?** Instalează [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cu `npx skills add microsoft/github-copilot-for-azure` — 37 de skill-uri pentru AI, Foundry, implementare, diagnostic și altele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări eronate ce pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->