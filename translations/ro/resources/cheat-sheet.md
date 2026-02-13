# Fișă de Comenzi Rapidă - Comenzi Esențiale AZD

**Referință Rapidă pentru Toate Capitolele**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Start Rapid**: [Capitolul 1: Bază & Start Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructură ca Cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă de comenzi cuprinzătoare oferă o referință rapidă pentru cele mai utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru verificări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiecte azd.

## Obiective de Învățare

Folosind această fișă de comenzi, vei:
- Avea acces instant la comenzile și sintaxa esențială Azure Developer CLI
- Înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi de depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru gestionarea mediului și fluxuri multi-mediu

## Rezultate de Învățare

Referindu-te regulat la această fișă de comenzi, vei putea:
- Executa comenzile azd cu încredere fără să mai consulți documentația completă
- Rezolva rapid probleme comune folosind comenzile de diagnostic adecvate
- Gestionează eficient multiple medii și scenarii de implementare
- Aplica funcționalități avansate azd și opțiuni de configurare după necesități
- Depana probleme de implementare cu secvențe de comenzi sistematice
- Optimiza fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi Pentru Început

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

### Inițializarea Proiectului
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

## Comenzi Principale de Implementare

### Flux Complet de Implementare
```bash
# Deplasează totul (provizionare + implementare)
azd up

# Deplasează cu solicitările de confirmare dezactivate
azd up --confirm-with-no-prompt

# Deplasează într-un mediu specific
azd up --environment production

# Deplasează cu parametri personalizați
azd up --parameter location=westus2
```

### Doar Infrastructură
```bash
# Configurare resurse Azure
azd provision

# 🧪 Previziune a modificărilor infrastructurii
azd provision --preview
# Arată o vedere simulatǎ a resurselor care ar fi create/modificate/șterse
# Similar cu 'terraform plan' sau 'bicep what-if' - sigur de rulat, fără modificări aplicate
```

### Doar Aplicație
```bash
# Implementați codul aplicației
azd deploy

# Implementați serviciul specific
azd deploy --service web
azd deploy --service api

# Implementați toate serviciile
azd deploy --all
```

### Construire și Împachetare
```bash
# Construiește aplicații
azd package

# Construiește serviciul specific
azd package --service api
```

## 🌍 Gestionarea Mediului

### Operațiuni pe Mediu
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

### Variabile de Mediu
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

## ⚙️ Comenzi de Configurare

### Configurare Globală
```bash
# Listează toate configurațiile
azd config list

# Setează valorile implicite globale
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Elimină configurația
azd config unset defaults.location

# Resetează toate configurațiile
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

### Panou Monitorizare
```bash
# Deschide tabloul de bord de monitorizare din portalul Azure
azd monitor

# Deschide metricele în direct din Application Insights
azd monitor --live

# Deschide panoul de jurnale din Application Insights
azd monitor --logs

# Deschide prezentarea generală din Application Insights
azd monitor --overview
```

### Vizualizare Jurnale Container
```bash
# Vizualizați jurnalele prin Azure CLI (pentru aplicații containerizate)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Urmăriți jurnalele în timp real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vizualizați jurnalele din portalul Azure
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

## 🛠️ Comenzi de Mentenanță

### Curățare
```bash
# Elimină toate resursele Azure
azd down

# Ștergere forțată fără confirmare
azd down --force

# Curăță resursele șterse soft
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

# Afișează configurația pipeline-ului
azd pipeline show
```

### Gestionarea Infrastructurii
```bash
# Generează șabloane de infrastructură
azd infra generate

# 🧪 Previziune și planificare a infrastructurii
azd provision --preview
# Simulează aprovizionarea infrastructurii fără a implementa
# Analizează șabloanele Bicep/Terraform și afișează:
# - Resurse ce urmează a fi adăugate (verde +)
# - Resurse ce urmează a fi modificate (galben ~)
# - Resurse ce urmează a fi șterse (roșu -)
# Sigur de rulat - nu se fac modificări reale în mediul Azure

# Sintezează infrastructura din azure.yaml
azd infra synth
```

### Informații Proiect
```bash
# Afișează starea proiectului și punctele finale
azd show

# Afișează informații detaliate despre proiect în format JSON
azd show --output json

# Obține punctele finale ale serviciului
azd show --output json | jq '.services'
```

## 🎯 Fluxuri Rapide

### Flux de Dezvoltare
```bash
# Începe proiect nou
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

### Flux Multi-Mediu
```bash
# Configurează mediile
azd env new dev
azd env new staging  
azd env new production

# Fă deploy în dev
azd env select dev
azd up

# Testează și promovează în staging
azd env select staging
azd up

# Fă deploy în producție
azd env select production
azd up
```

### Flux de Depanare
```bash
# Activează modul de depanare
export AZD_DEBUG=true

# Verifică starea implementării
azd show

# Validează configurația
azd config list

# Deschide panoul de monitorizare pentru jurnale
azd monitor --logs

# Verifică starea resurselor
azd show --output json
```

## 🔍 Comenzi de Debugging

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

### Debugging Șabloane
```bash
# Listează șabloanele disponibile cu detalii
azd template list --output json

# Afișează informații despre șablon
azd template show <template-name>

# Validează șablonul înainte de inițializare
azd template validate <template-name>
```

## 📁 Comenzi pentru Fișiere și Directoare

### Structura Proiectului
```bash
# Afișează structura directorului curent
tree /f  # Windows
find . -type f  # Linux/macOS

# Navighează la rădăcina proiectului azd
cd $(azd root)

# Afișează directorul de configurare azd
echo $AZD_CONFIG_DIR  # De obicei ~/.azd
```

## 🎨 Formatare Ieșire

### Ieșire JSON
```bash
# Obține ieșire JSON pentru scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parsează cu jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Ieșire Tabel
```bash
# Formatează ca tabel
azd env list --output table

# Vizualizează serviciile desfășurate
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații Comune de Comenzi

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
# Validare înainte de implementare
azd show
azd provision --preview  # Vizualizare modificări înainte de implementare
az account show
```

### Comparare Medii
```bash
#!/bin/bash
# Compară mediile
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

## 📝 Variabile de Mediu

### Variabile Comune de Mediu
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

## 🚨 Comenzi de Urgență

### Remedieri Rapide
```bash
# Resetați autentificarea
az account clear
az login

# Forțează reîmprospătarea mediului
azd env refresh

# Redeplasați toate serviciile
azd deploy

# Verificați starea implementării
azd show --output json
```

### Comenzi de Recuperare
```bash
# Recuperați după o implementare eșuată - curățați și implementați din nou
azd down --force --purge
azd up

# Reprovisionați doar infrastructura
azd provision

# Reimplementați doar aplicația
azd deploy
```

## 💡 Sfaturi Profesionale

### Aliasuri pentru Flux Mai Rapid
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

### Obținerea Ajutorului
```bash
# Ajutor general
azd --help
azd help

# Ajutor specific comenzi
azd up --help
azd env --help
azd config --help

# Afișează versiunea și informațiile despre build
azd version
azd version --output json
```

### Legături Documentație
```bash
# Deschideți documentația în browser
azd docs

# Afișați documentația șablonului
azd template show <template-name> --docs
```

---

**Sfat**: Marchează această fișă de comenzi și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția Anterioară**: [Verificări Preliminare](../docs/pre-deployment/preflight-checks.md)
- **Lecția Următoare**: [Glosar](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să țineți cont că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->