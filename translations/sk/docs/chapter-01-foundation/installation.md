# Inštalačný a Nastavovací Návod

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Nasledujúca**: [Váš prvý projekt](first-project.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexný návod vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa viacero spôsobov inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu na prípravu vášho vývojového prostredia pre nasadenia do Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Úspešne nainštalovať Azure Developer CLI na vašom operačnom systéme
- Nakonfigurovať autentifikáciu s Azure rôznymi metódami
- Nastaviť vaše vývojové prostredie s potrebnými predpokladmi
- Rozumieť rôznym možnostiam inštalácie a kedy ich používať
- Riešiť bežné problémy pri inštalácii a nastavení

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Nainštalovať azd vhodnou metódou pre vašu platformu
- Autentifikovať sa v Azure pomocou azd auth login
- Overiť inštaláciu a otestovať základné príkazy azd
- Nakonfigurovať vývojové prostredie pre optimálne používanie azd
- Samostatne vyriešiť bežné inštalačné problémy

Tento návod vám pomôže nainštalovať a nakonfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Azure predplatné** - [Vytvorte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** (voliteľné) - Pre príklady, ktoré explicitne používajú `az`; azd však autentifikuje samostatne
- **Git** - Pre klonovanie šablón a správu verzií
- **Docker** (voliteľné) - Pre kontajnerizované aplikácie

## Spôsoby inštalácie

### Windows

#### Možnosť 1: Windows Package Manager (odporúčané)
```cmd
winget install microsoft.azd
```

#### Možnosť 2: Inštalačný skript pre PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnosť 3: Chocolatey
```cmd
choco install azd
```

#### Možnosť 4: Manuálna inštalácia
1. Stiahnite si najnovšie vydanie z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbaľte do `C:\Program Files\azd\`
3. Pridajte do systémovej premennej PATH

### macOS

#### Možnosť 1: Homebrew (odporúčané)
```bash
brew tap azure/azd
brew install azd
```

#### Možnosť 2: Inštalačný skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 3: Manuálna inštalácia
Stiahnite archív pre vašu macOS architektúru z [výrobných súborov vydania](https://github.com/Azure/azure-dev/releases), rozbaľte ho a pridajte binárku `azd` do vášho `PATH`.

### Linux

#### Možnosť 1: Inštalačný skript (odporúčané)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 2: Správca balíkov

**Manuálna inštalácia z vydaných súborov:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Niektoré Codespaces a dev kontajnerové prostredia už obsahujú `azd`, ale radšej to overte, než predpokladajte:

```bash
azd version
```

Ak chýba `azd`, nainštalujte ho štandardným skriptom pre dané prostredie.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tento dočasný kontajner neukladá stav prihlásenia medzi spusteniami. Pre opakované nasadenia použite [nastavenie dev kontajnera](dev-containers.md); kontajnerové zostavovanie tiež vyžaduje prístup k Docker daemonovi z vnútra kontajnera.

## ✅ Overenie inštalácie

Po inštalácii overte, či azd funguje správne:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Očakávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutočné číslo verzie sa môže líšiť. Skontrolujte [Azure Developer CLI vydania](https://github.com/Azure/azure-dev/releases) pre najnovšiu verziu.

**✅ Kontrolný zoznam úspešnej inštalácie:**
- [ ] `azd version` zobrazuje číslo verzie bez chýb
- [ ] `azd --help` zobrazuje dokumentáciu príkazov
- [ ] `azd template list` zobrazuje dostupné šablóny
- [ ] Môžete vytvoriť testovací adresár a úspešne spustiť `azd init`

**Ak všetko prebehne úspešne, môžete pokračovať na [Váš prvý projekt](first-project.md)!**

## Nastavenie autentifikácie

### Odporúčané nastavenie pre začiatočníkov

Pre pracovné postupy s prioritou AZD sa prihláste pomocou `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Používajte prihlásenie cez Azure CLI len ak plánujete počas kurzu sami spúšťať príkazy `az`.

### Autentifikácia Azure CLI (voliteľná)
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

### Ktorý spôsob prihlásenia by ste mali použiť?

- Použite `azd auth login`, ak nasledujete začiatočnícku cestu AZD a väčšinou spúšťate `azd` príkazy.
- Používajte aj `az login`, keď chcete spúšťať príkazy Azure CLI ako `az account show` alebo priamo skúmať zdroje.
- Ak cvičenie zahŕňa oba príkazy `azd` a `az`, spustite obidva príkazy na prihlásenie na začiatku.

### Autentifikácia cez kód zariadenia
Ak používate bezhlavý systém alebo máte problémy s prehliadačom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Pre automatizované prostredia:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Overenie úplného nastavenia

Ak chcete rýchlu kontrolu pripravenosti pred začatím Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurácia

### Globálna konfigurácia
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Premenné prostredia
Pridajte do svojho profilového skriptu shellu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrácia IDE

### Visual Studio Code
Nainštalujte rozšírenie Azure Developer CLI:
1. Otvorte VS Code
2. Prejdite na Rozšírenia (Ctrl+Shift+X)
3. Vyhľadajte "Azure Developer CLI"
4. Nainštalujte rozšírenie

Funkcie:
- IntelliSense pre azure.yaml
- Integrované príkazy v termináli
- Prehliadanie šablón
- Monitorovanie nasadenia

### GitHub Codespaces
Vytvorte `.devcontainer/devcontainer.json`:
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
1. Nainštalujte Azure plugin
2. Nakonfigurujte Azure poverenia
3. Používajte integrovaný terminál pre azd príkazy

## 🐛 Riešenie problémov s inštaláciou

### Bežné problémy

#### Prístup zamietnutý (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálne pridajte azd do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problémy s sieťou/proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Konflikty verzií
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Ako získať viac pomoci
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Aktualizácia azd

### Kontrola aktualizácie
azd upozorní, keď je dostupné novšie vydanie, a môžete si overiť aktuálnu verziu pomocou:
```bash
azd version
```

### Manuálne aktualizácie

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
<summary><strong>Aký je rozdiel medzi azd a az CLI?</strong></summary>

**Azure CLI (az)**: Nízkoúrovňový nástroj na správu jednotlivých Azure zdrojov
- `az webapp create`, `az storage account create`
- Jeden zdroj naraz
- Zameranie na správu infraštruktúry

**Azure Developer CLI (azd)**: Vysokoúrovňový nástroj na kompletné nasadenie aplikácií
- `azd up` nasadzuje celú aplikáciu so všetkými zdrojmi
- Pracovné postupy založené na šablónach
- Zameranie na produktivitu vývojárov

**Sú nezávislé**: azd používa predvolene vlastnú autentifikáciu. Inštalujte a prihlasujte sa do Azure CLI len pre príkazy `az` alebo ak výslovne chcete používať `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Môžem používať azd s existujúcimi Azure zdrojmi?</strong></summary>

Áno! Môžete:
1. Importovať existujúce zdroje do azd prostredí
2. Odkazovať sa na existujúce zdroje vo vašich Bicep šablónach
3. Používať azd pre nové nasadenia vedľa existujúcej infraštruktúry

Pozrite si [Sprievodcu konfiguráciou](../chapter-03-configuration/configuration.md) pre detaily.
</details>

<details>
<summary><strong>Funguje azd s Azure Government alebo Azure China?</strong></summary>

Áno, nakonfigurujte cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Ak používate aj Azure CLI, konfigurujte `az cloud set --name ...` samostatne. Služby šablón a dostupnosť modelov sa líši podľa cloudu.
</details>

<details>
<summary><strong>Môžem používať azd v CI/CD pipeline?</strong></summary>

Určite! azd je navrhnutý pre automatizáciu:
- Integrácia s GitHub Actions
- Podpora Azure DevOps
- Autentifikácia pomocou service principal
- Neinteraktívny režim

Pozrite si [Sprievodcu nasadením](../chapter-04-infrastructure/deployment-guide.md) pre vzory CI/CD.
</details>

<details>
<summary><strong>Koľko stojí používanie azd?</strong></summary>

Samotný azd je **úplne zadarmo** a open-source. Platíte iba za:
- Azure zdroje, ktoré nasadíte
- Spotrebu Azure (výpočtový výkon, ukladanie atď.)

Použite `azd provision --preview` na kontrolu navrhovaných zdrojov a následne odhadnite ich náklady v [Azure kalkulačke cien](https://azure.microsoft.com/pricing/calculator/). Ukážka nepočítá ceny.
</details>

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k vášmu Azure predplatnému
2. **Vyskúšajte prvé nasadenie**: Postupujte podľa [Sprievodcu prvým projektom](first-project.md)
3. **Preskúmajte šablóny**: Prezrite si dostupné šablóny pomocou `azd template list`
4. **Nakonfigurujte svoje IDE**: Nastavte si vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Diskusie komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Schopnosti Azure agenta**](https://skills.sh/microsoft/github-copilot-for-azure) - Získajte priamu pomoc s Azure príkazmi vo vašom editore s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Nasledujúca**: [Váš prvý projekt](first-project.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte na [Váš prvý projekt](first-project.md) a začnite používať azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->