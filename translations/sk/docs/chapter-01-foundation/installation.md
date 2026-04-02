# Príručka inštalácie a nastavenia

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základné info o AZD](azd-basics.md)
- **➡️ Nasledujúca**: [Váš prvý projekt](first-project.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj s AI na prvom mieste](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Táto komplexná príručka vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa viaceré metódy inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu na prípravu vývojového prostredia pre Azure nasadenia.

## Ciele učenia

Na konci tejto lekcie budete:
- Úspešne inštalovať Azure Developer CLI na váš operačný systém
- Konfigurovať autentifikáciu s Azure pomocou viacerých metód
- Nastaviť vývojové prostredie s potrebnými predpokladmi
- Pochopiť rôzne možnosti inštalácie a kedy ich použiť
- Riešiť bežné problémy s inštaláciou a nastavením

## Výstupy učenia

Po dokončení tejto lekcie budete schopní:
- Inštalovať azd vhodnou metódou pre vašu platformu
- Autentifikovať sa v Azure pomocou príkazu azd auth login
- Overiť inštaláciu a otestovať základné príkazy azd
- Nakonfigurovať vaše vývojové prostredie pre optimálne používanie azd
- Samostatne riešiť bežné problémy s inštaláciou

Táto príručka vám pomôže nainštalovať a nakonfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na váš operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Predplatné Azure** - [Založte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - pre autentifikáciu a správu zdrojov
- **Git** - na klonovanie šablón a správu verzií
- **Docker** (voliteľné) - pre kontajnerizované aplikácie

## Spôsoby inštalácie

### Windows

#### Možnosť 1: Windows Package Manager (Odporúčané)
```cmd
winget install microsoft.azd
```

#### Možnosť 2: PowerShell inštalačný skript
```powershell
# Užitočné, keď winget nie je dostupný
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnosť 3: Chocolatey
```cmd
choco install azd
```

#### Možnosť 4: Manuálna inštalácia
1. Stiahnite si najnovšiu verziu z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbaľte do `C:\Program Files\azd\`
3. Pridajte do systémovej premennej PATH

### macOS

#### Možnosť 1: Homebrew (Odporúčané)
```bash
brew tap azure/azd
brew install azd
```

#### Možnosť 2: Inštalačný skript
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 3: Manuálna inštalácia
```bash
# Stiahnite a nainštalujte
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnosť 1: Inštalačný skript (Odporúčané)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 2: Správcovia balíkov

**Manuálna inštalácia z releasových súborov:**
```bash
# Stiahnite si najnovší archív pre vašu Linuxovú architektúru z:
# https://github.com/Azure/azure-dev/releases
# Potom ho rozbaľte a pridajte binárny súbor azd do vašej PATH.
```

### GitHub Codespaces

Niektoré Codespaces a dev container prostredia už obsahujú `azd`, no mali by ste to overiť, nie predpokladať:

```bash
azd version
```

Ak chýba `azd`, nainštalujte ho štandardným skriptom pre dané prostredie.

### Docker

```bash
# Spustiť azd v kontajneri
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvoriť alias pre jednoduchšie použitie
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Overenie inštalácie

Po inštalácii overte, či azd funguje správne:

```bash
# Skontrolovať verziu
azd version

# Zobraziť pomoc
azd --help

# Zoznam dostupných šablón
azd template list
```

Očakávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutočné číslo verzie sa bude líšiť. Skontrolujte [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pre najnovšiu verziu.

**✅ Kontrolný zoznam úspešnej inštalácie:**
- [ ] `azd version` zobrazuje číslo verzie bez chýb
- [ ] `azd --help` zobrazuje dokumentáciu príkazov
- [ ] `azd template list` zobrazuje dostupné šablóny
- [ ] Viete vytvoriť testovací adresár a úspešne spustiť `azd init`

**Ak všetky kontroly prejdú, môžete pokračovať do [Vášho prvého projektu](first-project.md)!**

## Nastavenie autentifikácie

### Odporúčané nastavenie pre začiatočníkov

Pre pracovné postupy založené na AZD sa prihláste pomocou `azd auth login`.

```bash
# Vyžaduje sa pre príkazy AZD, ako je azd up
azd auth login

# Overiť stav overenia AZD
azd auth login --check-status
```

Použite prihlásenie cez Azure CLI len vtedy, keď plánujete počas kurzu spúšťať príkazy `az` sami.

### Autentifikácia cez Azure CLI (voliteľné)
```bash
# Nainštalujte Azure CLI, ak nie je už nainštalovaný
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: pozrite si dokumentáciu inštalácie Azure CLI pre vašu distribúciu

# Prihláste sa do Azure
az login

# Overte overenie identity
az account show
```

### Ktorý spôsob prihlásenia použiť?

- Použite `azd auth login`, ak nasledujete začiatočnícku cestu AZD a väčšinou spúšťate príkazy `azd`.
- Použite tiež `az login`, ak chcete spúšťať Azure CLI príkazy ako `az account show` alebo priamo kontrolovať zdroje.
- Ak cvičenie obsahuje príkazy `azd` aj `az`, spustite oba príkazy na prihlásenie raz na začiatku.

### Autentifikácia cez Device Code
Ak používate systém bez GUI alebo máte problémy s prehliadačom:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Pre automatizované prostredia:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Overenie kompletného nastavenia

Ak chcete rýchlo overiť pripravenosť pred začatím Kapitoly 1:

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
# Nastaviť predplatné ako predvolené
azd config set defaults.subscription <subscription-id>

# Nastaviť predvolenú lokalitu
azd config set defaults.location eastus2

# Zobraziť všetky nastavenia
azd config show
```

### Premenné prostredia
Pridajte do vášho shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurácia Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurácia azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povoliť ladenie protokolovania
```

## Integrácia do IDE

### Visual Studio Code
Nainštalujte rozšírenie Azure Developer CLI:
1. Otvorte VS Code
2. Prejdite do rozšírení (Ctrl+Shift+X)
3. Vyhľadajte „Azure Developer CLI“
4. Nainštalujte rozšírenie

Funkcie:
- IntelliSense pre azure.yaml
- Integrované terminálové príkazy
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
3. Používajte integrovaný terminál pre príkazy azd

## 🐛 Riešenie problémov s inštaláciou

### Bežné problémy

#### Odmietnuté povolenie (Windows)
```powershell
# Spustiť PowerShell ako správca
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

#### Sieťové/proxy problémy
```bash
# Nakonfigurujte proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskočiť overovanie SSL (neodporúča sa pre produkciu)
azd config set http.insecure true
```

#### Konflikty verzií
```bash
# Odstrániť staré inštalácie
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: pred opätovnou inštaláciou odstráňte predchádzajúci binárny súbor azd alebo symbolický odkaz

# Vyčistiť konfiguráciu
rm -rf ~/.azd
```

### Ako získať ďalšiu pomoc
```bash
# Povoliť ladenie zápisu do denníka
export AZD_DEBUG=true
azd <command> --debug

# Zobraziť aktuálnu konfiguráciu
azd config show

# Zobraziť aktuálny stav nasadenia
azd show
```

## Aktualizácia azd

### Kontrola aktualizácie
azd vás upozorní, keď je k dispozícii novšie vydanie, a súčasnú verziu môžete skontrolovať príkazom:
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

**Azure Developer CLI (azd)**: Vysokoúrovňový nástroj pre kompletné nasadenie aplikácií
- `azd up` nasadí celú aplikáciu s všetkými zdrojmi
- Pracovné postupy založené na šablónach
- Zameranie na produktivitu vývojára

**Potrebujete oba**: azd používa az CLI na autentifikáciu
</details>

<details>
<summary><strong>Môžem použiť azd so existujúcimi Azure zdrojmi?</strong></summary>

Áno! Môžete:
1. Importovať existujúce zdroje do azd prostredí
2. Odkazovať na existujúce zdroje vo vašich Bicep šablónach
3. Používať azd na nové nasadenia vedľa existujúcej infraštruktúry

Pozrite [Konfiguračnú príručku](configuration.md) pre detaily.
</details>

<details>
<summary><strong>Funguje azd s Azure Government alebo Azure China?</strong></summary>

Áno, nakonfigurujte cloud:
```bash
# Azure vládny
az cloud set --name AzureUSGovernment
az login

# Azure Čína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Môžem použiť azd v CI/CD pipeline?</strong></summary>

Určite! azd je navrhnutý pre automatizáciu:
- Integrácia s GitHub Actions
- Podpora Azure DevOps
- Autentifikácia cez service principal
- Neinteraktívny režim

Pozrite [Príručku nasadenia](../chapter-04-infrastructure/deployment-guide.md) pre CI/CD vzory.
</details>

<details>
<summary><strong>Koľko stojí používanie azd?</strong></summary>

azd je **úplne zadarmo** a open-source. Platíte len za:
- Azure zdroje, ktoré nasadíte
- Náklady na spotrebu Azure (výpočetný výkon, ukladanie atď.)

Použite `azd provision --preview` na odhad nákladov pred nasadením.
</details>

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k vášmu Azure predplatnému
2. **Vyskúšajte prvé nasadenie**: Postupujte podľa [Príručky prvého projektu](first-project.md)
3. **Preskúmajte šablóny**: Prezrite si dostupné šablóny pomocou `azd template list`
4. **Nakonfigurujte svoje IDE**: Nastavte si vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Diskusie komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Získajte pomoc s Azure príkazmi priamo v editore pomocou `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základné info o AZD](azd-basics.md)
- **➡️ Nasledujúca**: [Váš prvý projekt](first-project.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 2: Vývoj s AI na prvom mieste](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte do [Vášho prvého projektu](first-project.md) a začnite s tvorbou pomocou azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:  
Tento dokument bol preložený pomocou služby prekladov AI [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo nesprávne výklady vyplývajúce z používania tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->