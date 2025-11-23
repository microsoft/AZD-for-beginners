<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-23T11:55:52+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "sk"
}
-->
# Inštalačný a nastavovací sprievodca

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Tento komplexný sprievodca vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa rôzne metódy inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu na prípravu vášho vývojového prostredia pre nasadenia na Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Úspešne nainštalovať Azure Developer CLI na váš operačný systém
- Konfigurovať autentifikáciu s Azure pomocou rôznych metód
- Nastaviť vaše vývojové prostredie s potrebnými predpokladmi
- Porozumieť rôznym možnostiam inštalácie a kedy ich použiť
- Riešiť bežné problémy s inštaláciou a nastavením

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Nainštalovať azd pomocou vhodnej metódy pre vašu platformu
- Autentifikovať sa s Azure pomocou azd auth login
- Overiť vašu inštaláciu a otestovať základné príkazy azd
- Konfigurovať vaše vývojové prostredie pre optimálne používanie azd
- Samostatne riešiť bežné problémy s inštaláciou

Tento sprievodca vám pomôže nainštalovať a konfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na váš operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Azure predplatné** - [Vytvorte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Na autentifikáciu a správu zdrojov
- **Git** - Na klonovanie šablón a verzionovanie
- **Docker** (voliteľné) - Na kontajnerové aplikácie

## Metódy inštalácie

### Windows

#### Možnosť 1: PowerShell (odporúčané)
```powershell
# Spustite ako správca alebo s vyššími oprávneniami
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Možnosť 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Možnosť 3: Chocolatey
```cmd
choco install azd
```

#### Možnosť 4: Manuálna inštalácia
1. Stiahnite si najnovšie vydanie z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozbaľte do `C:\Program Files\azd\`
3. Pridajte do PATH environment variable

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
```bash
# Stiahnuť a nainštalovať
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Možnosť 1: Inštalačný skript (odporúčané)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Možnosť 2: Správcovia balíkov

**Ubuntu/Debian:**
```bash
# Pridať úložisko balíkov Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Nainštalovať azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Pridať úložisko balíkov Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je predinštalovaný v GitHub Codespaces. Stačí vytvoriť codespace a okamžite začať používať azd.

### Docker

```bash
# Spustite azd v kontajneri
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvorte alias pre jednoduchšie použitie
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Overenie inštalácie

Po inštalácii overte, že azd funguje správne:

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
azd version 1.5.0 (commit abc123)
```

**✅ Kontrolný zoznam úspešnej inštalácie:**
- [ ] `azd version` zobrazuje číslo verzie bez chýb
- [ ] `azd --help` zobrazuje dokumentáciu príkazov
- [ ] `azd template list` zobrazuje dostupné šablóny
- [ ] `az account show` zobrazuje vaše Azure predplatné
- [ ] Môžete vytvoriť testovací adresár a úspešne spustiť `azd init`

**Ak všetky kontroly prejdú, ste pripravení pokračovať na [Váš prvý projekt](first-project.md)!**

## Nastavenie autentifikácie

### Autentifikácia cez Azure CLI (odporúčané)
```bash
# Nainštalujte Azure CLI, ak ešte nie je nainštalovaný
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Prihláste sa do Azure
az login

# Overte autentifikáciu
az account show
```

### Autentifikácia cez kód zariadenia
Ak používate systém bez grafického rozhrania alebo máte problémy s prehliadačom:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Pre automatizované prostredia:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurácia

### Globálna konfigurácia
```bash
# Nastaviť predvolené predplatné
azd config set defaults.subscription <subscription-id>

# Nastaviť predvolené umiestnenie
azd config set defaults.location eastus2

# Zobraziť všetky konfigurácie
azd config list
```

### Environmentálne premenné
Pridajte do vášho shell profilu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurácia Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurácia azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povoliť ladenie logovania
```

## Integrácia s IDE

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
2. Konfigurujte Azure poverenia
3. Používajte integrovaný terminál na príkazy azd

## 🐛 Riešenie problémov s inštaláciou

### Bežné problémy

#### Odmietnutie povolenia (Windows)
```powershell
# Spustite PowerShell ako správca
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
# Nakonfigurujte proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskočiť overenie SSL (neodporúča sa pre produkciu)
azd config set http.insecure true
```

#### Konflikty verzií
```bash
# Odstrániť staré inštalácie
# Windows: winget odinštalovať Microsoft.Azd
# macOS: brew odinštalovať azd
# Linux: sudo apt odstrániť azd

# Vyčistiť konfiguráciu
rm -rf ~/.azd
```

### Získanie ďalšej pomoci
```bash
# Povoliť ladenie protokolovania
export AZD_DEBUG=true
azd <command> --debug

# Zobraziť podrobné protokoly
azd logs

# Skontrolovať informácie o systéme
azd info
```

## Aktualizácia azd

### Automatické aktualizácie
azd vás upozorní, keď sú dostupné aktualizácie:
```bash
azd version --check-for-updates
```

### Manuálne aktualizácie

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
<summary><strong>Aký je rozdiel medzi azd a az CLI?</strong></summary>

**Azure CLI (az)**: Nízkoúrovňový nástroj na správu jednotlivých Azure zdrojov
- `az webapp create`, `az storage account create`
- Jeden zdroj naraz
- Zameranie na správu infraštruktúry

**Azure Developer CLI (azd)**: Vysokoúrovňový nástroj na kompletné nasadenie aplikácií
- `azd up` nasadí celú aplikáciu so všetkými zdrojmi
- Pracovné postupy založené na šablónach
- Zameranie na produktivitu vývojára

**Potrebujete oboje**: azd používa az CLI na autentifikáciu
</details>

<details>
<summary><strong>Môžem používať azd s existujúcimi Azure zdrojmi?</strong></summary>

Áno! Môžete:
1. Importovať existujúce zdroje do azd prostredí
2. Odkazovať na existujúce zdroje vo vašich Bicep šablónach
3. Používať azd na nové nasadenia vedľa existujúcej infraštruktúry

Pozrite si [Sprievodcu konfiguráciou](configuration.md) pre podrobnosti.
</details>

<details>
<summary><strong>Funguje azd s Azure Government alebo Azure China?</strong></summary>

Áno, nakonfigurujte cloud:
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
<summary><strong>Môžem používať azd v CI/CD pipeline?</strong></summary>

Samozrejme! azd je navrhnutý pre automatizáciu:
- Integrácia s GitHub Actions
- Podpora Azure DevOps
- Autentifikácia cez Service Principal
- Neinteraktívny režim

Pozrite si [Sprievodcu nasadením](../deployment/deployment-guide.md) pre vzory CI/CD.
</details>

<details>
<summary><strong>Aké sú náklady na používanie azd?</strong></summary>

azd samotný je **úplne zadarmo** a open-source. Platíte len za:
- Azure zdroje, ktoré nasadíte
- Náklady na spotrebu Azure (výpočty, úložisko, atď.)

Použite `azd provision --preview` na odhad nákladov pred nasadením.
</details>

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k vášmu Azure predplatnému
2. **Vyskúšajte prvé nasadenie**: Postupujte podľa [Sprievodcu prvým projektom](first-project.md)
3. **Preskúmajte šablóny**: Prehliadajte dostupné šablóny pomocou `azd template list`
4. **Konfigurujte vaše IDE**: Nastavte vaše vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Diskusie komunity](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md) 
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte na [Váš prvý projekt](first-project.md) a začnite pracovať s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->