# 5. Přizpůsobení šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stanovení výchozího bodu

Použijte inicializovaný repozitář [Začínáme s AI agenty](https://github.com/Azure-Samples/get-started-with-ai-agents) z předchozích modulů. Zaznamenejte revizi šablony, verzi AZD, vybrané prostředí, nasazení modelu a ukázkové otázky před jakoukoli změnou.

Ukázka implementuje chatovací aplikaci podporovanou agentem. Nestane se **automaticky** dvouagentovým maloobchodním systémem pouze nastavením proměnných prostředí nebo uložením dalších instrukčních souborů. Dodateční agenti, ovladače nástrojů, směrování, autorizace a přístup k datům vyžadují aplikační kód.

Prohlédněte si aktuální instrukce a nástroje nasazeného agenta v Foundry. Otestujte jednu faktickou otázku, jednu otázku pro vyhledávání a jednu otázku, na kterou ukázková data nemohou odpovědět. Ověřte citace podle skutečných zdrojových dokumentů, ne pouze předpokládejte, že plynulá odpověď je správná.

## 5.2 Přizpůsobení vyhledávání znalostí

Šablona podporuje vyhledávání založené na souborech a volitelnou integraci Azure AI Search. Řiďte se [aktuálním průvodcem AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pro indexaci a konfiguraci nástrojů.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Povolení služby je jen jedna část vyhledávání. Před nahráním vlastních dat:

1. Potvrďte, že máte povolení používat dokumenty a odstraňte citlivé informace.
2. Vyberte model vkládání, který je podporován ve vaší oblasti, a nastavte jeho kompatibilní verzi, typ nasazení a rozměry vektorů.
3. Vytvořte/naplňte index podle zdokumentovaného postupu ukázky.
4. Nakonfigurujte nástroj agenta pro vyhledávání tak, aby používal tento index.
5. Otestujte vyhledávání, citace, autorizaci a chování, když neexistuje žádný relevantní dokument.

Nepřepínejte z `text-embedding-3-small` na jiný model vkládání bez kontroly rozměrů a případného přestavění/přeindexování vektorů. Název jako `retail-products` není implementovaný katalog ani zásada řízení přístupu.

## 5.3 Sledování a monitorování

Řiďte se [průvodcem pozorovatelností ukázky](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Ujistěte se, že požadovaný prostředek Application Insights a připojení již existují; pokud měníte nastavení infrastruktury, použijte `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošlete testovací požadavek, poté prohlédněte aplikační logy Container App a zobrazení trasování agenta ve Foundry. Zkontrolujte latenci, volání nástrojů, chyby a korelaci mezi požadavkem a trasou. Nepředpokládejte, že telemetrie je připojena pouze proto, že nasazení proběhlo úspěšně.

Nezapínejte `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT`, pokud jste výslovně neprošli souhlas, redakci, uchovávání a kontrolu přístupu. Trasy mohou obsahovat citlivé argumenty nástrojů nebo obsah dokumentů, i když běžné aplikační logy vypadají nevinně.

## 5.4 Hodnocení agenta

Vstupní bod hodnocení ukázky je nyní [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), ne složka `evals/`. Ze základní složky ukázky použijte Python prostředí, které splňuje její zdokumentované požadavky:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Před spuštěním dokončete [předpoklady hodnocení](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy načítají konfiguraci z vybraného `.azure/<environment>/.env`; potvrďte, že je vybráno zamýšlené prostředí. Důležité vstupy zahrnují:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, používající formát požadovaný aktuální ukázkou (recenzovaná verze používá `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, použitý jako nasazení soudce-modelu

Prohlédněte si testy, abyste pochopili volbu hodnotitele, prahové hodnoty, požadované role a náklady modelu. Dokončené spuštění není automaticky průchodem kvalitou; zkontrolujte skóre, neúspěšné/chybné případy a propojené výsledky Foundry.

### Samostatné rozšíření hodnocení AZD

Python test výše je **specifický pracovní postup ukázky**. Volitelné rozšíření `azure.ai.evaluations` je jiný pracovní postup s vlastní konfigurací `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pro úplné nastavení rozšíření viz [pracovní postupy hodnocení a migrace](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od verze beta.22 rozšíření agentů nepoužívejte odstraněné příkazy `azd ai agent eval`. Instalace rozšíření hodnocení nepřevádí Python testy ukázky ani automaticky nevytváří konfiguraci hodnocení.

## 5.5 AI red teaming a kontinuální hodnocení

Aktuální ukázka poskytuje [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončete její předpoklady a prostudujte zamýšlený cíl a náklady před spuštěním:

```bash
pytest tests/test_red_teaming.py -s
```

Použijte autorizované testovací nasazení a syntetická data. Prohlédněte si vygenerované útoky a výsledky; toto skenování nezaručuje, že je aplikace bezpečná nebo v souladu s předpisy.

Průvodce [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) také popisuje průběžné hodnocení nastavené při spuštění kontejneru. Vyhodnocuje skutečné interakce uživatelů, nikoli generovaný testovací provoz, a podpora vyhodnocovače se liší podle regionu. Žádné interakce znamenají žádné záznamy v hodnocení. Ověřte nainstalovanou verzi vzoru a konfiguraci vyhodnocovače místo předpokládání, že každé nasazení má stejné výchozí hodnoty.

Autentizace je oddělena od vyhodnocení. Postupujte podle dokumentovaného nastavení identity/přístupu ve vzoru. Neexistuje žádný dokumentovaný „fallback pro základní autentizaci“ jako ochrana veřejného koncového bodu.

## 5.6 Cvičení návrhu: přizpůsobení pro maloobchod

!!! warning "Cvičení návrhu, nikoli dokončené nasazení"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napište krátký plán zahrnující:

| Oblast | Rozhodnutí a důkazy k získání |
|------|----------------------------------|
| Odpovědnosti agenta | Začněte s jedním agentem, nebo zdůvodněte oddělené agenty Shopper a Loyalty a logiku směrování |
| Data | Definujte syntetický katalog/soubor odměn a odpovědnost za aktualizace |
| Nástroje | Nejprve implementujte pouze pro čtení; určete autorizaci a ověřování pro jakékoliv zápisy |
| Modely | Vyberte dostupné kombinace modelu/verze/SKU a ověřte kvótu; vyhněte se přidělování nepoužívaných modelů |
| Vyhledávání | Definujte indexování, rozměry embeddingu, citace a přístupová oprávnění na úrovni dokumentů |
| Hodnocení | Přidejte případy očekávaných odpovědí, nepodporovaných otázek, používání nástrojů a bezpečnostní případy s explicitními prahy |
| Provoz | Definujte telemetrii, limity latence/chyb, nákladové limity a odpovědnost za úklid |

Uložení `custom-agents/shopper-agent-instructions.md` nezpůsobí, že vzor jej načte. Najděte kód aplikace, který vytváří/aktualizuje agenta, připojte své revidované instrukce tam a ověřte výslednou verzi agenta před testováním. Instrukce nemohou udělovat přístup k datům nebo nástrojům, které jste neimplementovali.

Aplikujte jednu změnu najednou, znovu nasadte ovlivněné komponenty a spusťte znovu své výchozí dotazy a hodnocení. Uchovejte funkční revizi pro srovnání. Pro inspiraci architekturou se podívejte na [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), který rovněž není kompletní maloobchodní aplikací.

!!! quote "NA KONCI TOHOTO CVIČENÍ BYSTE MĚLI MÍT"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Pokračujte na [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->