# Guida all'Installazione e alla Configurazione

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 1 - Fondamenti & Avvio Rapido
- **⬅️ Precedente**: [Nozioni di Base di AZD](azd-basics.md)
- **➡️ Successivo**: [Il Tuo Primo Progetto](first-project.md)
- **🚀 Capitolo Successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Questa guida completa ti accompagnerà nell'installazione e nella configurazione di Azure Developer CLI (azd) sul tuo sistema. Imparerai diversi metodi di installazione per differenti sistemi operativi, configurazione dell'autenticazione e impostazione iniziale per preparare il tuo ambiente di sviluppo per le distribuzioni Azure.

## Obiettivi di Apprendimento

Al termine di questa lezione, sarai in grado di:
- Installare con successo Azure Developer CLI sul tuo sistema operativo
- Configurare l'autenticazione con Azure usando diversi metodi
- Configurare il tuo ambiente di sviluppo con i prerequisiti necessari
- Comprendere le diverse opzioni di installazione e quando utilizzarle
- Risolvere problemi comuni di installazione e configurazione

## Risultati di Apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Installare azd utilizzando il metodo appropriato per la tua piattaforma
- Autenticarti con Azure usando azd auth login
- Verificare la tua installazione e testare i comandi base di azd
- Configurare il tuo ambiente di sviluppo per un uso ottimale di azd
- Risolvere autonomamente problemi comuni di installazione

Questa guida ti aiuterà a installare e configurare Azure Developer CLI sul tuo sistema, indipendentemente dal sistema operativo o dall'ambiente di sviluppo.

## Prerequisiti

Prima di installare azd, assicurati di avere:
- **Sottoscrizione Azure** - [Crea un account gratuito](https://azure.microsoft.com/free/)
- **Azure CLI** (opzionale) - Per esempi che eseguono esplicitamente `az`; azd si autentica indipendentemente
- **Git** - Per clonare i template e controllo versione
- **Docker** (opzionale) - Per applicazioni containerizzate

**Percorso Foundry GA del Capitolo 2:** Usa AZD **1.37.0 o successivo**, installa il pacchetto con `azd ext install microsoft.foundry`, e usa Python **3.13+** e l'attuale **uv** per l'esempio hosted-agent. La modalità di deployment del codice è remota, quindi non richiede una build Docker locale. Permessi Foundry, disponibilità regionale del modello e quote sono ancora richiesti; vedi la [configurazione hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metodi di Installazione

### Windows

#### Opzione 1: Windows Package Manager (Consigliato)
```cmd
winget install microsoft.azd
```

#### Opzione 2: Script di Installazione PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opzione 3: Chocolatey
```cmd
choco install azd
```

#### Opzione 4: Installazione Manuale
1. Scarica l'ultima release da [GitHub](https://github.com/Azure/azure-dev/releases)
2. Estrai in `C:\Program Files\azd\`
3. Aggiungi alla variabile d'ambiente PATH

### macOS

#### Opzione 1: Homebrew (Consigliato)
```bash
brew tap azure/azd
brew install azd
```

#### Opzione 2: Script di Installazione
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opzione 3: Installazione Manuale
Scarica l'archivio per la tua architettura macOS da [gli asset della release](https://github.com/Azure/azure-dev/releases), estrailo, e aggiungi il binario `azd` al tuo `PATH`.

### Linux

#### Opzione 1: Script di Installazione (Consigliato)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opzione 2: Gestori di Pacchetti

**Installazione manuale dagli asset della release:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Alcuni Codespaces e ambienti dev container includono già `azd`, ma è meglio verificarlo piuttosto che darlo per scontato:

```bash
azd version
```

Se `azd` manca, installalo con lo script standard per l'ambiente.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Questo container effimero non conserva lo stato di login tra le esecuzioni. Per distribuzioni ripetute, usa la [configurazione del dev container](dev-containers.md); le build del container richiedono inoltre un demone Docker accessibile dall'interno del container.

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
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Il numero di versione effettivo varierà. Controlla [le release di Azure Developer CLI](https://github.com/Azure/azure-dev/releases) per la versione più recente.

**✅ Checklist di Installazione Riuscita:**
- [ ] `azd version` mostra il numero di versione senza errori
- [ ] `azd --help` visualizza la documentazione dei comandi
- [ ] `azd template list` mostra i template disponibili
- [ ] Puoi creare una directory di test e eseguire con successo `azd init`

**Se tutti i controlli sono superati, sei pronto per proseguire con [Il Tuo Primo Progetto](first-project.md)!**

## Configurazione dell'Autenticazione

### Configurazione Consigliata per Principianti

Per workflow AZD-first, accedi con `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Usa il login di Azure CLI solo se prevedi di eseguire comandi `az` personalmente durante il corso.

### Autenticazione con Azure CLI (Opzionale)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Quale Flusso di Accesso Usare?

- Usa `azd auth login` se segui il percorso principiante AZD e gestisci principalmente comandi `azd`.
- Usa anche `az login` se vuoi eseguire comandi Azure CLI come `az account show` o ispezionare risorse direttamente.
- Se un esercizio include comandi sia `azd` che `az`, esegui entrambi i comandi di accesso una volta all'inizio.

### Autenticazione con Device Code
Se sei su un sistema senza interfaccia grafica o hai problemi col browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Per ambienti automatizzati:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Convalida della Configurazione Completa

Se vuoi un controllo rapido della preparazione prima di iniziare il Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configurazione

### Configurazione Globale
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variabili d'Ambiente
Aggiungi al profilo shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrazione IDE

### Visual Studio Code
Installa l'estensione Azure Developer CLI:
1. Apri VS Code
2. Vai su Estensioni (Ctrl+Shift+X)
3. Cerca "Azure Developer CLI"
4. Installa l'estensione

Funzioni:
- IntelliSense per azure.yaml
- Comandi terminal integrati
- Navigazione template
- Monitoraggio deployment

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

## 🐛 Risoluzione Problemi di Installazione

### Problemi Comuni

#### Permesso Negato (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemi PATH
Aggiungi manualmente azd al PATH:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflitti di Versione
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Ottenere Ulteriore Aiuto
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Aggiornamento di azd

### Verifica Aggiornamenti
azd avvisa quando è disponibile una release più recente, e puoi confermare la tua versione corrente con:
```bash
azd version
```

### Aggiornamenti Manuali

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Domande Frequenti

<details>
<summary><strong>Qual è la differenza tra azd e az CLI?</strong></summary>

**Azure CLI (az)**: Strumento di basso livello per gestire singole risorse Azure
- `az webapp create`, `az storage account create`
- Una risorsa alla volta
- Focus sulla gestione dell'infrastruttura

**Azure Developer CLI (azd)**: Strumento di alto livello per deploy completi di applicazioni
- `azd up` distribuisce l'intera app con tutte le risorse
- Workflow basati su template
- Focus sulla produttività dello sviluppatore

**Sono indipendenti**: azd usa la propria autenticazione di default. Installa e accedi ad Azure CLI solo per comandi `az`, oppure scegli esplicitamente `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Posso usare azd con risorse Azure esistenti?</strong></summary>

Certamente! Puoi:
1. Importare risorse esistenti negli ambienti azd
2. Fare riferimento a risorse esistenti nei template Bicep
3. Usare azd per nuove distribuzioni insieme all'infrastruttura esistente

Consulta la [Guida alla Configurazione](../chapter-03-configuration/configuration.md) per dettagli.
</details>

<details>
<summary><strong>azd funziona con Azure Government o Azure China?</strong></summary>

Sì, configura la cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Se usi anche Azure CLI, configura `az cloud set --name ...` separatamente. Servizi template e disponibilità modello variano per cloud.
</details>

<details>
<summary><strong>Posso usare azd in pipeline CI/CD?</strong></summary>

Assolutamente! azd è pensato per l'automazione:
- Integrazione con GitHub Actions
- Supporto Azure DevOps
- Autenticazione tramite service principal
- Modalità non interattiva

Consulta la [Guida al Deployment](../chapter-04-infrastructure/deployment-guide.md) per i pattern CI/CD.
</details>

<details>
<summary><strong>Qual è il costo di usare azd?</strong></summary>

azd è **completamente gratuito** e open-source. Paghi solo per:
- Le risorse Azure che distribuisci
- I costi di consumo Azure (calcolo, storage, ecc.)

Usa `azd provision --preview` per ispezionare le risorse proposte, poi stima i costi con il [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/). L'anteprima non calcola i prezzi.
</details>

## Passi Successivi

1. **Completa l'autenticazione**: Assicurati di poter accedere alla tua sottoscrizione Azure
2. **Prova il primo deployment**: Segui la [Guida al Primo Progetto](first-project.md)
3. **Esplora i template**: Sfoglia i template disponibili con `azd template list`
4. **Configura il tuo IDE**: Imposta il tuo ambiente di sviluppo

## Supporto

Se incontri problemi:
- [Documentazione Ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Segnala Problemi](https://github.com/Azure/azure-dev/issues)
- [Discussioni della Comunità](https://github.com/Azure/azure-dev/discussions)
- [Supporto Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Ricevi guida sui comandi Azure direttamente nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 1 - Fondamenti & Avvio Rapido
- **⬅️ Precedente**: [Nozioni di Base di AZD](azd-basics.md) 
- **➡️ Successivo**: [Il Tuo Primo Progetto](first-project.md)
- **🚀 Capitolo Successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installazione completata!** Prosegui con [Il Tuo Primo Progetto](first-project.md) per iniziare a costruire con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->