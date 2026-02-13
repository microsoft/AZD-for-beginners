<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD pre AI vývojárov
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Praktický workshop pre tvorbu AI aplikácií pomocou Azure Developer CLI.</strong><br>
      Dokončite 7 modulov, aby ste ovládli šablóny AZD a pracovné postupy nasadenia AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Posledná aktualizácia: február 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD pre AI vývojárov

Vitajte v praktickom workshope na učenie Azure Developer CLI (AZD) so zameraním na nasadzovanie AI aplikácií. Tento workshop vám pomôže získať praktické pochopenie šablón AZD v 3 krokoch:

1. **Objavovanie** - nájdite šablónu, ktorá vám vyhovuje.
1. **Nasadenie** - nasadiť a overiť, že funguje
1. **Prispôsobenie** - upravte a opakovane vylepšujte, aby bol váš!

Počas tohto workshopu sa tiež zoznámite so základnými nástrojmi a pracovnými postupmi pre vývojárov, ktoré vám pomôžu zefektívniť váš end-to-end vývojový proces.

<br/>

## Sprievodca v prehliadači

Lekcie workshopu sú v Markdown. Môžete sa v nich pohybovať priamo na GitHub - alebo spustiť náhľad v prehliadači, ako je zobrazené na snímke nižšie.

![Ukážka workshopu](../../../translated_images/sk/workshop.75906f133e6f8ba0.webp)

Ak chcete použiť túto možnosť - vytvorte fork repozitára do svojho profilu a spustite GitHub Codespaces. Keď bude terminál VS Code aktívny, zadajte tento príkaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Za pár sekúnd uvidíte vyskakovacie dialógové okno. Vyberte možnosť `Open in browser`. Webový sprievodca sa teraz otvorí v novej karte prehliadača. Niektoré výhody tohto náhľadu:

1. **Vstavané hľadanie** - rýchlo nájdite kľúčové slová alebo lekcie.
1. **Ikona kopírovania** - najeďte myšou na bloky kódu, aby sa zobrazila táto možnosť
1. **Prepínanie motívu** - prepnite medzi tmavým a svetlým režimom
1. **Získajte pomoc** - kliknite na ikonu Discord v päte a pripojte sa!

<br/>

## Prehľad workshopu

**Trvanie:** 3-4 hodiny  
**Úroveň:** Začiatočník až stredne pokročilý  
**Predpoklady:** Základná znalosť Azure, konceptov AI, VS Code a nástrojov príkazového riadku.

Toto je praktický workshop, kde sa učíte praxou. Po dokončení cvičení odporúčame prejsť kurz AZD For Beginners, aby ste pokračovali vo vzdelávaní v oblasti najlepších postupov pre zabezpečenie a produktivitu.

| Čas| Modul  | Cieľ |
|:---|:---|:---|
| 15 min | [Úvod](docs/instructions/0-Introduction.md) | Uviesť kontext, pochopiť ciele |
| 30 min | [Výber AI šablóny](docs/instructions/1-Select-AI-Template.md) | Preskúmať možnosti a vybrať štartovaciu šablónu | 
| 30 min | [Overenie AI šablóny](docs/instructions/2-Validate-AI-Template.md) | Nasadiť predvolené riešenie do Azure |
| 30 min | [Rozobratie AI šablóny](docs/instructions/3-Deconstruct-AI-Template.md) | Preskúmať štruktúru a konfiguráciu |
| 30 min | [Konfigurácia AI šablóny](docs/instructions/4-Configure-AI-Template.md) | Aktivovať a vyskúšať dostupné funkcie |
| 30 min | [Prispôsobenie AI šablóny](docs/instructions/5-Customize-AI-Template.md) | Prispôsobiť šablónu vašim potrebám |
| 30 min | [Odstránenie infraštruktúry](docs/instructions/6-Teardown-Infrastructure.md) | Vyčistiť a uvoľniť zdroje |
| 15 min | [Zhrnutie a ďalšie kroky](docs/instructions/7-Wrap-up.md) | Vzdelávacie zdroje, záverečná výzva workshopu |

<br/>

## Čo sa naučíte

Považujte šablónu AZD za učebný sandbox na preskúmanie rôznych možností a nástrojov pre end-to-end vývoj na Microsoft Foundry. Na konci tohto workshopu by ste mali mať intuitívny prehľad o rôznych nástrojoch a konceptoch v tomto kontexte.

| Koncept  | Cieľ |
|:---|:---|
| **Azure Developer CLI** | Pochopiť príkazy nástroja a pracovné postupy|
| **AZD šablóny**| Pochopiť štruktúru projektu a konfiguráciu|
| **Azure AI Agent**| Zriadiť a nasadiť projekt Microsoft Foundry |
| **Azure AI Search**| Umožniť kontextové inžinierstvo s agentmi |
| **Observabilita**| Preskúmať trasovanie, monitorovanie a hodnotenia |
| **Red Teaming**| Preskúmať adversárne testovanie a zmiernenia |

<br/>

## Štruktúra workshopu

Workshop je štruktúrovaný tak, aby vás previedol cestou od objavenia šablóny až po nasadenie, rozobratie a prispôsobenie - pričom základom je oficiálna [Začíname s AI Agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents) štartovacia šablóna.

### [Modul 1: Výber AI šablóny](docs/instructions/1-Select-AI-Template.md) (30 min)

- Čo sú AI šablóny?
- Kde nájdem AI šablóny?
- Ako môžem začať budovať AI agentov?
- **Lab**: Rýchly štart s GitHub Codespaces

### [Modul 2: Overenie AI šablóny](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Aká je architektúra AI šablóny?
- Aký je vývojový pracovný postup AZD?
- Ako môžem získať pomoc pri vývoji s AZD?
- **Lab**: Nasadiť a overiť šablónu AI agentov

### [Modul 3: Rozobratie AI šablóny](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Preskúmajte svoje prostredie v `.azure/` 
- Preskúmajte nastavenie zdrojov v `infra/` 
- Preskúmajte svoju AZD konfiguráciu v `azure.yaml`s
- **Lab**: Upraviť environmentálne premenné & znovu nasadiť

### [Modul 4: Konfigurácia AI šablóny](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Preskúmať: Retrieval Augmented Generation
- Preskúmať: Hodnotenie agentov & Red Teaming
- Preskúmať: Tracing & Monitoring
- **Lab**: Preskúmať AI agenta + Observability 

### [Modul 5: Prispôsobenie AI šablóny](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definovať: PRD so scenárovými požiadavkami
- Konfigurovať: Environmentálne premenné pre AZD
- Implementovať: Lifecycle Hooks pre pridané úlohy
- **Lab**: Prispôsobiť šablónu môjmu scenáru

### [Modul 6: Odstránenie infraštruktúry](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Zhrnutie: Čo sú AZD šablóny?
- Zhrnutie: Prečo používať Azure Developer CLI?
- Ďalšie kroky: Vyskúšajte inú šablónu!
- **Lab**: Deprovision infraštruktúry & vyčistenie

<br/>

## Výzva workshopu

Chcete sa viac vyzvať? Tu je niekoľko návrhov projektov - alebo sa s nami podeľte o svoje nápady!!

| Projekt | Popis |
|:---|:---|
|1. **Rozoberte zložitú AI šablónu** | Použite workflow a nástroje, ktoré sme načrtli, a zistite, či dokážete nasadiť, overiť a prispôsobiť inú šablónu AI riešenia. _Čo ste sa naučili?_|
|2. **Prispôsobte podľa svojho scenára**  | Skúste napísať PRD (Product Requirements Document) pre iný scenár. Potom použite GitHub Copilot v repozitári so šablónou v Agent Model - a požiadajte ho, aby vygeneroval pracovný postup prispôsobenia pre vás. _Čo ste sa naučili? Ako by ste mohli tieto návrhy vylepšiť?_|
| | |

## Máte spätnú väzbu?

1. Vytvorte issue v tomto repozitári - označte ho tagom `Workshop` pre prehľadnosť.
1. Pripojte sa k Microsoft Foundry Discord - spojte sa s kolegami!


| | | 
|:---|:---|
| **📚 Domov kurzu**| [AZD For Beginners](../README.md)|
| **📖 Dokumentácia** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Šablóny** | [Šablóny Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Ďalšie kroky** | [Začať workshop](../../../workshop) |
| | |

<br/>

---

**Navigácia:** [Hlavný kurz](../README.md) | [Úvod](docs/instructions/0-Introduction.md) | [Modul 1: Výber AI šablóny](docs/instructions/1-Select-AI-Template.md)

**Ste pripravení začať vytvárať AI aplikácie s AZD?**

[Začať workshop: Úvod →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->