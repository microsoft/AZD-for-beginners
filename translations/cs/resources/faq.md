# Často kladené otázky (FAQ)

**Získat pomoc podle kapitol**
- **📚 Domovská stránka kurzu**: [AZD Pro začátečníky](../README.md)
- **🚆 Problémy s instalací**: [Kapitola 1: Instalace a nastavení](../docs/chapter-01-foundation/installation.md)
- **🤖 Otázky týkající se AI**: [Kapitola 2: Vývoj zaměřený na AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Řešení problémů**: [Kapitola 7: Řešení problémů a ladění](../docs/chapter-07-troubleshooting/common-issues.md)

## Úvod

Tento komplexní FAQ poskytuje odpovědi na nejčastější otázky týkající se Azure Developer CLI (azd) a nasazování na Azure. Najděte rychlá řešení běžných problémů, pochopte osvědčené postupy a získejte vysvětlení konceptů a pracovních postupů azd.

## Výukové cíle

Prostřednictvím tohoto FAQ:
- Najdete rychlé odpovědi na běžné otázky a problémy Azure Developer CLI
- Pochopíte klíčové koncepty a terminologii prostřednictvím praktického formátu otázek a odpovědí
- Získáte přístup k řešením problémů pro časté situace a chyby
- Naučíte se osvědčené postupy díky často kladeným otázkám o optimalizaci
- Objevíte pokročilé funkce a možnosti díky otázkám na expertní úrovni
- Efektivně najdete informace o nákladech, bezpečnosti a strategiích nasazení

## Výstupy učení

Pravidelným odkazováním na toto FAQ budete schopni:
- Samostatně řešit běžné problémy Azure Developer CLI pomocí poskytnutých řešení
- Dělat informovaná rozhodnutí o strategiích a konfiguracích nasazení
- Pochopit vztah mezi azd a dalšími nástroji a službami Azure
- Používat osvědčené postupy založené na zkušenostech komunity a doporučeních expertů
- Efektivně řešit problémy s autentikací, nasazením a konfigurací
- Optimalizovat náklady a výkon pomocí poznatků a doporučení z FAQ

## Obsah

- [Začínáme](#getting-started)
- [Autentikace & přístup](#authentication--access)
- [Šablony & projekty](#templates--projects)
- [Nasazení & infrastruktura](#deployment--infrastructure)
- [Konfigurace & prostředí](#configuration--environments)
- [Řešení problémů](#troubleshooting)
- [Náklady & fakturace](#cost--billing)
- [Osvědčené postupy](#best-practices)
- [Pokročilá témata](#advanced-topics)

---

## Začínáme

### Q: Co je Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) je příkazový nástroj zaměřený na vývojáře, který urychluje dobu, za kterou dostanete svou aplikaci z lokálního vývojového prostředí na Azure. Poskytuje osvědčené postupy prostřednictvím šablon a pomáhá během celého životního cyklu nasazení.

### Q: Čím se azd liší od Azure CLI?
**A**: 
- **Azure CLI**: Nástroj obecného zaměření pro správu Azure zdrojů
- **azd**: Nástroj zaměřený na vývojáře pro pracovní postupy nasazení aplikací
- azd má vlastní autentizační a nasazovací workflow; Azure CLI je samostatný, doplňkový nástroj
- azd zahrnuje šablony, správu prostředí a automatizaci nasazení

### Q: Potřebuji mít nainstalovaný Azure CLI pro použití azd?
**A**: Ne pro základní workflow AZD. Autentizujte se pomocí `azd auth login`. Azure CLI nainstalujte samostatně, pokud šablonový háček nebo cvičení explicitně spouští příkazy `az`.

### Q: Jaké programovací jazyky azd podporuje?
**A**: azd je nezávislý na jazyce. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické webové stránky
- Aplikace v kontejnerech

### Q: Mohu použít azd s existujícími projekty?
**A**: Ano! Můžete:
1. Použít `azd init` k přidání konfigurace azd do existujících projektů
2. Přizpůsobit stávající projekty tak, aby odpovídaly struktuře šablony azd
3. Vytvořit vlastní šablony založené na vaší stávající architektuře

---

## Autentikace & přístup

### Q: Jak se autentizuji do Azure pomocí azd?
**A**: Použijte `azd auth login`, který otevře okno prohlížeče pro autentikaci do Azure. Pro scénáře CI/CD používejte servisní identity nebo spravované identity.

### Q: Mohu použít azd s více Azure předplatnými?
**A**: Ano. Použijte `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pro určení, které předplatné se má použít pro každé prostředí.

### Q: Jaká oprávnění potřebuji pro nasazení s azd?
**A**: Obvykle potřebujete:
- roli **Contributor** na skupině prostředků nebo předplatném
- roli **User Access Administrator** pokud nasazujete zdroje vyžadující přiřazení rolí
- Specifická oprávnění závisí na šabloně a nasazovaných zdrojích

### Q: Mohu použít azd v CI/CD pipelinech?
**A**: Rozhodně! azd je navržen pro integraci do CI/CD. Pro autentikaci používejte servisní identity a pro konfiguraci nastavte proměnné prostředí.

### Q: Jak řešit autentikaci v GitHub Actions?
**A**: Preferujte federaci identity (OIDC), nakonfigurovanou pomocí `azd pipeline config`. Generovaný workflow instaluje AZD a autentizuje AZD přímo s federovanou identitou. Samotný krok `azure/login` nezajišťuje přihlášení AZD. Přihlašovací krok uvnitř existujícího jobu je:
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

Proveďte provisioning nebo nasazení po přihlášení, s nakonfigurovaným cílovým prostředím AZD, předplatným a umístěním. Federované pověření identity musí důvěřovat repozitáři/referenci workflow nebo GitHub prostředí a její Azure role musí povolovat požadované operace.

---

## Šablony & projekty

### Q: Kde najdu šablony azd?
**A**: 
- Oficiální a komunitní šablony: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Komunitní šablony: vyhledávání na GitHubu pro "azd-template"
- Použijte `azd template list` k prohlížení dostupných šablon

### Q: Jak vytvořit vlastní šablonu?
**A**: 
1. Začněte se strukturou existující šablony
2. Upravte `azure.yaml`, infrastrukturní soubory a aplikační kód
3. Důkladně testujte pomocí `azd up`
4. Publikujte na GitHub s odpovídajícími tagy

### Q: Mohu použít azd bez šablony?
**A**: Ano, použijte `azd init` v existujícím projektu k vytvoření potřebných konfiguračních souborů. Konfiguraci `azure.yaml` a infrastrukturních souborů je nutné nastavit ručně.

### Q: Jaký je rozdíl mezi oficiálními a komunitními šablonami?
**A**: 
- **Oficiální šablony**: Spravované Microsoftem, pravidelně aktualizované, s komplexní dokumentací
- **Komunitní šablony**: Vytvořené vývojáři, mohou mít specializované případy použití, různé kvality a údržbu

### Q: Jak aktualizovat šablonu v mém projektu?
**A**: Šablony se neaktualizují automaticky. Můžete:
1. Ručně porovnat a sloučit změny ze zdrojové šablony
2. Začít znovu s `azd init` s použitím aktualizované šablony
3. Vybrat konkrétní vylepšení z aktualizovaných šablon

---

## Nasazení & infrastruktura

### Q: Jaké Azure služby může azd nasadit?
**A**: azd může nasadit jakoukoli službu Azure přes Bicep/ARM šablony, včetně:
- App Services, Container Apps, Functions
- Databázových služeb (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Síťových, bezpečnostních a monitorovacích zdrojů

### Q: Mohu nasadit do více regionů?
**A**: Ano, nastavte více regionů ve vašich Bicep šablonách a podle potřeby nastavte parametr umístění pro každé prostředí.

### Q: Jak řešit migrace schématu databáze?
**A**: Použijte deployment hooky v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Mohu nasadit pouze infrastrukturu bez aplikací?
**A**: Ano, použijte `azd provision` pro nasazení pouze infrastrukturních komponent definovaných ve vašich šablonách.

### Q: Jak nasadit do existujících Azure zdrojů?
**A**: Ano, pokud to šablona podporuje. Referencujte existující zdroje přes deklarace `existing` v Bicep nebo parametry pro existující zdroje v šabloně a mapujte aplikační služby na zamýšlené cíle. Toto nepřenáší vlastnictví ani nevytváří automaticky chybějící oprávnění. Před nasazením zkontrolujte šablonu.

### Q: Mohu použít Terraform místo Bicep?
**A**: Ano. AZD podporuje Terraform i Bicep. Vyberte šablonu založenou na Terraformu nebo nakonfigurujte `infra.provider: terraform` v `azure.yaml`, s odpovídajícími Terraform soubory a konfigurací stavu/backendu. Viz [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurace & prostředí

### Q: Jak spravovat různá prostředí (dev, staging, prod)?
**A**: Vytvořte samostatná prostředí pomocí `azd env new <environment-name>` a konfigurujte pro každé různé nastavení:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Kde jsou uloženy konfigurace prostředí?
**A**: Ve složce `.azure` uvnitř vašeho projektového adresáře. Každé prostředí má vlastní složku s konfiguračními soubory.

### Q: Jak nastavit konfiguraci specifickou pro prostředí?
**A**: Použijte `azd env set` pro nastavení proměnných prostředí:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Mohu sdílet konfiguraci prostředí mezi členy týmu?
**A**: Složka `.azure` obsahuje citlivé informace a neměla by být vkládána do verzovacího systému. Místo toho:
1. Dokumentujte potřebné proměnné prostředí
2. Použijte skripty nasazení k nastavení prostředí
3. Použijte Azure Key Vault pro citlivé konfigurace

### Q: Jak přepsat výchozí hodnoty šablony?
**A**: Nastavte proměnné prostředí odpovídající parametrům šablony:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Pouze proměnné použití šablonou mají vliv na nasazení. `SKU_NAME` výše je příklad vlastního vstupu, nikoli univerzálního nastavení AZD.

---

## Řešení problémů

### Q: Proč `azd up` selhává?
**A**: Běžné příčiny:
1. **Problémy s autentizací**: Spusťte `azd auth login`
2. **Nedostatečná oprávnění**: Zkontrolujte přiřazení rolí v Azure
3. **Konflikty názvů zdrojů**: Zkontrolujte konfliktní zdroj a vstupy názvů ve šabloně; pokud je potřeba izolace, vytvořte samostatné prostředí pomocí `azd env new`
4. **Problémy s kvótami/kapacitami**: Zkontrolujte dostupnost v regionech
5. **Chyby ve šabloně**: Validujte Bicep šablony

### Q: Jak ladit chyby nasazení?
**A**: 
1. Použijte `azd deploy --debug` pro podrobné výstupy
2. Zkontrolujte historii nasazení v Azure portálu
3. Přehodnoťte Aktivitu v Azure portálu
4. Použijte `azd show` k zobrazení aktuálního stavu prostředí

### Q: Proč nefungují mé proměnné prostředí?
**A**: Zkontrolujte:
1. Název proměnných přesně odpovídá parametrům šablony
2. Hodnoty jsou správně uzavřeny v uvozovkách, pokud obsahují mezery
3. Prostředí je vybráno: `azd env select <environment>`
4. Proměnné jsou nastaveny ve správném prostředí

### Q: Jak vyčistit neúspěšná nasazení?
**A**: 
```bash
azd down
```
 Nejprve zkontrolujte vybrané prostředí a potvrzení odstranění. Tento příkaz odstraní nasazené Azure zdroje, nikoli lokální konfiguraci prostředí `.azure`. Příkaz `--purge` žádá dodatečně trvalé odstranění podporovaných zdrojů se soft-delete a může být blokován ochranou proti odstranění; není to rutinní krok pro obnovu.

### Q: Proč není moje aplikace po nasazení dostupná?
**A**: Zkontrolujte:
1. Nasazení bylo úspěšně dokončeno
2. Aplikace běží (zkontrolujte logy v Azure portálu)
3. Síťové bezpečnostní skupiny povolují provoz
4. DNS/vlastní domény jsou správně nastaveny

---

## Náklady & fakturace

### Q: Kolik budou nasazení azd stát?
**A**: Náklady závisí na:
- Nasazených službách Azure
- Vybraných úrovních služeb/SKU
- Regionálních cenových rozdílech
- Vzorcích využití

Použijte [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pro odhady.

### Q: Jak kontrolovat náklady při nasazování azd?
**A**: 
1. Používejte nižší úrovně SKU pro vývojová prostředí
2. Nastavte rozpočty a upozornění v Azure
3. Používejte `azd down` k odstranění zdrojů, když nejsou potřeba
4. Vyberte vhodné regiony (náklady se liší podle lokality)
5. Používejte nástroje Azure Cost Management

### Q: Existují bezplatné úrovně pro šablony azd?
**A**: Některé služby mají bezplatné SKU nebo měsíční příděly, závislé na způsobilosti, plánu hostingu, regionu a omezeních předplatného. Neznamená to, že celá šablona je zdarma: databáze, hledání, síťování, registry, telemetrie a inferenční modely mohou samostatně účtovat poplatky. Před nasazením si ověřte [seznam bezplatných služeb Azure](https://azure.microsoft.com/free/) a aktuální ceny za každý zdroj.

### Q: Jak odhadnout náklady před nasazením?
**A**: 
1. Prohlédněte si `main.bicep` šablony, abyste zjistili, jaké zdroje jsou vytvořeny
2. Použijte Azure Pricing Calculator s konkrétními SKU
3. Nejprve nasadťe do vývojového prostředí a sledujte skutečné náklady
4. Použijte Azure Cost Management pro podrobnou analýzu nákladů

---

## Osvědčené postupy

### Q: Jaké jsou osvědčené postupy pro strukturu projektu azd?
**A**: 
1. Udržujte aplikační kód oddělený od infrastruktury
2. Používejte smysluplné názvy služeb v `azure.yaml`
3. Implementujte správné zpracování chyb ve skriptech sestavení
4. Používejte konfiguraci specifickou pro prostředí
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

### Otázka: Jak mám zacházet s tajnými údaji a citlivou konfigurací?
**Odpověď**: 
1. Používejte Azure Key Vault pro tajné údaje
2. Odkazujte se na tajné údaje v Key Vault v konfiguraci aplikace
3. Nikdy nezavádějte tajné údaje do verzovacího řízení
4. Používejte spravované identity pro autentizaci služba ke službě

### Otázka: Jaký je doporučený přístup k CI/CD s azd?
**Odpověď**: 
1. Používejte oddělená prostředí pro každou fázi (vývoj/test/prod)
2. Implementujte automatické testování před nasazením
3. Používejte servisní principály pro autentizaci
4. Ukládejte citlivou konfiguraci do tajných proměnných pipeline
5. Zavádějte schvalovací brány pro produkční nasazení

---

## Pokročilá témata

### Otázka: Mohu rozšířit azd o vlastní funkčnost?
**Odpověď**: Ano, pomocí nasazovacích hooků v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Otázka: Jak integrovat azd s existujícími DevOps procesy?
**Odpověď**: 
1. Používejte příkazy azd v existujících pipeline skriptech
2. Standardizujte šablony azd mezi týmy
3. Integrujte s existujícím monitoringem a upozorněními
4. Používejte JSON výstup azd pro integraci pipeline

### Otázka: Mohu použít azd s Azure DevOps?
**Odpověď**: Ano, azd funguje s jakýmkoli CI/CD systémem. Vytvořte Azure DevOps pipeline, které používají příkazy azd.

### Otázka: Jak přispět do azd nebo vytvořit komunitní šablony?
**Odpověď**: 
1. **azd nástroj**: Přispějte do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablony**: Řiďte se [pokyny pro přispění do galerie Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentace**: Přispějte do dokumentace na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Otázka: Jaká je roadmapa pro azd?
**Odpověď**: Podívejte se na [oficiální roadmapu](https://github.com/Azure/azure-dev/projects) plánovaných funkcí a vylepšení.

### Otázka: Jak migrovat z jiných nasazovacích nástrojů na azd?
**Odpověď**: 
1. Analyzujte aktuální architekturu nasazení
2. Vytvořte odpovídající Bicep šablony
3. Nakonfigurujte `azure.yaml` tak, aby odpovídal současným službám
4. Pečlivě testujte ve vývojovém prostředí
5. Postupně migrujte prostředí

---

## Stále máte otázky?

### **Nejprve vyhledejte**
- Podívejte se do [oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Prohledejte [GitHub issues](https://github.com/Azure/azure-dev/issues) pro podobné problémy

### **Získejte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora od komunity
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické dotazy
- [Azure Discord](https://discord.gg/azure) - Chat v reálném čase s komunitou

### **Nahlaste problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlásení chyb a žádosti o funkce
- Přiložte relevantní logy, chybové zprávy a kroky pro reprodukci

### **Zjistěte více**
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technické pokyny revidovány: 4. listopadu 2026. Dostupnost cloudu a ceny je nutné ověřit pro vaše předplatné a oblast.*

---

**Navigace**
- **Předchozí lekce**: [Glosář](glossary.md)
- **Následující lekce**: [Studijní průvodce](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->