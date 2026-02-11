# Inštalácia a nastavenie

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md)
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexný sprievodca vás prevedie inštaláciou a konfiguráciou Azure Developer CLI (azd) na vašom systéme. Naučíte sa niekoľko spôsobov inštalácie pre rôzne operačné systémy, nastavenie autentifikácie a počiatočnú konfiguráciu, aby ste pripravili svoje vývojové prostredie na nasadenia do Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Úspešne nainštalovať Azure Developer CLI na váš operačný systém
- Nakonfigurovať autentifikáciu s Azure pomocou viacerých metód
- Nastaviť svoje vývojové prostredie s potrebnými predpokladmi
- Porozumieť rôznym možnostiam inštalácie a kedy ktorú použiť
- Riešiť bežné problémy s inštaláciou a nastavením

## Výstupy učenia

Po dokončení tejto lekcie budete vedieť:
- Nainštalovať azd pomocou vhodnej metódy pre vašu platformu
- Overiť autentifikáciu do Azure pomocou azd auth login
- Overiť inštaláciu a otestovať základné príkazy azd
- Nakonfigurovať svoje vývojové prostredie pre optimálne používanie azd
- Samostatne vyriešiť bežné problémy s inštaláciou

Tento sprievodca vám pomôže nainštalovať a nakonfigurovať Azure Developer CLI na vašom systéme, bez ohľadu na operačný systém alebo vývojové prostredie.

## Predpoklady

Pred inštaláciou azd sa uistite, že máte:
- **Predplatné Azure** - [Vytvorte si bezplatný účet](https://azure.microsoft.com/free/)
- **Azure CLI** - Na autentifikáciu a správu prostriedkov
- **Git** - Na klonovanie šablón a správu verzií
- **Docker** (voliteľné) - Pre kontajnerizované aplikácie

## Spôsoby inštalácie

### Windows

#### Možnosť 1: PowerShell (odporúčané)
```powershell
# Spustiť ako správca alebo s povýšenými oprávneniami
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
3. Pridajte do premennej PATH

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

#### Možnosť 2: Správca balíčkov

**Ubuntu/Debian:**
```bash
# Pridať repozitár balíčkov Microsoftu
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Nainštalovať azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Pridať repozitár balíčkov Microsoftu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd je predinštalovaný v GitHub Codespaces. Jednoducho vytvorte codespace a začnite používať azd ihneď.

### Docker

```bash
# Spustiť azd v kontajneri
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Vytvoriť alias pre jednoduchšie použitie
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Overenie inštalácie

Po inštalácii overte, že azd funguje správne:

```bash
# Skontrolovať verziu
azd version

# Zobraziť nápovedu
azd --help

# Zobraziť dostupné šablóny
azd template list
```

Očakávaný výstup:
```
azd version 1.x.x (commit xxxxxx)
```

**Poznámka**: Skutočné číslo verzie sa môže líšiť. Skontrolujte [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pre najnovšiu verziu.

**✅ Kontrolný zoznam úspešnej inštalácie:**
- [ ] `azd version` zobrazuje číslo verzie bez chýb
- [ ] `azd --help` zobrazuje dokumentáciu príkazov
- [ ] `azd template list` zobrazuje dostupné šablóny
- [ ] `az account show` zobrazuje vaše predplatné Azure
- [ ] Môžete vytvoriť testovací adresár a úspešne spustiť `azd init`

**Ak všetky kontroly prejdú, môžete pokračovať na [Váš prvý projekt](first-project.md)!**

## Nastavenie autentifikácie

### Azure CLI autentifikácia (odporúčané)
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

### Autentifikácia pomocou kódu zariadenia
Ak ste na bezhlavom systéme alebo máte problémy s prehliadačom:
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

# Nastaviť predvolenú lokalitu
azd config set defaults.location eastus2

# Zobraziť všetku konfiguráciu
azd config list
```

### Premenné prostredia
Pridajte do profilu shellu (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurácia Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurácia azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Povoliť ladené logovanie
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
- Integrované terminálové príkazy
- Prehliadanie šablón
- Sledovanie nasadení

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
3. Použite integrovaný terminál pre príkazy azd

## 🐛 Riešenie problémov s inštaláciou

### Bežné problémy

#### Prístup zamietnutý (Windows)
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

#### Sieťové/proxy problémy
```bash
# Nakonfigurujte proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Preskočiť overenie SSL (neodporúča sa v produkčnom prostredí)
azd config set http.insecure true
```

#### Konflikty verzií
```bash
# Odstrániť staré inštalácie
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Vyčistiť konfiguráciu
rm -rf ~/.azd
```

### Ako získať ďalšiu pomoc
```bash
# Povoliť ladené protokolovanie
export AZD_DEBUG=true
azd <command> --debug

# Zobraziť aktuálnu konfiguráciu
azd config list

# Zobraziť aktuálny stav nasadenia
azd show
```

## Aktualizácia azd

### Automatické aktualizácie
azd vás upozorní, keď sú k dispozícii aktualizácie:
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

**Azure CLI (az)**: Nízkoúrovňový nástroj na správu jednotlivých prostriedkov Azure
- `az webapp create`, `az storage account create`
- Jeden prostriedok naraz
- Zameranie na správu infraštruktúry

**Azure Developer CLI (azd)**: Vysokoúrovňový nástroj na kompletné nasadenia aplikácií
- `azd up` nasadí celú aplikáciu so všetkými prostriedkami
- Práca so šablónami a workflow
- Zameranie na produktivitu vývojára

**Potrebujete oboje**: azd používa az CLI na autentifikáciu
</details>

<details>
<summary><strong>Môžem používať azd s existujúcimi prostriedkami Azure?</strong></summary>

Áno! Môžete:
1. Importovať existujúce prostriedky do prostredí azd
2. Odkazovať na existujúce prostriedky vo vašich Bicep šablónach
3. Používať azd pre nové nasadenia vedľa existujúcej infraštruktúry

Pozrite si [Sprievodcu konfiguráciou](configuration.md) pre podrobnosti.
</details>

<details>
<summary><strong>Funguje azd s Azure Government alebo Azure China?</strong></summary>

Áno, nakonfigurujte cloud:
```bash
# Azure pre vládu
az cloud set --name AzureUSGovernment
az login

# Azure Čína
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Môžem používať azd v CI/CD pipeline?</strong></summary>

Určite! azd je navrhnutý pre automatizáciu:
- Integrácia s GitHub Actions
- Podpora Azure DevOps
- Autentifikácia pomocou Service Principal
- Neinteraktívny režim

Pozrite si [Sprievodcu nasadením](../chapter-04-infrastructure/deployment-guide.md) pre vzory CI/CD.
</details>

<details>
<summary><strong>Koľko stojí používanie azd?</strong></summary>

azd je **úplne zadarmo** a open-source. Platíte iba za:
- Prostriedky Azure, ktoré nasadíte
- Náklady na spotrebu Azure (výpočtový výkon, úložisko atď.)

Použite `azd provision --preview` na odhad nákladov pred nasadením.
</details>

## Ďalšie kroky

1. **Dokončite autentifikáciu**: Uistite sa, že máte prístup k svojmu predplatnému Azure
2. **Vyskúšajte svoje prvé nasadenie**: Postupujte podľa [Sprievodcu prvým projektom](first-project.md)
3. **Preskúmajte šablóny**: Prezrite si dostupné šablóny pomocou `azd template list`
4. **Nakonfigurujte svoje IDE**: Nastavte svoje vývojové prostredie

## Podpora

Ak narazíte na problémy:
- [Oficiálna dokumentácia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Nahlásiť problémy](https://github.com/Azure/azure-dev/issues)
- [Komunitné diskusie](https://github.com/Azure/azure-dev/discussions)
- [Podpora Azure](https://azure.microsoft.com/support/)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a rýchly štart
- **⬅️ Predchádzajúca**: [Základy AZD](azd-basics.md) 
- **➡️ Ďalšia**: [Váš prvý projekt](first-project.md)
- **🚀 Ďalšia kapitola**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Inštalácia dokončená!** Pokračujte na [Váš prvý projekt](first-project.md) a začnite stavať s azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou služby automatického prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->