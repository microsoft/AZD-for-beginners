# AZD pre AI vývojárov Workshop

> Zdrojové pokyny prekontrolované podľa AZD 1.37.2 k 4. novembru 2026. Snímky obrazovky sú ilustračné; dostupnosť služby, označenia v portáli a prednastavenia šablón sa môžu zmeniť.

> [!IMPORTANT]  
> **Tento workshop je vybavený sprievodcom workshopom, ktorého náhľad si môžete pozrieť vo vašom lokálnom prehliadači. Pre začiatok otvorte repozitár v GitHub Codespaces, dev kontajneri alebo lokálnom klone s nainštalovaným MkDocs — potom počkajte, kým neuvidíte aktívny terminál VS Code a zadajte:**  
> Z koreňového adresára repozitára kurzu nainštalujte `requirements-dev.txt`, potom spustite `python -m mkdocs serve --config-file workshop/mkdocs.yml` na popredí.
> **Mali by ste vidieť vyskočiace dialógové okno na otvorenie náhľadovej stránky v prehliadači.**

Vitajte na praktickom workshope zameranom na učenie Azure Developer CLI (AZD) so zameraním na nasadenie AI aplikácií. Tento workshop vám pomôže získať praktické pochopenie AZD šablón v 3 krokoch:

1. **Objavovanie** - nájdite šablónu, ktorá je pre vás správna.
1. **Nasadenie** - nasadiť a overiť, že to funguje
1. **Prispôsobenie** - upraviť a iterovať, aby bola vaša!

Počas tohoto workshopu sa tiež oboznámite so základnými nástrojmi a pracovnými postupmi pre vývojárov, ktoré vám pomôžu zefektívniť váš celý vývojový proces.

| | | 
|:---|:---|
| **📚 Domovská stránka kurzu**| [AZD pre začiatočníkov](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentácia** | [Začnite so šablónami AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Šablóny** | [Microsoft Foundry Šablóny](https://ai.azure.com/templates) |
|**🚀 Ďalšie kroky** | [Prijmite Výzvu](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Prehľad workshopu

**Trvanie:** 3-4 hodiny  
**Úroveň:** Začiatočník až stredne pokročilý  
**Predpoklady:** Znalosť Azure, konceptov AI, VS Code a nástrojov príkazového riadku.

Toto je praktický workshop, kde sa učíte priamo pri práci. Po dokončení cvičení odporúčame preštudovať si kurz AZD pre začiatočníkov, aby ste pokračovali vo vašom učení o bezpečnostných a produktívnych osvedčených postupoch.

| Čas| Modul  | Cieľ |
|:---|:---|:---|
| 15 minút | Úvod | Nastavenie cieľov, pochopenie zámerov |
| 30 minút | Výber AI šablóny | Preskúmať možnosti a vybrať začínajúcu šablónu | 
| 30 minút | Overenie AI šablóny | Nasadiť predvolenú verziu na Azure |
| 30 minút | Rozobratie AI šablóny | Preskúmať štruktúru a konfiguráciu |
| 30 minút | Konfigurácia AI šablóny | Aktivovať a vyskúšať dostupné funkcie |
| 30 minút | Prispôsobenie AI šablóny | Prispôsobiť šablónu vašim potrebám |
| 30 minút | Uvoľnenie infraštruktúry | Vyčistiť a uvoľniť zdroje |
| 15 minút | Záver a ďalšie kroky | Zdroj učenia, výzva workshopu |
| | |

## Čo sa naučíte

Vnímajte AZD šablónu ako vzdelávacie pieskovisko na preskúmanie rôznych schopností a nástrojov pre úplný vývoj na Microsoft Foundry. Na konci workshopu by ste mali mať intuitívny prehľad o rôznych nástrojoch a konceptoch v tomto kontexte.

| Koncept  | Cieľ |
|:---|:---|
| **Azure Developer CLI** | Pochopenie príkazov nástroja a pracovných postupov|
| **AZD šablóny**| Pochopenie štruktúry projektu a konfigurácie|
| **Azure AI Agent**| Zavedenie a nasadenie Microsoft Foundry projektu  |
| **Azure AI Search**| Umožnenie kontextového inžinierstva s agentmi |
| **Observability**| Preskúmať trasovanie, monitorovanie a vyhodnocovanie |
| **Red Teaming**| Preskúmať adversárske testovanie a opatrenia |
| | |

## Moduly workshopu

Pripravený začať? Prejdite si moduly workshopu:

- [Modul 1: Výber AI šablóny](instructions/1-Select-AI-Template.md)
- [Modul 2: Overenie AI šablóny](instructions/2-Validate-AI-Template.md) 
- [Modul 3: Rozobratie AI šablóny](instructions/3-Deconstruct-AI-Template.md)
- [Modul 4: Konfigurácia AI šablóny](instructions/4-Configure-AI-Template.md)
- [Modul 5: Prispôsobenie AI šablóny](instructions/5-Customize-AI-Template.md)
- [Modul 6: Uvoľnenie infraštruktúry](instructions/6-Teardown-Infrastructure.md)
- [Modul 7: Záver a ďalšie kroky](instructions/7-Wrap-up.md)

## Máte spätnú väzbu?

Zverejnite problém v tomto repozitári (označte ho `Workshop`) alebo sa pridajte k nám na [Discord](https://aka.ms/foundry/discord) a napíšte na náš `#get-help` kanál

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->