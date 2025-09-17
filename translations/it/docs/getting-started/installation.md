<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-17T21:39:23+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "it"
}
-->
# Guida all'installazione e configurazione

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Nozioni di Base su AZD](azd-basics.md)
- **➡️ Successivo**: [Il Tuo Primo Progetto](first-project.md)
- **🚀 Capitolo Successivo**: [Capitolo 2: Sviluppo AI-First](../ai-foundry/azure-ai-foundry-integration.md)

## Introduzione

Questa guida completa ti accompagnerà nell'installazione e configurazione di Azure Developer CLI (azd) sul tuo sistema. Imparerai diversi metodi di installazione per sistemi operativi differenti, configurazione dell'autenticazione e impostazioni iniziali per preparare il tuo ambiente di sviluppo alle distribuzioni su Azure.

## Obiettivi di Apprendimento

Alla fine di questa lezione, sarai in grado di:
- Installare con successo Azure Developer CLI sul tuo sistema operativo
- Configurare l'autenticazione con Azure utilizzando diversi metodi
- Impostare il tuo ambiente di sviluppo con i prerequisiti necessari
- Comprendere le diverse opzioni di installazione e quando utilizzarle
- Risolvere problemi comuni di installazione e configurazione

## Risultati di Apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Installare azd utilizzando il metodo appropriato per la tua piattaforma
- Autenticarti con Azure utilizzando il comando `azd auth login`
- Verificare l'installazione e testare i comandi di base di azd
- Configurare il tuo ambiente di sviluppo per un utilizzo ottimale di azd
- Risolvere autonomamente problemi comuni di installazione

Questa guida ti aiuterà a installare e configurare Azure Developer CLI sul tuo sistema, indipendentemente dal sistema operativo o dall'ambiente di sviluppo.

## Prerequisiti

Prima di installare azd, assicurati di avere:
- **Abbonamento Azure** - [Crea un account gratuito](https://azure.microsoft.com/free/)
- **Azure CLI** - Per l'autenticazione e la gestione delle risorse
- **Git** - Per clonare template e controllo di versione
- **Docker** (opzionale) - Per applicazioni containerizzate

## Metodi di Installazione

### Windows

#### Opzione 1: PowerShell (Consigliata)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opzione 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opzione 3: Chocolatey
```cmd
choco install azd
```

#### Opzione 4: Installazione Manuale
1. Scarica l'ultima versione da [GitHub](https://github.com/Azure/azure-dev/releases)
2. Estrai in `C:\Program Files\azd\`
3. Aggiungi alla variabile PATH dell'ambiente

### macOS

#### Opzione 1: Homebrew (Consigliata)
```bash
brew tap azure/azd
brew install azd
```

#### Opzione 2: Script di Installazione
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opzione 3: Installazione Manuale
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opzione 1: Script di Installazione (Consigliata)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opzione 2: Gestori di Pacchetti

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd è preinstallato in GitHub Codespaces. Crea semplicemente uno spazio di lavoro e inizia a utilizzare azd immediatamente.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifica dell'Installazione

Dopo l'installazione, verifica che azd funzioni correttamente:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Output previsto:
```
azd version 1.5.0 (commit abc123)
```

## Configurazione dell'Autenticazione

### Autenticazione con Azure CLI (Consigliata)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Autenticazione con Codice Dispositivo
Se stai utilizzando un sistema senza interfaccia grafica o hai problemi con il browser:
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

### Configurazione Globale
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Variabili d'Ambiente
Aggiungi al profilo della tua shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integrazione con IDE

### Visual Studio Code
Installa l'estensione Azure Developer CLI:
1. Apri VS Code
2. Vai su Estensioni (Ctrl+Shift+X)
3. Cerca "Azure Developer CLI"
4. Installa l'estensione

Funzionalità:
- IntelliSense per azure.yaml
- Comandi integrati nel terminale
- Navigazione dei template
- Monitoraggio delle distribuzioni

### GitHub Codespaces
Crea un file `.devcontainer/devcontainer.json`:
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
3. Utilizza il terminale integrato per i comandi azd

## 🐛 Risoluzione dei Problemi di Installazione

### Problemi Comuni

#### Permesso Negato (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi con PATH
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

#### Problemi di Rete/Proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Conflitti di Versione
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Ottenere Ulteriore Supporto
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Aggiornamento di azd

### Aggiornamenti Automatici
azd ti notificherà quando sono disponibili aggiornamenti:
```bash
azd version --check-for-updates
```

### Aggiornamenti Manuali

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

## Prossimi Passi

1. **Completa l'autenticazione**: Assicurati di poter accedere al tuo abbonamento Azure
2. **Prova la tua prima distribuzione**: Segui la [Guida al Primo Progetto](first-project.md)
3. **Esplora i template**: Sfoglia i template disponibili con `azd template list`
4. **Configura il tuo IDE**: Imposta il tuo ambiente di sviluppo

## Supporto

Se incontri problemi:
- [Documentazione Ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Segnala Problemi](https://github.com/Azure/azure-dev/issues)
- [Discussioni della Community](https://github.com/Azure/azure-dev/discussions)
- [Supporto Azure](https://azure.microsoft.com/support/)

---

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Nozioni di Base su AZD](azd-basics.md) 
- **➡️ Successivo**: [Il Tuo Primo Progetto](first-project.md)
- **🚀 Capitolo Successivo**: [Capitolo 2: Sviluppo AI-First](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Installazione Completata!** Continua con [Il Tuo Primo Progetto](first-project.md) per iniziare a costruire con azd.

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.