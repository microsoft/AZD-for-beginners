# 5. Dostosuj szablon

!!! tip "PO ZAKOŃCZENIU TEGO MODUŁU BĘDZIESZ POTRAFIŁ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Ustal punkt odniesienia

Użyj zainicjowanego repozytorium [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) z poprzednich modułów. Zapisz rewizję szablonu, wersję AZD, wybrane środowisko, wdrożenie modelu oraz działające przykładowe pytania przed wprowadzeniem jakichkolwiek zmian.

Przykład implementuje aplikację czatową wspieraną przez agenta. Nie staje się **dwoma agentami systemem sprzedaży detalicznej** tylko przez ustawienie zmiennych środowiskowych lub zapisanie dodatkowych plików instrukcji. Dodatkowi agenci, obsługa narzędzi, trasowanie, autoryzacja i dostęp do danych wymagają kodu aplikacji.

Sprawdź instrukcje i narzędzia aktualnie wdrożonego agenta w Foundry. Przetestuj jedno pytanie faktograficzne, jedno pytanie o wyszukiwanie i jedno pytanie, na które przykładowe dane nie mogą odpowiedzieć. Zweryfikuj cytaty na podstawie faktycznych dokumentów źródłowych, a nie zakładaj, że płynna odpowiedź jest poprawna.

## 5.2 Dostosuj wyszukiwanie wiedzy

Szablon obsługuje wyszukiwanie oparte na plikach oraz opcjonalną integrację z Azure AI Search. Postępuj zgodnie z [aktualnym przewodnikiem AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) dotyczącym indeksowania i konfiguracji narzędzi.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Włączenie usługi to tylko część wyszukiwania. Przed przesłaniem własnych danych:

1. Potwierdź, że masz zgodę na używanie dokumentów i usuń informacje wrażliwe.
2. Wybierz model embedding wspierany w twoim regionie i ustaw jego kompatybilną wersję, typ wdrożenia oraz wymiar wektorów.
3. Utwórz/wypełnij indeks zgodnie z udokumentowanym procesem przykładu.
4. Skonfiguruj narzędzie wyszukiwania agenta do użycia tego indeksu.
5. Przetestuj wyszukiwanie, cytaty, autoryzację oraz zachowanie gdy nie istnieje odpowiedni dokument.

Nie zmieniaj modelu embedding z `text-embedding-3-small` na inny bez sprawdzenia wymiarów i przebudowy/przeindeksowania wektorów według potrzeb. Nazwa taka jak `retail-products` nie jest zaimplementowanym katalogiem ani polityką kontroli dostępu.

## 5.3 Śledzenie i monitoring

Postępuj zgodnie z [przewodnikiem obserwowalności przykładu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Upewnij się, że wymagany zasób Application Insights i połączenie już istnieją; przy zmianie ustawień infrastruktury użyj `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Wyślij zapytanie testowe, następnie sprawdź logi aplikacji Container App i widok śledzenia agenta w Foundry. Sprawdź opóźnienia, wywołania narzędzi, błędy oraz korelację między zapytaniem a śladem. Nie zakładaj, że telemetry jest podłączona wyłącznie dlatego, że wdrożenie się powiodło.

Pozostaw `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` wyłączone, chyba że wyraźnie przejrzałeś zgodę, redakcję, retencję i kontrolę dostępu. Ślady mogą zawierać wrażliwe argumenty narzędzi lub zawartość dokumentów, nawet gdy zwykłe logi aplikacji wyglądają na nieszkodliwe.

## 5.4 Ocena agenta

Punkt wejścia oceny przykładu to obecnie [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nie katalog `evals/`. Z katalogu głównego przykładu użyj środowiska Pythona spełniającego jego udokumentowane wymagania:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Przed uruchomieniem ukończ [wymagania wstępne oceny](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy ładują konfigurację z wybranego `.azure/<environment>/.env`; potwierdź, że wybrane jest zamierzone środowisko. Ważne dane wejściowe to:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, używany w formacie wymaganym przez aktualny przykład (przeglądana wersja używa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, używany jako wdrożenie modelu oceniającego

Zapoznaj się z testami, aby zrozumieć wybór ewaluatora, progi, wymagane role i koszty modelu. Zakończone uruchomienie nie jest automatycznie zdanym testem jakości; sprawdź wyniki, nieudane/błędne przypadki oraz powiązane wyniki w Foundry.

### Oddzielne rozszerzenie ocen AZD

Powyższy test Pythona to **specyficzny dla przykładu przepływ pracy**. Opcjonalne rozszerzenie `azure.ai.evaluations` to inny przepływ pracy, z własną konfiguracją `evals/azure.eval.yaml`. Instalowane jest oddzielnie, nie jest zawarte w ogólnie dostępnym pakiecie `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pełne ustawienie rozszerzenia zobacz w [przepływach pracy oceny i migracji](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od wersji beta.22 rozszerzenia agentów nie używaj usuniętych poleceń `azd ai agent eval`. Instalacja rozszerzenia ocen nie konwertuje testów Pythona przykładu ani nie tworzy automatycznie konfiguracji oceny.

Dla oddzielnego **ćwiczenia hostowanego GA na agencie**, użyj pustego folderu poza próbą tego warsztatu i postępuj zgodnie z [instrukcją lokalna chmura Foundry](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Używa AZD 1.37.0+, pakietu `microsoft.foundry`, Pythona 3.13+ i aktualnego uv. Będziesz sprawdzał `azure.yaml`, testował lokalnie w Agent Inspector, wdrażał źródło dla zdalnej kompilacji Foundry oraz generował/przeglądał zbiór danych i rubrykę przed konfiguracją `azd ai eval init --name quality`. Nie zastępuj testów tego przykładu ani nie zakładaj, że instalacja pakietu zmienia jego model hostowania.

## 5.5 Sztuczna inteligencja red teaming i ciągła ocena

Aktualny przykład udostępnia [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Ukończ jego wymagania wstępne i przejrzyj zamierzony cel oraz koszty przed uruchomieniem:

```bash
pytest tests/test_red_teaming.py -s
```

Używaj autoryzowanego wdrożenia testowego i danych syntetycznych. Przejrzyj wygenerowane ataki i wyniki; to skanowanie nie potwierdza, że aplikacja jest bezpieczna lub zgodna.

Przewodnik po [obserwowalności](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) opisuje również ciągłą ewaluację konfigurowaną podczas uruchamiania kontenera. Ocena dotyczy rzeczywistych interakcji użytkowników, a nie generowanego ruchu testowego, a wsparcie ewaluatora różni się w zależności od regionu. Brak interakcji oznacza brak wpisów w ocenie. Zweryfikuj zainstalowaną wersję próbki oraz konfigurację ewaluatora, zamiast zakładać, że każde wdrożenie ma te same domyślne ustawienia.

Uwierzytelnianie jest oddzielone od ewaluacji. Postępuj zgodnie z udokumentowanym ustawieniem tożsamości/dostępu próbki. Nie ma udokumentowanego „fallbacku basic auth”, na którym można polegać w celu ochrony publicznego punktu końcowego.

## 5.6 Ćwiczenie projektowe: personalizacja w handlu detalicznym

!!! warning "Ćwiczenie projektowe, a nie kompletne wdrożenie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napisz krótki plan uwzględniający:

| Obszar | Decyzja i dowody do zebrania |
|------|----------------------------------|
| Odpowiedzialności agenta | Zacznij od jednego agenta lub uzasadnij osobne agenty Shopper i Loyalty oraz logikę routingu |
| Dane | Zdefiniuj syntetyczny katalog/zestaw nagród oraz odpowiedzialność za aktualizacje |
| Narzędzia | Najpierw zaimplementuj obsługę tylko do odczytu; określ autoryzację i walidację dla zapisów |
| Modele | Wybierz dostępne kombinacje modeli/wersji/SKU i zweryfikuj limity; unikaj przygotowywania nieużywanych modeli |
| Wyszukiwanie | Zdefiniuj indeksowanie, wymiary embedowania, cytowania i kontrolę dostępu na poziomie dokumentu |
| Ewaluacja | Dodaj przypadki oczekiwanych odpowiedzi, niewspieranych pytań, użycia narzędzi i bezpieczeństwa z explicitnymi progami |
| Operacje | Zdefiniuj telemetrię, budżety opóźnień/błędów, limity kosztów i odpowiedzialność za sprzątanie |

Zapisanie `custom-agents/shopper-agent-instructions.md` nie powoduje, że próbka go załaduje. Znajdź kod aplikacji, który tworzy/aktualizuje agenta, podłącz tam swoje sprawdzone instrukcje i zweryfikuj wersję agenta przed testowaniem. Instrukcje nie mogą nadawać dostępu do danych lub narzędzi, które nie zostały przez Ciebie zaimplementowane.

Wprowadzaj zmiany pojedynczo, ponownie wdrażaj zmienione komponenty i powtarzaj swoje pytania bazowe i ewaluacje. Zachowaj działającą wersję do porównania. Dla inspiracji architektonicznej zobacz [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), który również nie jest kompletną aplikacją detaliczną.

!!! quote "NA KONIEC TEGO LABORATORIUM POWINIENEŚ MIEĆ"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Kontynuuj do [Demontaż infrastruktury](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->