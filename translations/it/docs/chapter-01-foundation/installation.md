# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Questa guida completa ti accompagnerà nell'installazione e nella configurazione di Azure Developer CLI (azd) sul tuo sistema. Imparerai diversi metodi di installazione per i vari sistemi operativi, la configurazione dell'autenticazione e le impostazioni iniziali per preparare il tuo ambiente di sviluppo alle distribuzioni su Azure.

## Obiettivi di apprendimento

Al termine di questa lezione, sarai in grado di:
- Installare con successo Azure Developer CLI sul tuo sistema operativo
- Configurare l'autenticazione con Azure usando più metodi
- Configurare il tuo ambiente di sviluppo con i prerequisiti necessari
- Capire le diverse opzioni di installazione e quando utilizzarle
- Risolvere i problemi comuni di installazione e configurazione

## Risultati di apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Installare azd usando il metodo appropriato per la tua piattaforma
- Autenticarti con Azure usando azd auth login
- Verificare l'installazione e testare i comandi base di azd
- Configurare il tuo ambiente di sviluppo per un utilizzo ottimale di azd
- Risolvere in autonomia i problemi di installazione più comuni

Questa guida ti aiuterà a installare e configurare Azure Developer CLI sul tuo sistema, indipendentemente dal sistema operativo o dall'ambiente di sviluppo.

## Prerequisiti

Prima di installare azd, assicurati di avere:
- **Azure subscription** - [Crea un account gratuito](https://azure.microsoft.com/free/)
- **Azure CLI** - Per l'autenticazione e la gestione delle risorse
- **Git** - Per clonare i template e il controllo versione
- **Docker** (opzionale) - Per applicazioni containerizzate

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Esegui come amministratore o con privilegi elevati
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Scarica l'ultima release da [GitHub](https://github.com/Azure/azure-dev/releases)
2. Estrai in `C:\Program Files\azd\`
3. Aggiungi alla variabile d'ambiente PATH

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Scarica e installa
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Aggiungi il repository dei pacchetti Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installa azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Aggiungi il repository dei pacchetti Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd è preinstallato in GitHub Codespaces. Crea semplicemente uno codespace e inizia a usare azd immediatamente.

### Docker

```bash
# Esegui azd in un contenitore
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crea un alias per un uso più semplice
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifica dell'installazione

Dopo l'installazione, verifica che azd funzioni correttamente:

```bash
# Controlla la versione
azd version

# Visualizza aiuto
azd --help

# Elenca i modelli disponibili
azd template list
```

Output previsto:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Il numero di versione effettivo varierà. Controlla le [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) per l'ultima versione.

**✅ Checklist di successo dell'installazione:**
- [ ] `azd version` mostra il numero di versione senza errori
- [ ] `azd --help` visualizza la documentazione dei comandi
- [ ] `azd template list` mostra i template disponibili
- [ ] `az account show` mostra la tua sottoscrizione Azure
- [ ] Puoi creare una directory di prova ed eseguire `azd init` con successo

**Se tutti i controlli passano, sei pronto per procedere a [Il tuo primo progetto](first-project.md)!**

## Configurazione dell'autenticazione

### Autenticazione con Azure CLI (Consigliato)
```bash
# Installa Azure CLI se non è già installato
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Accedi ad Azure
az login

# Verifica l'autenticazione
az account show
```

### Autenticazione con Device Code
Se sei su un sistema headless o hai problemi con il browser:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Per ambienti automatizzati:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configurazione

### Configurazione globale
```bash
# Imposta la sottoscrizione predefinita
azd config set defaults.subscription <subscription-id>

# Imposta la posizione predefinita
azd config set defaults.location eastus2

# Visualizza l'intera configurazione
azd config list
```

### Variabili d'ambiente
Aggiungi al tuo profilo della shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configurazione di Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configurazione di azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Abilita la registrazione di debug
```

## Integrazione IDE

### Visual Studio Code
Installa l'estensione Azure Developer CLI:
1. Apri VS Code
2. Vai a Estensioni (Ctrl+Shift+X)
3. Cerca "Azure Developer CLI"
4. Installa l'estensione

Funzionalità:
- IntelliSense per azure.yaml
- Comandi nel terminale integrato
- Esplorazione dei template
- Monitoraggio delle distribuzioni

### GitHub Codespaces
Crea un `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Installa il plugin Azure
2. Configura le credenziali Azure
3. Usa il terminale integrato per i comandi azd

## 🐛 Risoluzione dei problemi di installazione

### Problemi comuni

#### Permesso negato (Windows)
```powershell
# Esegui PowerShell come amministratore
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi di PATH
Aggiungi manualmente azd al tuo PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemi di rete/proxy
```bash
# Configura il proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignora la verifica SSL (non consigliato in produzione)
azd config set http.insecure true
```

#### Conflitti di versione
```bash
# Rimuovere le installazioni precedenti
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Pulire la configurazione
rm -rf ~/.azd
```

### Ottenere ulteriore aiuto
```bash
# Abilita il logging di debug
export AZD_DEBUG=true
azd <command> --debug

# Visualizza la configurazione corrente
azd config list

# Visualizza lo stato corrente della distribuzione
azd show
```

## Aggiornamento di azd

### Aggiornamenti automatici
azd ti notificherà quando sono disponibili aggiornamenti:
```bash
azd version --check-for-updates
```

### Aggiornamenti manuali

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Domande frequenti

<details>
<summary><strong>Qual è la differenza tra azd e az CLI?</strong></summary>

**Azure CLI (az)**: Strumento di basso livello per la gestione delle singole risorse Azure
- `az webapp create`, `az storage account create`
- Una risorsa alla volta
- Focus sulla gestione dell'infrastruttura

**Azure Developer CLI (azd)**: Strumento di alto livello per distribuzioni complete di applicazioni
- `azd up` distribuisce l'intera app con tutte le risorse
- Flussi di lavoro basati su template
- Focus sulla produttività dello sviluppatore

**Hai bisogno di entrambi**: azd usa az CLI per l'autenticazione
</details>

<details>
<summary><strong>Posso usare azd con risorse Azure esistenti?</strong></summary>

Sì! Puoi:
1. Importare risorse esistenti negli ambienti azd
2. Fare riferimento a risorse esistenti nei tuoi template Bicep
3. Usare azd per nuove distribuzioni insieme all'infrastruttura esistente

Vedi [Guida alla configurazione](configuration.md) per dettagli.
</details>

<details>
<summary><strong>azd funziona con Azure Government o Azure China?</strong></summary>

Sì, configura il cloud:
```bash
# Azure per il governo
az cloud set --name AzureUSGovernment
az login

# Azure Cina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Posso usare azd nelle pipeline CI/CD?</strong></summary>

Assolutamente! azd è progettato per l'automazione:
- Integrazione con GitHub Actions
- Supporto per Azure DevOps
- Autenticazione con service principal
- Modalità non interattiva

Vedi [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) per pattern CI/CD.
</details>

<details>
<summary><strong>Quanto costa usare azd?</strong></summary>

azd è **completamente gratuito** e open-source. Paghi solo per:
- Le risorse Azure che distribuisci
- I costi di consumo di Azure (compute, storage, ecc.)

Usa `azd provision --preview` per stimare i costi prima della distribuzione.
</details>

## Prossimi passi

1. **Completa l'autenticazione**: assicurati di poter accedere alla tua sottoscrizione Azure
2. **Prova la tua prima distribuzione**: segui la [Guida al primo progetto](first-project.md)
3. **Esplora i template**: sfoglia i template disponibili con `azd template list`
4. **Configura il tuo IDE**: imposta il tuo ambiente di sviluppo

## Supporto

Se riscontri problemi:
- [Documentazione ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Segnala problemi](https://github.com/Azure/azure-dev/issues)
- [Discussioni della community](https://github.com/Azure/azure-dev/discussions)
- [Supporto Azure](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installazione completata!** Continua con [Il tuo primo progetto](first-project.md) per iniziare a costruire con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni di carattere critico, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali fraintendimenti o errate interpretazioni derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->