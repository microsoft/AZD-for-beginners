# Průvodce instalací a nastavením

**Navigace kapitolami:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Následující kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) na vašem systému. Naučíte se různé způsoby instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci pro přípravu vašeho vývojového prostředí na nasazení do Azure.

## Výukové cíle

Na konci této lekce budete schopni:
- Úspěšně nainstalovat Azure Developer CLI na váš operační systém
- Nakonfigurovat autentizaci s Azure různými metodami
- Nastavit vývojové prostředí s potřebnými předpoklady
- Porozumět různým možnostem instalace a kdy kterou použít
- Vyřešit běžné problémy při instalaci a nastavení

## Výsledky učení

Po dokončení této lekce budete schopni:
- Nainstalovat azd pomocí vhodné metody pro vaši platformu
- Přihlásit se k Azure pomocí azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Nakonfigurovat vývojové prostředí pro optimální použití azd
- Samostatně řešit běžné problémy s instalací

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI na vašem systému, bez ohledu na operační systém nebo vývojové prostředí.

## Požadavky

Před instalací azd si zajistěte:
- **Azure předplatné** - [Vytvořit bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** (volitelné) - Pro příklady, které explicitně spouštějí `az`; azd se však autentizuje nezávisle
- **Git** - Pro klonování šablon a správu verzí
- **Docker** (volitelné) - Pro kontejnerizované aplikace

## Způsoby instalace

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
1. Stáhněte poslední verzi z [GitHubu](https://github.com/Azure/azure-dev/releases)
2. Rozbalte do `C:\Program Files\azd\`
3. Přidejte do systémové proměnné PATH

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
Stáhněte archiv pro vaši macOS architekturu z [release assets](https://github.com/Azure/azure-dev/releases), rozbalte ho a přidejte binární soubor `azd` do svého `PATH`.

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

Některé Codespaces a vývojová kontejnerová prostředí již obsahují `azd`, ale je dobré si to ověřit, než to předpokládat:

```bash
azd version
```

Pokud `azd` chybí, nainstalujte ho pomocí standardního instalačního skriptu pro dané prostředí.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tento dočasný kontejner neukládá přihlášení mezi běhy. Pro opakovaná nasazení použijte [nastavení dev kontejneru](dev-containers.md); buildy kontejnerů také vyžadují přístup k Docker daemonu z vnitřku kontejneru.

## ✅ Ověření instalace

Po instalaci ověřte, že azd funguje správně:

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

**Poznámka**: Skutečné číslo verze se může lišit. Nejnovější verzi zkontrolujte na [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases).

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] `azd version` zobrazí číslo verze bez chyb
- [ ] `azd --help` zobrazí dokumentaci příkazů
- [ ] `azd template list` zobrazí dostupné šablony
- [ ] Dokážete úspěšně vytvořit testovací adresář a spustit `azd init`

**Pokud prošly všechny kontroly, jste připraveni pokračovat do [Vašeho prvního projektu](first-project.md)!**

## Nastavení autentizace

### Doporučené nastavení pro začátečníky

Pro pracovní postupy orientované na AZD se přihlaste pomocí `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Použijte přihlášení přes Azure CLI pouze tehdy, pokud plánujete během kurzu sami spouštět `az` příkazy.

### Autentizace pomocí Azure CLI (volitelně)
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

### Který způsob přihlášení byste měli použít?

- Použijte `azd auth login` pokud sledujete začátečnickou cestu AZD a především spouštíte příkazy `azd`.
- Použijte také `az login` pokud chcete spouštět Azure CLI příkazy, jako je `az account show`, nebo přímo kontrolovat zdroje.
- Pokud cvičení zahrnuje příkazy `azd` i `az`, spusťte oba přihlašovací příkazy jednou na začátku.

### Autentizace pomocí kódu zařízení
Pokud jste na systém bez grafického rozhraní nebo máte problémy s prohlížečem:
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

### Ověření kompletního nastavení

Pokud chcete rychle prověřit připravenost před začátkem Kapitoly 1:

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
Přidejte do svého shell profilu (`.bashrc`, `.zshrc`, `.profile`):
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
2. Přejděte do rozšíření (Ctrl+Shift+X)
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

#### Odepření přístupu (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálně přidejte azd do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Síťové/proxy problémy
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

### Jak získat další pomoc
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
azd vás upozorní, když je k dispozici novější verze, a můžete si ověřit svou aktuální sestavu pomocí:
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
- `azd up` nasazuje celou aplikaci včetně všech zdrojů
- Práce se šablonami
- Zaměření na produktivitu vývojáře

**Jsou nezávislé**: azd používá vlastí autentizaci ve výchozím nastavení. Azure CLI instalujte a přihlašujte pouze pro příkazy `az`, nebo explicitně zapněte `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Mohu použít azd s existujícími Azure zdroji?</strong></summary>

Ano! Můžete:
1. Importovat existující zdroje do prostředí azd
2. Odkazovat na existující zdroje ve vašich Bicep šablonách
3. Použít azd pro nová nasazení vedle existující infrastruktury

Podrobnosti najdete v [konfiguračním průvodci](../chapter-03-configuration/configuration.md).
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

Pokud také používáte Azure CLI, nakonfigurujte `az cloud set --name ...` zvlášť. Služby šablon a dostupnost modelů se liší podle cloudu.
</details>

<details>
<summary><strong>Mohu použít azd v CI/CD pipelines?</strong></summary>

Rozhodně! azd je navrženo pro automatizaci:
- Integrace s GitHub Actions
- Podpora Azure DevOps
- Autentizace pomocí service principal
- Neinteraktivní režim

Vzorové postupy naleznete v [průvodci nasazením](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

azd samotné je **zcela zdarma** a otevřený software. Platíte pouze za:
- Azure zdroje, které nasadíte
- Náklady na spotřebu Azure (výpočet, úložiště atd.)

Použijte `azd provision --preview` pro kontrolu navrhovaných zdrojů a odhad nákladů pomocí [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview nepočítá ceny.
</details>

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup k vašemu Azure předplatnému
2. **Vyzkoušejte první nasazení**: Následujte [průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Připravte si vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Diskuse komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Získejte pokyny pro příkazy Azure přímo ve svém editoru s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolami:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md) 
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Následující kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalace dokončena!** Pokračujte do [Vašeho prvního projektu](first-project.md), abyste začali stavět s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->