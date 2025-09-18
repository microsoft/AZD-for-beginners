<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T09:37:57+00:00",
  "source_file": "course-outline.md",
  "language_code": "cs"
}
-->
## Struktura učení v 8 kapitolách

### Kapitola 1: Základy a rychlý start (30-45 minut) 🌱
**Předpoklady**: Azure předplatné, základní znalost příkazového řádku  
**Složitost**: ⭐

#### Co se naučíte
- Základy Azure Developer CLI
- Instalace AZD na vaší platformě  
- První úspěšné nasazení
- Klíčové koncepty a terminologie

#### Výukové materiály
- [AZD Basics](docs/getting-started/azd-basics.md) - Základní koncepty
- [Installation & Setup](docs/getting-started/installation.md) - Průvodce pro konkrétní platformy
- [Your First Project](docs/getting-started/first-project.md) - Praktický tutoriál
- [Command Cheat Sheet](resources/cheat-sheet.md) - Rychlý přehled

#### Praktický výsledek
Úspěšné nasazení jednoduché webové aplikace na Azure pomocí AZD

---

### Kapitola 2: Vývoj zaměřený na AI (1-2 hodiny) 🤖
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Azure AI Foundry s AZD
- Nasazení aplikací poháněných AI
- Konfigurace AI služeb
- Vzory RAG (Retrieval-Augmented Generation)

#### Výukové materiály
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Praktická laboratoř
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)

#### Praktický výsledek
Nasazení a konfigurace chatovací aplikace poháněné AI s funkcemi RAG

---

### Kapitola 3: Konfigurace a autentizace (45-60 minut) ⚙️
**Předpoklady**: Dokončená kapitola 1  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy pro autentizaci a zabezpečení
- Organizace a pojmenování zdrojů
- Nasazení do více prostředí

#### Výukové materiály
- [Configuration Guide](docs/getting-started/configuration.md) - Nastavení prostředí
- Vzory zabezpečení a spravovaná identita
- Příklady nasazení do více prostředí

#### Praktický výsledek
Správa více prostředí s odpovídající autentizací a zabezpečením

---

### Kapitola 4: Infrastruktura jako kód a nasazení (1-1,5 hodiny) 🏗️
**Předpoklady**: Dokončené kapitoly 1-3  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód pomocí Bicep
- Strategie zajišťování zdrojů
- Vytváření vlastních šablon

#### Výukové materiály
- [Deployment Guide](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy
- [Provisioning Resources](docs/deployment/provisioning.md) - Správa zdrojů
- Příklady kontejnerů a mikroslužeb

#### Praktický výsledek
Nasazení komplexních aplikací s více službami pomocí vlastních šablon infrastruktury

---

### Kapitola 5: Řešení s více AI agenty (2-3 hodiny) 🤖🤖
**Předpoklady**: Dokončené kapitoly 1-2  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury s více agenty
- Orchestrace a koordinace agentů
- Nasazení AI připravené pro produkci
- Implementace agentů pro zákazníky a inventář

#### Výukové materiály
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletní implementace
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasazení jedním kliknutím
- Vzory koordinace více agentů

#### Praktický výsledek
Nasazení a správa produkčního řešení s více AI agenty

---

### Kapitola 6: Validace před nasazením a plánování (1 hodina) 🔍
**Předpoklady**: Dokončená kapitola 4  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Automatizované kontroly před nasazením
- Plánování optimalizace nákladů

#### Výukové materiály
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Validace zdrojů
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Nákladově efektivní volby
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktický výsledek
Validace a optimalizace nasazení před jeho provedením

---

### Kapitola 7: Řešení problémů a ladění (1-1,5 hodiny) 🔧
**Předpoklady**: Dokončená jakákoliv kapitola o nasazení  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a jejich řešení
- Specifické problémy AI
- Optimalizace výkonu

#### Výukové materiály
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ a řešení
- [Debugging Guide](docs/troubleshooting/debugging.md) - Krok za krokem
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktický výsledek
Samostatná diagnostika a řešení běžných problémů s nasazením

---

### Kapitola 8: Produkční a podnikové vzory (2-3 hodiny) 🏢
**Předpoklady**: Dokončené kapitoly 1-4  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie nasazení do produkce
- Podnikové vzory zabezpečení
- Monitoring a optimalizace nákladů
- Škálovatelnost a správa

#### Výukové materiály
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Podnikové vzory
- Příklady mikroslužeb a podnikových řešení
- Rámce pro monitoring a správu

#### Praktický výsledek
Nasazení aplikací připravených pro podnikové prostředí s plnými produkčními schopnostmi

---

## Postup učení a složitost

### Postupné budování dovedností

- **🌱 Začátečníci**: Začněte kapitolou 1 (Základy) → Kapitola 2 (Vývoj AI)
- **🔧 Středně pokročilí**: Kapitoly 3-4 (Konfigurace & Infrastruktura) → Kapitola 6 (Validace)
- **🚀 Pokročilí**: Kapitola 5 (Řešení s více agenty) → Kapitola 7 (Řešení problémů)
- **🏢 Podnikové prostředí**: Dokončete všechny kapitoly, zaměřte se na kapitolu 8 (Produkční vzory)

### Indikátory složitosti

- **⭐ Základní**: Jednoduché koncepty, vedené tutoriály, 30-60 minut
- **⭐⭐ Střední**: Více konceptů, praktické cvičení, 1-2 hodiny  
- **⭐⭐⭐ Pokročilé**: Komplexní architektury, vlastní řešení, 1-3 hodiny
- **⭐⭐⭐⭐ Expertní**: Produkční systémy, podnikové vzory, 2-4 hodiny

### Flexibilní cesty učení

#### 🎯 Rychlá cesta pro AI vývojáře (4-6 hodin)
1. **Kapitola 1**: Základy a rychlý start (45 minut)
2. **Kapitola 2**: Vývoj zaměřený na AI (2 hodiny)  
3. **Kapitola 5**: Řešení s více AI agenty (3 hodiny)
4. **Kapitola 8**: Nejlepší postupy pro produkční AI (1 hodina)

#### 🛠️ Cesta pro specialisty na infrastrukturu (5-7 hodin)
1. **Kapitola 1**: Základy a rychlý start (45 minut)
2. **Kapitola 3**: Konfigurace a autentizace (1 hodina)
3. **Kapitola 4**: Infrastruktura jako kód a nasazení (1,5 hodiny)
4. **Kapitola 6**: Validace před nasazením a plánování (1 hodina)
5. **Kapitola 7**: Řešení problémů a ladění (1,5 hodiny)
6. **Kapitola 8**: Produkční a podnikové vzory (2 hodiny)

#### 🎓 Kompletní cesta učení (8-12 hodin)
Postupné dokončení všech 8 kapitol s praktickým cvičením a validací

## Rámec pro dokončení kurzu

### Validace znalostí
- **Kontrolní body kapitol**: Praktická cvičení s měřitelnými výsledky
- **Praktická ověření**: Nasazení funkčních řešení pro každou kapitolu
- **Sledování pokroku**: Vizualizace a odznaky za dokončení
- **Komunitní validace**: Sdílení zkušeností na Discord kanálech Azure

### Hodnocení výsledků učení

#### Dokončení kapitol 1-2 (Základy + AI)
- ✅ Nasazení základní webové aplikace pomocí AZD
- ✅ Nasazení chatovací aplikace poháněné AI s RAG
- ✅ Porozumění základním konceptům AZD a integraci AI

#### Dokončení kapitol 3-4 (Konfigurace + Infrastruktura)  
- ✅ Správa nasazení do více prostředí
- ✅ Vytvoření vlastních šablon infrastruktury pomocí Bicep
- ✅ Implementace bezpečných vzorů autentizace

#### Dokončení kapitol 5-6 (Více agentů + Validace)
- ✅ Nasazení komplexního řešení s více AI agenty
- ✅ Plánování kapacity a optimalizace nákladů
- ✅ Implementace automatizované validace před nasazením

#### Dokončení kapitol 7-8 (Řešení problémů + Produkce)
- ✅ Samostatné řešení problémů s nasazením  
- ✅ Implementace monitoringu a zabezpečení na podnikové úrovni
- ✅ Nasazení aplikací připravených pro produkční prostředí s řízením

### Certifikace a uznání
- **Odznak za dokončení kurzu**: Dokončení všech 8 kapitol s praktickou validací
- **Uznání v komunitě**: Aktivní účast v Discordu Azure AI Foundry
- **Profesní rozvoj**: Relevantní dovednosti pro nasazení AZD a AI
- **Kariérní růst**: Schopnosti pro nasazení cloudových řešení na podnikové úrovni

## Vhodnost obsahu pro moderní vývojáře

### Technická hloubka a pokrytí
- **Integrace Azure OpenAI**: Kompletní pokrytí GPT-4o, embeddings a nasazení více modelů
- **Vzory AI architektury**: Implementace RAG, orchestrace více agentů a produkční AI pracovní postupy
- **Infrastruktura jako kód**: Šablony Bicep, nasazení ARM a automatizované zajišťování
- **Připravenost na produkci**: Zabezpečení, škálování, monitoring, optimalizace nákladů a správa
- **Podnikové vzory**: Nasazení do více prostředí, integrace CI/CD a rámce pro dodržování předpisů

### Praktické zaměření na učení
- **Automatizace nasazení**: Důraz na praktické pracovní postupy AZD, nikoliv teoretické koncepty
- **Reálné scénáře**: Kompletní řešení pro maloobchod s více agenty (zákazník a inventář)
- **Produkční příklady**: Balíčky šablon ARM, nasazení jedním kliknutím a podnikové vzory
- **Dovednosti ladění**: Specifické ladění AI, diagnostika více služeb a optimalizace výkonu
- **Relevance pro průmysl**: Obsah založený na zpětné vazbě komunity Azure AI Foundry a požadavcích podniků

### Integrace komunity a podpory
- **Integrace Discordu**: Aktivní účast v komunitách Azure AI Foundry a Microsoft Azure
- **Diskuze na GitHubu**: Spolupráce na učení a řešení problémů s kolegy a odborníky
- **Přístup k odborníkům**: Přímé spojení s inženýry Microsoftu a specialisty na nasazení AI
- **Nepřetržité aktualizace**: Obsah kurzu se vyvíjí s aktualizacemi platformy Azure a zpětnou vazbou komunity
- **Rozvoj kariéry**: Dovednosti přímo aplikovatelné na moderní role v oblasti cloudu a AI

### Validace výsledků učení
- **Měřitelné dovednosti**: Každá kapitola obsahuje praktická cvičení s ověřitelnými výsledky
- **Rozvoj portfolia**: Kompletní projekty vhodné pro profesní portfolia a pracovní pohovory
- **Uznání v průmyslu**: Dovednosti odpovídají aktuálním požadavkům pracovního trhu na AZD a nasazení AI
- **Profesní síť**: Přístup do komunity vývojářů Azure pro kariérní růst a spolupráci

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neneseme odpovědnost za jakékoli nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.