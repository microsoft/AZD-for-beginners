# Průvodce instalací a nastavením

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Tento podrobný průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) na vašem systému. Naučíte se různé metody instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci, abyste připravili své vývojové prostředí pro nasazení na Azure.

## Cíle učení

Na konci této lekce budete schopni:
- Úspěšně nainstalovat Azure Developer CLI na váš operační systém
- Nastavit autentizaci s Azure pomocí různých metod
- Připravit své vývojové prostředí s potřebnými předpoklady
- Porozumět různým možnostem instalace a kdy je použít
- Řešit běžné problémy s instalací a nastavením

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI na vašem systému, bez ohledu na váš operační systém nebo vývojové prostředí.

## Předpoklady

Před instalací azd se ujistěte, že máte:
- **Azure předplatné** - [Vytvořte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Pro autentizaci a správu zdrojů
- **Git** - Pro klonování šablon a verzování
- **Docker** (volitelné) - Pro kontejnerové aplikace

## Metody instalace

### Windows

#### Možnost 1: PowerShell (doporučeno)
```powershell
# Spusťte jako správce nebo s vyššími oprávněními
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
1. Stáhněte si nejnovější verzi z [GitHubu](https://github.com/Azure/azure-dev/releases)
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

#### Možnost 3: Ruční instalace
```bash
# Stáhnout a nainstalovat
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnost 1: Instalační skript (doporučeno)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnost 2: Správci balíčků

**Ubuntu/Debian:**
```bash
# Přidat úložiště balíčků Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Nainstalovat azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Přidat úložiště balíčků Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je předinstalován v GitHub Codespaces. Stačí vytvořit codespace a ihned začít používat azd.

### Docker

```bash
# Spusťte azd v kontejneru
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvořte alias pro snadnější použití
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Ověření instalace

Po instalaci ověřte, že azd funguje správně:

```bash
# Zkontrolovat verzi
azd version

# Zobrazit nápovědu
azd --help

# Seznam dostupných šablon
azd template list
```

Očekávaný výstup:
```
azd version 1.5.0 (commit abc123)
```

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] `azd version` zobrazí číslo verze bez chyb
- [ ] `azd --help` zobrazí dokumentaci příkazů
- [ ] `azd template list` zobrazí dostupné šablony
- [ ] `az account show` zobrazí vaše Azure předplatné
- [ ] Můžete vytvořit testovací adresář a úspěšně spustit `azd init`

**Pokud všechny kontroly proběhnou úspěšně, můžete pokračovat na [Váš první projekt](first-project.md)!**

## Nastavení autentizace

### Autentizace pomocí Azure CLI (doporučeno)
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
Pokud pracujete na systému bez grafického rozhraní nebo máte problémy s prohlížečem:
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

# Zobrazit všechna nastavení
azd config list
```

### Proměnné prostředí
Přidejte do svého shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurace Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurace azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povolit ladicí protokolování
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
- Procházení šablon
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
1. Nainstalujte plugin Azure
2. Nakonfigurujte Azure přihlašovací údaje
3. Použijte integrovaný terminál pro příkazy azd

## 🐛 Řešení problémů s instalací

### Běžné problémy

#### Odepřený přístup (Windows)
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

#### Problémy se sítí/proxy
```bash
# Nakonfigurovat proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Přeskočit ověření SSL (nedoporučuje se pro produkci)
azd config set http.insecure true
```

#### Konflikty verzí
```bash
# Odstraňte staré instalace
# Windows: winget odinstalovat Microsoft.Azd
# macOS: brew odinstalovat azd
# Linux: sudo apt odstranit azd

# Vyčistit konfiguraci
rm -rf ~/.azd
```

### Další pomoc
```bash
# Povolit ladicí protokolování
export AZD_DEBUG=true
azd <command> --debug

# Zobrazit podrobné protokoly
azd logs

# Zkontrolovat informace o systému
azd info
```

## Aktualizace azd

### Automatické aktualizace
azd vás upozorní, když jsou dostupné aktualizace:
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

**Azure CLI (az)**: Nástroj na nízké úrovni pro správu jednotlivých Azure zdrojů
- `az webapp create`, `az storage account create`
- Jeden zdroj najednou
- Zaměření na správu infrastruktury

**Azure Developer CLI (azd)**: Nástroj na vysoké úrovni pro kompletní nasazení aplikací
- `azd up` nasadí celou aplikaci se všemi zdroji
- Práce na základě šablon
- Zaměření na produktivitu vývojářů

**Potřebujete oba**: azd používá az CLI pro autentizaci
</details>

<details>
<summary><strong>Mohu používat azd s existujícími Azure zdroji?</strong></summary>

Ano! Můžete:
1. Importovat existující zdroje do prostředí azd
2. Odkazovat na existující zdroje ve vašich Bicep šablonách
3. Používat azd pro nová nasazení vedle existující infrastruktury

Podrobnosti najdete v [Průvodci konfigurací](configuration.md).
</details>

<details>
<summary><strong>Funguje azd s Azure Government nebo Azure China?</strong></summary>

Ano, nakonfigurujte cloud:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure Čína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Mohu používat azd v CI/CD pipelines?</strong></summary>

Rozhodně! azd je navržen pro automatizaci:
- Integrace s GitHub Actions
- Podpora Azure DevOps
- Autentizace pomocí service principal
- Neinteraktivní režim

Podívejte se na [Průvodce nasazením](../deployment/deployment-guide.md) pro vzory CI/CD.
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

azd je **zcela zdarma** a open-source. Platíte pouze za:
- Azure zdroje, které nasadíte
- Náklady na spotřebu Azure (výpočetní výkon, úložiště atd.)

Použijte `azd provision --preview` pro odhad nákladů před nasazením.
</details>

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup ke svému Azure předplatnému
2. **Vyzkoušejte první nasazení**: Postupujte podle [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte si dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Připravte své vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problémy](https://github.com/Azure/azure-dev/issues)
- [Diskuze komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md) 
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj zaměřený na AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalace dokončena!** Pokračujte na [Váš první projekt](first-project.md) a začněte pracovat s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->