# Průvodce instalací a nastavením

**Navigace kapitolami:**
- **📚 Domů kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexní průvodce vás provede instalací a konfigurací Azure Developer CLI (azd) na vašem systému. Naučíte se různé způsoby instalace pro různé operační systémy, nastavení autentizace a počáteční konfiguraci pro přípravu vývojového prostředí pro nasazení na Azure.

## Cíle učení

Do konce této lekce budete:
- Úspěšně instalovat Azure Developer CLI na váš operační systém
- Konfigurovat autentizaci v Azure různými způsoby
- Nastavit vývojové prostředí s nezbytnými předpoklady
- Rozumět různým možnostem instalace a kdy je použít
- Řešit běžné problémy s instalací a nastavením

## Výsledky učení

Po dokončení této lekce budete schopni:
- Nainstalovat azd vhodnou metodou pro vaši platformu
- Autentizovat se v Azure pomocí příkazu azd auth login
- Ověřit instalaci a otestovat základní příkazy azd
- Konfigurovat vývojové prostředí pro optimální použití azd
- Samostatně řešit běžné problémy s instalací

Tento průvodce vám pomůže nainstalovat a nakonfigurovat Azure Developer CLI bez ohledu na váš operační systém nebo vývojové prostředí.

## Požadavky

Před instalací azd se ujistěte, že máte:
- **Azure předplatné** - [Vytvořte bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Pro autentizaci a správu zdrojů
- **Git** - Pro klonování šablon a správu verzí
- **Docker** (volitelné) - Pro kontejnerizované aplikace

## Způsoby instalace

### Windows

#### Možnost 1: Windows Package Manager (doporučeno)
```cmd
winget install microsoft.azd
```

#### Možnost 2: PowerShell instalační skript
```powershell
# Užitečné, když není k dispozici winget
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnost 3: Chocolatey
```cmd
choco install azd
```

#### Možnost 4: Manuální instalace
1. Stáhněte si nejnovější verzi z [GitHub](https://github.com/Azure/azure-dev/releases)
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

**Manuální instalace z vydaných souborů:**
```bash
# Stáhněte si nejnovější archiv pro vaši Linuxovou architekturu z:
# https://github.com/Azure/azure-dev/releases
# Poté jej rozbalte a přidejte spustitelný soubor azd do vaší cesty PATH.
```

### GitHub Codespaces

Některé Codespaces a vývojová kontejnerová prostředí již obsahují `azd`, ale je lepší to ověřit než předpokládat:

```bash
azd version
```

Pokud `azd` chybí, nainstalujte jej standardním skriptem pro dané prostředí.

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

# Vypsat dostupné šablony
azd template list
```

Očekávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutečné číslo verze se může lišit. Sledujte [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pro nejnovější verzi.

**✅ Kontrolní seznam úspěšné instalace:**
- [ ] příkaz `azd version` zobrazí číslo verze bez chyb
- [ ] příkaz `azd --help` zobrazí dokumentaci příkazů
- [ ] příkaz `azd template list` zobrazí dostupné šablony
- [ ] můžete vytvořit testovací adresář a úspěšně spustit `azd init`

**Pokud všechny kontroly projdou, můžete pokračovat do [Vašeho prvního projektu](first-project.md)!**

## Nastavení autentizace

### Doporučené nastavení pro začátečníky

Pro workflow orientované na AZD se přihlaste příkazem `azd auth login`.

```bash
# Požadováno pro příkazy AZD jako azd up
azd auth login

# Ověřit stav autentizace AZD
azd auth login --check-status
```

Používejte přihlášení přes Azure CLI jen pokud plánujete během kurzu přímo spouštět příkazy `az`.

### Autentizace pomocí Azure CLI (volitelné)
```bash
# Nainstalujte Azure CLI, pokud není již nainstalován
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: podívejte se na dokumentaci instalace Azure CLI pro vaši distribuci

# Přihlaste se do Azure
az login

# Ověřte autentizaci
az account show
```

### Který způsob přihlášení použít?

- Použijte `azd auth login`, pokud následujete AZD začátečnickou cestu a většinou spouštíte příkazy `azd`.
- Použijte také `az login`, pokud chcete spouštět přímé příkazy Azure CLI jako `az account show` nebo prohlížet zdroje přímo.
- Pokud cvičení obsahuje oba typy příkazů, spusťte oba příkazy přihlášení na začátku.

### Autentizace pomocí kódu zařízení
Pokud jste na bezhlavém systému nebo máte problémy s prohlížečem:
```bash
azd auth login --use-device-code
```

### Servisní principál (CI/CD)
Pro automatizovaná prostředí:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
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
# Nastavit výchozí předplatné
azd config set defaults.subscription <subscription-id>

# Nastavit výchozí lokaci
azd config set defaults.location eastus2

# Zobrazit veškeré nastavení
azd config show
```

### Proměnné prostředí
Přidejte do konfiguračního souboru vašeho shellu (`.bashrc`, `.zshrc`, `.profile`):
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
Nainstalujte si rozšíření Azure Developer CLI:
1. Otevřete VS Code
2. Přejděte do rozšíření (Ctrl+Shift+X)
3. Vyhledejte "Azure Developer CLI"
4. Nainstalujte rozšíření

Funkce:
- IntelliSense pro soubor azure.yaml
- Integrované terminálové příkazy
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

## 🐛 Řešení problémů s instalací

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

#### Problémy sítě/proxy
```bash
# Nakonfigurujte proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Přeskočit ověření SSL (nedoporučuje se pro produkci)
azd config set http.insecure true
```

#### Konflikty verzí
```bash
# Odeberte staré instalace
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: před přeinstalací odeberte předchozí binární soubor azd nebo symlink

# Vyčistěte konfiguraci
rm -rf ~/.azd
```

### Kde získat další pomoc
```bash
# Povolit ladicí protokolování
export AZD_DEBUG=true
azd <command> --debug

# Zobrazit aktuální konfiguraci
azd config show

# Zobrazit aktuální stav nasazení
azd show
```

## Aktualizace azd

### Kontrola aktualizace
azd vás upozorní, pokud je k dispozici novější verze, a své aktuální sestavení zkontrolujete pomocí:
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

**Azure CLI (az)**: Nástroj nízké úrovně pro správu jednotlivých Azure zdrojů
- `az webapp create`, `az storage account create`
- Po jednom zdroji najednou
- Zaměření na správu infrastruktury

**Azure Developer CLI (azd)**: Nástroj vysoké úrovně pro kompletní nasazení aplikací
- `azd up` nasazuje celou aplikaci se všemi zdroji
- Pracovní postupy založené na šablonách
- Zaměření na produktivitu vývojáře

**Potřebujete oba**: azd používá az CLI pro autentizaci
</details>

<details>
<summary><strong>Mohu používat azd s existujícími zdroji Azure?</strong></summary>

Ano! Můžete:
1. Importovat existující zdroje do prostředí azd
2. Odkazovat na existující zdroje ve vašich Bicep šablonách
3. Používat azd pro nové nasazení spolu se stávající infrastrukturou

Podrobnosti najdete v [Průvodci konfigurací](configuration.md).
</details>

<details>
<summary><strong>Funguje azd s Azure Government nebo Azure China?</strong></summary>

Ano, nakonfigurujte cloud:
```bash
# Vládní Azure
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
- Autentizace servisním účtem
- Režim bez interakce

Podívejte se na [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) pro CI/CD vzory.
</details>

<details>
<summary><strong>Kolik stojí používání azd?</strong></summary>

azd je **zcela zdarma** a open-source. Platíte jen za:
- Azure zdroje, které nasadíte
- Služby Azure (výpočet, úložiště, atd.)

Použijte `azd provision --preview` k odhadu nákladů před nasazením.
</details>

## Další kroky

1. **Dokončete autentizaci**: Ujistěte se, že máte přístup k Azure předplatnému
2. **Vyzkoušejte první nasazení**: Postupujte podle [Průvodce prvním projektem](first-project.md)
3. **Prozkoumejte šablony**: Prohlédněte dostupné šablony pomocí `azd template list`
4. **Nakonfigurujte své IDE**: Připravte si své vývojové prostředí

## Podpora

Pokud narazíte na problémy:
- [Oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásit problém](https://github.com/Azure/azure-dev/issues)
- [Diskuse komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Získejte pomoc s Azure příkazy přímo ve vašem editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolami:**
- **📚 Domů kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Základy AZD](azd-basics.md)
- **➡️ Další**: [Váš první projekt](first-project.md)
- **🚀 Další kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalace dokončena!** Pokračujte do [Vašeho prvního projektu](first-project.md) a začněte pracovat s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, uvědomte si prosím, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->