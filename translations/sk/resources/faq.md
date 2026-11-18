# Často kladené otázky (FAQ)

**Získajte pomoc podľa kapitol**
- **📚 Domovská stránka kurzu**: [AZD pre začiatočníkov](../README.md)
- **🚆 Problémy s inštaláciou**: [Kapitola 1: Inštalácia a nastavenie](../docs/chapter-01-foundation/installation.md)
- **🤖 Otázky k AI**: [Kapitola 2: Vývoj orientovaný na AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Riešenie problémov**: [Kapitola 7: Riešenie problémov a ladenie](../docs/chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexný FAQ poskytuje odpovede na najčastejšie otázky o Azure Developer CLI (azd) a nasadeniach Azure. Nájdite rýchle riešenia bežných problémov, pochopte osvedčené postupy a získajte objasnenie koncepcií a pracovných tokov azd.

## Ciele učenia

Prehľadom tohto FAQ:
- Nájdete rýchle odpovede na bežné otázky a problémy Azure Developer CLI
- Pochopíte kľúčové pojmy a terminológiu prostredníctvom praktického formátu otázok a odpovedí
- Získate prístup k riešeniam problémov pre časté chyby a scenáre
- Naučíte sa osvedčené postupy prostredníctvom často kladených otázok o optimalizácii
- Objavíte pokročilé funkcie a schopnosti cez expertné otázky
- Rýchlo sa odvoláte na usmernenia týkajúce sa nákladov, bezpečnosti a stratégie nasadenia

## Výsledky učenia

Pravidelným odvolávaním sa na tento FAQ budete schopní:
- Samostatne riešiť bežné problémy Azure Developer CLI pomocou poskytnutých riešení
- Robiť informované rozhodnutia o stratégiách a konfiguráciách nasadenia
- Pochopiť vzťah medzi azd a ďalšími nástrojmi a službami Azure
- Aplikovať osvedčené postupy na základe skúseností komunity a odporúčaní expertov
- Efektívne riešiť problémy s autentifikáciou, nasadením a konfiguráciou
- Optimalizovať náklady a výkonnosť pomocou poznatkov a odporúčaní z FAQ

## Obsah

- [Začíname](#getting-started)
- [Autentifikácia a prístup](#authentication--access)
- [Šablóny a projekty](#templates--projects)
- [Nasadenie a infraštruktúra](#deployment--infrastructure)
- [Konfigurácia a prostredia](#configuration--environments)
- [Riešenie problémov](#troubleshooting)
- [Náklady a fakturácia](#cost--billing)
- [Osvedčené postupy](#best-practices)
- [Pokročilé témy](#advanced-topics)

---

## Začíname

### Otázka: Čo je Azure Developer CLI (azd)?
**Odpoveď**: Azure Developer CLI (azd) je príkazový nástroj zameraný na vývojárov, ktorý zrýchľuje čas, za ktorý dostanete aplikáciu z lokálneho vývojového prostredia do Azure. Poskytuje osvedčené postupy cez šablóny a pomáha počas celého životného cyklu nasadenia.

### Otázka: Čím sa azd líši od Azure CLI?
**Odpoveď**: 
- **Azure CLI**: Nástroj na všeobecné účely na správu zdrojov Azure
- **azd**: Nástroj zameraný na vývojárov pre pracovné toky nasadenia aplikácií
- azd má vlastný princíp autentifikácie a pracovný tok nasadenia; Azure CLI je samostatný, doplňujúci nástroj
- azd obsahuje šablóny, správu prostredí a automatizáciu nasadenia

### Otázka: Potrebujem mať nainštalovaný Azure CLI, aby som mohol použiť azd?
**Odpoveď**: Nie pre základný pracovný tok AZD. Autentifikujte sa pomocou `azd auth login`. Azure CLI si nainštalujte samostatne, keď hák šablóny alebo cvičenie explicitne spustí príkazy `az`.

### Otázka: Aké programovacie jazyky azd podporuje?
**Odpoveď**: azd je nezávislý od jazyka. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické webové stránky
- Kontajnerizované aplikácie

### Otázka: Môžem použiť azd s existujúcimi projektmi?
**Odpoveď**: Áno! Môžete:
1. Použiť `azd init` na pridanie konfigurácie azd do existujúcich projektov
2. Prispôsobiť existujúce projekty štruktúre šablóny azd
3. Vytvoriť vlastné šablóny založené na vašej existujúcej architektúre

### Otázka: Čo sa zmenilo s všeobecnou dostupnosťou rozšírenia Foundry?
**Odpoveď**: Balík `microsoft.foundry` dosiahol verziu 1.0 a GA 5. novembra 2026. S AZD 1.37.0+ používajte `azd ext install microsoft.foundry` na inštaláciu siedmich hlavných rozšírení pre agentov, pripojenia, inšpektora, projekty, rutiny, zručnosti a nástroje. Nie je to nový príkazový priestor a jeho komponenty sú verzované nezávisle. Hodnotenia, dataset-y, doladenie a vlastné modely sa inštalujú zvlášť; voliteľné náhľadové funkcie sa nestávajú GA len preto, že balík je GA.

Prechod [hosted-agenta](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) používa Python 3.13+ a aktuálny uv. `azd ai agent run` otvorí Agent Inspector lokálne, ale volania modelu stále používajú Azure a účtujú poplatky. Režim kódu `azd deploy` nahráva zdroj pre vzdialenú zostavu bez potreby lokálneho zostavenia kontajnera.

### Otázka: Odstráni `azd down` hosťovaného agenta z existujúceho projektu Foundry?
**Odpoveď**: Nie pre cestu znovupoužitia projektu popísanú v rýchlom začiatku hosťovaného agenta: ponecháva projekt, hosťovaného agenta a ďalšie zdroje na mieste. Nežiaduce zdroje odstráňte samostatne bez mazať zdieľané zdroje. Ak prostredie vytvorilo nový projekt Foundry, `azd down` odstráni jeho skupinu zdrojov a všetko v nej. Pred potvrdením skontrolujte [návod na čistenie](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) a výzvy na vymazanie.

---

## Autentifikácia a prístup

### Otázka: Ako sa prihlásim do Azure pomocou azd?
**Odpoveď**: Použite `azd auth login`, ktorý otvorí okno prehliadača na autentifikáciu Azure. Pre scenáre CI/CD použite servisné princípy alebo spravované identity.

### Otázka: Môžem použiť azd s viacerými predplatnými Azure?
**Odpoveď**: Áno. Použite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` na určenie, ktoré predplatné sa používa pre každé prostredie.

### Otázka: Aké oprávnenia potrebujem na nasadenie cez azd?
**Odpoveď**: Väčšinou potrebujete:
- rolu **Prispievateľa** na skupine zdrojov alebo predplatnom
- rolu **Správcu prístupu používateľov**, ak nasadzujete zdroje vyžadujúce priradenie rolí
- Konkrétne oprávnenia závisia od šablóny a nasadzovaných zdrojov

### Otázka: Môžem použiť azd v CI/CD pipeline?
**Odpoveď**: Určite! azd je navrhnutý pre integráciu CI/CD. Použite servisné princípy na autentifikáciu a nastavte premenné prostredia na konfiguráciu.

### Otázka: Ako riešim autentifikáciu v GitHub Actions?
**Odpoveď**: Preferujte federáciu identity pracovného zaťaženia (OIDC), nakonfigurovanú pomocou `azd pipeline config`. Vygenerovaný pracovný tok nainštaluje AZD a autentifikuje AZD priamo použitím federovanej identity. Samotný krok `azure/login` nezabezpečí prihlásenie AZD. Prihlasovací krok v existujúcej úlohe vyzerá takto:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Nasadzujte alebo spravujte po prihlásení s nastaveným zamýšľaným prostredím AZD, predplatným a lokalitou. Federovaný poverovací údaj identity musí dôverovať úložištiu/ref repozitára alebo GitHub prostrediu a jeho Azure roly musia povoliť požadované operácie.

---

## Šablóny a projekty

### Otázka: Kde nájdem šablóny azd?
**Odpoveď**: 
- Oficiálne a komunitné šablóny: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Komunitné šablóny: vyhľadávajte na GitHub „azd-template“
- Použite `azd template list` na prehliadanie dostupných šablón

### Otázka: Ako vytvorím vlastnú šablónu?
**Odpoveď**: 
1. Začnite s existujúcou štruktúrou šablóny
2. Upraviť `azure.yaml`, infraštruktúrne súbory a aplikačný kód
3. Dôkladne otestujte pomocou `azd up`
4. Publikujte na GitHub so správnymi značkami

### Otázka: Môžem použiť azd bez šablóny?
**Odpoveď**: Áno, použite `azd init` v existujúcom projekte na vytvorenie potrebných konfiguračných súborov. Manuálne budete musieť nakonfigurovať `azure.yaml` a infraštruktúrne súbory.

### Otázka: Aký je rozdiel medzi oficiálnymi a komunitnými šablónami?
**Odpoveď**: 
- **Oficiálne šablóny**: Spravované spoločnosťou Microsoft, pravidelne aktualizované, komplexná dokumentácia
- **Komunitné šablóny**: Vytvorené vývojármi, môžu mať špecializované použitie, rôzna kvalita a údržba

### Otázka: Ako aktualizujem šablónu v mojom projekte?
**Odpoveď**: Šablóny sa neaktualizujú automaticky. Môžete:
1. Manuálne porovnať a zlúčiť zmeny zo zdrojovej šablóny
2. Začať nové s `azd init` s použitím aktualizovanej šablóny
3. Vybrať si konkrétne vylepšenia z aktualizovaných šablón

---

## Nasadenie a infraštruktúra

### Otázka: Aké služby Azure môže azd nasadiť?
**Odpoveď**: azd môže nasadiť akúkoľvek službu Azure cez Bicep/ARM šablóny, vrátane:
- App Services, Container Apps, Functions
- Databázy (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Siete, bezpečnosť a monitorovacie zdroje

### Otázka: Môžem nasadiť do viacerých regiónov?
**Odpoveď**: Áno, nastavte viaceré regióny vo vašich Bicep šablónach a správne nakonfigurujte parameter lokality pre každé prostredie.

### Otázka: Ako riešim migrácie schémy databázy?
**Odpoveď**: Použite háky nasadenia v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Otázka: Môžem nasadiť iba infraštruktúru bez aplikácií?
**Odpoveď**: Áno, použite `azd provision` na nasadenie iba infraštruktúrnych komponentov definovaných vo vašich šablónach.

### Otázka: Ako nasadím na existujúce zdroje Azure?
**Odpoveď**: Áno, ak to šablóna podporuje. Odkážte na existujúce zdroje pomocou Bicep deklarácií `existing` alebo dokumentovaných parametrov existujúcich zdrojov v šablóne a namapujte aplikačné služby na ich určené ciele. Toto neimportuje vlastníctvo ani automaticky nevytvára chýbajúce oprávnenia. Pred nasadením si šablónu preverte.

### Otázka: Môžem použiť Terraform namiesto Bicep?
**Odpoveď**: Áno. AZD podporuje Terraform aj Bicep. Vyberte si šablónu založenú na Terraform alebo nakonfigurujte `infra.provider: terraform` v `azure.yaml` s príslušnými Terraform súbormi a konfiguráciou stavu/back-endu. Pozrite si [pracovný tok Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurácia a prostredia

### Otázka: Ako spravujem rôzne prostredia (vývoj, test, produkcia)?
**Odpoveď**: Vytvorte samostatné prostredia pomocou `azd env new <environment-name>` a konfigurujte pre každé odlišné nastavenia:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Otázka: Kde sa ukladajú konfigurácie prostredí?
**Odpoveď**: V priečinku `.azure` vo vašom adresári projektu. Každé prostredie má vlastný priečinok s konfiguračnými súbormi.

### Otázka: Ako nastavím konfiguráciu špecifickú pre prostredie?
**Odpoveď**: Použite `azd env set` na nastavenie premenných prostredia:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Otázka: Môžem zdieľať konfigurácie prostredí medzi členmi tímu?
**Odpoveď**: Priečinok `.azure` obsahuje citlivé informácie a nemal by sa ukladať do verzovacieho systému. Namiesto toho:
1. Dokumentujte potrebné premenné prostredia
2. Používajte skripty nasadenia na nastavenie prostredí
3. Použite Azure Key Vault pre citlivú konfiguráciu

### Otázka: Ako prepíšem predvolené hodnoty šablóny?
**Odpoveď**: Nastavte premenné prostredia, ktoré zodpovedajú parametrom šablóny:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Iba premenné použité šablónou ovplyvňujú nasadenie. `SKU_NAME` vyššie je príklad vlastného vstupu, nie univerzálne nastavenie AZD.

---

## Riešenie problémov

### Otázka: Prečo zlyháva `azd up`?
**Odpoveď**: Bežné príčiny:
1. **Problémy s autentifikáciou**: Spustite `azd auth login`
2. **Nedostatočné oprávnenia**: Skontrolujte priradenia rolí v Azure
3. **Konflikty názvov zdrojov**: Skontrolujte konfliktný zdroj a vstupy šablóny na názvy; vytvorte samostatné prostredie s `azd env new`, ak je potrebná izolácia
4. **Problémy s kvótou/kapacitou**: Skontrolujte dostupnosť v regióne
5. **Chyby v šablóne**: Validujte Bicep šablóny

### Otázka: Ako ladím zlyhania nasadenia?
**Odpoveď**: 
1. Použite `azd deploy --debug` pre podrobný výstup
2. Skontrolujte históriu nasadení v Azure portáli
3. Prezrite si Aktivity v Azure portáli
4. Použite `azd show` na zobrazenie aktuálneho stavu prostredia

### Otázka: Prečo moje premenné prostredia nefungujú?
**Odpoveď**: Skontrolujte:
1. Názvy premenných presne zodpovedajú parametrom šablóny
2. Hodnoty sú správne uzavreté do úvodzoviek, ak obsahujú medzery
3. Je vybrané správne prostredie: `azd env select <environment>`
4. Premenné sú nastavené v správnom prostredí

### Otázka: Ako vyčistím neúspešné nasadenia?
**Odpoveď**: 
```bash
azd down
```
Najskôr si preverte vybrané prostredie a potvrdenie vymazania. Toto zmaže nasadené zdroje Azure, nie lokálnu konfiguráciu prostredia `.azure`. `--purge` navyše žiada trvalé vymazanie podporovaných zdrojov s možnosťou mäkkého mazania a môže byť blokované ochranou uchovávania/čistenia; nie je to rutinný krok obnovy.

### Otázka: Prečo moja aplikácia nie je po nasadení prístupná?
**Odpoveď**: Skontrolujte:
1. Nasadenie bolo úspešne dokončené
2. Aplikácia beží (skontrolujte logy v Azure portáli)
3. Sieťové bezpečnostné skupiny povoľujú prenos
4. DNS/custom domény sú správne nakonfigurované

---

## Náklady a fakturácia

### Otázka: Koľko bude stáť nasadenie cez azd?
**Odpoveď**: Náklady závisia od:
- Nasadených služieb Azure
- Vybraných úrovní služieb/SKU
- Miestnych cenových rozdielov
- Vzorov používania

Použite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pre odhady.

### Otázka: Ako kontrolovať náklady pri nasadeniach azd?
**Odpoveď**: 
1. Používajte nižšie úrovne SKU pre vývojové prostredia
2. Nastavte rozpočty a upozornenia v Azure
3. Použite `azd down` na odstránenie zdrojov, keď nie sú potrebné
4. Vyberte vhodné regióny (náklady sa líšia podľa lokality)
5. Využívajte nástroje Azure Cost Management

### Otázka: Existujú bezplatné úrovne pre šablóny azd?
**Odpoveď**: Niektoré služby majú bezplatné SKU alebo mesačné granty, v závislosti od oprávnenosti, plánu hostingu, regiónu a limitov predplatného. To však neznamená, že celá šablóna je bezplatná: databázy, vyhľadávanie, sieťové služby, registrácia, telemetria a inferencia modelov môžu spôsobovať samostatné poplatky. Pred nasadením skontrolujte [zoznam bezplatných služieb Azure](https://azure.microsoft.com/free/) a aktuálne ceny pre každý zdroj.

### Otázka: Ako odhadnúť náklady pred nasadením?
**Odpoveď**: 
1. Prezrite si `main.bicep` šablóny, aby ste videli, aké zdroje sa vytvárajú
2. Použite Azure Pricing Calculator s konkrétnymi SKU
3. Najprv nasadiť do vývojového prostredia na sledovanie skutočných nákladov
4. Použite Azure Cost Management pre podrobnú analýzu nákladov

---

## Najlepšie postupy

### Otázka: Aké sú najlepšie postupy pre štruktúru projektu azd?
**Odpoveď**: 
1. Udržiavajte aplikačný kód oddelene od infraštruktúry
2. Používajte zmysluplné názvy služieb v `azure.yaml`
3. Implementujte správne spracovanie chýb v skriptoch zostavenia
4. Používajte konfiguráciu špecifickú pre prostredie
5. Zahrňte komplexnú dokumentáciu

### Otázka: Ako mám organizovať viacero služieb v azd?
**Odpoveď**: Použite odporúčanú štruktúru:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Otázka: Mám ukladať priečinok `.azure` do verziovacieho systému?
**Odpoveď**: **Nie!** Priečinok `.azure` obsahuje citlivé informácie. Pridajte ho do `.gitignore`:
```gitignore
.azure/
```

### Otázka: Ako spravujem tajomstvá a citlivú konfiguráciu?
**Odpoveď**: 
1. Použite Azure Key Vault pre tajomstvá
2. Odkážte na tajomstvá Key Vault v konfigurácii aplikácie
3. Nikdy nezverejňujte tajomstvá vo verziovacom systéme
4. Použite spravované identity na autentifikáciu služieb medzi sebou

### Otázka: Aký je odporúčaný prístup k CI/CD s azd?
**Odpoveď**: 
1. Používajte samostatné prostredia pre každú fázu (vývoj/test/produkcia)
2. Implementujte automatizované testovanie pred nasadením
3. Používajte servisné princípy na autentifikáciu
4. Uchovávajte citlivú konfiguráciu v tajomstvách/premenných pipeline
5. Zaveste schvaľovacie brány pre produkčné nasadenia

---

## Pokročilé témy

### Otázka: Môžem rozšíriť azd o vlastnú funkcionalitu?
**Odpoveď**: Áno, cez hooky nasadenia v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Otázka: Ako integrovať azd do existujúcich DevOps procesov?
**Odpoveď**: 
1. Používajte azd príkazy v existujúcich pipeline skriptoch
2. Štandardizujte azd šablóny naprieč tímami
3. Integrujte s existujúcim monitorovaním a upozorňovaním
4. Používajte JSON výstup azd pre integráciu pipeline

### Otázka: Môžem použiť azd s Azure DevOps?
**Odpoveď**: Áno, azd funguje s akýmkoľvek CI/CD systémom. Vytvorte Azure DevOps pipeline, ktoré používajú azd príkazy.

### Otázka: Ako prispieť do azd alebo vytvoriť komunitné šablóny?
**Odpoveď**: 
1. **azd nástroj**: Prispievajte do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablóny**: Postupujte podľa [pokynov na príspevok do Awesome AZD gallery](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentácia**: Prispievajte do dokumentácie na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Otázka: Aký je plán vývoja azd?
**Odpoveď**: Skontrolujte [oficiálny plán vývoja](https://github.com/Azure/azure-dev/projects) pre plánované funkcie a vylepšenia.

### Otázka: Ako migrovať z iných nástrojov nasadenia na azd?
**Odpoveď**: 
1. Analyzujte aktuálnu architektúru nasadenia
2. Vytvorte ekvivalentné Bicep šablóny
3. Nakonfigurujte `azure.yaml` tak, aby zodpovedal aktuálnym službám
4. Dôkladne testujte vo vývojovom prostredí
5. Postupne migrujte prostredia

---

## Máte ešte otázky?

### **Najprv vyhľadajte**
- Skontrolujte [oficiálnu dokumentáciu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Vyhľadajte v [GitHub issues](https://github.com/Azure/azure-dev/issues) podobné problémy

### **Získajte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora komunity
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické otázky
- [Azure Discord](https://discord.gg/azure) - Komunitný chat v reálnom čase

### **Nahláste problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlásenia chýb a žiadosti o funkcie
- Priložte relevantné logy, chybové správy a kroky na reprodukciu

### **Viac informácií**
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technické usmernenie revidované: 4. novembra 2026. Dostupnosť cloudových služieb a ceny je potrebné vždy overiť podľa vášho predplatného a regiónu.*

---

**Navigácia**
- **Predchádzajúca lekcia**: [Glosár](glossary.md)
- **Ďalšia lekcia**: [Študijný sprievodca](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->