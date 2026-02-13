# Instalace a průvodce nastavením

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) na vašem systému. Naučíte se několik metod instalace pro různé operační systémy, nastavení ověřování a počáteční konfiguraci pro připravení vývojového prostředí pro nasazení na Azure.

## Cíle učení

Na konci této lekce budete:
- Úspěšně nainstalovat Azure Developer CLI na vašem operačním systému
- Konfigurovat ověřování s Azure pomocí několika metod
- Nastavit vývojové prostředí s nezbytnými předpoklady
- Rozumět různým možnostem instalace a kdy kterou použít
- Řešit běžné problémy s instalací a nastavením

## Výstupy učení

Po dokončení této lekce budete schopni:
- Nainstalovat azd pomocí vhodné metody pro vaši platformu
- Ověřit se v Azure pomocí azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Konfigurovat vývojové prostředí pro optimální používání azd
- Samostatně vyřešit běžné instalační problémy

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI na vašem systému, bez ohledu na váš operační systém nebo vývojové prostředí.

## Požadavky

Před instalací azd se ujistěte, že máte:
- **Azure subscription** - [Vytvořte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - pro ověřování a správu prostředků
- **Git** - pro klonování šablon a správu verzí
- **Docker** (volitelně) - pro kontejnerizované aplikace

## Způsoby instalace

### Windows

#### Možnost 1: PowerShell (Doporučeno)
```powershell
# Spusťte jako správce nebo s povýšenými oprávněními
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
1. Stáhněte si nejnovější vydání z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbalte do `C:\Program Files\azd\`
3. Přidejte do proměnné PATH

### macOS

#### Možnost 1: Homebrew (Doporučeno)
```bash
brew tap azure/azd
brew install azd
```

#### Možnost 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 3: Ruční instalace
```bash
# Stáhnout a nainstalovat
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Install Script (Doporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Package Managers

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

azd je předinstalovaný v GitHub Codespaces. Jednoduše vytvořte codespace a začněte azd používat okamžitě.

### Docker

```bash
# Spusťte azd v kontejneru
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvořte alias pro snazší použití
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

**Poznámka**: Skutečné číslo verze se může lišit. Podívejte se na [Vydání Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pro nejnovější verzi.

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] `azd version` zobrazuje číslo verze bez chyb
- [ ] `azd --help` zobrazuje dokumentaci příkazů
- [ ] `azd template list` zobrazuje dostupné šablony
- [ ] `az account show` zobrazuje vaše Azure předplatné
- [ ] Můžete vytvořit testovací adresář a úspěšně spustit `azd init`

**Pokud všechny kontroly projdou, jste připraveni pokračovat na [Váš první projekt](first-project.md)!**

## Nastavení ověřování

### Ověřování pomocí Azure CLI (Doporučeno)
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

### Ověřování pomocí kódu zařízení
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

# Zobrazit celou konfiguraci
azd config list
```

### Proměnné prostředí
Přidejte do profilového souboru shellu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurace Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurace azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povolit protokolování pro ladění
```

## Integrace IDE

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

#### Oprávnění odepřeno (Windows)
```powershell
# Spusťte PowerShell jako správce
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s proměnnou PATH
Ručně přidejte azd do proměnné PATH:

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
# Nastavit proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Přeskočit ověřování SSL (nedoporučuje se pro produkční prostředí)
azd config set http.insecure true
```

#### Konflikty verzí
```bash
# Odstraňte staré instalace
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Vyčistěte konfiguraci
rm -rf ~/.azd
```

### Kde získat další pomoc
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
azd vás upozorní, když budou k dispozici aktualizace:
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

## 💡 Často kladené otázky

<details>
<summary><strong>Jaký je rozdíl mezi azd a az CLI?</strong></summary>

**Azure CLI (az)**: Nástroj nízké úrovně pro správu jednotlivých Azure prostředků
- `az webapp create`, `az storage account create`
- Jeden prostředek najednou
- Zaměření na správu infrastruktury

**Azure Developer CLI (azd)**: Nástroj vysoké úrovně pro kompletní nasazení aplikací
- `azd up` nasadí celou aplikaci se všemi prostředky
- Pracovní postupy založené na šablonách
- Zaměření na produktivitu vývojáře

**Potřebujete oba**: azd používá az CLI pro ověřování
</details>

<details>
<summary><strong>Mohu použít azd s existujícími Azure prostředky?</strong></summary>

Ano! Můžete:
1. Importovat existující prostředky do azd prostředí
2. Odkazovat na existující prostředky ve vašich Bicep šablonách
3. Používat azd pro nová nasazení vedle stávající infrastruktury

Viz [Průvodce konfigurací](configuration.md) pro podrobnosti.
</details>

<details>
<summary><strong>Funguje azd s Azure Government nebo Azure China?</strong></summary>

Ano, nakonfigurujte cloud:
```bash
# Azure pro vládní instituce
az cloud set --name AzureUSGovernment
az login

# Azure Čína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Mohu používat azd v CI/CD pipelinech?</strong></summary>

Rozhodně! azd je navržen pro automatizaci:
- Integrace s GitHub Actions
- Podpora Azure DevOps
- Ověřování pomocí service principal
- Režim bez interakce

Viz [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) pro vzory CI/CD.
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

azd jako takový je **zcela zdarma** a open-source. Platíte pouze za:
- Azure prostředky, které nasadíte
- Spotřebu Azure (výpočet, úložiště atd.)

Použijte `azd provision --preview` pro odhad nákladů před nasazením.
</details>

## Další kroky

1. **Dokončete ověřování**: Ujistěte se, že máte přístup k vašemu Azure předplatnému
2. **Vyzkoušejte první nasazení**: Postupujte podle [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte si dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Nastavte vaše vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Komunitní diskuse](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

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
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby automatického překladu založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho zdrojovém jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Za jakákoli nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu neneseme odpovědnost.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->