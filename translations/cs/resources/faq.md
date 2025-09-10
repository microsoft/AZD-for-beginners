<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:25:46+00:00",
  "source_file": "resources/faq.md",
  "language_code": "cs"
}
-->
# Často kladené dotazy (FAQ)

## Úvod

Tento obsáhlý FAQ poskytuje odpovědi na nejčastější otázky týkající se Azure Developer CLI (azd) a nasazování v Azure. Najděte rychlá řešení běžných problémů, pochopte osvědčené postupy a získejte vysvětlení konceptů a pracovních postupů azd.

## Cíle učení

Při pročítání tohoto FAQ se naučíte:
- Rychle najít odpovědi na běžné otázky a problémy s Azure Developer CLI
- Pochopit klíčové koncepty a terminologii prostřednictvím praktického formátu otázek a odpovědí
- Přistupovat k řešením problémů pro časté chyby a scénáře
- Naučit se osvědčené postupy prostřednictvím často kladených otázek o optimalizaci
- Objevit pokročilé funkce a možnosti prostřednictvím otázek na expertní úrovni
- Efektivně odkazovat na doporučení ohledně nákladů, bezpečnosti a strategií nasazení

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

### Otázka: Co je Azure Developer CLI (azd)?
**Odpověď**: Azure Developer CLI (azd) je nástroj příkazového řádku zaměřený na vývojáře, který urychluje proces přechodu vaší aplikace z lokálního vývojového prostředí do Azure. Poskytuje osvědčené postupy prostřednictvím šablon a pomáhá s celým životním cyklem nasazení.

### Otázka: Jak se azd liší od Azure CLI?
**Odpověď**: 
- **Azure CLI**: Univerzální nástroj pro správu zdrojů Azure
- **azd**: Nástroj zaměřený na vývojáře pro pracovní postupy nasazení aplikací
- azd využívá Azure CLI interně, ale poskytuje vyšší úroveň abstrakce pro běžné vývojové scénáře
- azd zahrnuje šablony, správu prostředí a automatizaci nasazení

### Otázka: Potřebuji mít nainstalovaný Azure CLI, abych mohl používat azd?
**Odpověď**: Ano, azd vyžaduje Azure CLI pro autentizaci a některé operace. Nejprve nainstalujte Azure CLI a poté azd.

### Otázka: Jaké programovací jazyky azd podporuje?
**Odpověď**: azd je nezávislý na jazyce. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické weby
- Kontejnerizované aplikace

### Otázka: Mohu používat azd s existujícími projekty?
**Odpověď**: Ano! Můžete:
1. Použít `azd init` k přidání konfigurace azd do existujících projektů
2. Přizpůsobit existující projekty struktuře šablon azd
3. Vytvořit vlastní šablony na základě vaší stávající architektury

---

## Autentizace a přístup

### Otázka: Jak se autentizuji s Azure pomocí azd?
**Odpověď**: Použijte `azd auth login`, což otevře okno prohlížeče pro autentizaci v Azure. Pro scénáře CI/CD použijte service principals nebo spravované identity.

### Otázka: Mohu používat azd s více předplatnými Azure?
**Odpověď**: Ano. Použijte `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` k určení, které předplatné použít pro každé prostředí.

### Otázka: Jaká oprávnění potřebuji k nasazení pomocí azd?
**Odpověď**: Obvykle potřebujete:
- Roli **Contributor** na skupině prostředků nebo předplatném
- Roli **User Access Administrator**, pokud nasazujete prostředky vyžadující přiřazení rolí
- Konkrétní oprávnění se liší podle šablony a nasazovaných prostředků

### Otázka: Mohu používat azd v CI/CD pipelinech?
**Odpověď**: Rozhodně! azd je navržen pro integraci s CI/CD. Pro autentizaci použijte service principals a nastavte proměnné prostředí pro konfiguraci.

### Otázka: Jak řeším autentizaci v GitHub Actions?
**Odpověď**: Použijte akci Azure Login s přihlašovacími údaji service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Šablony a projekty

### Otázka: Kde najdu šablony azd?
**Odpověď**: 
- Oficiální šablony: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Komunitní šablony: Vyhledávání na GitHubu "azd-template"
- Použijte `azd template list` k procházení dostupných šablon

### Otázka: Jak vytvořím vlastní šablonu?
**Odpověď**: 
1. Začněte se strukturou existující šablony
2. Upravte `azure.yaml`, soubory infrastruktury a kód aplikace
3. Důkladně otestujte pomocí `azd up`
4. Publikujte na GitHub s příslušnými tagy

### Otázka: Mohu používat azd bez šablony?
**Odpověď**: Ano, použijte `azd init` v existujícím projektu k vytvoření potřebných konfiguračních souborů. Budete muset ručně nakonfigurovat `azure.yaml` a soubory infrastruktury.

### Otázka: Jaký je rozdíl mezi oficiálními a komunitními šablonami?
**Odpověď**: 
- **Oficiální šablony**: Udržované Microsoftem, pravidelně aktualizované, s komplexní dokumentací
- **Komunitní šablony**: Vytvořené vývojáři, mohou mít specializované případy použití, různou kvalitu a údržbu

### Otázka: Jak aktualizuji šablonu ve svém projektu?
**Odpověď**: Šablony se neaktualizují automaticky. Můžete:
1. Ručně porovnat a sloučit změny ze zdrojové šablony
2. Začít znovu s `azd init` pomocí aktualizované šablony
3. Vybrat konkrétní vylepšení z aktualizovaných šablon

---

## Nasazení a infrastruktura

### Otázka: Jaké služby Azure může azd nasazovat?
**Odpověď**: azd může nasazovat jakoukoli službu Azure prostřednictvím šablon Bicep/ARM, včetně:
- App Services, Container Apps, Functions
- Databází (SQL, PostgreSQL, Cosmos DB)
- Úložiště, Key Vault, Application Insights
- Síťových, bezpečnostních a monitorovacích prostředků

### Otázka: Mohu nasazovat do více regionů?
**Odpověď**: Ano, nakonfigurujte více regionů ve svých šablonách Bicep a nastavte parametr umístění pro každé prostředí.

### Otázka: Jak řeším migrace schématu databáze?
**Odpověď**: Použijte deployment hooks v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Otázka: Mohu nasazovat pouze infrastrukturu bez aplikací?
**Odpověď**: Ano, použijte `azd provision` k nasazení pouze infrastrukturních komponent definovaných ve vašich šablonách.

### Otázka: Jak nasazuji do existujících prostředků Azure?
**Odpověď**: Toto je složité a není přímo podporováno. Můžete:
1. Importovat existující prostředky do svých šablon Bicep
2. Použít odkazy na existující prostředky v šablonách
3. Upravit šablony tak, aby podmíněně vytvářely nebo odkazovaly na prostředky

### Otázka: Mohu používat Terraform místo Bicep?
**Odpověď**: V současné době azd primárně podporuje šablony Bicep/ARM. Podpora Terraformu není oficiálně dostupná, i když mohou existovat komunitní řešení.

---

## Konfigurace a prostředí

### Otázka: Jak spravuji různá prostředí (dev, staging, prod)?
**Odpověď**: Vytvořte samostatná prostředí pomocí `azd env new <environment-name>` a nakonfigurujte různá nastavení pro každé:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Otázka: Kde jsou uloženy konfigurace prostředí?
**Odpověď**: Ve složce `.azure` ve vašem projektovém adresáři. Každé prostředí má svou vlastní složku s konfiguračními soubory.

### Otázka: Jak nastavím konfiguraci specifickou pro prostředí?
**Odpověď**: Použijte `azd env set` k nastavení proměnných prostředí:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Otázka: Mohu sdílet konfigurace prostředí mezi členy týmu?
**Odpověď**: Složka `.azure` obsahuje citlivé informace a neměla by být přidána do verzovacího systému. Místo toho:
1. Dokumentujte požadované proměnné prostředí
2. Použijte skripty nasazení k nastavení prostředí
3. Použijte Azure Key Vault pro citlivou konfiguraci

### Otázka: Jak přepíšu výchozí hodnoty šablony?
**Odpověď**: Nastavte proměnné prostředí odpovídající parametrům šablony:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Řešení problémů

### Otázka: Proč `azd up` selhává?
**Odpověď**: Běžné příčiny:
1. **Problémy s autentizací**: Spusťte `azd auth login`
2. **Nedostatečná oprávnění**: Zkontrolujte přiřazení rolí v Azure
3. **Konflikty názvů prostředků**: Změňte AZURE_ENV_NAME
4. **Problémy s kvótami/kapacitou**: Zkontrolujte dostupnost v regionu
5. **Chyby šablony**: Ověřte šablony Bicep

### Otázka: Jak ladím chyby nasazení?
**Odpověď**: 
1. Použijte `azd deploy --debug` pro podrobný výstup
2. Zkontrolujte historii nasazení v Azure portálu
3. Projděte si protokol aktivit v Azure portálu
4. Použijte `azd show` k zobrazení aktuálního stavu prostředí

### Otázka: Proč moje proměnné prostředí nefungují?
**Odpověď**: Zkontrolujte:
1. Názvy proměnných přesně odpovídají parametrům šablony
2. Hodnoty jsou správně uzavřeny v uvozovkách, pokud obsahují mezery
3. Prostředí je vybráno: `azd env select <environment>`
4. Proměnné jsou nastaveny ve správném prostředí

### Otázka: Jak vyčistím neúspěšná nasazení?
**Odpověď**: 
```bash
azd down --force --purge
```
Tím odstraníte všechny prostředky a konfiguraci prostředí.

### Otázka: Proč moje aplikace není po nasazení dostupná?
**Odpověď**: Zkontrolujte:
1. Nasazení bylo úspěšně dokončeno
2. Aplikace běží (zkontrolujte protokoly v Azure portálu)
3. Síťové bezpečnostní skupiny povolují provoz
4. DNS/vlastní domény jsou správně nakonfigurovány

---

## Náklady a fakturace

### Otázka: Kolik budou nasazení azd stát?
**Odpověď**: Náklady závisí na:
- Nasazovaných službách Azure
- Vybraných úrovních služeb/SKU
- Regionálních rozdílech v cenách
- Vzorcích využití

Použijte [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pro odhady.

### Otázka: Jak kontroluji náklady při nasazeních azd?
**Odpověď**: 
1. Používejte nižší úrovně SKU pro vývojová prostředí
2. Nastavte rozpočty a upozornění v Azure
3. Použijte `azd down` k odstranění prostředků, když nejsou potřeba
4. Vyberte vhodné regiony (náklady se liší podle lokality)
5. Použijte nástroje Azure Cost Management

### Otázka: Existují bezplatné možnosti pro šablony azd?
**Odpověď**: Mnoho služeb Azure nabízí bezplatné úrovně:
- App Service: Dostupná bezplatná úroveň
- Azure Functions: 1M bezplatných spuštění/měsíc
- Cosmos DB: Bezplatná úroveň s 400 RU/s
- Application Insights: Prvních 5GB/měsíc zdarma

Nakonfigurujte šablony tak, aby využívaly bezplatné úrovně, kde je to možné.

### Otázka: Jak odhadnu náklady před nasazením?
**Odpověď**: 
1. Projděte si `main.bicep` šablony a zjistěte, jaké prostředky se vytvářejí
2. Použijte Azure Pricing Calculator s konkrétními SKU
3. Nejprve nasazujte do vývojového prostředí a sledujte skutečné náklady
4. Použijte Azure Cost Management pro podrobnou analýzu nákladů

---

## Osvědčené postupy

### Otázka: Jaké jsou osvědčené postupy pro strukturu projektů azd?
**Odpověď**: 
1. Oddělte kód aplikace od infrastruktury
2. Používejte smysluplné názvy služeb v `azure.yaml`
3. Implementujte správné zpracování chyb ve skriptech sestavení
4. Používejte konfiguraci specifickou pro prostředí
5. Zahrňte komplexní dokumentaci

### Otázka: Jak mám organizovat více služeb v azd?
**Odpověď**: Použijte doporučenou strukturu:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Otázka: Mám přidat složku `.azure` do verzovacího systému?
**Odpověď**: **Ne!** Složka `.azure` obsahuje citlivé informace. Přidejte ji do `.gitignore`:
```gitignore
.azure/
```

### Otázka: Jak mám spravovat tajné klíče a citlivou konfiguraci?
**Odpověď**: 
1. Použijte Azure Key Vault pro tajné klíče
2. Odkazujte na tajné klíče Key Vault v konfiguraci aplikace
3. Nikdy neukládejte tajné klíče do verzovacího systému
4. Použijte spravované identity pro autentizaci mezi službami

### Otázka: Jaký je doporučený přístup pro CI/CD s azd?
**Odpověď**: 
1. Používejte samostatná prostředí pro každou fázi (dev/staging/prod)
2. Implementujte automatizované testování před nasazením
3. Použijte service principals pro autentizaci
4. Ukládejte citlivou konfiguraci do tajných klíčů/proměnných pipeline
5. Implementujte schvalovací brány pro nasazení do produkce

---

## Pokročilá témata

### Otázka: Mohu rozšířit azd o vlastní funkce?
**Odpověď**: Ano, prostřednictvím deployment hooks v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Otáz
1. Analyzujte aktuální architekturu nasazení  
2. Vytvořte ekvivalentní šablony Bicep  
3. Nakonfigurujte `azure.yaml`, aby odpovídal aktuálním službám  
4. Důkladně otestujte v vývojovém prostředí  
5. Postupně migrujte prostředí  

---

## Máte stále otázky?

### **Nejprve hledejte**
- Podívejte se na [oficiální dokumentaci](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Vyhledejte [problémy na GitHubu](https://github.com/Azure/azure-dev/issues) pro podobné situace  

### **Získejte pomoc**
- [Diskuze na GitHubu](https://github.com/Azure/azure-dev/discussions) - Podpora od komunity  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické dotazy  
- [Azure Discord](https://discord.gg/azure) - Komunitní chat v reálném čase  

### **Nahlaste problémy**
- [Problémy na GitHubu](https://github.com/Azure/azure-dev/issues/new) - Hlásit chyby a požadavky na funkce  
- Přiložte relevantní logy, chybové zprávy a kroky k reprodukci  

### **Zjistěte více**
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Tento FAQ je pravidelně aktualizován. Poslední aktualizace: 9. září 2025*  

---

**Navigace**  
- **Předchozí lekce**: [Slovník](glossary.md)  
- **Další lekce**: [Studijní průvodce](study-guide.md)  

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.