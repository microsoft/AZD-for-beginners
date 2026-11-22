# 5. Prispôsobenie šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stanovenie východiskového bodu

Použite inicializované úložisko [Začíname s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents) z predchádzajúcich modulov. Pred zmenou čohokoľvek si zaznamenajte revíziu šablóny, verziu AZD, vybrané prostredie, nasadenie modelu a pracovné ukážkové otázky.

Ukážka implementuje aplikáciu konverzačného agenta. NEPRERASTIE na maloobchodný systém dvoch agentov len nastavením premenných prostredia alebo uložením ďalších inštrukčných súborov. Extra agenti, spracovanie nástrojov, smerovanie, autorizácia a prístup k údajom vyžadujú aplikačný kód.

Prezrite si inštrukcie a nástroje aktuálne nasadeného agenta vo Foundry. Otestujte jednu faktickú otázku, jednu otázku vyhľadávania a jednu otázku, na ktorú ukážkové dáta nevedia odpovedať. Overte citácie voči skutočným zdrojovým dokumentom namiesto toho, aby ste predpokladali, že plynulá odpoveď je správna.

## 5.2 Prispôsobenie vyhľadávania poznatkov

Šablóna podporuje vyhľadávanie založené na súboroch a voliteľnú integráciu Azure AI Search. Postupujte podľa [aktuálneho návodu AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pre indexovanie a konfiguráciu nástrojov.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Povoľovanie služby je iba jedna časť vyhľadávania. Pred nahraním vlastných údajov:

1. Overte, že máte povolenie používať dokumenty a odstráňte citlivé informácie.
2. Vyberte model vkladania podporovaný vo vašom regióne a nastavte jeho kompatibilnú verziu, typ nasadenia a dimenzie vektorov.
3. Vytvorte/naplňte index podľa dokumentovaného postupu ukážky.
4. Nakonfigurujte vyhľadávací nástroj agenta tak, aby používal tento index.
5. Otestujte vyhľadávanie, citácie, autorizáciu a správanie, keď neexistuje žiadny relevantný dokument.

Neprepínajte z `text-embedding-3-small` na iný model vkladania bez overenia rozmerov a podľa potreby znovuvytvorenia alebo preindexovania vektorov. Názov ako `retail-products` nie je implementovaný katalóg ani politika prístupu.

## 5.3 Sledovanie a monitorovanie

Postupujte podľa [návodu na pozorovateľnosť vzorky](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Uistite sa, že požadovaný zdroj Application Insights a spojenie už existujú; ak meníte nastavenia infraštruktúry, použite `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošlite testovaciu požiadavku, potom si prezrite aplikačné logy Container App a zobrazenie sledovania agenta vo Foundry. Skontrolujte latenciu, volania nástrojov, chyby a koreláciu medzi požiadavkou a sledovaním. Nepredpokladajte, že telemetria je pripojená len preto, že nasadenie bolo úspešné.

Nechajte `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` vypnuté, pokiaľ ste explicitne nepreskúmali súhlas, redakciu, uchovávanie a kontrolu prístupu. Sledovania môžu obsahovať citlivé argumenty nástrojov alebo obsah dokumentov, aj keď obyčajné aplikačné logy vyzerajú neškodne.

## 5.4 Hodnotenie agenta

Vstupný bod hodnotenia vzorky je teraz [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nie adresár `evals/`. Z koreňového adresára vzorky použite Python prostredie spĺňajúce dokumentované požiadavky:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Pred spustením dokončite [požiadavky hodnotenia](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy načítajú konfiguráciu z vybraného `.azure/<environment>/.env`; overte, že je vybrané požadované prostredie. Dôležité vstupy zahŕňajú:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, použitý vo formáte požadovanom aktuálnou ukážkou (recenzovaná verzia používa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, používaný ako nasadenie súdneho modelu

Prezrite si testy, aby ste porozumeli voľbe hodnotiteľa, prahom, potrebným rolám a nákladom na model. Dokončené spustenie nie je automaticky úspešným kvalitatívnym filtrom; prezrite si skóre, neúspešné/chybné prípady a prepojené výsledky vo Foundry.

### Rozšírenie samostatného hodnotenia AZD

Python test vyššie je **workflow špecifický pre vzorku**. Voliteľné rozšírenie `azure.ai.evaluations` je iný workflow, s vlastnou konfiguráciou `evals/azure.eval.yaml`. Inštaluje sa samostatne, nie je súčasťou všeobecne dostupného balíka `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pre kompletné nastavenie rozšírenia pozrite [workflow hodnotenia a migráciu](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od beta.22 rozšírenia agentov nepoužívajte odstránené príkazy `azd ai agent eval`. Inštalácia rozšírenia hodnotení neupravuje Python testy vzorky ani automaticky nevytvára konfiguráciu hodnotenia.

Pre samostatné **cvičenie hosteného agenta GA** použite prázdnu zložku mimo ukážok tohto workshopu a postupujte podľa [návodu Foundry z lokálu do cloudu](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Používa AZD 1.37.0+, balík `microsoft.foundry`, Python 3.13+ a aktuálny uv. Preskúmate `azure.yaml`, testujete lokálne s Agent Inspector, nasadíte kód pre vzdialenú zostavu Foundry a vygenerujete/preskúmate dataset a klasifikáciu pred konfigurovaním `azd ai eval init --name quality`. Nenahrádzajte testy tejto vzorky ani nepredpokladajte, že inštalácia balíka zmení jeho hostingový model.

## 5.5 Red teaming AI a kontinuálne hodnotenie

Aktuálna vzorka poskytuje [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončite jej požiadavky a preštudujte zamýšľaný cieľ a náklady pred spustením:

```bash
pytest tests/test_red_teaming.py -s
```

Použite autorizované testovacie nasadenie a syntetické dáta. Prezrite generované útoky a výsledky; toto skenovanie nepreukazuje, že aplikácia je bezpečná alebo v súlade.

Sprievodca [pozorovateľnosťou](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) tiež popisuje kontinuálne hodnotenie konfigurované pri spustení kontajnera. Vyhodnocuje skutočné interakcie používateľov, nie generovaný testovací prenos, a podpora vyhodnocovateľa sa líši podľa regiónu. Žiadne interakcie znamenajú žiadne záznamy o hodnotení. Overte nainštalovanú vzorovú verziu a konfiguráciu vyhodnocovateľa namiesto toho, aby ste predpokladali, že každé nasadenie má rovnaké predvolené nastavenia.

Autentifikácia je oddelená od hodnotenia. Postupujte podľa zdokumentovaného nastavenia identity/prístupu vo vzore. Neexistuje zdokumentovaný „fallback základnej autentifikácie“ na ochranu verejného koncového bodu.

## 5.6 Dizajnové cvičenie: prispôsobenie maloobchodu

!!! warning "Dizajnové cvičenie, nie hotové nasadenie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napíšte krátky plán riešiaci:

| Oblasť | Rozhodnutie a zhromaždené dôkazy |
|------|----------------------------------|
| Zodpovednosti agenta | Začnite s jedným agentom alebo zdôvodnite samostatných agentov Shopper a Loyalty a logiku smerovania |
| Dáta | Definujte syntetický katalóg/dáta odmien a vlastníctvo aktualizácií |
| Nástroje | Najprv implementujte iba obsluhu na čítanie; špecifikujte autorizáciu a validáciu pre akékoľvek zápisy |
| Modely | Vyberte dostupné kombinácie modelu/verzie/SKU a overte kvótu; vyhnite sa nasadeniu nepoužitých modelov |
| Vyhľadávanie | Definujte indexovanie, rozmery vkladov, citácie a prístupové kontroly na úrovni dokumentov |
| Hodnotenie | Pridajte prípady očakávanej odpovede, nepodporovanej otázky, použitia nástroja a bezpečnosti s explicitnými prahmi |
| Prevádzka | Definujte telemetriu, rozpočty latencie/chýb, limity nákladov a vlastníctvo čistenia |

Uloženie `custom-agents/shopper-agent-instructions.md` nezpôsobí jeho načítanie vo vzorovom príklade. Nájdite aplikačný kód, ktorý vytvára/aktualizuje agenta, pripojte tam svoje prekontrolované inštrukcie a pred testovaním overte výslednú verziu agenta. Inštrukcie nemôžu udeliť prístup k dátam alebo nástrojom, ktoré ste neimplementovali.

Aplikujte jednu zmenu naraz, znovu nasadte dotknuté komponenty a opakovane spustite svoje základné otázky a hodnotenia. Uchovajte funkčnú revíziu na porovnanie. Pre inšpiráciu architektúry pozrite [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ktorý tiež nie je kompletnou maloobchodnou aplikáciou.

!!! quote "NA KONCI TOHTO LABÁKU BY STE MALI MAŤ"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Pokračujte na [Demontáž infraštruktúry](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->