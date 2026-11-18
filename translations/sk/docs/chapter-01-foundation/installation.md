# Príručka inštalácie a nastavenia

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Táto komplexná príručka vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa viacero metód inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu na prípravu vývojového prostredia pre Azure nasadenia.

## Ciele učenia

Na konci tejto lekcie budete schopní:
- Úspešne nainštalovať Azure Developer CLI na váš operačný systém
- Konfigurovať autentifikáciu s Azure pomocou viacerých metód
- Nastaviť vývojové prostredie s potrebnými predpokladmi
- Pochopiť rôzne možnosti inštalácie a kedy ktorú použiť
- Riešiť bežné problémy s inštaláciou a nastavením

## Výstupy učenia

Po absolvovaní tejto lekcie budete schopní:
- Inštalovať azd pomocou vhodnej metódy pre vašu platformu
- Autentifikovať sa s Azure pomocou azd auth login
- Overiť inštaláciu a otestovať základné príkazy azd
- Konfigurovať vývojové prostredie pre optimálne používanie azd
- Samostatne riešiť bežné problémy s inštaláciou

Táto príručka vám pomôže nainštalovať a nakonfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Azure predplatné** - [Vytvorte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** (voliteľné) - Pre príklady, ktoré explicitne používajú `az`; azd sa autentifikuje samostatne
- **Git** - Pre klonovanie šablón a správu verzií
- **Docker** (voliteľné) - Pre kontajnerizované aplikácie

**Cesta Foundry GA v kapitole 2:** Použite AZD **1.37.0 alebo vyšší**, nainštalujte balík s `azd ext install microsoft.foundry`, používajte Python **3.13+** a aktuálny **uv** pre vzorový hosťovaný agent. Režim nasadzovania kódu sa vykonáva vzdialene, takže lokálna Docker build nie je potrebná. Stále sú potrebné Foundry povolenia, dostupnosť modelu podľa regiónu a kvóta; pozrite si [nastavenie hosťovaného agenta](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Spôsoby inštalácie

### Windows

#### Možnosť 1: Windows Package Manager (odporúčané)
```cmd
winget install microsoft.azd
```

#### Možnosť 2: PowerShell Inštalačný skript
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
Stiahnite si archív pre vašu macOS architektúru z [release assets](https://github.com/Azure/azure-dev/releases), rozbaľte ho a pridajte binárku `azd` do vášho `PATH`.

### Linux

#### Možnosť 1: Inštalačný skript (odporúčané)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 2: Správca balíkov

**Manuálna inštalácia z release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Niektoré Codespaces a prostredia dev kontajnerov už obsahujú `azd`, ale je dobré si to overiť namiesto predpokladania:

```bash
azd version
```

Ak `azd` chýba, nainštalujte ho štandardným skriptom pre dané prostredie.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Tento efemérny kontajner si neuchováva prihlásenie medzi spusteniami. Pre opakované nasadenia používajte [nastavenie dev kontajnera](dev-containers.md); na buildy kontajnera je tiež potrebný Docker démon prístupný z kontajnera.

## ✅ Overenie inštalácie

Po inštalácii overte, že azd správne funguje:

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
- [ ] `azd --help` zobrazuje dokumentáciu príkazu
- [ ] `azd template list` zobrazuje dostupné šablóny
- [ ] Môžete vytvoriť testovací adresár a úspešne spustiť `azd init`

**Ak všetky kontroly prejdú, ste pripravení pokračovať do [Vášho prvého projektu](first-project.md)!**

## Nastavenie autentifikácie

### Odporúčané nastavenie pre začiatočníkov

Pre pracovné postupy založené na AZD sa prihláste pomocou `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Používajte prihlásenie Azure CLI iba keď počas kurzu plánujete sami spúšťať príkazy `az`.

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

### Ktorý spôsob prihlasovania používať?

- Použite `azd auth login`, ak nasledujete začiatočnícku cestu AZD a väčšinou spúšťate príkazy `azd`.
- Použite aj `az login`, keď chcete spúšťať Azure CLI príkazy ako napríklad `az account show` alebo priamo kontrolovať zdroje.
- Ak cvičenie obsahuje príkazy `azd` aj `az`, spustite oba príkazy na prihlásenie raz na začiatku.

### Autentifikácia pomocou zariadenia (Device Code Authentication)
Ak používate systém bez prehliadača alebo máte problémy s prehliadačom:
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

Ak chcete rýchlu kontrolu pripravenosti pred začiatkom Kapitoly 1:

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
Pridajte do vášho shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrácia do IDE

### Visual Studio Code
Nainštalujte rozšírenie Azure Developer CLI:
1. Otvorte VS Code
2. Prejdite na Rozšírenia (Ctrl+Shift+X)
3. Vyhľadajte "Azure Developer CLI"
4. Nainštalujte rozšírenie

Funkcie:
- IntelliSense pre azure.yaml
- Integrované terminálové príkazy
- Prehliadanie šablón
- Monitorovanie nasadení

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

#### Odmietnutý prístup (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problémy s PATH
Manuálne pridajte azd do vašej PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Sieťové / Proxy problémy
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

### Získanie ďalšej pomoci
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
azd varuje, keď je k dispozícii novšie vydanie, a môžete skontrolovať vašu aktuálnu zostavu pomocou:
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

**Azure Developer CLI (azd)**: Vysokoúrovňový nástroj na kompletné nasadenia aplikácií
- `azd up` nasadzuje celú aplikáciu so všetkými zdrojmi
- Pracovné postupy založené na šablónach
- Zameranie na produktivitu vývojára

**Sú nezávislé**: azd štandardne používa vlastnú autentifikáciu. Azure CLI inštalujte a prihlasujte sa k nemu iba ak používate príkazy `az`, alebo ak explicitne chcete použiť `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Môžem použiť azd s existujúcimi Azure zdrojmi?</strong></summary>

Áno! Môžete:
1. Importovať existujúce zdroje do azd prostredí
2. Odkazovať na existujúce zdroje vo vašich Bicep šablónach
3. Používať azd pre nové nasadenia vedľa existujúcej infraštruktúry

Pre podrobnosti pozrite [Konfiguračnú príručku](../chapter-03-configuration/configuration.md).
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

Ak používate aj Azure CLI, nakonfigurujte `az cloud set --name ...` samostatne. Služby šablón a dostupnosť modelov sa líšia podľa cloudu.
</details>

<details>
<summary><strong>Môžem použiť azd v CI/CD pipeline?</strong></summary>

Určite! azd je navrhnuté pre automatizáciu:
- Integrácia s GitHub Actions
- Podpora Azure DevOps
- Autentifikácia pomocou service principal
- Režim bez interakcie

Pozrite si [Príručku nasadenia](../chapter-04-infrastructure/deployment-guide.md) pre vzory CI/CD.
</details>

<details>
<summary><strong>Aké sú náklady na používanie azd?</strong></summary>

Samotný azd je **úplne zadarmo** a open-source. Platíte len za:
- Azure zdroje, ktoré nasadíte
- Spotrebu Azure (výpočty, ukladanie atď.)

Použite `azd provision --preview` na kontrolu navrhovaných zdrojov, potom odhadnite ich náklady pomocou [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview ceny nevyčíta.
</details>

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k Azure predplatnému
2. **Vyskúšajte svoje prvé nasadenie**: Postupujte podľa [Príručky prvého projektu](first-project.md)
3. **Prezrite si šablóny**: Prezrite dostupné šablóny pomocou `azd template list`
4. **Nakonfigurujte IDE**: Nastavte si vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Diskusie komunity](https://github.com/Azure/azure-dev/discussions)
- [Azure podpora](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Získajte pokyny k Azure príkazom priamo vo vašom editore s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md) 
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte do [Vášho prvého projektu](first-project.md), aby ste začali vytvárať pomocou azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->