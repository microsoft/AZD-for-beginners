# 5. Přizpůsobení šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stanovení základní úrovně

Použijte inicializované repozitář [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) z předchozích modulů. Před jakoukoli změnou zaznamenejte revizi šablony, verzi AZD, vybrané prostředí, nasazení modelu a pracující ukázkové otázky.

Ukázka implementuje chatovací aplikaci podporovanou agentem. Nezmění se na maloobchodní systém se dvěma agenty jen nastavením proměnných prostředí nebo uložením dalších instrukčních souborů. Další agenti, nástroje, směrování, autorizace a přístup k datům vyžadují aplikační kód.

Prohlédněte si aktuálně nasazené instrukce a nástroje agenta ve Foundry. Otestujte jednu faktickou otázku, jednu otázku na vyhledávání a jednu otázku, na kterou vzorová data nemohou odpovědět. Ověřte citace vůči skutečným zdrojovým dokumentům, nepředpokládejte, že plynulá odpověď je správná.

## 5.2 Přizpůsobení vyhledávání znalostí

Šablona podporuje vyhledávání založené na souborech a volitelnou integraci Azure AI Search. Postupujte podle [aktuálního průvodce AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pro indexaci a konfiguraci nástrojů.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Povolování služby je jen částí vyhledávání. Než nahrajete svá data:

1. Potvrďte, že máte oprávnění dokumenty používat a odstraňte citlivé informace.
2. Vyberte model embeddingu podporovaný ve vaší oblasti a nastavte jeho kompatibilní verzi, typ nasazení a rozměry vektorů.
3. Vytvořte/naplňte index podle dokumentovaného procesu ve vzorku.
4. Nakonfigurujte nástroj agenta pro vyhledávání tak, aby používal tento index.
5. Otestujte vyhledávání, citace, autorizaci a chování, když neexistuje žádný relevantní dokument.

Nepřepínejte z `text-embedding-3-small` na jiný embeddingový model bez kontroly rozměrů a nutnosti znovuvytvořit/zkontrolovat indexace vektorů. Název jako `retail-products` není implementovaný katalog ani politika řízení přístupu.

## 5.3 Sledování a monitorování

Postupujte podle [průvodce observability vzorku](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Ujistěte se, že požadovaný zdroj Application Insights a připojení již existují; při změně infrastruktury použijte `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Odešlete testovací požadavek, poté prohlédněte aplikační logy Container App a zobrazení sledování agenta ve Foundry. Zkontrolujte latenci, volání nástrojů, chyby a korelaci mezi požadavkem a sledováním. Nepředpokládejte, že telemetrie je připojena pouze proto, že nasazení bylo úspěšné.

Nechte `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` zakázané, pokud jste výslovně nezkontrolovali souhlas, vymazání dat, uchovávání a kontrolu přístupu. Sledování může obsahovat citlivé argumenty nástrojů nebo obsah dokumentů, i když obyčejné aplikační logy vypadají neškodně.

## 5.4 Hodnocení agenta

Vstupní bod hodnocení vzorku je nyní [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nikoli složka `evals/`. Ze kořene vzorku použijte Python prostředí odpovídající jeho dokumentovaným požadavkům:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Před spuštěním dokončete [předpoklady hodnocení](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy načítají konfiguraci z vybraného `.azure/<environment>/.env`; ověřte, že je vybráno zamýšlené prostředí. Důležité vstupy zahrnují:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, použitý formát vyžadovaný aktuálním vzorkem (přezkoumaná verze používá `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, používaný jako nasazení modelu soudce

Prohlédněte testy, abyste pochopili výběr hodnotitele, prahové hodnoty, požadované role a náklady na model. Dokončené spuštění není automaticky kvalifikační branou; přezkoumejte skóre, neúspěšné/chybné případy a propojené výsledky ve Foundry.

### Rozšíření samostatného hodnocení AZD

Výše uvedený Python test je **workflow specifické pro vzorek**. Volitelné rozšíření `azure.ai.evaluations` je jiný workflow s vlastní konfigurací `evals/azure.eval.yaml`. Instalace je samostatná, není součástí obecně dostupného balíčku `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pro kompletní nastavení rozšíření viz [workflow hodnocení a migrace](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od verze beta.22 rozšíření agentů nepoužívejte odstraněné příkazy `azd ai agent eval`. Instalace rozšíření hodnocení nepřevádí Python testy vzorku ani automaticky nevytváří konfigurační hodnocení.

Pro samostatné **cvičení GA hostovaného agenta** použijte prázdnou složku mimo vzorek tohoto workshopu a postupujte podle [Foundry local-to-cloud walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Používá AZD 1.37.0+, balíček `microsoft.foundry`, Python 3.13+ a aktuální uv. Budete kontrolovat `azure.yaml`, testovat lokálně pomocí Agent Inspector, nasazovat zdroj pro vzdálenou sestavu Foundry, generovat/zkoumat datovou sadu a rubricu před konfigurací `azd ai eval init --name quality`. Nepřepisujte testy tohoto vzorku ani nepředpokládejte, že instalace balíčku změní jeho hostingový model.

## 5.5 Red teaming AI a kontinuální hodnocení

Aktuální vzorek poskytuje [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončete jeho předpoklady a přezkoumejte zamýšlený cíl a náklady před spuštěním:

```bash
pytest tests/test_red_teaming.py -s
```

Použijte autorizované testovací nasazení a syntetická data. Zkontrolujte generované útoky a výsledky; toto skenování nezaručuje, že je aplikace bezpečná nebo v souladu.

Průvodce [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) popisuje také kontinuální evaluaci konfigurovanou při spuštění kontejneru. Hodnotí skutečné uživatelské interakce, nikoli generovaný testovací provoz, a podpora evaluátoru se liší podle regionu. Žádné interakce znamenají žádné záznamy evaluace. Ověřte nainstalovanou vzorovou verzi a konfiguraci evaluátoru místo předpokladu, že každé nasazení má stejné výchozí hodnoty.

Autentizace je oddělena od evaluace. Postupujte podle zdokumentovaného nastavení identity/přístupu ve vzoru. Neexistuje žádný zdokumentovaný „basic auth fallback“, na který byste se mohli spolehnout pro ochranu veřejného endpointu.

## 5.6 Designová cvičení: přizpůsobení pro maloobchod

!!! warning "Designové cvičení, ne dokončené nasazení"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napište krátký plán řešící:

| Oblast | Rozhodnutí a důkazy k získání |
|-------|----------------------------------|
| Odpovědnost agentů | Začněte s jedním agentem, nebo odůvodněte samostatné agenty Shopper a Loyalty a směrovací logiku |
| Data | Definujte syntetickou databázi katalogu/odměn a zodpovědnost za aktualizace |
| Nástroje | Nejprve implementujte pouze čtecí zpracovatele; specifikujte autorizaci a validaci pro jakékoliv zápisy |
| Modely | Vyberte dostupné kombinace modelů/verzí/SKU a ověřte kvótu; vyhněte se provisioningu nepoužitých modelů |
| Vyhledávání | Definujte indexování, rozměry embeddingu, citace a přístupová práva na úrovni dokumentů |
| Evaluace | Přidejte případy s očekávanou odpovědí, nepodporovanou otázkou, použitím nástroje a bezpečnostní s explicitními prahy |
| Operace | Definujte telemetrii, limity latence/chyb, nákladové limity a zodpovědnost za úklid |

Uložení `custom-agents/shopper-agent-instructions.md` nezpůsobí, že by ji vzor načítal. Najděte aplikační kód, který vytváří/aktualizuje agenta, připojte tam své prověřené instrukce a ověřte výslednou verzi agenta před testováním. Instrukce nemohou udělit přístup k datům nebo nástrojům, které jste neimplementovali.

Aplikujte jednu změnu najednou, opět nasaďte dotčené komponenty a spusťte znovu své základní otázky a evaluace. Uchovejte funkční revizi pro srovnání. Pro inspiraci architekturou viz [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), který rovněž není kompletní maloobchodní aplikací.

!!! quote "NA KONCI TOHOTO CVIČENÍ MĚL(A) BYSTE MÍT"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Pokračujte na [Rozebrání infrastruktury](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->