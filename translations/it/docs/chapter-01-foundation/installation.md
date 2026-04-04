# Guida all'installazione e alla configurazione

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Nozioni di base di AZD](azd-basics.md)
- **➡️ Successivo**: [Il tuo primo progetto](first-project.md)
- **🚀 Capitolo successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Questa guida completa ti accompagnerà nell'installazione e nella configurazione di Azure Developer CLI (azd) sul tuo sistema. Imparerai diversi metodi di installazione per i vari sistemi operativi, come configurare l'autenticazione e la configurazione iniziale per preparare il tuo ambiente di sviluppo alle distribuzioni su Azure.

## Obiettivi di apprendimento

Al termine di questa lezione, sarai in grado di:
- Installare correttamente Azure Developer CLI sul tuo sistema operativo
- Configurare l'autenticazione con Azure usando più metodi
- Preparare l'ambiente di sviluppo con i prerequisiti necessari
- Comprendere le diverse opzioni di installazione e quando usarle
- Risolvere i problemi comuni di installazione e configurazione

## Risultati di apprendimento

Dopo aver completato questa lezione, potrai:
- Installare azd usando il metodo appropriato per la tua piattaforma
- Autenticarti con Azure usando azd auth login
- Verificare l'installazione e testare comandi di base di azd
- Configurare il tuo ambiente di sviluppo per un uso ottimale di azd
- Risolvere autonomamente i problemi di installazione più comuni

Questa guida ti aiuterà a installare e configurare Azure Developer CLI sul tuo sistema, indipendentemente dal sistema operativo o dall'ambiente di sviluppo.

## Prerequisiti

Prima di installare azd, assicurati di avere:
- **Sottoscrizione Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Per l'autenticazione e la gestione delle risorse
- **Git** - Per clonare i template e il controllo versione
- **Docker** (opzionale) - Per applicazioni containerizzate

## Metodi di installazione

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# Utile quando winget non è disponibile
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

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

**Manual installation from release assets:**
```bash
# Scarica l'archivio più recente per la tua architettura Linux da:
# https://github.com/Azure/azure-dev/releases
# Quindi estrailo e aggiungi il binario azd al tuo PATH.
```

### GitHub Codespaces

Alcuni Codespaces e ambienti dev container includono già `azd`, ma dovresti verificarlo invece di dare per scontato:

```bash
azd version
```

Se `azd` manca, installalo con lo script standard per l'ambiente.

### Docker

```bash
# Esegui azd in un contenitore
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crea un alias per un utilizzo più semplice
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifica dell'installazione

Dopo l'installazione, verifica che azd funzioni correttamente:

```bash
# Controlla la versione
azd version

# Visualizza l'aiuto
azd --help

# Elenca i modelli disponibili
azd template list
```

Output previsto:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Il numero di versione effettivo può variare. Controlla [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) per la versione più recente.

**✅ Lista di controllo per il successo dell'installazione:**
- [ ] `azd version` mostra il numero di versione senza errori
- [ ] `azd --help` visualizza la documentazione dei comandi
- [ ] `azd template list` mostra i template disponibili
- [ ] Puoi creare una directory di prova ed eseguire con successo `azd init`

**Se tutti i controlli sono superati, sei pronto per procedere a [Il tuo primo progetto](first-project.md)!**

## Configurazione dell'autenticazione

### Configurazione consigliata per principianti

Per i flussi di lavoro incentrati su AZD, accedi con `azd auth login`.

```bash
# Necessario per i comandi AZD come azd up
azd auth login

# Verificare lo stato di autenticazione di AZD
azd auth login --check-status
```

Usa l'accesso tramite Azure CLI solo quando prevedi di eseguire i comandi `az` personalmente durante il corso.

### Autenticazione con Azure CLI (Opzionale)
```bash
# Installa Azure CLI se non è già installata
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: consulta la documentazione di installazione dell'Azure CLI per la tua distribuzione

# Accedi ad Azure
az login

# Verifica l'autenticazione
az account show
```

### Quale flusso di accesso dovresti usare?

- Usa `azd auth login` se stai seguendo il percorso AZD per principianti e esegui principalmente comandi `azd`.
- Usa anche `az login` quando vuoi eseguire comandi Azure CLI come `az account show` o ispezionare le risorse direttamente.
- Se un esercizio include sia comandi `azd` che `az`, esegui entrambi i comandi di accesso una sola volta all'inizio.

### Autenticazione tramite Device Code
Se sei su un sistema headless o hai problemi con il browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Per ambienti automatizzati:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valida la tua configurazione completa

Se vuoi un rapido controllo di prontezza prima di iniziare il Capitolo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configurazione

### Configurazione globale
```bash
# Imposta la sottoscrizione predefinita
azd config set defaults.subscription <subscription-id>

# Imposta la posizione predefinita
azd config set defaults.location eastus2

# Visualizza tutta la configurazione
azd config show
```

### Variabili d'ambiente
Aggiungi al tuo profilo shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configurazione di Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configurazione di azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Abilita il logging di debug
```

## Integrazione con l'IDE

### Visual Studio Code
Installa l'estensione Azure Developer CLI:
1. Apri VS Code
2. Vai alle Estensioni (Ctrl+Shift+X)
3. Cerca "Azure Developer CLI"
4. Installa l'estensione

Funzionalità:
- IntelliSense per azure.yaml
- Comandi del terminale integrato
- Esplorazione dei template
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
1. Installa il plugin di Azure
2. Configura le credenziali Azure
3. Usa il terminale integrato per i comandi azd

## 🐛 Risoluzione dei problemi di installazione

### Problemi comuni

#### Permesso negato (Windows)
```powershell
# Esegui PowerShell come amministratore
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
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: rimuovere il precedente binario azd o il collegamento simbolico prima di reinstallare

# Pulire la configurazione
rm -rf ~/.azd
```

### Ottenere ulteriore assistenza
```bash
# Abilita i log di debug
export AZD_DEBUG=true
azd <command> --debug

# Visualizza la configurazione corrente
azd config show

# Visualizza lo stato corrente della distribuzione
azd show
```

## Aggiornamento di azd

### Controllo aggiornamenti
azd avvisa quando è disponibile una nuova release, e puoi confermare la build corrente con:
```bash
azd version
```

### Aggiornamenti manuali

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

## 💡 Domande frequenti

<details>
<summary><strong>Qual è la differenza tra azd e az CLI?</strong></summary>

**Azure CLI (az)**: Strumento a basso livello per gestire singole risorse di Azure
- `az webapp create`, `az storage account create`
- Una risorsa alla volta
- Focalizzato sulla gestione dell'infrastruttura

**Azure Developer CLI (azd)**: Strumento ad alto livello per distribuzioni complete di applicazioni
- `azd up` distribuisce l'intera app con tutte le risorse
- Flussi di lavoro basati su template
- Focalizzato sulla produttività degli sviluppatori

**Hai bisogno di entrambi**: azd utilizza az CLI per l'autenticazione
</details>

<details>
<summary><strong>Posso usare azd con risorse Azure esistenti?</strong></summary>

Sì! Puoi:
1. Importare risorse esistenti negli ambienti azd
2. Fare riferimento a risorse esistenti nei tuoi template Bicep
3. Usare azd per nuove distribuzioni insieme all'infrastruttura esistente

Vedi [Guida alla configurazione](configuration.md) per i dettagli.
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
- Autenticazione tramite service principal
- Modalità non interattiva

Consulta [Guida alla distribuzione](../chapter-04-infrastructure/deployment-guide.md) per i pattern CI/CD.
</details>

<details>
<summary><strong>Qual è il costo dell'utilizzo di azd?</strong></summary>

azd è **completamente gratuito** e open-source. Pagherai solo per:
- Le risorse Azure che distribuisci
- I costi di consumo Azure (compute, storage, ecc.)

Usa `azd provision --preview` per stimare i costi prima della distribuzione.
</details>

## Prossimi passi

1. **Completa l'autenticazione**: Assicurati di poter accedere alla tua sottoscrizione Azure
2. **Prova la tua prima distribuzione**: Segui la [Guida al primo progetto](first-project.md)
3. **Esplora i template**: Sfoglia i template disponibili con `azd template list`
4. **Configura il tuo IDE**: Imposta il tuo ambiente di sviluppo

## Supporto

Se riscontri problemi:
- [Documentazione ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Segnala problemi](https://github.com/Azure/azure-dev/issues)
- [Discussioni della community](https://github.com/Azure/azure-dev/discussions)
- [Supporto Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Ottieni suggerimenti sui comandi Azure direttamente nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Nozioni di base di AZD](azd-basics.md) 
- **➡️ Successivo**: [Il tuo primo progetto](first-project.md)
- **🚀 Capitolo successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installazione completata!** Continua con [Il tuo primo progetto](first-project.md) per iniziare a costruire con azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->