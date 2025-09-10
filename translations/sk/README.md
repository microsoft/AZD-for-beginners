<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:35:52+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# AZD Pre Začiatočníkov

![AZD-pre-začiatočníkov](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sk.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Postupujte podľa týchto krokov, aby ste mohli začať používať tieto zdroje:
1. **Forknite repozitár**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte repozitár**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Pripojte sa k Azure Discord komunitám a stretnite sa s expertmi a ďalšími vývojármi**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podpora Viacerých Jazykov

#### Podporované cez GitHub Action (Automatizované & Vždy Aktuálne)

[Francúzština](../fr/README.md) | [Španielčina](../es/README.md) | [Nemčina](../de/README.md) | [Ruština](../ru/README.md) | [Arabčina](../ar/README.md) | [Perzština (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradičná, Macao)](../mo/README.md) | [Čínština (tradičná, Hongkong)](../hk/README.md) | [Čínština (tradičná, Taiwan)](../tw/README.md) | [Japončina](../ja/README.md) | [Kórejčina](../ko/README.md) | [Hindčina](../hi/README.md) | [Bengálčina](../bn/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Portugalčina (Portugalsko)](../pt/README.md) | [Portugalčina (Brazília)](../br/README.md) | [Taliančina](../it/README.md) | [Poľština](../pl/README.md) | [Turečtina](../tr/README.md) | [Gréčtina](../el/README.md) | [Thajčina](../th/README.md) | [Švédčina](../sv/README.md) | [Dánčina](../da/README.md) | [Nórčina](../no/README.md) | [Fínčina](../fi/README.md) | [Holandčina](../nl/README.md) | [Hebrejčina](../he/README.md) | [Vietnamčina](../vi/README.md) | [Indonézština](../id/README.md) | [Malajčina](../ms/README.md) | [Tagalog (Filipínčina)](../tl/README.md) | [Swahilčina](../sw/README.md) | [Maďarčina](../hu/README.md) | [Čeština](../cs/README.md) | [Slovenčina](./README.md) | [Rumunčina](../ro/README.md) | [Bulharčina](../bg/README.md) | [Srbčina (Cyrilika)](../sr/README.md) | [Chorvátčina](../hr/README.md) | [Slovinčina](../sl/README.md) | [Ukrajinčina](../uk/README.md) | [Barmčina (Myanmar)](../my/README.md)

**Ak chcete podporiť ďalšie jazyky, zoznam podporovaných jazykov nájdete [tu](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Úvod

Vitajte v komplexnom sprievodcovi pre Azure Developer CLI (azd). Tento repozitár je navrhnutý tak, aby pomohol vývojárom na všetkých úrovniach, od študentov po profesionálnych vývojárov, naučiť sa a zvládnuť Azure Developer CLI pre efektívne nasadenie do cloudu. Táto štruktúrovaná vzdelávacia pomôcka poskytuje praktické skúsenosti s nasadením do Azure cloudu, riešením bežných problémov a implementáciou najlepších postupov pre úspešné nasadenie šablón AZD.

## Ciele Učenia

Prácou s týmto repozitárom sa naučíte:
- Zvládnuť základy a hlavné koncepty Azure Developer CLI
- Naučiť sa nasadzovať a poskytovať Azure zdroje pomocou Infrastructure as Code
- Rozvíjať schopnosti riešiť bežné problémy pri nasadení AZD
- Pochopiť validáciu pred nasadením a plánovanie kapacity
- Implementovať najlepšie postupy v oblasti bezpečnosti a optimalizácie nákladov
- Získať istotu pri nasadzovaní aplikácií pripravených na produkciu do Azure

## Výsledky Učenia

Po absolvovaní tohto kurzu budete schopní:
- Úspešne nainštalovať, nakonfigurovať a používať Azure Developer CLI
- Vytvárať a nasadzovať aplikácie pomocou šablón AZD
- Riešiť problémy s autentifikáciou, infraštruktúrou a nasadením
- Vykonávať kontroly pred nasadením vrátane plánovania kapacity a výberu SKU
- Implementovať monitorovanie, bezpečnosť a najlepšie postupy v oblasti správy nákladov
- Integrovať pracovné postupy AZD do CI/CD pipeline

## Obsah

- [Čo je Azure Developer CLI?](../..)
- [Rýchly Štart](../..)
- [Dokumentácia](../..)
- [Príklady & Šablóny](../..)
- [Zdroje](../..)
- [Prispievanie](../..)

## Čo je Azure Developer CLI?

Azure Developer CLI (azd) je príkazový riadok zameraný na vývojárov, ktorý urýchľuje proces vytvárania a nasadzovania aplikácií do Azure. Poskytuje:

- **Nasadenia založené na šablónach** - Používajte predpripravené šablóny pre bežné aplikačné vzory
- **Infrastructure as Code** - Spravujte Azure zdroje pomocou Bicep alebo Terraform
- **Integrované pracovné postupy** - Jednoducho poskytujte, nasadzujte a monitorujte aplikácie
- **Prívetivé pre vývojárov** - Optimalizované pre produktivitu a skúsenosti vývojárov

## Rýchly Štart

### Predpoklady
- Azure predplatné
- Nainštalovaný Azure CLI
- Git (na klonovanie šablón)

### Inštalácia
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaše Prvé Nasadenie
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentácia

### Začíname
- [**Základy AZD**](docs/getting-started/azd-basics.md) - Hlavné koncepty a terminológia
- [**Inštalácia & Nastavenie**](docs/getting-started/installation.md) - Návody na inštaláciu podľa platformy
- [**Konfigurácia**](docs/getting-started/configuration.md) - Nastavenie prostredia a autentifikácia
- [**Váš Prvý Projekt**](docs/getting-started/first-project.md) - Krok za krokom tutoriál

### Nasadenie & Poskytovanie
- [**Sprievodca Nasadením**](docs/deployment/deployment-guide.md) - Kompletné pracovné postupy nasadenia
- [**Poskytovanie Zdroje**](docs/deployment/provisioning.md) - Správa Azure zdrojov

### Kontroly Pred Nasadením
- [**Plánovanie Kapacity**](docs/pre-deployment/capacity-planning.md) - Validácia kapacity Azure zdrojov
- [**Výber SKU**](docs/pre-deployment/sku-selection.md) - Výber správnych SKU pre Azure
- [**Kontroly Pred Nasadením**](docs/pre-deployment/preflight-checks.md) - Automatizované validačné skripty

### Riešenie Problémov
- [**Bežné Problémy**](docs/troubleshooting/common-issues.md) - Často sa vyskytujúce problémy a ich riešenia
- [**Sprievodca Ladením**](docs/troubleshooting/debugging.md) - Krok za krokom stratégie ladenia

## Príklady & Šablóny

### Štartovacie Šablóny
- [**Jednoduchá Webová Aplikácia**](../../examples/simple-web-app) - Základné nasadenie Node.js webovej aplikácie
- [**Statická Webstránka**](../../examples/static-website) - Hosting statickej webstránky na Azure Storage
- [**Aplikácia v Kontajneri**](../../examples/container-app) - Nasadenie aplikácie v kontajneri
- [**Aplikácia s Databázou**](../../examples/database-app) - Webová aplikácia s integráciou databázy

### Pokročilé Scenáre
- [**Mikroslužby**](../../examples/microservices) - Architektúra aplikácie s viacerými službami
- [**Serverless Funkcie**](../../examples/serverless-function) - Nasadenie Azure Functions
- [**Príklady Konfigurácií**](../../examples/configurations) - Opakovane použiteľné vzory konfigurácií

## Zdroje

### Rýchle Referencie
- [**Cheat Sheet Príkazov**](resources/cheat-sheet.md) - Základné príkazy azd
- [**Glosár**](resources/glossary.md) - Terminológia Azure a azd
- [**FAQ**](resources/faq.md) - Často kladené otázky
- [**Študijný Sprievodca**](resources/study-guide.md) - Komplexné ciele učenia a cvičenia

### Externé Zdroje
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Kalkulačka Cien](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Učebná Trajektória

### Pre Študentov & Začiatočníkov
1. Začnite s [Základmi AZD](docs/getting-started/azd-basics.md)
2. Postupujte podľa [Sprievodcu Inštaláciou](docs/getting-started/installation.md)
3. Dokončite [Váš Prvý Projekt](docs/getting-started/first-project.md)
4. Precvičte si [Príklad Jednoduchej Webovej Aplikácie](../../examples/simple-web-app)

### Pre Vývojárov
1. Preštudujte si [Sprievodcu Konfiguráciou](docs/getting-started/configuration.md)
2. Preskúmajte [Sprievodcu Nasadením](docs/deployment/deployment-guide.md)
3. Pracujte na [Príklade Aplikácie s Databázou](../../examples/database-app)
4. Preskúmajte [Príklad Aplikácie v Kontajneri](../../examples/container-app)

### Pre DevOps Inžinierov
1. Zvládnite [Poskytovanie Zdroje](docs/deployment/provisioning.md)
2. Implementujte [Kontroly Pred Nasadením](docs/pre-deployment/preflight-checks.md)
3. Precvičte si [Plánovanie Kapacity](docs/pre-deployment/capacity-planning.md)
4. Pokročilý [Príklad Mikroslužieb](../../examples/microservices)

## Prispievanie

Radi privítame príspevky! Prečítajte si náš [Sprievodca Prispievaním](CONTRIBUTING.md) pre podrobnosti o:
- Ako nahlásiť problémy a požiadať o funkcie
- Pokyny pre príspevky kódu
- Zlepšenia dokumentácie
- Štandardy komunity

## Podpora

- **Problémy**: [Nahláste chyby a požiadajte o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Diskusie**: [Microsoft Azure Discord Komunita Q&A a diskusie](https://discord.gg/microsoft-azure)
- **Email**: Pre súkromné otázky
- **Microsoft Learn**: [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licencia

Tento projekt je licencovaný pod MIT Licenciou - pozrite si [LICENSE](../../LICENSE) súbor pre detaily.

## 🎒 Ďalšie Kurzy

Náš tím vytvára ďalšie kurzy! Pozrite si:

- [**NOVÉ** Model Context Protocol (MCP) Pre Začiatočníkov](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agenti Pre Začiatočníkov](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI Pre Začiatočníkov pomocou .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI Pre Začiatočníkov](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatívna AI Pre Začiatočníkov pomocou Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML Pre Začiatočníkov](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science Pre Začiatočníkov](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Pre Začiatočníkov](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kybernetická Bezpečnosť Pre Začiatočníkov](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev pre začiatočníkov](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT pre začiatočníkov](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR vývoj pre začiatočníkov](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre AI párové programovanie](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Ovládnutie GitHub Copilot pre vývojárov C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Vyberte si vlastné dobrodružstvo s Copilotom](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigácia**
- **Ďalšia lekcia**: [Základy AZD](docs/getting-started/azd-basics.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny preklad od človeka. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.