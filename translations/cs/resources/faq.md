# Často kladené otázky (FAQ)

**Získejte pomoc podle kapitoly**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **🚆 Problémy s instalací**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 Otázky týkající se AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Řešení problémů**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Úvod

Tento komplexní FAQ poskytuje odpovědi na nejčastější otázky týkající se Azure Developer CLI (azd) a nasazení do Azure. Najdete zde rychlá řešení běžných problémů, pochopení osvědčených postupů a objasnění konceptů a pracovních postupů azd.

## Cíle učení

Při prostudování tohoto FAQ budete:
- Nalézat rychlé odpovědi na běžné dotazy a problémy s Azure Developer CLI
- Rozumět klíčovým pojmům a terminologii prostřednictvím praktického formátu otázek a odpovědí
- Získat přístup k řešením při odstraňování problémů pro časté chyby a scénáře
- Naučit se osvědčené postupy týkající se optimalizace
- Objevovat pokročilé funkce a schopnosti prostřednictvím otázek na úrovni expertů
- Efektivně získávat doporučení ohledně nákladů, zabezpečení a strategie nasazení

## Výsledky učení

Při pravidelném využívání tohoto FAQ budete schopni:
- Samostatně řešit běžné problémy s Azure Developer CLI pomocí poskytnutých řešení
- Dělat informovaná rozhodnutí o strategiích nasazení a konfiguracích
- Chápat vztah mezi azd a dalšími nástroji a službami Azure
- Aplikovat osvědčené postupy na základě zkušeností komunity a doporučení odborníků
- Efektivně řešit problémy s autentizací, nasazením a konfigurací
- Optimalizovat náklady a výkon pomocí poznatků a doporučení z FAQ

## Obsah

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) je nástroj příkazového řádku zaměřený na vývojáře, který zrychluje dobu potřebnou k tomu, aby vaše aplikace přešla z lokálního vývojového prostředí do Azure. Poskytuje osvědčené postupy prostřednictvím šablon a pomáhá v celém životním cyklu nasazení.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Nástroj obecného určení pro správu prostředků Azure
- **azd**: Nástroj zaměřený na vývojáře pro pracovní postupy nasazení aplikací
- azd používá interně Azure CLI, ale poskytuje vyšší úroveň abstrakcí pro běžné vývojové scénáře
- azd zahrnuje šablony, správu prostředí a automatizaci nasazení

### Q: Do I need Azure CLI installed to use azd?
**A**: Ano, azd vyžaduje Azure CLI pro autentizaci a některé operace. Nejprve nainstalujte Azure CLI a poté nainstalujte azd.

### Q: What programming languages does azd support?
**A**: azd je nezávislý na jazyce. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické weby
- Kontejnerizované aplikace

### Q: Can I use azd with existing projects?
**A**: Ano! Můžete buď:
1. Použít `azd init` k přidání konfigurace azd do existujících projektů
2. Přizpůsobit existující projekty tak, aby odpovídaly struktuře šablon azd
3. Vytvořit vlastní šablony založené na vaší stávající architektuře

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Použijte `azd auth login`, které otevře okno prohlížeče pro autentizaci do Azure. Pro scénáře CI/CD použijte servisní principaly nebo spravované identity.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Ano. Použijte `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` k určení, kterou předplatné použít pro každé prostředí.

### Q: What permissions do I need to deploy with azd?
**A**: Typicky potřebujete:
- **Contributor** roli na resource group nebo subscription
- **User Access Administrator**, pokud nasazujete prostředky, které vyžadují přiřazení rolí
- Specifická oprávnění se liší podle šablony a nasazovaných prostředků

### Q: Can I use azd in CI/CD pipelines?
**A**: Rozhodně! azd je navržen pro integraci do CI/CD. Použijte servisní principaly pro autentizaci a nastavte proměnné prostředí pro konfiguraci.

### Q: How do I handle authentication in GitHub Actions?
**A**: Použijte akci Azure Login s přihlašovacími údaji servisního principala:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Oficiální šablony: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Šablony komunity: Vyhledávání na GitHubu pro "azd-template"
- Použijte `azd template list` pro prohlížení dostupných šablon

### Q: How do I create a custom template?
**A**: 
1. Začněte se strukturou existující šablony
2. Upravte `azure.yaml`, infrastrukturní soubory a aplikační kód
3. Důkladně otestujte pomocí `azd up`
4. Publikujte na GitHub s vhodnými štítky

### Q: Can I use azd without a template?
**A**: Ano, použijte `azd init` v existujícím projektu k vytvoření nezbytných konfiguračních souborů. Budete muset ručně nakonfigurovat `azure.yaml` a infrastrukturní soubory.

### Q: What's the difference between official and community templates?
**A**: 
- **Oficiální šablony**: Udržované společností Microsoft, pravidelně aktualizované, s rozsáhlou dokumentací
- **Šablony komunity**: Vytvořené vývojáři, mohou mít specializované použití, různá kvalita a údržba

### Q: How do I update a template in my project?
**A**: Šablony se neaktualizují automaticky. Můžete:
1. Ručně porovnat a sloučit změny ze zdrojové šablony
2. Začít znovu pomocí `azd init` s aktualizovanou šablonou
3. Cherry-pickovat konkrétní vylepšení z aktualizovaných šablon

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd může nasadit jakoukoli službu Azure prostřednictvím Bicep/ARM šablon, včetně:
- App Services, Container Apps, Functions
- Databází (SQL, PostgreSQL, Cosmos DB)
- Úložiště, Key Vault, Application Insights
- Síťování, zabezpečení a monitorovací prostředky

### Q: Can I deploy to multiple regions?
**A**: Ano, nakonfigurujte více regionů ve svých Bicep šablonách a nastavte parametr location odpovídajícím způsobem pro každé prostředí.

### Q: How do I handle database schema migrations?
**A**: Použijte deployment hooks v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Ano, použijte `azd provision` k nasazení pouze infrastrukturních komponent definovaných ve vašich šablonách.

### Q: How do I deploy to existing Azure resources?
**A**: To je složité a není přímo podporováno. Můžete:
1. Importovat existující prostředky do vašich Bicep šablon
2. Použít reference na existující prostředky v šablonách
3. Upravit šablony tak, aby podmíněně vytvářely nebo odkazovaly prostředky

### Q: Can I use Terraform instead of Bicep?
**A**: V současnosti azd primárně podporuje Bicep/ARM šablony. Podpora Terraformu není oficiálně dostupná, i když mohou existovat komunitní řešení.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Vytvořte samostatná prostředí pomocí `azd env new <environment-name>` a nakonfigurujte odlišná nastavení pro každé:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: V složce `.azure` ve vašem adresáři projektu. Každé prostředí má svou vlastní složku s konfiguračními soubory.

### Q: How do I set environment-specific configuration?
**A**: Použijte `azd env set` pro konfiguraci proměnných prostředí:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: Složka `.azure` obsahuje citlivé informace a neměla by být commitována do verzovacího systému. Místo toho:
1. Zdokumentujte požadované proměnné prostředí
2. Použijte skripty pro nasazení k nastavení prostředí
3. Použijte Azure Key Vault pro citlivou konfiguraci

### Q: How do I override template defaults?
**A**: Nastavte proměnné prostředí, které odpovídají parametrům šablony:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Běžné příčiny:
1. **Authentication issues**: Spusťte `azd auth login`
2. **Insufficient permissions**: Zkontrolujte přiřazení rolí v Azure
3. **Resource naming conflicts**: Změňte AZURE_ENV_NAME
4. **Quota/capacity issues**: Zkontrolujte dostupnost v regionu
5. **Template errors**: Validujte Bicep šablony

### Q: How do I debug deployment failures?
**A**: 
1. Použijte `azd deploy --debug` pro podrobné výstupy
2. Zkontrolujte historii nasazení v Azure portálu
3. Prohlédněte Aktivní logy (Activity Log) v Azure portálu
4. Použijte `azd show` pro zobrazení stavu aktuálního prostředí

### Q: Why are my environment variables not working?
**A**: Zkontrolujte:
1. Že názvy proměnných přesně odpovídají parametrům šablony
2. Že hodnoty jsou správně uzavřeny v uvozovkách, pokud obsahují mezery
3. Že je vybráno správné prostředí: `azd env select <environment>`
4. Že jsou proměnné nastaveny ve správném prostředí

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Toto odstraní všechny prostředky a konfiguraci prostředí.

### Q: Why is my application not accessible after deployment?
**A**: Zkontrolujte:
1. Že nasazení bylo úspěšně dokončeno
2. Že aplikace běží (zkontrolujte logy v Azure portálu)
3. Že síťové bezpečnostní skupiny povolují provoz
4. Že DNS/vlastní domény jsou správně nakonfigurovány

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Náklady závisí na:
- Nasazených službách Azure
- Vybraných úrovních služeb/SKU
- Regionálních rozdílech v cenách
- Vzorcích používání

Použijte [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) pro odhady.

### Q: How do I control costs in azd deployments?
**A**: 
1. Používejte nižší SKU pro vývojová prostředí
2. Nastavte rozpočty a upozornění v Azure
3. Používejte `azd down` k odstranění prostředků, když nejsou potřeba
4. Vyberte vhodné regiony (ceny se liší podle lokality)
5. Používejte nástroje Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Mnoho služeb Azure nabízí bezplatné vrstvy:
- App Service: K dispozici bezplatná úroveň
- Azure Functions: 1M bezplatných spuštění/měsíc
- Cosmos DB: Bezplatná vrstva s 400 RU/s
- Application Insights: Prvních 5GB/měsíc zdarma

Konfigurujte šablony tak, aby používaly bezplatné úrovně, kde jsou dostupné.

### Q: How do I estimate costs before deployment?
**A**: 
1. Prohlédněte si `main.bicep` šablony, abyste viděli, jaké prostředky jsou vytvořeny
2. Použijte Azure Pricing Calculator s konkrétními SKU
3. Nasajte do vývojového prostředí nejprve, abyste sledovali skutečné náklady
4. Použijte Azure Cost Management pro detailní analýzu nákladů

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Držte aplikační kód odděleně od infrastruktury
2. Používejte smysluplné názvy služeb v `azure.yaml`
3. Implementujte správné zpracování chyb v build skriptech
4. Používejte konfiguraci specifickou pro prostředí
5. Zahrňte komplexní dokumentaci

### Q: How should I organize multiple services in azd?
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

### Q: Should I commit the `.azure` folder to version control?
**A**: **Ne!** Složka `.azure` obsahuje citlivé informace. Přidejte ji do `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Používejte Azure Key Vault pro tajemství
2. Odkazujte na tajemství Key Vault v konfiguraci aplikace
3. Nikdy necommitujte tajemství do verzovacího systému
4. Používejte spravované identity pro autentizaci mezi službami

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Používejte samostatná prostředí pro každé stupně (dev/staging/prod)
2. Implementujte automatizované testování před nasazením
3. Používejte servisní principaly pro autentizaci
4. Ukládejte citlivou konfiguraci do tajemství/promených pipeline
5. Zaveďte schvalovací brány pro produkční nasazení

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Ano, prostřednictvím deployment hooks v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Použijte příkazy azd v existujících skriptech pipeline
2. Standardizujte šablony azd napříč týmy
3. Integrujte s existujícím monitorováním a alertováním
4. Používejte JSON výstup azd pro integraci do pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Ano, azd funguje s jakýmkoli CI/CD systémem. Vytvořte Azure DevOps pipeline, které používají příkazy azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **nástroj azd**: Přispějte do [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Šablony**: Vytvořte šablony podle [pokynů pro šablony](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentace**: Přispějte do dokumentace na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Otázka: Jaký je plán vývoje pro azd?
**Odpověď**: Zkontrolujte [oficiální plán](https://github.com/Azure/azure-dev/projects) pro plánované funkce a vylepšení.

### Otázka: Jak migrovat z jiných nástrojů nasazení na azd?
**Odpověď**: 
1. Analyzujte současnou architekturu nasazení
2. Vytvořte ekvivalentní Bicep šablony
3. Konfigurujte `azure.yaml` tak, aby odpovídal současným službám
4. Důkladně otestujte ve vývojovém prostředí
5. Postupně migrujte prostředí

---

## Stále máte otázky?

### **Nejprve vyhledejte**
- Zkontrolujte [oficiální dokumentaci](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Vyhledejte [GitHub issues](https://github.com/Azure/azure-dev/issues) pro podobné problémy

### **Získejte pomoc**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora komunity
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické dotazy
- [Azure Discord](https://discord.gg/azure) - Komunitní chat v reálném čase

### **Nahlásit problémy**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Nahlášení chyb a požadavků na funkce
- Přiložte příslušné logy, chybové zprávy a kroky k reprodukci

### **Další informace**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tato častá otázka (FAQ) je pravidelně aktualizována. Poslední aktualizace: September 9, 2025*

---

**Navigace**
- **Předchozí lekce**: [Glossary](glossary.md)
- **Další lekce**: [Studijní průvodce](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby pro překlad založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nezodpovídáme za jakákoliv nedorozumění nebo mylné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->