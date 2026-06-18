# Fișă de referință cu comenzi - Comenzi esențiale AZD

**Referință rapidă pentru toate capitolele**
- **📚 Pagina cursului**: [AZD Pentru începători](../README.md)
- **📖 Pornire rapidă**: [Capitolul 1: Bază & Pornire rapidă](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructură ca și cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă cu comenzi cuprinzătoare oferă o referință rapidă pentru cele mai frecvent utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru consultări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiecte azd.

## Obiective de învățare

Folosind această fișă cu comenzi, veți:
- Avea acces instantaneu la comenzile și sintaxa esențiale Azure Developer CLI
- Înțelege organizarea comenzilor după categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi de depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru gestionarea mediilor și fluxuri de lucru multi-mediu

## Rezultate de învățare

Cu referință regulată la această fișă cu comenzi, veți putea:
- Executa comenzi azd cu încredere fără a consulta documentația completă
- Rezolva rapid probleme comune folosind comenzile diagnostice potrivite
- Gestione eficient mai multe medii și scenarii de implementare
- Aplica funcționalități avansate azd și opțiuni de configurare după nevoie
- Depana probleme de implementare folosind secvențe sistematice de comenzi
- Optimiza fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi pentru început

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

### Inițializarea proiectului
```bash
# Răsfoiește șabloanele disponibile
azd template list

# Inițializează din șablon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inițializează în directorul curent
azd init .

# Inițializează cu nume personalizat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comenzi principale de implementare

### Flux complet de implementare
```bash
# Desfășurați totul (provisionare + distribuire)
azd up

# Desfășurați cu prompturi de confirmare dezactivate
azd up --confirm-with-no-prompt

# Desfășurați într-un mediu specific
azd up --environment production

# Desfășurați cu parametri personalizați
azd up --parameter location=westus2
```

### Doar infrastructură
```bash
# Provizionați resurse Azure
azd provision

# 🧪 Previzualizați modificările infrastructurii
azd provision --preview
# Afișează o vizualizare de simulare a resurselor care ar fi create/modificate/șterse
# Similar cu 'terraform plan' sau 'bicep what-if' - sigur de executat, fără modificări aplicate
```

### Doar aplicație
```bash
# Dezvoltă codul aplicației
azd deploy

# Dezvoltă un serviciu specific
azd deploy --service web
azd deploy --service api

# Dezvoltă toate serviciile
azd deploy --all
```

### Construire și împachetare
```bash
# Restaurare (descărcare) a dependențelor aplicației
azd restore

# Restaurare a unui serviciu specific
azd restore --service api

# Construiește un artefact de implementare fără a implementa
azd package

# Construiește un serviciu specific
azd package --service api
```

> **`azd restore`** descarcă dependențele aplicației tale (npm, pip, NuGet, Maven, etc.). Se execută automat în timpul `azd package` și `azd deploy`, așadar rareori apelezi direct acestă comandă — ruleaz-o manual pentru a prelua dependențele în avans (de exemplu, pentru a încălzi o cache CI sau a lucra offline ulterior).

> **`azd package`** construiește artefactul ce poate fi implementat (o imagine container sau zip) **fără** a-l împinge către Azure. Folosește-l singur pentru a verifica dacă o construire reușește, inspecta rezultatul sau produce un artefact pe care un proces separat îl va implementa mai târziu. `azd deploy` împachetează automat, deci ai nevoie de `azd package` doar când dorești artefactul fără implementare.


## 🌍 Gestionarea mediului

### Operațiuni de mediu
```bash
# Listează toate mediile
azd env list

# Creează un mediu nou
azd env new development
azd env new staging --location westus2

# Selectează mediul
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
# Listează toată configurația
azd config show

# Setează valorile implicite globale
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Elimină configurația
azd config unset defaults.location

# Resetează toată configurația
azd config reset
```

### Configurare proiect
```bash
# Validează azure.yaml
azd config validate

# Afișează informațiile proiectului
azd show

# Obține punctele finale ale serviciilor
azd show --output json
```

## 📊 Monitorizare și diagnostic

### Tablou de monitorizare
```bash
# Deschideți panoul de monitorizare Azure portal
azd monitor

# Deschideți metricile live din Application Insights
azd monitor --live

# Deschideți panoul de jurnale din Application Insights
azd monitor --logs

# Deschideți prezentarea generală din Application Insights
azd monitor --overview
```

### Vizualizare jurnale container
```bash
# Vizualizați jurnalele prin Azure CLI (pentru Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Urmăriți jurnalele în timp real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vizualizați jurnalele din Portalul Azure
azd monitor --logs
```

### Interogări Log Analytics
```bash
# Accesează Log Analytics prin portalul Azure
azd monitor --logs

# Interoghează jurnalele folosind Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comenzi de întreținere

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

# 🧪 Previzualizare și planificare infrastructură
azd provision --preview
# Simulează aprovizionarea infrastructurii fără a implementa
# Analizează șabloanele Bicep/Terraform și afișează:
# - Resurse care urmează să fie adăugate (verde +)
# - Resurse care urmează să fie modificate (galben ~)
# - Resurse care urmează să fie șterse (roșu -)
# Sigur de rulat - nu se fac modificări efective în mediul Azure

# Sintetizează infrastructura din azure.yaml
azd infra synth
```

### Informații proiect
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

# Instalează extensia abilităților agenților (previzualizare)
azd extension install azure.ai.skills

# Instalează extensia conexiunilor Foundry (previzualizare)
azd extension install azure.ai.connections

# Instalează extensia pentru ajustare fină
azd extension install azure.ai.finetune

# Instalează extensia pentru modele personalizate
azd extension install azure.ai.models

# Actualizează toate extensiile instalate
azd extension upgrade --all
```

### Comenzi agent AI
```bash
# Inițializează un proiect agent dintr-un manifest
azd ai agent init -m <manifest-path-or-uri>

# Țintește un proiect Foundry specific
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specifică directorul sursă al agentului
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Alege o țintă de găzduire
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testează un agent implementat (afișează latența + timpul până la primul octet)
azd ai agent invoke

# Arată configurația endpoint-ului activ
azd ai agent endpoint show

# Generează un set de date pentru evaluare, apoi optimizează agentul
azd ai agent eval generate
azd ai agent optimize

# Descarcă sursa implementată a unui agent găzduit bazat pe cod
azd ai agent code download

# Șterge un agent găzduit și toate versiunile sale (--force încheie sesiunile active)
azd ai agent delete --force
```

### Server MCP (Alpha)
```bash
# Porniți serverul MCP pentru proiectul dvs.
azd mcp start

# Gestionați consimțământul pentru unelte pentru operațiunile MCP
azd copilot consent list
```

### Generare infrastructură
```bash
# Generează fișiere IaC din definiția proiectului tău
azd infra generate

# Sintezează infrastructura din azure.yaml
azd infra synth
```

---

## 🎯 Fluxuri rapide de lucru

### Flux de dezvoltare
```bash
# Pornește proiect nou
azd init --template todo-nodejs-mongo
cd my-project

# Publică în dezvoltare
azd env new dev
azd up

# Fă modificări și republică
azd deploy

# Deschide panoul de monitorizare
azd monitor --live
```

### Flux multi-mediu
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

# Deschide panoul de monitorizare pentru jurnale
azd monitor --logs

# Verifică starea resurselor
azd show --output json
```

## 🔍 Comenzi de depanare

### Informații debug
```bash
# Activează ieșirea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Dezactivează telemetria pentru o ieșire mai curată
export AZD_DISABLE_TELEMETRY=true

# Verifică configurația curentă
azd config show

# Verifică starea autentificării
az account show
```

### Debug șabloane
```bash
# Listează șabloanele disponibile cu detalii
azd template list --output json

# Afișează informații despre șablon
azd template show <template-name>

# Efectuează validarea șablonului înainte de inițializare
azd template validate <template-name>
```

## 📁 Comenzi pentru fișiere și directoare

### Structura proiectului
```bash
# Afișați structura directorului curent
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigați la rădăcina proiectului azd
cd $(azd root)

# Afișați directorul de configurare azd
echo $AZD_CONFIG_DIR  # De obicei ~/.azd
```

## 🎨 Formatare output

### Output JSON
```bash
# Obțineți ieșire JSON pentru scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parcurgeți cu jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output tabel
```bash
# Formatează ca tabel
azd env list --output table

# Vizualizează serviciile implementate
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații comune de comenzi

### Script verificare stare
```bash
#!/bin/bash
# Verificare rapidă a stării de sănătate
azd show
azd env get-values
azd monitor --logs
```

### Validare implementare
```bash
#!/bin/bash
# Validarea înainte de implementare
azd show
azd provision --preview  # Previzualizați modificările înainte de implementare
az account show
```

### Comparare medii
```bash
#!/bin/bash
# Compară medii
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script curățare resurse
```bash
#!/bin/bash
# Curăță mediile vechi
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabile de mediu

### Variabile comune de mediu
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

# Redeplasează toate serviciile
azd deploy

# Verifică starea implementării
azd show --output json
```

### Comenzi de recuperare
```bash
# Recuperează dintr-o implementare eșuată - curăță și reimplementează
azd down --force --purge
azd up

# Reprovisionare doar infrastructura
azd provision

# Reimplementează doar aplicația
azd deploy
```

## 💡 Sfaturi profesioniste

### Aliasuri pentru flux mai rapid
```bash
# Adaugă în fișierul tău .bashrc sau .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături funcții
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajutor și documentație

### Obținere ajutor
```bash
# Ajutor general
azd --help
azd help

# Ajutor specific pentru comandă
azd up --help
azd env --help
azd config --help

# Afișează versiunea și informații despre build
azd version
azd version --output json
```

### Linkuri documentație
```bash
# Deschide documentația în browser
azd docs

# Arată documentația șablonului
azd template show <template-name> --docs
```

---

**Sfat**: Marchează această fișă cu comenzi și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția precedentă**: [Verificări prealabile](../docs/pre-deployment/preflight-checks.md)
- **Lecția următoare**: [Glosar](glossary.md)

---

> **💡 Vrei ajutor pentru comenzile Azure în editorul tău?** Instalează [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cu `npx skills add microsoft/github-copilot-for-azure` — 37 de aptitudini pentru AI, Foundry, implementare, diagnostic și altele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->