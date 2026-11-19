# Často kladené otázky (FAQ)

**Získejte pomoc podle kapitol**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **🚆 Problémy s instalací**: [Kapitola 1: Instalace a nastavení](../docs/chapter-01-foundation/installation.md)
- **🤖 Otázky ohledně AI**: [Kapitola 2: Vývoj s AI na prvním místě](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Řešení problémů**: [Kapitola 7: Řešení problémů a ladění](../docs/chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexní FAQ poskytuje odpovědi na nejčastější otázky týkající se Azure Developer CLI (azd) a nasazení Azure. Najděte rychlá řešení běžných problémů, pochopte osvědčené postupy a získejte objasnění konceptů a pracovních postupů azd.

## Cíle učení

Prostřednictvím tohoto FAQ:
- Najdete rychlé odpovědi na běžné otázky a problémy Azure Developer CLI
- Pochopíte klíčové pojmy a terminologii prostřednictvím praktického formátu otázek a odpovědí
- Získáte řešení pro časté problémy a chybové scénáře
- Naučíte se osvědčené postupy založené na často kladených otázkách o optimalizaci
- Objevíte pokročilé funkce a možnosti prostřednictvím odborných otázek
- Efektivně budete odkazovat na pokyny týkající se nákladů, bezpečnosti a strategií nasazení

## Výsledky učení

Při pravidelném využívání tohoto FAQ budete schopni:
- Samostatně řešit běžné problémy Azure Developer CLI pomocí dostupných řešení
- Činit informovaná rozhodnutí o strategiích a konfiguracích nasazení
- Pochopit vztah mezi azd a dalšími nástroji a službami Azure
- Aplikovat osvědčené postupy na základě zkušeností komunity a odborných doporučení
- Účinně řešit problémy s autentizací, nasazením a konfigurací
- Optimalizovat náklady a výkon pomocí poznatků a doporučení z FAQ

## Obsah

- [Začínáme](#getting-started)
- [Autentizace a přístup](#authentication--access)
- [Šablony a projekty](#templates--projects)
- [Nasazení a infrastruktura](#deployment--infrastructure)
- [Konfigurace a prostředí](#configuration--environments)
- [Řešení problémů](#troubleshooting)
- [Náklady a fakturace](#cost--billing)
- [Osvědčené postupy](#best-practices)
- [Pokročilá témata](#advanced-topics)

---

## Začínáme

### Otázka: Co je Azure Developer CLI (azd)?
**Odpověď**: Azure Developer CLI (azd) je nástroj příkazového řádku zaměřený na vývojáře, který urychluje dobu, za kterou dostanete svou aplikaci z lokálního vývojového prostředí do Azure. Poskytuje osvědčené postupy prostřednictvím šablon a pomáhá s celým životním cyklem nasazení.

### Otázka: Jak se azd liší od Azure CLI?
**Odpověď**: 
- **Azure CLI**: Obecný nástroj pro správu Azure zdrojů
- **azd**: Nástroj zaměřený na vývojáře pro pracovní postupy nasazení aplikací
- azd má vlastní autentizační a nasazovací pracovní postup; Azure CLI je samostatný, doplňkový nástroj
- azd zahrnuje šablony, správu prostředí a automatizaci nasazení

### Otázka: Potřebuji mít nainstalovaný Azure CLI, abych mohl používat azd?
**Odpověď**: Ne pro základní pracovní postup AZD. Autentizujte se pomocí `azd auth login`. Azure CLI instalujte samostatně, pokud šablona nebo cvičení explicitně spustí příkazy `az`.

### Otázka: Jaké programovací jazyky azd podporuje?
**Odpověď**: azd je nezávislý na jazyce. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické webové stránky
- Aplikace v kontejnerech

### Otázka: Mohu použít azd se stávajícími projekty?
**Odpověď**: Ano! Můžete buď:
1. Použít `azd init` k přidání konfigurace azd do stávajících projektů
2. Přizpůsobit stávající projekty tak, aby odpovídaly struktuře šablony azd
3. Vytvořit vlastní šablony založené na vaší stávající architektuře

### Otázka: Co se změnilo s obecnou dostupností rozšíření Foundry?
**Odpověď**: Balíček `microsoft.foundry` dosáhl verze 1.0 a GA 5. listopadu 2026. S AZD 1.37.0+ použijte `azd ext install microsoft.foundry` k instalaci sedmi základních rozšíření pro agenty, připojení, inspektora, projekty, rutiny, dovednosti a nástroje. Není to nová příkazová doména a jeho komponenty mají nezávislé verze. Hodnocení, datové sady, doladění a vlastní modely se instalují samostatně; nepovinné náhledové funkce se nestávají GA jen proto, že balíček je GA.

Průvodce [hostovaným agentem](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) používá Python 3.13+ a aktuální uv. `azd ai agent run` otevírá Agent Inspector lokálně, ale volání modelu stále využívají Azure a vznikají poplatky. Režim kódu `azd deploy` nahrává zdroj pro vzdálenou kompilaci bez potřeby lokálního sestavení kontejneru.

### Otázka: Odstraní `azd down` hostovaného agenta ze stávajícího projektu Foundry?
**Odpověď**: Ne pro cestu opětovného použití projektu popsanou v rychlém startu hostovaného agenta: zanechává projekt, hostovaného agenta a další zdroje na místě. Odstraňte nežádoucí zdroje zvlášť, aniž byste odstranili sdílené zdroje. Pokud prostředí vytvořilo nový projekt Foundry, `azd down` smaže jeho skupinu prostředků a vše v ní. Před potvrzením si prostudujte [pokyny pro čištění](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) a výzvy k mazání.

---

## Autentizace a přístup

### Otázka: Jak se autentizuji do Azure pomocí azd?
**Odpověď**: Použijte `azd auth login`, který otevře okno prohlížeče k autentizaci Azure. Pro scénáře CI/CD použijte servisní principaly nebo řízené identity.

### Otázka: Mohu použít azd s více Azure subscription?
**Odpověď**: Ano. Použijte `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` k určení, kterou subscription použít pro každé prostředí.

### Otázka: Jaká oprávnění potřebuji k nasazení pomocí azd?
**Odpověď**: Obvykle potřebujete:
- roli **Contributor** na skupině prostředků nebo subscription
- **User Access Administrator**, pokud nasazujete zdroje vyžadující přiřazení rolí
- Specifická oprávnění se liší podle šablony a nasazovaných zdrojů

### Otázka: Mohu použít azd v CI/CD pipeline?
**Odpověď**: Rozhodně! azd je navržen pro integraci do CI/CD. Použijte servisní principaly pro autentizaci a nastavte proměnné prostředí pro konfiguraci.

### Otázka: Jak řešit autentizaci v GitHub Actions?
**Odpověď**: Preferujte federaci identity pracovního zatížení (OIDC), nastavenou s `azd pipeline config`. Generovaný workflow instaluje AZD a autentizuje AZD přímo s federovanou identitou. Samotný krok `azure/login` nezabezpečí přihlášení AZD. Přihlašovací krok uvnitř existující práce je:
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

Provádějte provisioning nebo nasazení po přihlášení s nastaveným prostředím AZD, subscription a umístěním. Federovaný přihlašovací údaj identity musí důvěřovat úložišti/ref repository workflow nebo GitHub prostředí a její role Azure musí dovolovat požadované operace.

---

## Šablony a projekty

### Otázka: Kde najdu azd šablony?
**Odpověď**: 
- Oficiální a komunitní šablony: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Komunitní šablony: vyhledávání na GitHubu „azd-template“
- Použijte `azd template list` k prohlížení dostupných šablon

### Otázka: Jak vytvořím vlastní šablonu?
**Odpověď**: 
1. Začněte se strukturou existující šablony
2. Upravte `azure.yaml`, infrastrukturu a aplikační kód
3. Důkladně otestujte pomocí `azd up`
4. Publikujte na GitHubu s příslušnými značkami

### Otázka: Mohu používat azd bez šablony?
**Odpověď**: Ano, použijte `azd init` ve stávajícím projektu pro vytvoření potřebných konfiguračních souborů. Budete muset ručně nakonfigurovat `azure.yaml` a infrastrukturu.

### Otázka: Jaký je rozdíl mezi oficiálními a komunitními šablonami?
**Odpověď**: 
- **Oficiální šablony**: Spravuje Microsoft, pravidelně aktualizovány, ucelená dokumentace
- **Komunitní šablony**: Vytvořené vývojáři, mohou mít specializované použití, různá kvalita a údržba

### Otázka: Jak aktualizuji šablonu ve svém projektu?
**Odpověď**: Šablony se automaticky neaktualizují. Můžete:
1. Porovnat a ručně sloučit změny ze zdrojové šablony
2. Začít znovu s `azd init` pomocí aktualizované šablony
3. Vybrat konkrétní vylepšení z aktualizovaných šablon

---

## Nasazení a infrastruktura

### Otázka: Jaké služby Azure může azd nasadit?
**Odpověď**: azd může nasadit jakoukoli službu Azure přes Bicep/ARM šablony, včetně:
- App Services, Container Apps, Functions
- Databáze (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Síťové, bezpečnostní a monitorovací zdroje

### Otázka: Mohu nasadit do více regionů?
**Odpověď**: Ano, nakonfigurujte více regionů ve svých Bicep šablonách a podle potřeby nastavte parametr umístění pro každé prostředí.

### Otázka: Jak zpracovávám migrace schémat databáze?
**Odpověď**: Použijte nasazovací hooky v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Otázka: Mohu nasadit pouze infrastrukturu bez aplikací?
**Odpověď**: Ano, použijte `azd provision` k nasazení pouze komponent infrastruktury definovaných ve vašich šablonách.

### Otázka: Jak nasadím do existujících Azure zdrojů?
**Odpověď**: Ano, pokud to šablona podporuje. Odkazujte se na existující zdroje přes deklarace `existing` v Bicep nebo dokumentované parametry šablony pro existující zdroje a mapujte aplikační služby na jejich zamýšlené cíle. Toto nepřenáší vlastnictví ani automaticky nevytváří chybějící oprávnění. Před nasazením si šablonu prostudujte.

### Otázka: Mohu použít Terraform místo Bicep?
**Odpověď**: Ano. AZD podporuje Terraform stejně jako Bicep. Vyberte šablonu založenou na Terraformu nebo nakonfigurujte `infra.provider: terraform` v `azure.yaml` s příslušnými Terraform soubory a konfigurací stavu/backendu. Viz [pracovní postup Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurace a prostředí

### Otázka: Jak spravovat různá prostředí (dev, staging, prod)?
**Odpověď**: Vytvořte samostatná prostředí pomocí `azd env new <environment-name>` a nakonfigurujte různá nastavení pro každé:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Otázka: Kde jsou uloženy konfigurace prostředí?
**Odpověď**: Ve složce `.azure` ve vašem projektovém adresáři. Každé prostředí má vlastní složku s konfiguračními soubory.

### Otázka: Jak nastavit konfiguraci specifickou pro prostředí?
**Odpověď**: Použijte `azd env set` ke konfiguraci proměnných prostředí:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Otázka: Mohu sdílet konfigurace prostředí mezi členy týmu?
**Odpověď**: Složka `.azure` obsahuje citlivé informace a neměla by být zařazena do verzovacího systému. Místo toho:
1. Dokumentujte požadované proměnné prostředí
2. Použijte nasazovací skripty k nastavení prostředí
3. Použijte Azure Key Vault pro citlivou konfiguraci

### Otázka: Jak přepsat výchozí hodnoty šablon?
**Odpověď**: Nastavte proměnné prostředí, které odpovídají parametrům šablony:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Pouze proměnné používané šablonou ovlivňují nasazení. `SKU_NAME` výše je příklad vlastního vstupu, nikoli univerzální nastavení AZD.

---

## Řešení problémů

### Otázka: Proč `azd up` selhává?
**Odpověď**: Běžné příčiny:
1. **Problémy s autentizací**: Spusťte `azd auth login`
2. **Nedostatečná oprávnění**: Zkontrolujte svá přiřazení rolí Azure
3. **Konflikty názvů zdrojů**: Zkontrolujte konfliktní zdroj a vstupy pojmenování šablony; vytvořte samostatné prostředí pomocí `azd env new`, pokud je potřeba izolace
4. **Problémy s kvótou/kapacitou**: Zkontrolujte regionální dostupnost
5. **Chyby ve šabloně**: Ověřte Bicep šablony

### Otázka: Jak ladit chyby nasazení?
**Odpověď**: 
1. Použijte `azd deploy --debug` pro podrobný výstup
2. Zkontrolujte historii nasazení v Azure portálu
3. Prohlédněte si protokol aktivit v Azure portálu
4. Použijte `azd show` k zobrazení aktuálního stavu prostředí

### Otázka: Proč moje proměnné prostředí nefungují?
**Odpověď**: Zkontrolujte:
1. Jména proměnných přesně odpovídají parametrům šablony
2. Hodnoty jsou správně v uvozovkách, pokud obsahují mezery
3. Je vybráno správné prostředí: `azd env select <environment>`
4. Proměnné jsou nastaveny ve správném prostředí

### Otázka: Jak vyčistit neúspěšná nasazení?
**Odpověď**: 
```bash
azd down
```
 Nejprve zkontrolujte vybrané prostředí a potvrzení smazání. Toto smaže nasazené Azure zdroje, nikoli místní konfiguraci prostředí `.azure`. `--purge` navíc požaduje trvalé odstranění podporovaných měkkých smazaných zdrojů a může být blokováno ochranou proti uchování/mazání; není to rutinní krok pro obnovu.

### Otázka: Proč není moje aplikace po nasazení dostupná?
**Odpověď**: Zkontrolujte:
1. Nasazení bylo dokončeno úspěšně
2. Aplikace běží (zkontrolujte logy v Azure portálu)
3. Síťové bezpečnostní skupiny umožňují provoz
4. DNS/vlastní domény jsou správně nakonfigurovány

---

## Náklady a fakturace

### Otázka: Kolik budou nasazení azd stát?
**Odpověď**: Náklady závisí na:
- nasazených službách Azure
- vybraných úrovních služeb/SKU
- regionálních cenových rozdílech
- vzorcích používání

Použijte [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pro odhady.

### Otázka: Jak ovládat náklady při nasazení azd?
**Odpověď**: 
1. Použijte nižší úrovně SKU pro vývojová prostředí
2. Nastavte rozpočty a upozornění v Azure
3. Použijte `azd down` k odstranění zdrojů, když nejsou potřeba
4. Vyberte vhodné regiony (náklady se liší podle lokality)
5. Použijte nástroje Azure Cost Management

### Q: Existují pro azd šablony možnosti zdarma?
**A**: Některé služby mají zdarma SKU nebo měsíční granty, které závisí na způsobilosti, plánu hostování, regionu a limitech předplatného. To však nedělá celou šablonu zdarma: databáze, vyhledávání, síť, registr, telemetrie a inferování modelů mohou být samostatně účtovány. Před nasazením zkontrolujte [seznam bezplatných služeb Azure](https://azure.microsoft.com/free/) a aktuální ceny každého prostředku.

### Q: Jak odhadnu náklady před nasazením?
**A**: 
1. Prohlédněte si `main.bicep` šablony, abyste zjistili, jaké prostředky jsou vytvořeny
2. Použijte Azure Pricing Calculator s konkrétními SKU
3. Nejprve nasazujte do vývojového prostředí pro sledování skutečných nákladů
4. Použijte Azure Cost Management pro podrobnou analýzu nákladů

---

## Nejlepší postupy

### Q: Jaké jsou nejlepší postupy pro strukturu projektu azd?
**A**: 
1. Udržujte aplikační kód oddělený od infrastruktury
2. Používejte smysluplné názvy služeb v `azure.yaml`
3. Implementujte správné zpracování chyb ve build skriptech
4. Používejte konfigurace specifické pro prostředí
5. Zahrňte komplexní dokumentaci

### Q: Jak mám organizovat více služeb v azd?
**A**: Použijte doporučenou strukturu:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Měl bych commitovat složku `.azure` do verzovacího systému?
**A**: **Ne!** Složka `.azure` obsahuje citlivé informace. Přidejte ji do `.gitignore`:
```gitignore
.azure/
```

### Q: Jak mám nakládat s tajnostmi a citlivou konfigurací?
**A**: 
1. Použijte Azure Key Vault pro tajemství
2. Odkazujte na tajemství Key Vault v konfiguračním souboru aplikace
3. Nikdy nezavádějte tajemství do verzovacího systému
4. Používejte spravované identity pro autentizaci služba-služba

### Q: Jaký je doporučený přístup k CI/CD s azd?
**A**: 
1. Používejte oddělená prostředí pro každý stupeň (dev/staging/prod)
2. Implementujte automatizované testování před nasazením
3. Používejte service principals pro autentizaci
4. Uchovávejte citlivou konfiguraci v tajemstvích/proměnných pipeline
5. Implementujte schvalovací brány pro produkční nasazení

---

## Pokročilá témata

### Q: Mohu rozšířit azd o vlastní funkcionalitu?
**A**: Ano, přes deployment hooks v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Jak integrovat azd s existujícími DevOps procesy?
**A**: 
1. Používejte příkazy azd ve stávajících pipeline skriptech
2. Standardizujte na azd šablony napříč týmy
3. Integrujte se stávajícím monitoringem a upozorněními
4. Používejte JSON výstup azd pro integraci pipeline

### Q: Mohu použít azd s Azure DevOps?
**A**: Ano, azd funguje s libovolným CI/CD systémem. Vytvořte Azure DevOps pipelines, které používají příkazy azd.

### Q: Jak přispět do azd nebo vytvořit komunitní šablony?
**A**: 
1. **azd nástroj**: Přispějte do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablony**: Řiďte se [pokyny pro přispění do galerie Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentace**: Přispějte do dokumentace na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Jaká je mapa cesty pro azd?
**A**: Zkontrolujte [oficiální roadmapu](https://github.com/Azure/azure-dev/projects) pro plánované funkce a vylepšení.

### Q: Jak migrovat z jiných nástrojů nasazení na azd?
**A**: 
1. Analyzujte současnou architekturu nasazení
2. Vytvořte ekvivalentní Bicep šablony
3. Nakonfigurujte `azure.yaml` tak, aby odpovídalo současným službám
4. Důkladně testujte ve vývojovém prostředí
5. Postupně migrujte prostředí

---

## Stále máte otázky?

### **Nejprve vyhledejte**
- Zkontrolujte [oficiální dokumentaci](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Vyhledejte [GitHub issues](https://github.com/Azure/azure-dev/issues) pro podobné problémy

### **Získejte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora komunity
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické otázky
- [Azure Discord](https://discord.gg/azure) - Komunitní chat v reálném čase

### **Nahlaste problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlásení chyb a požadavků na funkce
- Uveďte relevantní logy, chybové zprávy a kroky k reprodukci

### **Zjistěte více**
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technické pokyny byly přezkoumány: 4. listopadu 2026. Dostupnost cloudu a ceny je nutné zkontrolovat pro vaše předplatné a region.*

---

**Navigace**
- **Předchozí lekce**: [Glosář](glossary.md)
- **Další lekce**: [Studijní průvodce](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->