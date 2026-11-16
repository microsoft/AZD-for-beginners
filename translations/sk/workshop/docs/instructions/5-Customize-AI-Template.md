# 5. Prispôsobenie šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE VEDIEŤ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stanovenie východiskovej úrovne

Použite inicializovaný repozitár [Začnite s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents) z predchádzajúcich modulov. Pred zmenou čohokoľvek si zaznamenajte revíziu šablóny, verziu AZD, zvolené prostredie, nasadenie modelu a vzorové otázky.

Vzor implementuje chatovaciu aplikáciu poháňanú agentom. Nezmení sa na maloobchodný systém s dvoma agentmi iba nastavením premenných prostredia alebo uložením ďalších inštrukčných súborov. Dodatoční agenti, obsluha nástrojov, smerovanie, autorizácia a prístup k dátam vyžadujú aplikačný kód.

Preskúmajte pokyny a nástroje aktuálne nasadeného agenta vo Foundry. Otestujte jednu faktickú otázku, jednu otázku na vyhľadávanie a jednu otázku, na ktorú vzorové dáta nevedia odpovedať. Overte citácie proti skutočným zdrojovým dokumentom namiesto predpokladania, že plynulá odpoveď je správna.

## 5.2 Prispôsobenie získavania znalostí

Šablóna podporuje získavanie údajov založené na súboroch a voliteľnú integráciu Azure AI Search. Postupujte podľa [aktuálneho návodu AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pre indexovanie a konfiguráciu nástrojov.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Povolenie služby je len jednou súčasťou získavania dát. Pred nahraním vlastných údajov:

1. Overte si, že máte povolenie na použitie dokumentov a odstráňte citlivé informácie.
2. Vyberte model na vkladanie údajov podporovaný vo vašom regióne a nastavte jeho kompatibilnú verziu, typ nasadenia a rozmery vektorov.
3. Vytvorte / naplňte index pomocou zdokumentovaného postupu vo vzore.
4. Nakonfigurujte nástroj agenta na získavanie údajov tak, aby používal daný index.
5. Otestujte získavanie údajov, citácie, autorizáciu a správanie, keď neexistuje žiadny relevantný dokument.

Neprehadzujte `text-embedding-3-small` na iný model vkladania bez kontroly rozmerov a prípadného prerobenia / znovuindexovania vektorov. Názov ako `retail-products` nie je implementovaný katalóg ani politika prístupu.

## 5.3 Trasovanie a monitorovanie

Postupujte podľa [sprievodcu pozorovateľnosťou vzoru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Uistite sa, že vyžadovaný zdroj Application Insights a pripojenie už existujú; ak meníte infraštruktúru, použite `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošlite testovací dopyt a potom skúmajte aplikačné logy Container App a zobrazenie trasovania agenta vo Foundry. Skontrolujte latenciu, volania nástrojov, chyby a koreláciu medzi dopytom a trasou. Nepredpokladajte, že telemetria je pripojená len preto, že nasadenie prebehlo úspešne.

Nechávejte `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` vypnutý, pokiaľ ste výslovne nezvážili súhlas, redakciu, uchovávanie a kontroly prístupu. Trasovanie môže obsahovať citlivé argumenty nástrojov alebo obsah dokumentov aj keď bežné aplikačné logy vyzerajú neškodne.

## 5.4 Vyhodnotenie agenta

Vstupným miestom vyhodnotenia vzoru je teraz [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nie priečinok `evals/`. Zo základne vzoru použite Python prostredie, ktoré spĺňa jeho dokumentované požiadavky:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Pred spustením dokončite [požiadavky na vyhodnotenie](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy načítavajú konfiguráciu z vybraného `.azure/<environment>/.env`; overte, či je vybrané správne prostredie. Medzi dôležité vstupy patrí:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, vo formáte požadovanom aktuálnym vzorom (uverejnená verzia používa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, používaný ako nasadenie rozhodujúceho modelu

Preskúmajte testy, aby ste pochopili výber hodnotiteľa, prahové hodnoty, požadované roly a náklady modelu. Dokončený beh nie je automaticky úspešným kvalitatívnym bránovi; prezrite si skóre, neúspešné / chybné prípady a prepojené výsledky vo Foundry.

### Rozšírenie samostatných hodnotení AZD

Uvedený Python test je **týmto vzorom špecifický pracovný tok**. Voliteľné rozšírenie `azure.ai.evaluations` je iný pracovný tok s vlastnou konfiguráciou `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pre kompletné nastavenie rozšírenia pozrite [pracovné toky a migráciu hodnotení](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od beta verzie agentov s rozšírením 22 nepoužívajte odstránené príkazy `azd ai agent eval`. Inštalácia rozšírenia hodnotení neprevádza Python testy vzoru ani automaticky nevytvára konfiguráciu hodnotenia.

## 5.5 AI red teaming a kontinuálne hodnotenie

Aktuálny vzor poskytuje [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončite jeho predpoklady a preskúmajte cieľ a náklady pred spustením:

```bash
pytest tests/test_red_teaming.py -s
```

Použite autorizované testovacie nasadenie a syntetické dáta. Preskúmajte generované útoky a výsledky; toto skenovanie neurčuje, že aplikácia je bezpečná alebo v súlade.

Sprievodca [pozorovateľnosťou](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) tiež popisuje nepretržitú evaluáciu nakonfigurovanú pri spustení kontajnera. Vyhodnocuje skutočné interakcie používateľov, nie generovaný testovací prevádzku, a podpora vyhodnotenia sa líši podľa regiónu. Žiadne interakcie znamenajú žiadne záznamy vyhodnotenia. Overte si nainštalovanú verziu príkladu a konfiguráciu vyhodnotenia namiesto predpokladu, že každé nasadenie má rovnaké predvolené hodnoty.

Overovanie je oddelené od vyhodnotenia. Postupujte podľa zdokumentovaného nastavenia identity/prístupu v príklade. Neexistuje žiadny zdokumentovaný „basic auth fallback“, na ktorý by sa dalo spoľahnúť pri ochrane verejného koncového bodu.

## 5.6 Návrhové cvičenie: prispôsobenie maloobchodu

!!! warning "Návrhové cvičenie, nie dokončené nasadenie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napíšte krátky plán, ktorý rieši:

| Oblasť | Rozhodnutie a zber dôkazov |
|------|----------------------------------|
| Zodpovednosti agenta | Začnite s jedným agentom alebo zdôvodnite samostatné agentov Shopper a Loyalty a logiku smerovania |
| Dáta | Definujte syntetický katalóg/databázu odmien a vlastníctvo aktualizácií |
| Nástroje | Najprv implementujte handler-y iba na čítanie; špecifikujte autorizáciu a overenie pre akékoľvek zápisy |
| Modely | Vyberte dostupné kombinácie model/ verzia/ SKU a overte kvótu; vyhnite sa poskytovaniu nepoužívaných modelov |
| Vyhľadávanie | Definujte indexovanie, rozmery embeddingu, citácie a prístupové kontroly na úrovni dokumentov |
| Vyhodnotenie | Pridajte prípady očakávaných odpovedí, nepodporovaných otázok, použitia nástrojov a bezpečnostné prípady s explicitnými prahmi |
| Prevádzka | Definujte telemetriu, latenciu/rozpočet chýb, limity nákladov a vlastníctvo čistenia |

Uloženie `custom-agents/shopper-agent-instructions.md` nespôsobí, že príklad ho načíta. Nájdite aplikačný kód, ktorý vytvára/aktualizuje agenta, pripojte svoje skontrolované inštrukcie tam a pred testovaním overte výslednú verziu agenta. Inštrukcie nemôžu udeliť prístup k dátam alebo nástrojom, ktoré ste neimplementovali.

Aplikujte jednu zmenu naraz, znovu nasadte ovplyvnené komponenty a opäť spustite svoje základné otázky a vyhodnotenia. Udržiavajte funkčnú revíziu na porovnanie. Pre architektonickú inšpiráciu pozrite [maloobchodný blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ktorý tiež nie je kompletnou maloobchodnou aplikáciou.

!!! quote "NA KONCI TOHTO CVIČENIA BY STE MALI MAŤ"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Pokračujte na [Odstránenie infraštruktúry](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->