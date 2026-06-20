# 2. Walidacja szablonu

> Walidowano za pomocą `azd 1.25.6` w czerwcu 2026.

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Analizować architekturę rozwiązania AI
    - [ ] Rozumieć przepływ pracy wdrażania AZD
    - [ ] Korzystać z GitHub Copilot, aby uzyskać pomoc dotyczącą użycia AZD
    - [ ] **Laboratorium 2:** Wdrażać i weryfikować szablon AI Agents

---


## 1. Wprowadzenie

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) lub `azd` to otwarte narzędzie wiersza poleceń, które upraszcza przepływ pracy dewelopera podczas tworzenia i wdrażania aplikacji w Azure.

[Szablony AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) to standardowe repozytoria zawierające przykładowy kod aplikacji, zasoby _infrastruktury jako kodu_ oraz pliki konfiguracyjne `azd` tworzące spójną architekturę rozwiązania. Provisioning infrastruktury staje się tak prosty jak polecenie `azd provision` – a użycie `azd up` pozwala na jednoczesne provisionowanie infrastruktury **i** wdrożenie aplikacji!

W efekcie rozpoczęcie procesu tworzenia aplikacji może być tak proste, jak znalezienie odpowiedniego _szablonu startowego AZD_, który najlepiej odpowiada Twoim potrzebom aplikacyjnym i infrastrukturalnym – a następnie dostosowanie repozytorium do wymagań scenariusza.

Zanim zaczniemy, upewnijmy się, że masz zainstalowany Azure Developer CLI.

1. Otwórz terminal VS Code i wpisz to polecenie:

      ```bash title="" linenums="0"
      azd version
      ```

1. Powinieneś zobaczyć coś podobnego!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Jesteś teraz gotowy do wybrania i wdrożenia szablonu za pomocą azd**

---

## 2. Wybór szablonu

Platforma Microsoft Foundry oferuje [zestaw zalecanych szablonów AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), które pokrywają popularne scenariusze rozwiązań takie jak _automatyzacja przepływów pracy wielu agentów_ oraz _wielomodalne przetwarzanie treści_. Możesz także odkryć te szablony, odwiedzając portal Microsoft Foundry.

1. Odwiedź [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Zaloguj się do portalu Microsoft Foundry, gdy zostaniesz o to poproszony – zobaczysz coś takiego.

![Pick](../../../../../translated_images/pl/01-pick-template.60d2d5fff5ebc374.webp)


Opcje **Basic** to twoje szablony startowe:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), który wdraża podstawową aplikację chatową _z twoimi danymi_ w Azure Container Apps. Użyj tego, aby zbadać podstawowy scenariusz chatbota AI.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), który również wdraża standardowego Agenta AI (z agentami Foundry). Użyj tego, aby zapoznać się z rozwiązaniami AI agentycznego obejmującymi narzędzia i modele.

Odwiedź drugi link w nowej karcie przeglądarki (lub kliknij `Open in GitHub` na powiązanej karcie). Powinieneś zobaczyć repozytorium tego szablonu AZD. Poświęć chwilę na zapoznanie się z README. Architektura aplikacji wygląda tak:

![Arch](../../../../../translated_images/pl/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktywacja szablonu

Spróbujmy wdrożyć ten szablon i upewnić się, że jest prawidłowy. Postępujemy zgodnie z wytycznymi w sekcji [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wybierz środowisko robocze dla repozytorium szablonu:

      - **GitHub Codespaces**: Kliknij [ten link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potwierdź `Create codespace`
      - **Lokalne klonowanie lub kontener deweloperski**: Sklonuj `Azure-Samples/get-started-with-ai-agents` i otwórz w VS Code

1. Poczekaj aż terminal VS Code będzie gotowy, następnie wpisz następujące polecenie:

   ```bash title="" linenums="0"
   azd up
   ```

Wykonaj kroki przepływu pracy, które rozpocznie to polecenie:

1. Zostaniesz poproszony o zalogowanie się do Azure – postępuj zgodnie z instrukcjami, aby się uwierzytelnić
1. Wprowadź unikalną nazwę środowiska – np. użyłem `nitya-mshack-azd`
1. To spowoduje utworzenie folderu `.azure/` – zobaczysz podfolder o nazwie środowiska
1. Zostaniesz poproszony o wybór nazwy subskrypcji – wybierz domyślną
1. Zostaniesz poproszony o lokalizację – wybierz `East US 2`

Teraz poczekaj na zakończenie provisioningu. **To zajmuje 10-15 minut**

1. Po zakończeniu na konsoli pojawi się komunikat SUCCESS, taki jak ten:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. W Azure Portal pojawi się teraz utworzona grupa zasobów o nazwie środowiska:

      ![Infra](../../../../../translated_images/pl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Jesteś teraz gotowy do walidacji wdrożonej infrastruktury i aplikacji**.

---

## 4. Walidacja szablonu

1. Odwiedź stronę [Resource Groups](https://portal.azure.com/#browse/resourcegroups) w Azure Portal – zaloguj się, gdy zostaniesz o to poproszony
1. Kliknij na RG dla swojej nazwy środowiska – zobaczysz stronę jak powyżej

      - kliknij zasób Azure Container Apps
      - kliknij na Application Url w sekcji _Essentials_ (u góry po prawej)

1. Powinieneś zobaczyć hostowany frontend aplikacji jak na obrazku:

   ![App](../../../../../translated_images/pl/03-test-application.471910da12c3038e.webp)

1. Spróbuj zadać kilka [przykładowych pytań](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zapytaj: ```What is the capital of France?``` 
      1. Zapytaj: ```What's the best tent under $200 for two people, and what features does it include?```

1. Powinieneś otrzymać odpowiedzi podobne do tych pokazanych poniżej. _Ale jak to działa?_ 

      ![App](../../../../../translated_images/pl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Walidacja Agenta

Aplikacja Azure Container App wdraża punkt końcowy łączący się z Agentem AI provisionowanym w projekcie Microsoft Foundry dla tego szablonu. Sprawdźmy, co to oznacza.

1. Wróć do strony _Overview_ w Azure Portal dla swojej grupy zasobów

1. Kliknij na zasób `Microsoft Foundry` na liście

1. Powinieneś zobaczyć to. Kliknij przycisk `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/pl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Powinieneś zobaczyć stronę projektu Foundry dla swojej aplikacji AI
   ![Project](../../../../../translated_images/pl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknij na `Agents` – zobaczysz domyślnego Agenta provisionowanego w twoim projekcie
   ![Agents](../../../../../translated_images/pl/06-visit-agents.bccb263f77b00a09.webp)

1. Wybierz go – zobaczysz szczegóły Agenta. Zwróć uwagę na:

      - Agent korzysta domyślnie z File Search (zawsze)
      - Pole `Knowledge` agenta wskazuje, że zostało przesłanych 32 plików (do wyszukiwania w plikach)
      ![Agents](../../../../../translated_images/pl/07-view-agent-details.0e049f37f61eae62.webp)

1. Znajdź opcję `Data+indexes` w lewym menu i kliknij, aby zobaczyć szczegóły.

      - Powinieneś zobaczyć 32 pliki danych przesłane do bazy wiedzy.
      - Odzwierciedlają one 12 plików klientów i 20 plików produktów znajdujących się w `src/files`
      ![Data](../../../../../translated_images/pl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Zweryfikowałeś działanie Agenta!**

1. Odpowiedzi agenta opierają się na wiedzy zawartej w tych plikach.
1. Możesz teraz zadawać pytania dotyczące tych danych i otrzymywać wiarygodne odpowiedzi.
1. Przykład: `customer_info_10.json` opisuje 3 zakupy dokonane przez "Amanda Perez".

Wróć do zakładki przeglądarki z punktem końcowym Container App i zapytaj: `What products does Amanda Perez own?`. Powinieneś zobaczyć coś takiego:

![Data](../../../../../translated_images/pl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Plac zabaw Agenta

Zbudujmy trochę intuicji na temat możliwości Microsoft Foundry, testując Agenta w Agents Playground.

1. Wróć do strony `Agents` w Microsoft Foundry – wybierz domyślnego agenta
1. Kliknij opcję `Try in Playground` – zobaczysz interfejs placu zabaw jak ten
1. Zadaj to samo pytanie: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/pl/09-ask-in-playground.a1b93794f78fa676.webp)

Otrzymasz tę samą (lub podobną) odpowiedź – ale także dodatkowe informacje, które pomogą zrozumieć jakość, koszt i wydajność twojej agentycznej aplikacji. Na przykład:

1. Zauważ, że odpowiedź cytuje pliki danych użyte do "uziemienia" odpowiedzi
1. Najedź kursorem na dowolną z tych etykiet plików – czy dane odpowiadają twojemu zapytaniu i wyświetlonej odpowiedzi?

Widzisz także wiersz _statystyk_ poniżej odpowiedzi.

1. Najedź kursorem na dowolną metrykę – np. Safety. Zobaczysz coś takiego
1. Czy oceniona wartość odpowiada twojej intuicji co do poziomu bezpieczeństwa odpowiedzi?

      ![Data](../../../../../translated_images/pl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Wbudowana obserwowalność

Obserwowalność polega na instrumentowaniu aplikacji, aby generowała dane, które można wykorzystać do zrozumienia, debugowania i optymalizacji jej działania. Aby to zobaczyć:

1. Kliknij przycisk `View Run Info` – zobaczysz ten widok. To przykład [śledzenia agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) w praktyce. _Ten widok możesz także uzyskać klikając Thread Logs w menu głównym_.

   - Zobacz kroki wykonania i narzędzia zaangażowane przez agenta
   - Zrozum całkowitą liczbę tokenów (w porównaniu do użycia tokenów wyjściowych) dla odpowiedzi
   - Zobacz opóźnienia i gdzie czas jest spędzany podczas wykonania

      ![Agent](../../../../../translated_images/pl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknij zakładkę `Metadata`, aby zobaczyć dodatkowe atrybuty wykonania, które mogą być pomocne przy debugowaniu problemów w przyszłości.

      ![Agent](../../../../../translated_images/pl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknij zakładkę `Evaluations`, aby zobaczyć automatyczne oceny odpowiedzi agenta. Obejmują one oceny bezpieczeństwa (np. samookaleczenie) oraz oceny specyficzne dla agenta (np. rozpoznanie intencji, realizacja zadania).

      ![Agent](../../../../../translated_images/pl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na koniec kliknij zakładkę `Monitoring` w menu bocznym.

      - Wybierz zakładkę `Resource usage` na wyświetlanej stronie – i przeglądaj metryki.
      - Śledź wykorzystanie aplikacji pod względem kosztów (tokenów) i obciążenia (żądań).
      - Śledź opóźnienia aplikacji do pierwszego bajtu (przetwarzanie wejścia) i ostatniego bajtu (wyjścia).

      ![Agent](../../../../../translated_images/pl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Zmienne środowiskowe

Do tej pory przeszliśmy przez wdrożenie w przeglądarce – i potwierdziliśmy, że nasza infrastruktura jest provisionowana, a aplikacja działa. Aby jednak pracować _kodem jako pierwszy_, musimy skonfigurować lokalne środowisko deweloperskie z odpowiednimi zmiennymi niezbędnymi do pracy z tymi zasobami. Korzystanie z `azd` to ułatwia.

1. Azure Developer CLI [używa zmiennych środowiskowych](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) do przechowywania i zarządzania ustawieniami konfiguracyjnymi wdrożeń aplikacji.

1. Zmienne środowiskowe są przechowywane w `.azure/<env-name>/.env` – przypisane do środowiska `env-name` używanego podczas wdrożenia i pomagają izolować środowiska pomiędzy różnymi celami wdrożenia w tym samym repozytorium.

1. Zmienne środowiskowe są automatycznie ładowane przez polecenie `azd` za każdym razem, gdy wykonuje ono określone polecenie (np. `azd up`). Uwaga: `azd` nie odczytuje automatycznie zmiennych środowiskowych na poziomie systemu operacyjnego (np. ustawionych w shellu) – zamiast tego użyj `azd set env` i `azd get env` do przesyłania informacji w skryptach.


Wypróbujmy kilka poleceń:

1. Pobierz wszystkie zmienne środowiskowe ustawione dla `azd` w tym środowisku:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Zobaczysz coś takiego:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Pobierz konkretną wartość – np. chcę sprawdzić, czy ustawiliśmy wartość `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Zobaczysz coś takiego – nie była ustawiona domyślnie!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Ustaw nową zmienną środowiskową dla `azd`. Tutaj aktualizujemy nazwę modelu agenta. _Uwaga: wszelkie zmiany będą od razu odzwierciedlone w pliku `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz powinniśmy zobaczyć, że wartość została ustawiona:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Zauważ, że niektóre zasoby są trwałe (np. wdrożenia modeli) i będzie wymagać więcej niż tylko `azd up`, aby wymusić ponowne wdrożenie. Spróbujmy więc zniszczyć pierwotne wdrożenie i ponownie wdrożyć z zmienionymi zmiennymi środowiskowymi.

1. **Odświeżenie** Jeśli wcześniej wdrożyłeś infrastrukturę za pomocą szablonu azd – możesz _odświeżyć_ stan lokalnych zmiennych środowiskowych na podstawie aktualnego stanu wdrożenia Azure za pomocą tego polecenia:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      To potężny sposób na _zsynchronizowanie_ zmiennych środowiskowych pomiędzy dwoma lub więcej lokalnymi środowiskami developerskimi (np. zespół z wieloma programistami) - pozwalając wdrożonej infrastrukturze służyć jako źródło prawdy dla stanu zmiennych środowiskowych. Członkowie zespołu po prostu _odświeżają_ zmienne, aby ponownie się zsynchronizować.

---

## 9. Gratulacje 🏆

Właśnie ukończyłeś kompletny przepływ pracy, w którym:

- [X] Wybrałeś szablon AZD, którego chcesz użyć
- [X] Otworzyłeś szablon w obsługiwanym środowisku developerskim
- [X] Wdrożyłeś szablon i potwierdziłeś, że działa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->