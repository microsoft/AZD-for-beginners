<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:06:56+00:00",
  "source_file": "workshop/README.md",
  "language_code": "cs"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop ve výstavbě 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Tento workshop je momentálně aktivně vyvíjen.</strong><br>
      Obsah může být neúplný nebo se může měnit. Brzy se vraťte pro aktualizace!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Poslední aktualizace: říjen 2025
      </span>
    </div>
  </div>
</div>

# Workshop AZD pro vývojáře AI

Vítejte v praktickém workshopu zaměřeném na Azure Developer CLI (AZD) s důrazem na nasazení AI aplikací. Tento workshop vám pomůže získat praktické znalosti o šablonách AZD ve 3 krocích:

1. **Objevování** - najděte šablonu, která vám vyhovuje.
1. **Nasazení** - nasazení a ověření funkčnosti.
1. **Přizpůsobení** - upravte a přizpůsobte si šablonu podle svých potřeb!

Během tohoto workshopu budete také seznámeni se základními nástroji a pracovními postupy pro vývojáře, které vám pomohou zefektivnit celý proces vývoje.

<br/>

## Průvodce v prohlížeči

Lekce workshopu jsou v Markdownu. Můžete je procházet přímo na GitHubu - nebo spustit náhled v prohlížeči, jak je ukázáno na obrázku níže.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.cs.png)

Pro použití této možnosti - vytvořte si fork repozitáře ve svém profilu a spusťte GitHub Codespaces. Jakmile bude terminál VS Code aktivní, zadejte tento příkaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Během několika sekund se zobrazí dialogové okno. Vyberte možnost `Otevřít v prohlížeči`. Průvodce v prohlížeči se nyní otevře v nové záložce prohlížeče. Některé výhody tohoto náhledu:

1. **Vestavěné vyhledávání** - rychle najděte klíčová slova nebo lekce.
1. **Ikona kopírování** - najeďte na bloky kódu a zobrazí se tato možnost.
1. **Přepínání motivů** - přepínejte mezi tmavým a světlým motivem.
1. **Získejte pomoc** - klikněte na ikonu Discordu v zápatí a připojte se!

<br/>

## Přehled workshopu

**Délka:** 3-4 hodiny  
**Úroveň:** Začátečník až středně pokročilý  
**Předpoklady:** Znalost Azure, konceptů AI, VS Code a nástrojů příkazového řádku.

Tento workshop je praktický, učíte se přímo při práci. Po dokončení cvičení doporučujeme projít si kurikulum AZD pro začátečníky, abyste pokračovali ve své vzdělávací cestě v oblasti bezpečnosti a produktivity.

| Čas| Modul  | Cíl |
|:---|:---|:---|
| 15 min | [Úvod](docs/instructions/0-Introduction.md) | Nastavení scény, pochopení cílů |
| 30 min | [Výběr AI šablony](docs/instructions/1-Select-AI-Template.md) | Prozkoumejte možnosti a vyberte startovací šablonu | 
| 30 min | [Ověření AI šablony](docs/instructions/2-Validate-AI-Template.md) | Nasazení výchozího řešení na Azure |
| 30 min | [Rozbor AI šablony](docs/instructions/3-Deconstruct-AI-Template.md) | Prozkoumejte strukturu a konfiguraci |
| 30 min | [Konfigurace AI šablony](docs/instructions/4-Configure-AI-Template.md) | Aktivace a vyzkoušení dostupných funkcí |
| 30 min | [Přizpůsobení AI šablony](docs/instructions/5-Customize-AI-Template.md) | Přizpůsobení šablony vašim potřebám |
| 30 min | [Odstranění infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) | Úklid a uvolnění zdrojů |
| 15 min | [Závěr a další kroky](docs/instructions/7-Wrap-up.md) | Zdroje pro učení, výzva workshopu |

<br/>

## Co se naučíte

Šablonu AZD si představte jako učební prostředí pro zkoumání různých schopností a nástrojů pro kompletní vývoj na Azure AI Foundry. Na konci workshopu byste měli mít intuitivní představu o různých nástrojích a konceptech v tomto kontextu.

| Koncept  | Cíl |
|:---|:---|
| **Azure Developer CLI** | Porozumět příkazům a pracovním postupům nástroje |
| **Šablony AZD**| Porozumět struktuře projektu a konfiguraci |
| **Azure AI Agent**| Zajistit a nasadit projekt Azure AI Foundry |
| **Azure AI Search**| Aktivovat kontextové inženýrství s agenty |
| **Pozorovatelnost**| Prozkoumat trasování, monitorování a hodnocení |
| **Red Teaming**| Prozkoumat testování odolnosti a zmírnění rizik |

<br/>

## Struktura workshopu

Workshop je strukturován tak, aby vás provedl cestou od objevení šablony, přes nasazení, rozbor a přizpůsobení - s využitím oficiální startovací šablony [Začínáme s AI agenty](https://github.com/Azure-Samples/get-started-with-ai-agents).

### [Modul 1: Výběr AI šablony](docs/instructions/1-Select-AI-Template.md) (30 min)

- Co jsou AI šablony?
- Kde najdu AI šablony?
- Jak začít s budováním AI agentů?
- **Lab**: Rychlý start s GitHub Codespaces

### [Modul 2: Ověření AI šablony](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Jaká je architektura AI šablony?
- Jaký je vývojový pracovní postup AZD?
- Jak získat pomoc s vývojem AZD?
- **Lab**: Nasazení a ověření šablony AI agentů

### [Modul 3: Rozbor AI šablony](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Prozkoumejte své prostředí v `.azure/` 
- Prozkoumejte nastavení zdrojů v `infra/` 
- Prozkoumejte konfiguraci AZD v `azure.yaml`
- **Lab**: Úprava proměnných prostředí a opětovné nasazení

### [Modul 4: Konfigurace AI šablony](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Prozkoumejte: Retrieval Augmented Generation
- Prozkoumejte: Hodnocení agentů a Red Teaming
- Prozkoumejte: Trasování a monitorování
- **Lab**: Prozkoumejte AI agenta + pozorovatelnost 

### [Modul 5: Přizpůsobení AI šablony](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definujte: PRD se scénářovými požadavky
- Konfigurujte: Proměnné prostředí pro AZD
- Implementujte: Lifecycle Hooks pro přidané úkoly
- **Lab**: Přizpůsobení šablony pro můj scénář

### [Modul 6: Odstranění infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Rekapitulace: Co jsou šablony AZD?
- Rekapitulace: Proč používat Azure Developer CLI?
- Další kroky: Vyzkoušejte jinou šablonu!
- **Lab**: Odstranění infrastruktury a úklid

<br/>

## Výzva workshopu

Chcete se sami více zapojit? Zde je několik návrhů projektů - nebo nám sdílejte své nápady!!

| Projekt | Popis |
|:---|:---|
|1. **Rozbor komplexní AI šablony** | Použijte pracovní postupy a nástroje, které jsme popsali, a zkuste nasadit, ověřit a přizpůsobit jinou šablonu AI řešení. _Co jste se naučili?_|
|2. **Přizpůsobení podle vašeho scénáře**  | Zkuste napsat PRD (Product Requirements Document) pro jiný scénář. Poté použijte GitHub Copilot ve svém repozitáři šablony v Agent Modelu - a požádejte ho, aby vám vytvořil pracovní postup přizpůsobení. _Co jste se naučili? Jak byste mohli tyto návrhy zlepšit?_|
| | |

## Máte zpětnou vazbu?

1. Vytvořte issue v tomto repozitáři - označte ho `Workshop` pro snadné vyhledání.
1. Připojte se na Discord Azure AI Foundry - spojte se s ostatními!

| | | 
|:---|:---|
| **📚 Domov kurzu**| [AZD pro začátečníky](../README.md)|
| **📖 Dokumentace** | [Začínáme s AI šablonami](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI šablony** | [Šablony Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Další kroky** | [Přijměte výzvu](../../../workshop) |
| | |

<br/>

---

**Předchozí:** [Průvodce řešením problémů AI](../docs/troubleshooting/ai-troubleshooting.md) | **Další:** Začněte s [Lab 1: Základy AZD](../../../workshop/lab-1-azd-basics)

**Připraveni začít budovat AI aplikace s AZD?**

[Začněte s Lab 1: Základy AZD →](./lab-1-azd-basics/README.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.