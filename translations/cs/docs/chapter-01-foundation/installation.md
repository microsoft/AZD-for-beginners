# Průvodce instalací a nastavením

**Navigace kapitolami:**
- **📚 Úvod do kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Následující kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) ve vašem systému. Naučíte se různé způsoby instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci, abyste připravili své vývojové prostředí pro nasazování do Azure.

## Cíle učení

Na konci této lekce budete schopni:
- Úspěšně nainstalovat Azure Developer CLI na váš operační systém
- Nakonfigurovat autentizaci s Azure pomocí různých metod
- Nastavit své vývojové prostředí s potřebnými předpoklady
- Porozumět různým možnostem instalace a kdy kterou použít
- Řešit běžné problémy s instalací a nastavením

## Výsledky učení

Po dokončení této lekce budete schopni:
- Nainstalovat azd pomocí vhodné metody pro vaši platformu
- Přihlásit se k Azure pomocí příkazu azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Nakonfigurovat své vývojové prostředí pro optimální využití azd
- Samostatně vyřešit běžné problémy s instalací

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI na vašem systému, bez ohledu na váš operační systém nebo vývojové prostředí.

## Požadavky

Před instalací azd se ujistěte, že máte:
- **Azure předplatné** - [Vytvořit bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** (volitelné) - Pro příklady, které explicitně spouští `az`; azd autentizuje nezávisle
- **Git** - Pro klonování šablon a správu verzí
- **Docker** (volitelné) - Pro kontejnery aplikací

**Cesta Foundry GA v kapitole 2:** Použijte AZD **1.37.0 nebo novější**, nainstalujte balíček s `azd ext install microsoft.foundry` a použijte Python **3.13+** a aktuální **uv** pro ukázku hosted-agenta. Její režim nasazení kódu se sestavuje vzdáleně, takže není nutné místní Docker sestavení. Požadována jsou oprávnění Foundry, dostupnost modelu v regionu a kvóta; viz [nastavení hosted-agenta](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metody instalace

### Windows

#### Možnost 1: Správce balíčků Windows (doporučeno)
```cmd
winget install microsoft.azd
```

#### Možnost 2: PowerShell instalační skript
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Manuální instalace
1. Stáhněte nejnovější vydání z [GitHubu](https://github.com/Azure/azure-dev/releases)
2. Rozbalte do `C:\Program Files\azd\`
3. Přidejte do proměnné prostředí PATH

### macOS

#### Možnost 1: Homebrew (doporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Instalační skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Manuální instalace
Stáhněte archiv pro vaši macOS architekturu z [release assets](https://github.com/Azure/azure-dev/releases), rozbalte jej a přidejte binární soubor `azd` do vašeho `PATH`.

### Linux

#### Možnost 1: Instalační skript (doporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Správci balíčků

**Manuální instalace z release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Některé Codespaces a vývojové kontejnerové prostředí již obsahují `azd`, ale měli byste to ověřit, než to předpokládáte:

```bash
azd version
```

Pokud chybí `azd`, nainstalujte ho standardním skriptem pro dané prostředí.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tento dočasný kontejner neuchovává přihlašovací stav mezi spuštěními. Pro opakovaná nasazení použijte [nastavení vývojového kontejneru](dev-containers.md); sestavení kontejneru také vyžaduje Docker daemon dostupný z kontejneru.

## ✅ Ověření instalace

Po instalaci ověřte správnou funkčnost azd:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očekávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutečné číslo verze se může lišit. Podívejte se na [vydání Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pro nejnovější verzi.

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] `azd version` zobrazí číslo verze bez chyb
- [ ] `azd --help` zobrazí dokumentaci příkazů
- [ ] `azd template list` ukáže dostupné šablony
- [ ] Můžete vytvořit testovací adresář a úspěšně spustit `azd init`

**Pokud všechny kontroly projdou, jste připraveni pokračovat na [Váš první projekt](first-project.md)!**

## Nastavení autentizace

### Doporučené nastavení pro začátečníky

Pro workflow zaměřené primárně na AZD se přihlaste pomocí `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Používejte přihlášení Azure CLI pouze pokud plánujete během kurzu sami spouštět příkazy `az`.

### Autentizace přes Azure CLI (volitelné)
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

### Který způsob přihlášení použít?

- Použijte `azd auth login` pokud následujete začátečnickou AZD cestu a hlavně spouštíte příkazy `azd`.
- Použijte také `az login` pokud chcete spouštět příkazy Azure CLI jako `az account show` nebo přímo kontrolovat zdroje.
- Pokud cvičení obsahuje příkazy jak `azd`, tak `az`, spusťte oba typy přihlášení jednou na začátku.

### Autentizace pomocí kódu zařízení
Pokud používáte počítač bez obrazovky nebo máte problémy s prohlížečem:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Pro automatizovaná prostředí:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Ověřte své kompletní nastavení

Pokud chcete rychle zkontrolovat připravenost před začátkem kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurace

### Globální konfigurace
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Proměnné prostředí
Přidejte do svého shellového profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrace s IDE

### Visual Studio Code
Nainstalujte rozšíření Azure Developer CLI:
1. Otevřete VS Code
2. Jděte na Rozšíření (Ctrl+Shift+X)
3. Vyhledejte "Azure Developer CLI"
4. Nainstalujte rozšíření

Funkce:
- IntelliSense pro azure.yaml
- Integrované příkazy terminálu
- Prohlížení šablon
- Sledování nasazení

### GitHub Codespaces
Vytvořte `.devcontainer/devcontainer.json`:
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
1. Nainstalujte Azure plugin
2. Nakonfigurujte Azure přihlašovací údaje
3. Používejte integrovaný terminál pro příkazy azd

## 🐛 Řešení problémů s instalací

### Běžné problémy

#### Zamítnutí oprávnění (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálně přidejte azd do svého PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problémy se sítí/proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Konflikty verzí
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Kde získat další pomoc
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Aktualizace azd

### Kontrola aktualizace
azd vás upozorní, když je k dispozici novější vydání, a můžete si ověřit svou aktuální verzi pomocí:
```bash
azd version
```

### Manuální aktualizace

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

## 💡 Často kladené otázky

<details>
<summary><strong>Jaký je rozdíl mezi azd a az CLI?</strong></summary>

**Azure CLI (az)**: Nástroj na nízké úrovni pro správu jednotlivých Azure zdrojů
- `az webapp create`, `az storage account create`
- Jeden zdroj najednou
- Zaměření na správu infrastruktury

**Azure Developer CLI (azd)**: Nástroj na vyšší úrovni pro kompletní nasazení aplikací
- `azd up` nasazuje celou aplikaci včetně všech prostředků
- Workflow založené na šablonách
- Zaměření na produktivitu vývojářů

**Jsou nezávislé**: azd standardně používá svou vlastní autentizaci. Azure CLI instalujte a přihlašujte se k němu pouze pro příkazy `az` nebo pokud explicitně chcete použít `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Mohu používat azd s existujícími Azure zdroji?</strong></summary>

Ano! Můžete:
1. Importovat existující zdroje do azd prostředí
2. Odkazovat na existující zdroje ve svých Bicep šablonách
3. Používat azd pro nová nasazení vedle existující infrastruktury

Podrobnosti najdete v [Konfiguračním průvodci](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Funguje azd s Azure Government nebo Azure China?</strong></summary>

Ano, nakonfigurujte cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Pokud používáte i Azure CLI, konfigurovat `az cloud set --name ...` zvlášť. Šablonové služby a dostupnost modelů se liší podle cloudu.
</details>

<details>
<summary><strong>Mohu používat azd v CI/CD pipelinech?</strong></summary>

Rozhodně! azd je navržen pro automatizaci:
- Integrace s GitHub Actions
- Podpora Azure DevOps
- Autentizace service principal
- Neinteraktivní režim

Vzory CI/CD najdete v [Průvodci nasazením](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

Azd samotné je **zcela zdarma** a open-source. Platíte pouze za:
- Azure zdroje, které nasadíte
- Náklady na spotřebu Azure (výpočet, úložiště atd.)

Použijte `azd provision --preview` k prohlížení navrhovaných zdrojů a pak odhadněte náklady pomocí [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Náhled nezahrnuje výpočty cen.
</details>

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup ke svému Azure předplatnému
2. **Vyzkoušejte první nasazení**: Následujte [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Nastavte své vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Diskuze komunity](https://github.com/Azure/azure-dev/discussions)
- [Azure podpora](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Získejte pomoc s Azure příkazy přímo ve svém editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolami:**
- **📚 Úvod do kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md) 
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Následující kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalace dokončena!** Pokračujte na [Váš první projekt](first-project.md) a začněte stavět s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->