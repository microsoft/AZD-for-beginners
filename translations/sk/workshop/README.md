<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:08:19+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sk"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop vo výstavbe 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Tento workshop je momentálne vo fáze aktívneho vývoja.</strong><br>
      Obsah môže byť neúplný alebo podliehať zmenám. Skontrolujte neskôr aktualizácie!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Posledná aktualizácia: Október 2025
      </span>
    </div>
  </div>
</div>

# Workshop AZD pre vývojárov AI

Vitajte na praktickom workshope zameranom na učenie sa Azure Developer CLI (AZD) s dôrazom na nasadenie AI aplikácií. Tento workshop vám pomôže získať praktické znalosti o šablónach AZD v 3 krokoch:

1. **Objavovanie** - nájdite šablónu, ktorá je pre vás najvhodnejšia.
1. **Nasadenie** - nasadenie a overenie funkčnosti
1. **Prispôsobenie** - upravte a prispôsobte si šablónu podľa svojich potrieb!

Počas tohto workshopu budete tiež oboznámení so základnými nástrojmi a pracovnými postupmi pre vývojárov, ktoré vám pomôžu zefektívniť váš vývojový proces od začiatku až do konca.

<br/>

## Návod v prehliadači

Lekcie workshopu sú v Markdown formáte. Môžete ich prehliadať priamo na GitHube - alebo spustiť náhľad v prehliadači, ako je znázornené na obrázku nižšie.

![Workshop](../../../translated_images/sk/workshop.75906f133e6f8ba0.png)

Ak chcete použiť túto možnosť - vytvorte si fork repozitára vo svojom profile a spustite GitHub Codespaces. Keď bude terminál VS Code aktívny, zadajte tento príkaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Po niekoľkých sekundách sa zobrazí dialógové okno. Vyberte možnosť `Otvoriť v prehliadači`. Návod založený na webe sa teraz otvorí v novej karte prehliadača. Niektoré výhody tohto náhľadu:

1. **Vstavané vyhľadávanie** - rýchlo nájdite kľúčové slová alebo lekcie.
1. **Ikona kopírovania** - pri kódoch sa zobrazí možnosť kopírovania.
1. **Prepínanie témy** - prepínajte medzi tmavým a svetlým režimom.
1. **Získajte pomoc** - kliknite na ikonu Discord v päte a pripojte sa!

<br/>

## Prehľad workshopu

**Trvanie:** 3-4 hodiny  
**Úroveň:** Začiatočník až mierne pokročilý  
**Predpoklady:** Znalosť Azure, AI konceptov, VS Code a nástrojov príkazového riadku.

Toto je praktický workshop, kde sa učíte priamo pri práci. Po dokončení cvičení odporúčame preštudovať si učebné osnovy AZD pre začiatočníkov, aby ste pokračovali vo svojej vzdelávacej ceste v oblasti bezpečnosti a produktivity.

| Čas| Modul  | Cieľ |
|:---|:---|:---|
| 15 min | [Úvod](docs/instructions/0-Introduction.md) | Nastavenie cieľov a pochopenie zámerov |
| 30 min | [Výber AI šablóny](docs/instructions/1-Select-AI-Template.md) | Preskúmanie možností a výber štartovacej šablóny | 
| 30 min | [Overenie AI šablóny](docs/instructions/2-Validate-AI-Template.md) | Nasadenie predvolenej šablóny na Azure |
| 30 min | [Rozbor AI šablóny](docs/instructions/3-Deconstruct-AI-Template.md) | Preskúmanie štruktúry a konfigurácie |
| 30 min | [Konfigurácia AI šablóny](docs/instructions/4-Configure-AI-Template.md) | Aktivácia a skúšanie dostupných funkcií |
| 30 min | [Prispôsobenie AI šablóny](docs/instructions/5-Customize-AI-Template.md) | Úprava šablóny podľa vašich potrieb |
| 30 min | [Odstránenie infraštruktúry](docs/instructions/6-Teardown-Infrastructure.md) | Vyčistenie a uvoľnenie zdrojov |
| 15 min | [Zhrnutie a ďalšie kroky](docs/instructions/7-Wrap-up.md) | Zdroje na učenie, výzva workshopu |

<br/>

## Čo sa naučíte

AZD šablónu si predstavte ako učebný sandbox na preskúmanie rôznych schopností a nástrojov pre kompletný vývoj na Azure AI Foundry. Na konci tohto workshopu by ste mali mať intuitívne pochopenie rôznych nástrojov a konceptov v tomto kontexte.

| Koncept  | Cieľ |
|:---|:---|
| **Azure Developer CLI** | Pochopenie príkazov a pracovných postupov nástroja |
| **AZD šablóny**| Pochopenie štruktúry projektu a konfigurácie |
| **Azure AI Agent**| Zriadenie a nasadenie projektu Azure AI Foundry |
| **Azure AI Search**| Aktivácia kontextového inžinierstva s agentmi |
| **Pozorovateľnosť**| Preskúmanie sledovania, monitorovania a hodnotení |
| **Red Teaming**| Preskúmanie testovania odolnosti a zmierňovania rizík |

<br/>

## Štruktúra workshopu

Workshop je štruktúrovaný tak, aby vás previedol cestou od objavenia šablóny, cez nasadenie, rozbor a prispôsobenie - s použitím oficiálnej šablóny [Začíname s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents) ako základu.

### [Modul 1: Výber AI šablóny](docs/instructions/1-Select-AI-Template.md) (30 min)

- Čo sú AI šablóny?
- Kde nájdem AI šablóny?
- Ako začať s budovaním AI agentov?
- **Lab**: Rýchly štart s GitHub Codespaces

### [Modul 2: Overenie AI šablóny](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Aká je architektúra AI šablóny?
- Aký je vývojový pracovný postup AZD?
- Ako získať pomoc pri vývoji AZD?
- **Lab**: Nasadenie a overenie šablóny AI agentov

### [Modul 3: Rozbor AI šablóny](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Preskúmajte svoje prostredie v `.azure/` 
- Preskúmajte nastavenie zdrojov v `infra/` 
- Preskúmajte konfiguráciu AZD v `azure.yaml`
- **Lab**: Úprava environmentálnych premenných a opätovné nasadenie

### [Modul 4: Konfigurácia AI šablóny](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Preskúmanie: Retrieval Augmented Generation
- Preskúmanie: Hodnotenie agentov a Red Teaming
- Preskúmanie: Sledovanie a monitorovanie
- **Lab**: Preskúmanie AI agenta + pozorovateľnosť 

### [Modul 5: Prispôsobenie AI šablóny](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definovanie: PRD so scenárovými požiadavkami
- Konfigurácia: Environmentálne premenné pre AZD
- Implementácia: Lifecycle Hooks pre dodatočné úlohy
- **Lab**: Prispôsobenie šablóny pre môj scenár

### [Modul 6: Odstránenie infraštruktúry](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Rekapitulácia: Čo sú AZD šablóny?
- Rekapitulácia: Prečo používať Azure Developer CLI?
- Ďalšie kroky: Skúste inú šablónu!
- **Lab**: Odstránenie infraštruktúry a vyčistenie

<br/>

## Výzva workshopu

Chcete sa sami vyzvať na viac? Tu je niekoľko návrhov na projekty - alebo sa podeľte o svoje nápady s nami!!

| Projekt | Popis |
|:---|:---|
|1. **Rozbor komplexnej AI šablóny** | Použite pracovný postup a nástroje, ktoré sme načrtli, a zistite, či dokážete nasadiť, overiť a prispôsobiť inú šablónu AI riešenia. _Čo ste sa naučili?_|
|2. **Prispôsobenie podľa vášho scenára**  | Skúste napísať PRD (Product Requirements Document) pre iný scenár. Potom použite GitHub Copilot vo vašom repozitári šablóny v Agent Model - a požiadajte ho, aby vám vygeneroval pracovný postup prispôsobenia. _Čo ste sa naučili? Ako by ste mohli tieto návrhy zlepšiť?_|
| | |

## Máte spätnú väzbu?

1. Zverejnite problém v tomto repozitári - označte ho `Workshop` pre pohodlie.
1. Pripojte sa k Azure AI Foundry Discord - spojte sa so svojimi kolegami!


| | | 
|:---|:---|
| **📚 Domov kurzu**| [AZD pre začiatočníkov](../README.md)|
| **📖 Dokumentácia** | [Začíname s AI šablónami](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI šablóny** | [Šablóny Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Ďalšie kroky** | [Prijmite výzvu](../../../workshop) |
| | |

<br/>

---

**Predchádzajúce:** [Príručka na riešenie problémov AI](../docs/troubleshooting/ai-troubleshooting.md) | **Ďalšie:** Začnite s [Lab 1: Základy AZD](../../../workshop/lab-1-azd-basics)

**Pripravení začať budovať AI aplikácie s AZD?**

[Začnite Lab 1: Základy AZD →](./lab-1-azd-basics/README.md)

---

**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.