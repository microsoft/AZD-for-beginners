<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-18T09:51:48+00:00",
  "source_file": "resources/faq.md",
  "language_code": "cs"
}
-->
# Často kladené otázky (FAQ)

**Pomoc podle kapitoly**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **🚆 Problémy s instalací**: [Kapitola 1: Instalace a nastavení](../docs/getting-started/installation.md)
- **🤖 Dotazy na AI**: [Kapitola 2: Vývoj zaměřený na AI](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Řešení problémů**: [Kapitola 7: Řešení problémů a ladění](../docs/troubleshooting/common-issues.md)

## Úvod

Tento komplexní FAQ poskytuje odpovědi na nejčastější otázky týkající se Azure Developer CLI (azd) a nasazení na Azure. Najděte rychlá řešení běžných problémů, pochopte osvědčené postupy a získejte vysvětlení konceptů a pracovních postupů azd.

## Cíle učení

Při pročítání tohoto FAQ se naučíte:
- Rychle najít odpovědi na běžné otázky a problémy s Azure Developer CLI
- Pochopit klíčové koncepty a terminologii prostřednictvím praktického formátu otázek a odpovědí
- Přistupovat k řešením problémů pro časté chyby a scénáře
- Naučit se osvědčené postupy prostřednictvím často kladených otázek o optimalizaci
- Objevit pokročilé funkce a možnosti prostřednictvím otázek na expertní úrovni
- Efektivně odkazovat na doporučení ohledně nákladů, bezpečnosti a strategie nasazení

## Výsledky učení

Pravidelným odkazováním na tento FAQ budete schopni:
- Samostatně řešit běžné problémy s Azure Developer CLI pomocí poskytnutých řešení
- Činit informovaná rozhodnutí o strategiích a konfiguracích nasazení
- Pochopit vztah mezi azd a dalšími nástroji a službami Azure
- Aplikovat osvědčené postupy na základě zkušeností komunity a doporučení odborníků
- Efektivně řešit problémy s autentizací, nasazením a konfigurací
- Optimalizovat náklady a výkon pomocí poznatků a doporučení z FAQ

## Obsah

- [Začínáme](../../../resources)
- [Autentizace a přístup](../../../resources)
- [Šablony a projekty](../../../resources)
- [Nasazení a infrastruktura](../../../resources)
- [Konfigurace a prostředí](../../../resources)
- [Řešení problémů](../../../resources)
- [Náklady a fakturace](../../../resources)
- [Osvědčené postupy](../../../resources)
- [Pokročilá témata](../../../resources)

---

## Začínáme

### Q: Co je Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) je nástroj příkazového řádku zaměřený na vývojáře, který urychluje proces přechodu aplikace z lokálního vývojového prostředí na Azure. Poskytuje osvědčené postupy prostřednictvím šablon a pomáhá s celým životním cyklem nasazení.

### Q: Jak se azd liší od Azure CLI?
**A**: 
- **Azure CLI**: Nástroj pro obecnou správu zdrojů Azure
- **azd**: Nástroj zaměřený na vývojáře pro pracovní postupy nasazení aplikací
- azd interně využívá Azure CLI, ale poskytuje vyšší úroveň abstrakce pro běžné scénáře vývoje
- azd zahrnuje šablony, správu prostředí a automatizaci nasazení

### Q: Potřebuji mít nainstalovaný Azure CLI, abych mohl používat azd?
**A**: Ano, azd vyžaduje Azure CLI pro autentizaci a některé operace. Nejprve nainstalujte Azure CLI, poté azd.

### Q: Jaké programovací jazyky azd podporuje?
**A**: azd je nezávislý na jazyku. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické weby
- Kontejnerové aplikace

### Q: Mohu používat azd s existujícími projekty?
**A**: Ano! Můžete:
1. Použít `azd init` k přidání konfigurace azd do existujících projektů
2. Přizpůsobit existující projekty tak, aby odpovídaly struktuře šablon azd
3. Vytvořit vlastní šablony na základě vaší stávající architektury

---

## Autentizace a přístup

### Q: Jak se autentizuji s Azure pomocí azd?
**A**: Použijte `azd auth login`, což otevře okno prohlížeče pro autentizaci na Azure. Pro scénáře CI/CD použijte servisní principy nebo spravované identity.

### Q: Mohu používat azd s více předplatnými Azure?
**A**: Ano. Použijte `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` k určení, které předplatné použít pro každé prostředí.

### Q: Jaká oprávnění potřebuji k nasazení pomocí azd?
**A**: Obvykle potřebujete:
- **Role Contributor** na skupině zdrojů nebo předplatném
- **User Access Administrator**, pokud nasazujete zdroje vyžadující přiřazení rolí
- Specifická oprávnění se liší podle šablony a nasazovaných zdrojů

### Q: Mohu používat azd v CI/CD pipelinech?
**A**: Rozhodně! azd je navržen pro integraci s CI/CD. Použijte servisní principy pro autentizaci a nastavte proměnné prostředí pro konfiguraci.

### Q: Jak řeším autentizaci v GitHub Actions?
**A**: Použijte akci Azure Login s přihlašovacími údaji servisního principu:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Šablony a projekty

### Q: Kde najdu šablony azd?
**A**: 
- Oficiální šablony: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Šablony od komunity: Vyhledávání na GitHubu "azd-template"
- Použijte `azd template list` k procházení dostupných šablon

### Q: Jak vytvořím vlastní šablonu?
**A**: 
1. Začněte se strukturou existující šablony
2. Upravte `azure.yaml`, soubory infrastruktury a kód aplikace
3. Důkladně otestujte pomocí `azd up`
4. Publikujte na GitHub s odpovídajícími tagy

### Q: Mohu používat azd bez šablony?
**A**: Ano, použijte `azd init` v existujícím projektu k vytvoření potřebných konfiguračních souborů. Budete muset ručně nakonfigurovat `azure.yaml` a soubory infrastruktury.

### Q: Jaký je rozdíl mezi oficiálními a komunitními šablonami?
**A**: 
- **Oficiální šablony**: Udržované Microsoftem, pravidelně aktualizované, komplexní dokumentace
- **Komunitní šablony**: Vytvořené vývojáři, mohou mít specializované případy použití, různou kvalitu a údržbu

### Q: Jak aktualizuji šablonu ve svém projektu?
**A**: Šablony se neaktualizují automaticky. Můžete:
1. Ručně porovnat a sloučit změny ze zdrojové šablony
2. Začít znovu s `azd init` pomocí aktualizované šablony
3. Vybrat konkrétní vylepšení z aktualizovaných šablon

---

## Nasazení a infrastruktura

### Q: Jaké služby Azure může azd nasazovat?
**A**: azd může nasazovat jakoukoli službu Azure prostřednictvím šablon Bicep/ARM, včetně:
- App Services, Container Apps, Functions
- Databází (SQL, PostgreSQL, Cosmos DB)
- Úložiště, Key Vault, Application Insights
- Síťových, bezpečnostních a monitorovacích zdrojů

### Q: Mohu nasazovat do více regionů?
**A**: Ano, nakonfigurujte více regionů ve svých šablonách Bicep a nastavte parametr umístění odpovídajícím způsobem pro každé prostředí.

### Q: Jak řeším migrace schématu databáze?
**A**: Použijte deployment hooks v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Mohu nasazovat pouze infrastrukturu bez aplikací?
**A**: Ano, použijte `azd provision` k nasazení pouze infrastrukturních komponent definovaných ve vašich šablonách.

### Q: Jak nasazuji do existujících zdrojů Azure?
**A**: Toto je složité a není přímo podporováno. Můžete:
1. Importovat existující zdroje do svých šablon Bicep
2. Použít odkazy na existující zdroje v šablonách
3. Upravit šablony tak, aby podmíněně vytvářely nebo odkazovaly na zdroje

### Q: Mohu používat Terraform místo Bicep?
**A**: V současné době azd primárně podporuje šablony Bicep/ARM. Podpora Terraformu není oficiálně dostupná, i když mohou existovat komunitní řešení.

---

## Konfigurace a prostředí

### Q: Jak spravuji různá prostředí (dev, staging, prod)?
**A**: Vytvořte samostatná prostředí pomocí `azd env new <environment-name>` a nakonfigurujte různá nastavení pro každé:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Kde jsou uloženy konfigurace prostředí?
**A**: Ve složce `.azure` ve vašem projektovém adresáři. Každé prostředí má svou vlastní složku s konfiguračními soubory.

### Q: Jak nastavím konfiguraci specifickou pro prostředí?
**A**: Použijte `azd env set` k nastavení proměnných prostředí:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Mohu sdílet konfigurace prostředí mezi členy týmu?
**A**: Složka `.azure` obsahuje citlivé informace a neměla by být přidávána do verzovacího systému. Místo toho:
1. Dokumentujte požadované proměnné prostředí
2. Použijte skripty nasazení k nastavení prostředí
3. Použijte Azure Key Vault pro citlivou konfiguraci

### Q: Jak přepíšu výchozí hodnoty šablony?
**A**: Nastavte proměnné prostředí odpovídající parametrům šablony:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Řešení problémů

### Q: Proč `azd up` selhává?
**A**: Běžné příčiny:
1. **Problémy s autentizací**: Spusťte `azd auth login`
2. **Nedostatečná oprávnění**: Zkontrolujte přiřazení rolí na Azure
3. **Konflikty názvů zdrojů**: Změňte AZURE_ENV_NAME
4. **Problémy s kvótami/kapacitou**: Zkontrolujte dostupnost v regionu
5. **Chyby šablony**: Validujte šablony Bicep

### Q: Jak ladím chyby nasazení?
**A**: 
1. Použijte `azd deploy --debug` pro podrobný výstup
2. Zkontrolujte historii nasazení v Azure portálu
3. Projděte si Activity Log v Azure portálu
4. Použijte `azd show` k zobrazení aktuálního stavu prostředí

### Q: Proč moje proměnné prostředí nefungují?
**A**: Zkontrolujte:
1. Názvy proměnných přesně odpovídají parametrům šablony
2. Hodnoty jsou správně uzavřeny v uvozovkách, pokud obsahují mezery
3. Prostředí je vybráno: `azd env select <environment>`
4. Proměnné jsou nastaveny ve správném prostředí

### Q: Jak vyčistím neúspěšná nasazení?
**A**: 
```bash
azd down --force --purge
```
Tím odstraníte všechny zdroje a konfiguraci prostředí.

### Q: Proč moje aplikace není po nasazení dostupná?
**A**: Zkontrolujte:
1. Nasazení bylo úspěšně dokončeno
2. Aplikace běží (zkontrolujte logy v Azure portálu)
3. Síťové bezpečnostní skupiny umožňují provoz
4. DNS/vlastní domény jsou správně nakonfigurovány

---

## Náklady a fakturace

### Q: Kolik budou stát nasazení azd?
**A**: Náklady závisí na:
- Nasazených službách Azure
- Vybraných úrovních služeb/SKU
- Regionálních cenových rozdílech
- Vzorcích využití

Použijte [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pro odhady.

### Q: Jak kontroluji náklady při nasazeních azd?
**A**: 
1. Použijte nižší úrovně SKU pro vývojová prostředí
2. Nastavte rozpočty a upozornění na Azure
3. Použijte `azd down` k odstranění zdrojů, když nejsou potřeba
4. Vyberte vhodné regiony (náklady se liší podle lokality)
5. Použijte nástroje Azure Cost Management

### Q: Existují možnosti bezplatné úrovně pro šablony azd?
**A**: Mnoho služeb Azure nabízí bezplatné úrovně:
- App Service: K dispozici bezplatná úroveň
- Azure Functions: 1M bezplatných spuštění/měsíc
- Cosmos DB: Bezplatná úroveň s 400 RU/s
- Application Insights: Prvních 5GB/měsíc zdarma

Konfigurujte šablony tak, aby využívaly bezplatné úrovně, kde je to možné.

### Q: Jak odhadnu náklady před nasazením?
**A**: 
1. Projděte si `main.bicep` šablony, abyste viděli, jaké zdroje jsou vytvořeny
2. Použijte Azure Pricing Calculator s konkrétními SKU
3. Nejprve nasazujte do vývojového prostředí, abyste sledovali skutečné náklady
4. Použijte Azure Cost Management pro podrobnou analýzu nákladů

---

## Osvědčené postupy

### Q: Jaké jsou osvědčené postupy pro strukturu projektu azd?
**A**: 
1. Oddělte kód aplikace od infrastruktury
2. Používejte smysluplné názvy služeb v `azure.yaml`
3. Implementujte správné zpracování chyb ve skriptech sestavení
4. Používejte konfiguraci specifickou pro prostředí
5. Zahrňte komplexní dokumentaci

### Q: Jak bych měl organizovat více služeb v azd?
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

### Q: Měl bych přidávat složku `.azure` do verzovacího systému?
**A**: **Ne!** Složka `.azure` obsahuje citlivé informace. Přidejte ji do `.gitignore`:
```gitignore
.azure/
```

### Q: Jak řeším tajné informace a citlivou konfiguraci?
**A**: 
1. Použijte Azure Key Vault pro tajné informace
2. Odkazujte na tajné informace z Key Vault v konfiguraci aplikace
3. Nikdy nepřidávejte tajné informace do verzovacího systému
4. Použijte spravované identity pro autentizaci mezi službami

### Q: Jaký je doporučený přístup pro CI/CD s azd?
**A**: 
1. Používejte samostatná prostředí pro každou fázi (dev/staging/prod)
2. Implementujte automatizované testování před nasazením
3. Používejte servisní principy pro autentizaci
4. Ukládejte citlivou konfiguraci do tajných proměnných/pipeline
5. Implementujte schvalovací brány pro nasazení do produkce

---

## Pokročilá témata

### Q: Mohu rozšířit azd o vlastní funkce?
**A**: Ano, prostřednictvím deployment hooks v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Jak integruji azd do stávajících DevOps procesů?
**A**: 
1. Používejte příkazy azd ve stávajících skriptech pipeline
2. Standard
# Často kladené dotazy (FAQ)

## Co je Azure Developer CLI (azd)?

Azure Developer CLI (azd) je nástroj, který zjednodušuje vývoj a nasazení aplikací v Azure. Poskytuje jednotné rozhraní pro správu infrastruktury, kódu a CI/CD procesů.

---

### **Začínáme**

### Q: Jak nainstaluji azd?
**A**: Postupujte podle [oficiální příručky k instalaci](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd).

### Q: Jak vytvořím nový projekt?
**A**: 
1. Spusťte příkaz `azd up`.
2. Vyberte šablonu projektu.
3. Postupujte podle pokynů k nastavení prostředí.

---

### **Používání azd**

### Q: Jaké šablony jsou dostupné?
**A**: Prozkoumejte [oficiální seznam šablon](https://github.com/Azure/azure-dev/tree/main/templates).

### Q: Jak mohu přizpůsobit šablony?
**A**: 
1. Upravte soubory Bicep nebo Terraform.
2. Aktualizujte `azure.yaml` podle vašich požadavků.
3. Otestujte změny v testovacím prostředí.

---

### **Přispívání**

### Q: Jak mohu přispět do azd?
**A**: Existuje několik způsobů, jak přispět:

1. **Kód**: Přispějte kódem prostřednictvím [GitHub repozitáře](https://github.com/Azure/azure-dev).
2. **Šablony**: Vytvářejte šablony podle [pokynů pro šablony](https://github.com/Azure-Samples/awesome-azd).
3. **Dokumentace**: Přispívejte do dokumentace na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs).

### Q: Jaký je plán vývoje azd?
**A**: Podívejte se na [oficiální roadmapu](https://github.com/Azure/azure-dev/projects) pro plánované funkce a vylepšení.

### Q: Jak migrovat z jiných nástrojů pro nasazení na azd?
**A**: 
1. Analyzujte aktuální architekturu nasazení.
2. Vytvořte ekvivalentní šablony Bicep.
3. Nakonfigurujte `azure.yaml` tak, aby odpovídal aktuálním službám.
4. Důkladně otestujte v prostředí pro vývoj.
5. Postupně migrujte prostředí.

---

## Máte stále otázky?

### **Nejprve hledejte**
- Podívejte se do [oficiální dokumentace](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/).
- Prohledejte [GitHub issues](https://github.com/Azure/azure-dev/issues) pro podobné problémy.

### **Získejte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora od komunity.
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické dotazy.
- [Azure Discord](https://discord.gg/azure) - Komunitní chat v reálném čase.

### **Nahlaste problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hlášení chyb a požadavky na funkce.
- Přiložte relevantní logy, chybové zprávy a kroky k reprodukci.

### **Zjistěte více**
- [Dokumentace k Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/).
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/).
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/).

---

*Tento FAQ je pravidelně aktualizován. Poslední aktualizace: 9. září 2025*

---

**Navigace**
- **Předchozí lekce**: [Slovníček](glossary.md)
- **Další lekce**: [Studijní příručka](study-guide.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.