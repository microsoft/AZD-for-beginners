# Průvodce instalací a nastavením

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) ve vašem systému. Naučíte se více způsobů instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci, abyste připravili své vývojové prostředí pro nasazení do Azure.

## Cíle učení

Na konci této lekce budete:
- Úspěšně nainstalovat Azure Developer CLI ve vašem operačním systému
- Nastavit autentizaci s Azure pomocí několika metod
- Nastavit vývojové prostředí s nezbytnými předpoklady
- Pochopit různé možnosti instalace a kdy kterou použít
- Řešit běžné problémy s instalací a nastavením

## Očekávané výsledky

Po dokončení této lekce budete schopni:
- Nainstalovat azd pomocí vhodné metody pro vaši platformu
- Autentizovat se v Azure pomocí azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Nakonfigurovat vývojové prostředí pro optimální využití azd
- Samostatně vyřešit běžné problémy s instalací

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI ve vašem systému, bez ohledu na váš operační systém nebo vývojové prostředí.

## Požadavky

Před instalací azd se ujistěte, že máte:
- **Předplatné Azure** - [Vytvořte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - pro autentizaci a správu prostředků
- **Git** - pro klonování šablon a řízení verzí
- **Docker** (volitelně) - pro kontejnerizované aplikace

## Způsoby instalace

### Windows

#### Možnost 1: PowerShell (Doporučeno)
```powershell
# Spusťte jako správce nebo s zvýšenými oprávněními
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Ruční instalace
1. Stáhněte nejnovější vydání z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbalte do `C:\Program Files\azd\`
3. Přidejte do proměnné prostředí PATH

### macOS

#### Možnost 1: Homebrew (Doporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Instalční skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Ruční instalace
```bash
# Stáhnout a nainstalovat
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Instalční skript (Doporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Správci balíčků

**Ubuntu/Debian:**
```bash
# Přidat repozitář balíčků Microsoftu
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Nainstalovat azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Přidat repozitář balíčků Microsoftu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je předinstalován v GitHub Codespaces. Jednoduše vytvořte codespace a začněte ihned používat azd.

### Docker

```bash
# Spusťte azd v kontejneru
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvořte alias pro jednodušší použití
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Ověření instalace

Po instalaci ověřte, že azd funguje správně:

```bash
# Zkontrolovat verzi
azd version

# Zobrazit nápovědu
azd --help

# Vypsat dostupné šablony
azd template list
```

Očekávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutečné číslo verze se může lišit. Zkontrolujte [Vydání Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pro nejnovější verzi.

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] `azd version` zobrazuje číslo verze bez chyb
- [ ] `azd --help` zobrazuje dokumentaci příkazů
- [ ] `azd template list` zobrazuje dostupné šablony
- [ ] `az account show` zobrazuje vaše Azure předplatné
- [ ] Můžete vytvořit testovací adresář a úspěšně spustit `azd init`

**Pokud všechny kontroly projdou, jste připraveni přejít na [Váš první projekt](first-project.md)!**

## Nastavení autentizace

### Autentizace přes Azure CLI (Doporučeno)
```bash
# Nainstalujte Azure CLI, pokud ještě není nainstalován
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Přihlaste se do Azure
az login

# Ověřte autentizaci
az account show
```

### Autentizace pomocí kódu zařízení
Pokud jste na bezhlavém systému nebo máte problémy s prohlížečem:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pro automatizovaná prostředí:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurace

### Globální konfigurace
```bash
# Nastavit výchozí předplatné
azd config set defaults.subscription <subscription-id>

# Nastavit výchozí umístění
azd config set defaults.location eastus2

# Zobrazit veškerou konfiguraci
azd config list
```

### Proměnné prostředí
Přidejte do profilu shellu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurace Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurace azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povolit ladicí logování
```

## Integrace s IDE

### Visual Studio Code
Nainstalujte rozšíření Azure Developer CLI:
1. Otevřete VS Code
2. Přejděte na Rozšíření (Ctrl+Shift+X)
3. Vyhledejte "Azure Developer CLI"
4. Nainstalujte rozšíření

Funkce:
- IntelliSense pro azure.yaml
- Integrované příkazy v terminálu
- Prohlížení šablon
- Monitorování nasazení

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

## 🐛 Řešení potíží s instalací

### Běžné problémy

#### Odmítnutí oprávnění (Windows)
```powershell
# Spusťte PowerShell jako správce
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Ruční přidání azd do PATH:

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
# Nakonfigurujte proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Přeskočit ověřování SSL (nedoporučuje se pro produkční prostředí)
azd config set http.insecure true
```

#### Konflikty verzí
```bash
# Odstranit staré instalace
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Vyčistit konfiguraci
rm -rf ~/.azd
```

### Získání další pomoci
```bash
# Povolit ladicí logování
export AZD_DEBUG=true
azd <command> --debug

# Zobrazit aktuální konfiguraci
azd config list

# Zobrazit aktuální stav nasazení
azd show
```

## Aktualizace azd

### Automatické aktualizace
azd vám oznámí, když budou k dispozici aktualizace:
```bash
azd version --check-for-updates
```

### Ruční aktualizace

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

## 💡 Často kladené dotazy

<details>
<summary><strong>Jaký je rozdíl mezi azd a az CLI?</strong></summary>

**Azure CLI (az)**: Nástroj na nízké úrovni pro správu jednotlivých prostředků Azure
- `az webapp create`, `az storage account create`
- Jeden prostředek najednou
- Zaměření na správu infrastruktury

**Azure Developer CLI (azd)**: Nástroj vyšší úrovně pro kompletní nasazení aplikací
- `azd up` nasadí celou aplikaci se všemi prostředky
- Pracovní postupy založené na šablonách
- Zaměření na produktivitu vývojáře

**Potřebujete obojí**: azd používá az CLI pro autentizaci
</details>

<details>
<summary><strong>Mohu používat azd s existujícími prostředky Azure?</strong></summary>

Ano! Můžete:
1. Importovat existující prostředky do prostředí azd
2. Odkazovat na existující prostředky ve vašich Bicep šablonách
3. Používat azd pro nová nasazení vedle existující infrastruktury

Podrobnosti najdete v [Průvodci konfigurací](configuration.md).
</details>

<details>
<summary><strong>Funguje azd s Azure Government nebo Azure China?</strong></summary>

Ano, nakonfigurujte cloud:
```bash
# Azure pro vládu
az cloud set --name AzureUSGovernment
az login

# Azure Čína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Mohu použít azd v CI/CD pipeline?</strong></summary>

Rozhodně! azd je navrženo pro automatizaci:
- Integrace s GitHub Actions
- Podpora Azure DevOps
- Autentizace pomocí service principal
- Neinteraktivní režim

Viz [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) pro vzory CI/CD.
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

azd je **zcela zdarma** a open-source. Platíte jen za:
- Azure prostředky, které nasadíte
- Spotřebu Azure (výpočet, úložiště atd.)

Použijte `azd provision --preview` k odhadu nákladů před nasazením.
</details>

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup k vašemu předplatnému Azure
2. **Vyzkoušejte své první nasazení**: Postupujte podle [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Procházejte dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Nastavte své vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Komunitní diskuse](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Dovednosti Azure Agenta**](https://skills.sh/microsoft/github-copilot-for-azure) - Získejte vedení příkazů Azure přímo ve svém editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md) 
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalace dokončena!** Pokračujte na [Váš první projekt](first-project.md) a začněte vytvářet s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->