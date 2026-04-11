<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD pro vývojáře AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Praktický workshop pro vytváření AI aplikací s Azure Developer CLI.</strong><br>
      Dokončete 7 modulů a zvládněte šablony AZD a postupy nasazení AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Poslední aktualizace: březen 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD pro vývojáře AI

Vítejte na praktickém workshopu zaměřeném na učení Azure Developer CLI (AZD) s důrazem na nasazení AI aplikací. Tento workshop vám pomůže získat aplikované znalosti šablon AZD ve 3 krocích:

1. **Objevování** - najděte šablonu, která je pro vás ta pravá.
1. **Nasazení** - nasadit a ověřit funkčnost.
1. **Přizpůsobení** - upravit a iterovat, aby byla vaše!

Během tohoto workshopu se také seznámíte se základními nástroji a postupy vývojáře, které vám pomohou zefektivnit celý váš vývojový proces.

<br/>

## Průvodce v prohlížeči

Lekce workshopu jsou ve formátu Markdown. Můžete je přímo procházet na GitHubu, nebo spustit náhled v prohlížeči, jak je zobrazeno na snímku obrazovky níže.

![Workshop](../../../translated_images/cs/workshop.75906f133e6f8ba0.webp)

Pro použití této možnosti - forknete repozitář do svého profilu a spusťte GitHub Codespaces. Jakmile je terminál VS Code aktivní, zadejte tento příkaz:

Tento náhled v prohlížeči funguje v GitHub Codespaces, vývojových kontejnerech nebo v místní kopii s nainstalovaným Pythonem a MkDocs.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Za pár sekund se zobrazí dialogové okno. Vyberte možnost `Open in browser` (Otevřít v prohlížeči). Webový průvodce se nyní otevře v nové záložce prohlížeče. Některé výhody tohoto náhledu:

1. **Vestavěné vyhledávání** - rychlé vyhledání klíčových slov nebo lekcí.
1. **Ikona kopírování** - najeďte myší na bloky kódu a uvidíte tuto možnost.
1. **Přepínání motivů** - přepínejte mezi tmavým a světlým režimem.
1. **Získejte pomoc** - klikněte na ikonku Discordu v patičce a připojte se!

<br/>

## Přehled workshopu

**Délka:** 3–4 hodiny  
**Úroveň:** Začátečník až středně pokročilý  
**Předpoklady:** Znalost Azure, konceptů AI, VS Code a nástrojů příkazového řádku.

Tento workshop je zaměřen na praktické učení. Po dokončení cvičení doporučujeme projít si kurz AZD pro začátečníky, abyste pokračovali ve vzdělávání v oblasti bezpečnosti a osvědčených postupů produktivity.

| Čas| Modul  | Cíl |
|:---|:---|:---|
| 15 min | [Úvod](docs/instructions/0-Introduction.md) | Nastavit cíle a pochopit záměr |
| 30 min | [Výběr AI šablony](docs/instructions/1-Select-AI-Template.md) | Prozkoumat možnosti a vybrat startovací šablonu | 
| 30 min | [Ověření AI šablony](docs/instructions/2-Validate-AI-Template.md) | Nasadit výchozí řešení do Azure |
| 30 min | [Rozebrání AI šablony](docs/instructions/3-Deconstruct-AI-Template.md) | Prozkoumat strukturu a konfiguraci |
| 30 min | [Konfigurace AI šablony](docs/instructions/4-Configure-AI-Template.md) | Aktivovat a vyzkoušet dostupné funkce |
| 30 min | [Přizpůsobení AI šablony](docs/instructions/5-Customize-AI-Template.md) | Přizpůsobit šablonu vašim potřebám |
| 30 min | [Ukončení infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) | Vyčistit a uvolnit prostředky |
| 15 min | [Závěr & další kroky](docs/instructions/7-Wrap-up.md) | Vzdělávací zdroje, výzva workshopu |

<br/>

## Co se naučíte

Považujte šablonu AZD za sandbox pro učení a objevování různých schopností a nástrojů pro kompletní vývoj na platformě Microsoft Foundry. Po skončení tohoto workshopu byste měli mít intuitivní přehled o různých nástrojích a konceptech v tomto kontextu.

| Koncept  | Cíl |
|:---|:---|
| **Azure Developer CLI** | Pochopit příkazy a postupy nástroje |
| **Šablony AZD**| Pochopit strukturu projektu a konfiguraci |
| **Azure AI Agent**| Provisioning a nasazení projektu Microsoft Foundry |
| **Azure AI Search**| Umožnit kontextové řízení s agenty |
| **Observability**| Prozkoumat tracing, monitoring a hodnocení |
| **Red Teaming**| Prozkoumat adversariální testy a mitigace |

<br/>

## Struktura workshopu

Workshop je strukturován tak, aby vás provedl cestou od objevení šablony, přes nasazení, rozebrání a přizpůsobení - používajíc oficiální startovací šablonu [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) jako základ.

### [Modul 1: Výběr AI šablony](docs/instructions/1-Select-AI-Template.md) (30 min)

- Co jsou AI šablony?
- Kde najdu AI šablony?
- Jak začít stavět AI agenty?
- **Cvičení**: Rychlý start v Codespaces nebo vývojovém kontejneru

### [Modul 2: Ověření AI šablony](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Jaká je architektura AI šablony?
- Jaký je vývojový postup AZD?
- Kde mohu získat pomoc s vývojem AZD?
- **Cvičení**: Nasadit a ověřit AI Agents šablonu

### [Modul 3: Rozebrání AI šablony](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Prozkoumat prostředí v `.azure/`
- Prozkoumat nastavení zdrojů v `infra/`
- Prozkoumat konfiguraci AZD v `azure.yaml`
- **Cvičení**: Upravit proměnné prostředí a nasadit znovu

### [Modul 4: Konfigurace AI šablony](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Prozkoumat: Retrieval Augmented Generation
- Prozkoumat: Hodnocení agenta & Red Teaming
- Prozkoumat: Tracing & Monitoring
- **Cvičení**: Prozkoumat AI agenta + observabilitu

### [Modul 5: Přizpůsobení AI šablony](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definovat: PRD se scénáři požadavků
- Konfigurovat: proměnné prostředí pro AZD
- Implementovat: životní cyklus úkolů (lifecycle hooks)
- **Cvičení**: Přizpůsobit šablonu pro svůj scénář

### [Modul 6: Ukončení infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Rekapitulace: Co jsou AZD šablony?
- Rekapitulace: Proč používat Azure Developer CLI?
- Další kroky: Vyzkoušejte jinou šablonu!
- **Cvičení**: Odstranění infrastruktury a úklid

<br/>

## Výzva workshopu

Chcete se vyzvat a udělat více? Zde jsou některé projektové návrhy – nebo nám sdílejte své nápady!

| Projekt | Popis |
|:---|:---|
|1. **Rozebrání složité AI šablony** | Použijte postup a nástroje, které jsme popsali, a zkuste nasadit, ověřit a přizpůsobit jinou AI šablonu. _Co jste se naučili?_|
|2. **Přizpůsobení podle vašeho scénáře**  | Zkuste napsat PRD (dokument požadavků na produkt) pro jiný scénář. Pak použijte GitHub Copilot v repozitáři šablony v Agent Model a požádejte ho o vytvoření procesu přizpůsobení. _Co jste se naučili? Jak byste mohli zlepšit tyto návrhy?_|
| | |

## Máte zpětnou vazbu?

1. Založte issue v tomto repozitáři - pro snadnější dohledání označte `Workshop`.
1. Připojte se do Microsoft Foundry Discord - spojte se s kolegy!


| | | 
|:---|:---|
| **📚 Domovská stránka kurzu**| [AZD pro začátečníky](../README.md)|
| **📖 Dokumentace** | [Začínáme se šablonami AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI šablony** | [Šablony Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Další kroky** | [Začít workshop](#přehled-workshopu) |
| | |

<br/>

---

**Navigace:** [Hlavní kurz](../README.md) | [Úvod](docs/instructions/0-Introduction.md) | [Modul 1: Výběr šablony](docs/instructions/1-Select-AI-Template.md)

**Připraveni začít vytvářet AI aplikace s AZD?**

[Začít workshop: Úvod →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Neodpovídáme za jakákoliv nedorozumění nebo nesprávné výklady vyplývající z používání tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->