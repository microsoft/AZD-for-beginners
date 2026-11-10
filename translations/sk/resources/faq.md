# Často kladené otázky (FAQ)

**Získajte pomoc podľa kapitol**
- **📚 Domovská stránka kurzu**: [AZD pre začiatočníkov](../README.md)
- **🚆 Problémy s inštaláciou**: [Kapitola 1: Inštalácia a nastavenie](../docs/chapter-01-foundation/installation.md)
- **🤖 Otázky o AI**: [Kapitola 2: Vývoj s AI na prvom mieste](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Riešenie problémov**: [Kapitola 7: Riešenie problémov a ladenie](../docs/chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexný FAQ poskytuje odpovede na najčastejšie otázky týkajúce sa Azure Developer CLI (azd) a nasadzovania do Azure. Nájdite rýchle riešenia bežných problémov, pochopte najlepšie postupy a získajte objasnenie konceptov a pracovných tokov azd.

## Ciele učenia

Preštudovaním tohto FAQ budete:
- Nachádzať rýchle odpovede na bežné otázky a problémy Azure Developer CLI
- Pochopiť kľúčové koncepty a terminológiu prostredníctvom praktických otázok a odpovedí
- Získať prístup k riešeniam problémov pre časté chyby a situácie
- Naučiť sa najlepšie postupy prostredníctvom často kladených otázok o optimalizácii
- Objaviť pokročilé funkcie a možnosti cez otázky na úrovni expertov
- Efektívne získať odkazy na pokyny týkajúce sa nákladov, zabezpečenia a stratégie nasadenia

## Výsledky učenia

Pravidelným odkazovaním na tento FAQ budete schopní:
- Samostatne riešiť bežné problémy Azure Developer CLI pomocou poskytnutých riešení
- Robiť informované rozhodnutia o stratégiách nasadenia a konfiguráciách
- Pochopiť vzťah medzi azd a ďalšími Azure nástrojmi a službami
- Uplatňovať najlepšie postupy na základe skúseností komunity a odporúčaní expertov
- Efektívne riešiť problémy s autentifikáciou, nasadením a konfiguráciou
- Optimalizovať náklady a výkon pomocou poznatkov z FAQ a odporúčaní

## Obsah

- [Začíname](#getting-started)
- [Autentifikácia a prístup](#authentication--access)
- [Šablóny a projekty](#templates--projects)
- [Nasadenie a infraštruktúra](#deployment--infrastructure)
- [Konfigurácia a prostredia](#configuration--environments)
- [Riešenie problémov](#troubleshooting)
- [Náklady a fakturácia](#cost--billing)
- [Najlepšie postupy](#best-practices)
- [Pokročilé témy](#advanced-topics)

---

## Začíname

### Otázka: Čo je Azure Developer CLI (azd)?
**Odpoveď**: Azure Developer CLI (azd) je príkazový nástroj zameraný na vývojárov, ktorý zrýchľuje čas potrebný na presun vašej aplikácie z lokálneho vývojového prostredia do Azure. Poskytuje najlepšie postupy cez šablóny a pomáha počas celého životného cyklu nasadenia.

### Otázka: Čím sa azd líši od Azure CLI?
**Odpoveď**: 
- **Azure CLI**: Všeobecný nástroj na správu zdrojov v Azure
- **azd**: Nástroj zameraný na vývojárov pre pracovné toky nasadenia aplikácií
- azd má vlastný autentifikačný a nasadzovací pracovný tok; Azure CLI je samostatný, doplnkový nástroj
- azd obsahuje šablóny, správu prostredí a automatizáciu nasadenia

### Otázka: Potrebujem mať nainštalovaný Azure CLI na používanie azd?
**Odpoveď**: Nie pre základný pracovný tok AZD. Autentifikujte sa pomocou `azd auth login`. Azure CLI inštalujte samostatne, keď šablóna alebo cvičenie explicitne spustí príkazy `az`.

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

### Otázka: Môžem používať azd s existujúcimi projektmi?
**Odpoveď**: Áno! Môžete:
1. Použiť `azd init` na pridanie konfigurácie azd do existujúcich projektov
2. Prispôsobiť existujúce projekty tak, aby zodpovedali štruktúre šablóny azd
3. Vytvoriť vlastné šablóny na základe vašej existujúcej architektúry

---

## Autentifikácia a prístup

### Otázka: Ako sa autentifikovať v Azure pomocou azd?
**Odpoveď**: Použite `azd auth login`, ktorý otvorí okno prehliadača na autentifikáciu v Azure. Pre scenáre CI/CD používajte servisné princípy alebo spravované identity.

### Otázka: Môžem používať azd s viacerými Azure predplatnými?
**Odpoveď**: Áno. Použite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` na určenie, ktoré predplatné sa má použiť pre každé prostredie.

### Otázka: Aké oprávnenia potrebujem na nasadenie pomocou azd?
**Odpoveď**: Zvyčajne potrebujete:
- rolu **Prispievateľa** na skupine zdrojov alebo predplatnom
- rolu **Správcu prístupu používateľov**, ak nasadzujete zdroje, ktoré vyžadujú prideľovanie rolí
- Konkrétne oprávnenia sa líšia podľa šablón a zdrojov, ktoré sa nasadzujú

### Otázka: Môžem používať azd v CI/CD pipeline?
**Odpoveď**: Určite! azd je navrhnutý pre integráciu s CI/CD. Použite servisné princípy na autentifikáciu a nastavte premenné prostredia na konfiguráciu.

### Otázka: Ako riešiť autentifikáciu v GitHub Actions?
**Odpoveď**: Preferujte federáciu identity záťaže (OIDC), nakonfigurovanú pomocou `azd pipeline config`. Generovaný pracovný tok inštaluje AZD a autentifikuje AZD priamo pomocou federovanej identity. Samotný krok `azure/login` nezabezpečuje prihlásenie AZD. Krok prihlásenia v rámci existujúcej úlohy je:
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

Po prihlásení vykonajte provisions alebo nasadenie s nastaveným prostredím AZD, predplatným a lokalitou. Federované poverenie identity musí dôverovať repozitáru/odkazu alebo prostrediu GitHub priebehu a jej Azure role musia povoliť požadované operácie.

---

## Šablóny a projekty

### Otázka: Kde nájdem šablóny azd?
**Odpoveď**: 
- Oficiálne a komunitné šablóny: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Komunitné šablóny: GitHub vyhľadávanie "azd-template"
- Použite `azd template list` na prehliadanie dostupných šablón

### Otázka: Ako vytvoriť vlastnú šablónu?
**Odpoveď**: 
1. Začnite so štruktúrou existujúcej šablóny
2. Upraviť `azure.yaml`, infraštruktúrne súbory a aplikačný kód
3. Dôkladne otestovať pomocou `azd up`
4. Publikovať na GitHub s príslušnými tagmi

### Otázka: Môžem použiť azd bez šablóny?
**Odpoveď**: Áno, použite `azd init` v existujúcom projekte na vytvorenie potrebných konfiguračných súborov. Manuálne budete musieť nakonfigurovať `azure.yaml` a infraštruktúrne súbory.

### Otázka: Aký je rozdiel medzi oficiálnymi a komunitnými šablónami?
**Odpoveď**: 
- **Oficiálne šablóny**: Udržiavané Microsoftom, pravidelne aktualizované, komplexná dokumentácia
- **Komunitné šablóny**: Vytvorené vývojármi, môžu mať špecifické použitia, rôzna kvalita a údržba

### Otázka: Ako aktualizovať šablónu v mojom projekte?
**Odpoveď**: Šablóny sa neaktualizujú automaticky. Môžete:
1. Manuálne porovnať a zlúčiť zmeny zo zdrojovej šablóny
2. Začať znova s `azd init` použitím aktualizovanej šablóny
3. Vybrať konkrétne vylepšenia z aktualizovaných šablón

---

## Nasadenie a infraštruktúra

### Otázka: Aké Azure služby môže azd nasadiť?
**Odpoveď**: azd môže nasadiť akúkoľvek Azure službu cez Bicep/ARM šablóny, vrátane:
- App Services, Container Apps, Functions
- Databázy (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Sieťové, bezpečnostné a monitorovacie zdroje

### Otázka: Môžem nasadiť do viacerých regiónov?
**Odpoveď**: Áno, nastavte viacero regiónov vo vašich Bicep šablónach a správne nastavte parameter umiestnenia pre každé prostredie.

### Otázka: Ako riešiť migrácie schémy databázy?
**Odpoveď**: Použite nasadzovacie háčiky v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Otázka: Môžem nasadiť len infraštruktúru bez aplikácií?
**Odpoveď**: Áno, použite `azd provision` na nasadenie len infraštruktúrnych komponentov definovaných vo vašich šablónach.

### Otázka: Ako nasadiť do existujúcich Azure zdrojov?
**Odpoveď**: Áno, ak to šablóna podporuje. Odkážte sa na existujúce zdroje pomocou Bicep deklarácií `existing` alebo parametrov šablóny pre existujúce zdroje a mapujte aplikačné služby na ich určené ciele. Toto neimportuje vlastníctvo ani automaticky nevytvára chýbajúce oprávnenia. Pred nasadením prezrite šablónu.

### Otázka: Môžem namiesto Bicep používať Terraform?
**Odpoveď**: Áno. AZD podporuje Terraform aj Bicep. Vyberte šablónu založenú na Terraform alebo nakonfigurujte `infra.provider: terraform` v `azure.yaml` s príslušnými Terraform súbormi a konfiguráciou stavu/backendu. Pozrite [Terraform pracovný tok](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurácia a prostredia

### Otázka: Ako spravovať rôzne prostredia (dev, staging, prod)?
**Odpoveď**: Vytvorte samostatné prostredia pomocou `azd env new <environment-name>` a nastavte pre každé rôzne nastavenia:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Otázka: Kde sú uložené konfigurácie prostredí?
**Odpoveď**: V priečinku `.azure` vo vašom projektovom adresári. Každé prostredie má vlastný priečinok s konfiguračnými súbormi.

### Otázka: Ako nastaviť konfiguráciu špecifickú pre prostredie?
**Odpoveď**: Použite `azd env set` na nastavenie premenných prostredia:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Otázka: Môžem zdieľať konfigurácie prostredí medzi členmi tímu?
**Odpoveď**: Priečinok `.azure` obsahuje citlivé informácie a nemal by sa commitovať do verzovacieho systému. Namiesto toho:
1. Zdokumentujte požadované premenné prostredia
2. Použite nasadzovacie skripty na nastavenie prostredí
3. Použite Azure Key Vault na citlivé konfigurácie

### Otázka: Ako prekryť predvolené hodnoty šablóny?
**Odpoveď**: Nastavte premenné prostredia, ktoré zodpovedajú parameterom šablóny:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Len premenné využívané šablónou ovplyvňujú nasadenie. `SKU_NAME` vyššie je príklad vlastného vstupu, nie univerzálne nastavenie AZD.

---

## Riešenie problémov

### Otázka: Prečo zlyháva `azd up`?
**Odpoveď**: Bežné príčiny:
1. **Problémy s autentifikáciou**: Spustite `azd auth login`
2. **Nedostatočné povolenia**: Skontrolujte priradenia rolí v Azure
3. **Konflikty názvov zdrojov**: Skontrolujte konfliktný zdroj a vstupy názvov v šablóne; ak potrebujete izoláciu, vytvorte samostatné prostredie pomocou `azd env new`
4. **Problémy s kvótami/kapacitami**: Skontrolujte dostupnosť v regióne
5. **Chyby v šablóne**: Validujte Bicep šablóny

### Otázka: Ako debugovať zlyhania nasadenia?
**Odpoveď**: 
1. Použite `azd deploy --debug` na podrobný výstup
2. Skontrolujte históriu nasadení v Azure portáli
3. Prezrite si záznamy aktivít v Azure portáli
4. Použite `azd show` na zobrazenie aktuálneho stavu prostredia

### Otázka: Prečo moje premenné prostredia nefungujú?
**Odpoveď**: Skontrolujte:
1. Názvy premenných presne zodpovedajú parametrom šablóny
2. Hodnoty sú správne uzavreté v úvodzovkách, ak obsahujú medzery
3. Je vybraté prostredie: `azd env select <environment>`
4. Premenné sú nastavené v správnom prostredí

### Otázka: Ako vyčistiť neúspešné nasadenia?
**Odpoveď**: 
```bash
azd down
```
 Najprv si preverte vybrané prostredie a potvrdenie zmazania. Toto zmaže nasadené Azure zdroje, nie lokálnu konfiguráciu prostredia `.azure`. `--purge` taktiež požiada o trvalé zmazanie podporovaných soft-deleted zdrojov a môže byť blokovaná ochranou proti uchovaniu/odstráneniu; nie je to rutinný krok obnovy.

### Otázka: Prečo nie je moja aplikácia dostupná po nasadení?
**Odpoveď**: Skontrolujte:
1. Nasadenie bolo úspešné
2. Aplikácia beží (skontrolujte logy v Azure portáli)
3. Sieťové bezpečnostné skupiny povoľujú prevádzku
4. DNS/vlastné domény sú správne nakonfigurované

---

## Náklady a fakturácia

### Otázka: Koľko budú stáť nasadenia pomocou azd?
**Odpoveď**: Náklady závisia od:
- Azure služieb, ktoré nasadíte
- Vybraných služobných úrovní/SKU
- Regionálnych cenových rozdielov
- Vzorcov používania

Použite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pre odhady.

### Otázka: Ako kontrolovať náklady pri nasadeniach azd?
**Odpoveď**: 
1. Používajte nízke triedy SKU pre vývojové prostredia
2. Nastavte rozpočty a upozornenia v Azure
3. Používajte `azd down` na odstránenie zdrojov, keď nie sú potrebné
4. Vyberajte vhodné regióny (náklady sa líšia podľa lokality)
5. Používajte nástroje Azure Cost Management

### Otázka: Existujú bezplatné úrovne pre šablóny azd?
**Odpoveď**: Niektoré služby majú bezplatné SKU alebo mesačné granty, podliehajúce oprávneniu, plánu hostingu, regiónu a limitom predplatného. To však nespravuje celú šablónu bezplatne: databázy, vyhľadávanie, sieťovanie, registre, telemetria a inferencia modelov môžu používať samostatné poplatky. Pred nasadením si skontrolujte [zoznam bezplatných služieb Azure](https://azure.microsoft.com/free/) a aktuálne ceny každého zdroja.

### Otázka: Ako odhadnúť náklady pred nasadením?
**Odpoveď**: 
1. Prezrite si `main.bicep` v šablóne, aby ste videli, aké zdroje budú vytvorené
2. Použite Azure Pricing Calculator s konkrétnymi SKU
3. Najskôr nasadzujte do vývojového prostredia a sledujte skutočné náklady
4. Používajte Azure Cost Management pre podrobnú analýzu nákladov

---

## Najlepšie postupy

### Otázka: Aké sú najlepšie postupy pre štruktúru projektu azd?
**Odpoveď**: 
1. Držte aplikačný kód oddelene od infraštruktúry
2. Používajte zmysluplné názvy služieb v `azure.yaml`
3. Implementujte správne spracovanie chýb v build skriptoch
4. Využívajte konfigurácie špecifické pre prostredie
5. Zahrňte obsiahlu dokumentáciu

### Otázka: Ako by som mal organizovať viaceré služby v azd?
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

### Otázka: Mám commitovať priečinok `.azure` do verzovacieho systému?
**Odpoveď**: **Nie!** Priečinok `.azure` obsahuje citlivé informácie. Pridajte ho do `.gitignore`:
```gitignore
.azure/
```

### O: Ako mám zaobchádzať s tajnými údajmi a citlivou konfiguráciou?
**O**: 
1. Použite Azure Key Vault pre tajné údaje
2. Odkazujte tajné údaje z Key Vault v konfigurácii aplikácie
3. Nikdy nezverejňujte tajné údaje do verzionovacieho systému
4. Používajte spravované identity na autentifikáciu medzi službami

### O: Aký je odporúčaný prístup pre CI/CD s azd?
**O**: 
1. Použite samostatné prostredia pre každý stupeň (vývoj/testovanie/produkcia)
2. Implementujte automatizované testovanie pred nasadením
3. Používajte servisné princípy na autentifikáciu
4. Ukladajte citlivú konfiguráciu do tajomstiev/premenných pipeline
5. Zaveste schvaľovacie brány pre produkčné nasadenia

---

## Pokročilé témy

### O: Môžem rozšíriť azd o vlastnú funkcionalitu?
**O**: Áno, cez deployment hooky v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### O: Ako môžem integrovať azd s existujúcimi DevOps procesmi?
**O**: 
1. Používajte príkazy azd v existujúcich pipeline skriptoch
2. Štandardizujte azd šablóny naprieč tímami
3. Integrujte s existujúcim monitorovaním a upozorňovaním
4. Používajte JSON výstup azd pre integráciu do pipeline

### O: Môžem použiť azd s Azure DevOps?
**O**: Áno, azd funguje s akýmkoľvek CI/CD systémom. Vytvorte Azure DevOps pipeline, ktoré používajú príkazy azd.

### O: Ako môžem prispieť do azd alebo vytvoriť komunitné šablóny?
**O**: 
1. **azd nástroj**: Prispievajte do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablóny**: Nasledujte [pokyny na príspevky do galérie Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentácia**: Prispievajte do dokumentácie na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### O: Aká je cesta rozvoja azd?
**O**: Pozrite si [oficiálnu cestu rozvoja](https://github.com/Azure/azure-dev/projects) pre plánované funkcie a vylepšenia.

### O: Ako migrovať z iných nástrojov na nasadzovanie na azd?
**O**: 
1. Analyzujte súčasnú architektúru nasadenia
2. Vytvorte ekvivalentné Bicep šablóny
3. Nakonfigurujte `azure.yaml` tak, aby zodpovedal súčasným službám
4. Dôkladne otestujte vo vývojovom prostredí
5. Postupne migrujte prostredia

---

## Máte ešte otázky?

### **Najskôr vyhľadajte**
- Skontrolujte [oficiálnu dokumentáciu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Vyhľadajte v [GitHub issues](https://github.com/Azure/azure-dev/issues) podobné problémy

### **Získajte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora komunity
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické otázky
- [Azure Discord](https://discord.gg/azure) - Chat komunity v reálnom čase

### **Nahláste problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlásenia chýb a požiadavky na funkcie
- Priložte relevantné logy, chybové hlásenia a kroky na reprodukciu

### **Naučte sa viac**
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technické usmernenie revidované: 4. novembra 2026. Dostupnosť cloudu a ceny treba overiť pre váš odber a región.*

---

**Navigácia**
- **Predchádzajúca lekcia**: [Glosár](glossary.md)
- **Nasledujúca lekcia**: [Študijný sprievodca](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->