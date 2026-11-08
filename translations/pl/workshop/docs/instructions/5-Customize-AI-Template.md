# 5. Dostosuj szablon

!!! tip "NA KOŃCU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Ustal bazę odniesienia

Użyj zainicjowanego repozytorium [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) z poprzednich modułów. Zapisz wersję szablonu, wersję AZD, wybrane środowisko, wdrożenie modelu oraz przykładowe pytania przed wprowadzeniem jakichkolwiek zmian.

Przykład implementuje aplikację czatu wspieraną przez agenta. Nie staje się to systemem detalicznym z dwoma agentami tylko przez ustawienie zmiennych środowiskowych lub zapis dodatkowych plików instrukcji. Dodatkowi agenci, obsługa narzędzi, routowanie, autoryzacja i dostęp do danych wymagają kodu aplikacji.

Sprawdź obecne instrukcje i narzędzia wdrożonego agenta w Foundry. Przetestuj jedno pytanie faktograficzne, jedno pytanie typu retrieval i jedno pytanie, na które dane próbki nie mogą odpowiedzieć. Zweryfikuj cytaty względem faktycznych źródłowych dokumentów zamiast zakładać, że płynna odpowiedź jest poprawna.

## 5.2 Dostosuj pobieranie wiedzy

Szablon wspiera pobieranie na podstawie plików oraz opcjonalną integrację z Azure AI Search. Postępuj zgodnie z [aktualnym przewodnikiem AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) dotyczącym indeksowania i konfiguracji narzędzi.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Włączenie usługi to tylko część pobierania. Przed przesłaniem własnych danych:

1. Potwierdź, że masz pozwolenie na użycie dokumentów i usuń informacje wrażliwe.
2. Wybierz model embeddingu obsługiwany w twoim regionie i ustaw jego kompatybilną wersję, typ wdrożenia i wymiary wektorów.
3. Utwórz/wypełnij indeks zgodnie z dokumentowanym procesem próbki.
4. Skonfiguruj narzędzie pobierania agenta, aby używało tego indeksu.
5. Przetestuj pobieranie, cytowania, autoryzację i zachowanie, gdy nie istnieje żaden istotny dokument.

Nie przełączaj się z `text-embedding-3-small` na inny model embeddingu bez sprawdzenia wymiarów i ewentualnego przebudowania/przeindeksowania wektorów. Nazwa taka jak `retail-products` nie jest implementowanym katalogiem ani polityką kontroli dostępu.

## 5.3 Śledzenie i monitorowanie

Postępuj zgodnie z [przewodnikiem obserwowalności próbki](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Upewnij się, że wymagana zasobów Application Insights i połączenie już istnieją; jeśli zmieniasz ustawienia infrastruktury, użyj `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Wyślij testowe żądanie, następnie przejrzyj logi aplikacji Container App i widok śledzenia agenta w Foundry. Sprawdź opóźnienia, wywołania narzędzi, błędy oraz korelację między żądaniem a śladem. Nie zakładaj, że telemetria jest podłączona tylko dlatego, że wdrożenie się powiodło.

Pozostaw `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` wyłączone chyba że wyraźnie przejrzałeś zgodę, redakcję, przechowywanie i kontrole dostępu. Ślady mogą zawierać wrażliwe argumenty narzędzi lub treść dokumentów, nawet jeśli zwykłe logi aplikacji wyglądają nieszkodliwie.

## 5.4 Ocena agenta

Punkt wejścia oceny próbki to teraz [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), a nie katalog `evals/`. Z korzenia próbki użyj środowiska Python, które spełnia dokumentowane wymagania:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Przed uruchomieniem ukończ [wymagania wstępne oceny](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testy ładują konfigurację z wybranego `.azure/<environment>/.env`; potwierdź, że wybrane jest odpowiednie środowisko. Ważne dane wejściowe obejmują:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, używając formatu wymaganego przez obecną próbkę (zweryfikowana wersja wykorzystuje `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, używanego jako wdrożenie modelu sędziego

Sprawdź testy, aby zrozumieć wybór ewaluatora, progi, wymagane role i koszty modeli. Ukończone uruchomienie nie oznacza automatycznie przejścia bramki jakości; sprawdź wyniki, przypadki nieudane/błędne i powiązane wyniki w Foundry.

### Oddzielne rozszerzenie ocen AZD

Powyzszy test w Pythonie to **przepływ pracy specyficzny dla próbki**. Opcjonalne rozszerzenie `azure.ai.evaluations` jest innym przepływem pracy, posiadającym własną konfigurację `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pełna konfiguracja rozszerzenia dostępna jest w [przepływach oceny i migracji](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od beta.22 rozszerzenia agents nie używaj usuniętych poleceń `azd ai agent eval`. Instalacja rozszerzenia ocen nie konwertuje automatycznie testów Pythonowej próbki ani nie tworzy konfiguracji oceny.

## 5.5 Red teaming AI i ciągła ewaluacja

Aktualna próbka zawiera [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Ukończ jej wymagania wstępne i przejrzyj zamierzony cel oraz koszty przed uruchomieniem:

```bash
pytest tests/test_red_teaming.py -s
```

Użyj autoryzowanego wdrożenia testowego i danych syntetycznych. Przejrzyj wygenerowane ataki i wyniki; to skanowanie nie gwarantuje, że aplikacja jest bezpieczna lub zgodna.

Przewodnik [po obserwowalności](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) opisuje też ciągłą ewaluację konfigurowaną przy starcie kontenera. Ocena odbywa się na podstawie faktycznych interakcji użytkownika, a nie generowanego ruchu testowego, a wsparcie ewaluatora zależy od regionu. Brak interakcji oznacza brak wpisów ewaluacji. Zweryfikuj wersję zainstalowanej próbki i konfigurację ewaluatora zamiast zakładać, że każde wdrożenie ma te same domyślne ustawienia.

Uwierzytelnianie jest oddzielne od ewaluacji. Postępuj zgodnie z dokumentowaną konfiguracją tożsamości/dostępu próbki. Nie istnieje udokumentowane „podstawowe uwierzytelnianie jako zapasowe” do zabezpieczania publicznego punktu końcowego.

## 5.6 Ćwiczenie projektowe: dostosowanie systemu detalicznego

!!! warning "Ćwiczenie projektowe, a nie kompletne wdrożenie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napisz krótki plan uwzględniający:

| Obszar | Decyzja i dowody do zebrania |
|------|------------------------------|
| Odpowiedzialności agenta | Zacznij od jednego agenta lub uzasadnij osobnych agentów Shopper i Loyalty oraz logikę routingu |
| Dane | Zdefiniuj syntetyczny katalog/dane o nagrodach i właściciela aktualizacji |
| Narzędzia | Najpierw wdroż obsługę tylko do odczytu; określ autoryzację i walidację dla jakichkolwiek zapisów |
| Modele | Wybierz dostępne kombinacje model/wersja/SKU i zweryfikuj limit; unikaj provisionowania nieużywanych modeli |
| Pobieranie | Zdefiniuj indeksowanie, wymiary embeddingu, cytowania i kontroli dostępu na poziomie dokumentu |
| Ewaluacja | Dodaj przypadki z oczekiwaną odpowiedzią, pytania niewspierane, użycie narzędzi i bezpieczeństwo z wyraźnymi progami |
| Operacje | Zdefiniuj telemetrię, budżety opóźnień/błędów, limity kosztów oraz właściciela sprzątania |

Zapisanie `custom-agents/shopper-agent-instructions.md` nie powoduje, że próbka ją ładuje. Znajdź kod aplikacji tworzący/aktualizujący agenta, podłącz tam przeglądane instrukcje i zweryfikuj wersję agenta przed testami. Instrukcje nie mogą przyznawać dostępu do danych lub narzędzi, których nie zaimplementowałeś.

Wprowadzaj zmiany pojedynczo, ponownie wdrażaj dotknięte komponenty i ponownie uruchamiaj pytania bazowe oraz ewaluacje. Zachowaj działającą rewizję do porównań. Dla inspiracji architektonicznych zobacz [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), który również nie jest kompletną aplikacją detaliczną.

!!! quote "NA KOŃCU TEGO LABORATORIUM POWINIENEŚ MIEĆ"

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