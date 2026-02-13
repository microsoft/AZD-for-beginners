# Často kladené otázky (FAQ)

**Získajte pomoc podľa kapitoly**
- **📚 Course Home**: [AZD pre začiatočníkov](../README.md)
- **🚆 Installation Issues**: [Kapitola 1: Inštalácia & Nastavenie](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Kapitola 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Kapitola 7: Riešenie problémov & Ladenie](../docs/troubleshooting/common-issues.md)

## Úvod

Táto komplexná sekcia FAQ poskytuje odpovede na najčastejšie otázky týkajúce sa Azure Developer CLI (azd) a nasadení v Azure. Nájdete rýchle riešenia bežných problémov, pochopenie osvedčených postupov a objasnenie konceptov a pracovných postupov azd.

## Ciele učenia

Po preštudovaní tohto FAQ budete:
- Nalieť rýchle odpovede na bežné otázky a problémy súvisiace s Azure Developer CLI
- Pochopiť kľúčové koncepty a terminológiu prostredníctvom praktického formátu otázok a odpovedí
- Získať prístup k riešeniam pri častých problémoch a chybových scénároch
- Naučiť sa osvedčené postupy prostredníctvom často kladených otázok o optimalizácii
- Objaviť pokročilé funkcie a možnosti cez otázky na úrovni expertov
- Efektívne získať odporúčania týkajúce sa nákladov, bezpečnosti a nasadzovacích stratégií

## Očakávané výsledky učenia

Pri pravidelnom odkazovaní na toto FAQ budete schopní:
- Riešiť bežné problémy Azure Developer CLI samostatne pomocou poskytnutých riešení
- Robiť informované rozhodnutia o stratégiách a konfiguráciách nasadenia
- Pochopiť vzťah medzi azd a ostatnými nástrojmi a službami Azure
- Aplikovať osvedčené postupy založené na skúsenostiach komunity a odporúčaniach odborníkov
- Efektívne riešiť problémy s autentifikáciou, nasadením a konfiguráciou
- Optimalizovať náklady a výkon pomocou poznatkov z FAQ

## Obsah

- [Začíname](../../../resources)
- [Autentifikácia & Prístup](../../../resources)
- [Šablóny & Projekty](../../../resources)
- [Nasadenie & Infraštruktúra](../../../resources)
- [Konfigurácia & Prostredia](../../../resources)
- [Riešenie problémov](../../../resources)
- [Náklady & Fakturácia](../../../resources)
- [Osvedčené postupy](../../../resources)
- [Pokročilé témy](../../../resources)

---

## Začíname

### Otázka: Čo je Azure Developer CLI (azd)?
**Odpoveď**: Azure Developer CLI (azd) je vývojársky zameraný príkazový nástroj, ktorý urýchľuje proces presunu aplikácie z lokálneho vývojového prostredia do Azure. Poskytuje osvedčené postupy cez šablóny a pomáha s celým životným cyklom nasadenia.

### Otázka: Ako sa azd líši od Azure CLI?
**Odpoveď**: 
- **Azure CLI**: Nástroj všeobecného určenia na správu zdrojov Azure
- **azd**: Nástroj zameraný na vývojárov pre pracovné postupy nasadenia aplikácií
- azd používa Azure CLI vnútorně, ale poskytuje vyššie úrovňové abstrakcie pre bežné vývojárske scenáre
- azd obsahuje šablóny, správu prostredí a automatizáciu nasadenia

### Otázka: Potrebujem mať nainštalovaný Azure CLI na používanie azd?
**Odpoveď**: Áno, azd vyžaduje Azure CLI pre autentifikáciu a niektoré operácie. Najprv nainštalujte Azure CLI, potom nainštalujte azd.

### Otázka: Aké programovacie jazyky azd podporuje?
**Odpoveď**: azd je nezávislý na jazyku. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické weby
- Kontajnerizované aplikácie

### Otázka: Môžem používať azd s existujúcimi projektmi?
**Odpoveď**: Áno! Môžete buď:
1. Použiť `azd init` na pridanie konfigurácie azd do existujúcich projektov
2. Prispôsobiť existujúce projekty tak, aby zodpovedali štruktúre šablóny azd
3. Vytvoriť vlastné šablóny založené na vašej existujúcej architektúre

---

## Autentifikácia & Prístup

### Otázka: Ako sa autentifikovať do Azure pomocou azd?
**Odpoveď**: Použite `azd auth login`, ktorý otvorí okno prehliadača pre autentifikáciu do Azure. Pre CI/CD scenáre použite service principals alebo managed identities.

### Otázka: Môžem používať azd s viacerými predplatnými Azure?
**Odpoveď**: Áno. Použite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` na určenie, ktoré predplatné sa má použiť pre každé prostredie.

### Otázka: Aké oprávnenia potrebujem na nasadenie s azd?
**Odpoveď**: Zvyčajne potrebujete:
- rolu **Contributor** na resource group alebo predplatnom
- **User Access Administrator**, ak nasadzujete prostriedky, ktoré vyžadujú priradenia rolí
- Konkrétne povolenia sa líšia podľa šablóny a nasadzovaných zdrojov

### Otázka: Môžem používať azd v CI/CD pipeline?
**Odpoveď**: Určite! azd je navrhnutý pre integráciu CI/CD. Použite service principals pre autentifikáciu a nastavte premenné prostredia pre konfiguráciu.

### Otázka: Ako riešiť autentifikáciu v GitHub Actions?
**Odpoveď**: Použite akciu Azure Login s povereniami service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Šablóny & Projekty

### Otázka: Kde nájdem šablóny azd?
**Odpoveď**: 
- Oficiálne šablóny: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Šablóny komunity: Hľadajte na GitHub "azd-template"
- Použite `azd template list` na prezretie dostupných šablón

### Otázka: Ako vytvorím vlastnú šablónu?
**Odpoveď**: 
1. Začnite s existujúcou štruktúrou šablóny
2. Upraviť `azure.yaml`, infraštruktúrne súbory a aplikačný kód
3. Dôkladne otestujte pomocou `azd up`
4. Zverejnite na GitHub s príslušnými tagmi

### Otázka: Môžem používať azd bez šablóny?
**Odpoveď**: Áno, použite `azd init` v existujúcom projekte na vytvorenie potrebných konfiguračných súborov. Budete musieť manuálne nakonfigurovať `azure.yaml` a infraštruktúrne súbory.

### Otázka: Aký je rozdiel medzi oficiálnymi a komunitnými šablónami?
**Odpoveď**: 
- **Oficiálne šablóny**: Udržiavané Microsoftom, pravidelne aktualizované, s komplexnou dokumentáciou
- **Komunitné šablóny**: Vytvorené vývojármi, môžu mať špecializované prípady použitia, rôzna kvalita a údržba

### Otázka: Ako aktualizujem šablónu vo svojom projekte?
**Odpoveď**: Šablóny sa neaktualizujú automaticky. Môžete:
1. Manuálne porovnať a zlúčiť zmeny zo zdrojovej šablóny
2. Začať nanovo pomocou `azd init` s aktualizovanou šablónou
3. Vybrať konkrétne vylepšenia z aktualizovaných šablón

---

## Nasadenie & Infraštruktúra

### Otázka: Aké služby Azure môže azd nasadiť?
**Odpoveď**: azd môže nasadiť akúkoľvek službu Azure cez Bicep/ARM šablóny, vrátane:
- App Services, Container Apps, Functions
- Databáz (SQL, PostgreSQL, Cosmos DB)
- Úložiska, Key Vault, Application Insights
- Sieťovania, bezpečnostných a monitorovacích zdrojov

### Otázka: Môžem nasadiť do viacerých regiónov?
**Odpoveď**: Áno, nakonfigurujte viaceré regióny vo vašich Bicep šablónach a nastavte parameter location primerane pre každé prostredie.

### Otázka: Ako riešiť migrácie databázovej schémy?
**Odpoveď**: Použite deployment hooks v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Otázka: Môžem nasadiť len infraštruktúru bez aplikácií?
**Odpoveď**: Áno, použite `azd provision` na nasadenie iba infraštruktúrnych komponentov definovaných vo vašich šablónach.

### Otázka: Ako nasadiť na existujúce zdroje Azure?
**Odpoveď**: To je zložité a nie je priamo podporované. Môžete:
1. Importovať existujúce zdroje do vašich Bicep šablón
2. Použiť referencie na existujúce zdroje v šablónach
3. Upraviť šablóny tak, aby podmienečne vytvárali alebo referencovali zdroje

### Otázka: Môžem namiesto Bicep používať Terraform?
**Odpoveď**: Momentálne azd primárne podporuje Bicep/ARM šablóny. Podpora pre Terraform nie je oficiálne dostupná, hoci môžu existovať komunitné riešenia.

---

## Konfigurácia & Prostredia

### Otázka: Ako spravovať rôzne prostredia (dev, staging, prod)?
**Odpoveď**: Vytvorte samostatné prostredia pomocou `azd env new <environment-name>` a nakonfigurujte pre každé odlišné nastavenia:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Otázka: Kde sú uložené konfigurácie prostredia?
**Odpoveď**: V priečinku `.azure` vo vašom projektovom adresári. Každé prostredie má svoju vlastnú zložku s konfiguračnými súbormi.

### Otázka: Ako nastaviť konfiguráciu špecifickú pre prostredie?
**Odpoveď**: Použite `azd env set` na konfiguráciu premenných prostredia:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Otázka: Môžem zdieľať konfigurácie prostredia medzi členmi tímu?
**Odpoveď**: Zložka `.azure` obsahuje citlivé informácie a nemala by byť commitnutá do verzovacieho systému. Namiesto toho:
1. Zdokumentujte potrebné premenné prostredia
2. Použite nasadzovacie skripty na nastavenie prostredí
3. Použite Azure Key Vault pre citlivú konfiguráciu

### Otázka: Ako prepíšem predvolené hodnoty šablóny?
**Odpoveď**: Nastavte premenné prostredia, ktoré zodpovedajú parametrom šablóny:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Riešenie problémov

### Otázka: Prečo `azd up` zlyháva?
**Odpoveď**: Bežné príčiny:
1. **Problémy s autentifikáciou**: Spustite `azd auth login`
2. **Nedostatočné oprávnenia**: Skontrolujte priradenia rolí v Azure
3. **Konflikty názvov zdrojov**: Zmeňte AZURE_ENV_NAME
4. **Problémy s kvótami/kapacitou**: Skontrolujte dostupnosť v regióne
5. **Chyby v šablónach**: Overte Bicep šablóny

### Otázka: Ako debugovať zlyhania nasadenia?
**Odpoveď**: 
1. Použite `azd deploy --debug` pre podrobný výpis
2. Skontrolujte históriu nasadení v Azure porte
3. Prezrite si Activity Log v Azure porte
4. Použite `azd show` na zobrazenie aktuálneho stavu prostredia

### Otázka: Prečo moje premenné prostredia nefungujú?
**Odpoveď**: Skontrolujte:
1. Mená premenných presne zodpovedajú parametroch šablóny
2. Hodnoty sú správne uzavreté v úvodzovkách, ak obsahujú medzery
3. Je vybrané správne prostredie: `azd env select <environment>`
4. Premenné sú nastavené v správnom prostredí

### Otázka: Ako vyčistiť neúspešné nasadenia?
**Odpoveď**: 
```bash
azd down --force --purge
```
Toto odstráni všetky zdroje a konfiguráciu prostredia.

### Otázka: Prečo moja aplikácia nie je prístupná po nasadení?
**Odpoveď**: Skontrolujte:
1. Nasadenie bolo úspešne dokončené
2. Aplikácia beží (skontrolujte logy v Azure porte)
3. Sieťové bezpečnostné skupiny povoľujú prenos
4. DNS/vlastné domény sú správne nakonfigurované

---

## Náklady & Fakturácia

### Otázka: Koľko budú stáť nasadenia azd?
**Odpoveď**: Náklady závisia od:
- Nasadených služieb Azure
- Vybraných úrovní služieb/SKU
- Cenových rozdielov podľa regiónu
- Vzorcov využitia

Použite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) na odhad.

### Otázka: Ako kontrolovať náklady pri nasadeniach azd?
**Odpoveď**: 
1. Použite nižšie SKU pre vývojové prostredia
2. Nastavte Azure rozpočty a upozornenia
3. Použite `azd down` na odstránenie zdrojov, keď nie sú potrebné
4. Vyberte vhodné regióny (ceny sa líšia podľa lokality)
5. Použite nástroje Azure Cost Management

### Otázka: Existujú možnosti bezplatnej úrovne pre šablóny azd?
**Odpoveď**: Mnohé služby Azure ponúkajú bezplatné úrovne:
- App Service: dostupná bezplatná úroveň
- Azure Functions: 1M bezplatných vykonaní/mesiac
- Cosmos DB: bezplatná úroveň s 400 RU/s
- Application Insights: prvých 5GB/mesiac zadarmo

Nakonfigurujte šablóny, aby používali bezplatné úrovne tam, kde sú dostupné.

### Otázka: Ako odhadnúť náklady pred nasadením?
**Odpoveď**: 
1. Prezrite si `main.bicep` šablóny, aby ste videli, aké zdroje sa vytvárajú
2. Použite Azure Pricing Calculator s konkrétnymi SKU
3. Nasadte do vývojového prostredia najprv a sledujte skutočné náklady
4. Použite Azure Cost Management pre detailnú analýzu nákladov

---

## Osvedčené postupy

### Otázka: Aké sú osvedčené postupy pre štruktúru projektu azd?
**Odpoveď**: 
1. Oddelte aplikačný kód od infraštruktúry
2. Používajte zmysluplné názvy služieb v `azure.yaml`
3. Implementujte správne spracovanie chýb v build skriptoch
4. Používajte konfiguráciu špecifickú pre prostredie
5. Zahrňte komplexnú dokumentáciu

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

### Otázka: Mal by som commitovať zložku `.azure` do verzovacieho systému?
**Odpoveď**: **Nie!** Zložka `.azure` obsahuje citlivé informácie. Pridajte ju do `.gitignore`:
```gitignore
.azure/
```

### Otázka: Ako riešiť tajomstvá a citlivú konfiguráciu?
**Odpoveď**: 
1. Použite Azure Key Vault pre tajomstvá
2. Referencujte tajomstvá Key Vault v konfigurácii aplikácie
3. Nikdy necommitujte tajomstvá do verzovacieho systému
4. Použite managed identities pre autentifikáciu medzi službami

### Otázka: Aký je odporúčaný prístup pre CI/CD s azd?
**Odpoveď**: 
1. Použite samostatné prostredia pre každú fázu (dev/staging/prod)
2. Implementujte automatizované testovanie pred nasadením
3. Použite service principals pre autentifikáciu
4. Ukladajte citlivú konfiguráciu v secrets/variables pipeline
5. Zaveste schvaľovacie brány pre produkčné nasadenia

---

## Pokročilé témy

### Otázka: Môžem rozšíriť azd o vlastnú funkcionalitu?
**Odpoveď**: Áno, cez deployment hooks v `azure.yaml`:
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
2. Štandardizujte šablóny azd naprieč tímami
3. Integrujte s existujúcim monitoringom a upozorňovaním
4. Používajte JSON výstup azd pre integráciu do pipeline

### Otázka: Môžem používať azd s Azure DevOps?
**Odpoveď**: Áno, azd funguje s akýmkoľvek CI/CD systémom. Vytvorte Azure DevOps pipeline, ktoré používajú príkazy azd.

### Otázka: Ako prispieť do azd alebo vytvoriť komunitné šablóny?
**Odpoveď**:
1. **azd tool**: Prispieť do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Vytvoriť šablóny podľa [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Documentation**: Prispieť do dokumentácie na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: What's the roadmap for azd?
**A**: Skontrolujte [oficiálny plán](https://github.com/Azure/azure-dev/projects) pre plánované funkcie a vylepšenia.

### Q: How do I migrate from other deployment tools to azd?
**A**: 
1. Analyzujte súčasnú architektúru nasadzovania
2. Vytvorte ekvivalentné šablóny Bicep
3. Nakonfigurujte `azure.yaml`, aby zodpovedal súčasným službám
4. Dôkladne otestujte vo vývojovom prostredí
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

### **Nahlásiť problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlásenia chýb a požiadavky na funkcie
- Zahrňte príslušné logy, chybové hlásenia a kroky na reprodukciu

### **Zistite viac**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Táto FAQ je pravidelne aktualizovaná. Naposledy aktualizované: 9. septembra 2025*

---

**Navigácia**
- **Predchádzajúca lekcia**: [Glosár](glossary.md)
- **Ďalšia lekcia**: [Študijný sprievodca](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->