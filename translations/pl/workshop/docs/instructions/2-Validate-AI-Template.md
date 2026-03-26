# 2. Weryfikacja szablonu

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ POTRAFIŁ"

    - [ ] Analizować architekturę rozwiązania AI
    - [ ] Rozumieć przepływ pracy wdrażania AZD
    - [ ] Korzystać z GitHub Copilot, aby uzyskać pomoc dotyczącą użycia AZD
    - [ ] **Laboratorium 2:** Wdrażać i weryfikować szablon AI Agents

---


## 1. Wprowadzenie

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) lub `azd` to otwartoźródłowe narzędzie wiersza poleceń, które upraszcza przepływ pracy programisty przy tworzeniu i wdrażaniu aplikacji na platformie Azure.

[Szablony AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) to ustandaryzowane repozytoria zawierające przykładowy kod aplikacji, zasoby _infrastruktury jako kod_ oraz pliki konfiguracyjne `azd` dla spójnej architektury rozwiązania. Provisioning infrastruktury staje się tak prosty jak polecenie `azd provision` – natomiast użycie `azd up` pozwala jednocześnie utworzyć infrastrukturę **i** wdrożyć aplikację!

W efekcie, rozpoczęcie procesu tworzenia aplikacji może być tak proste jak znalezienie odpowiedniego _szablonu startowego AZD_, który najlepiej odpowiada Twoim potrzebom aplikacji i infrastruktury – a następnie dostosowanie repozytorium do wymagań scenariusza.

Zanim zaczniemy, upewnijmy się, że masz zainstalowany Azure Developer CLI.

1. Otwórz terminal w VS Code i wpisz to polecenie:

      ```bash title="" linenums="0"
      azd version
      ```

1. Powinieneś zobaczyć coś takiego!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Teraz możesz wybrać i wdrożyć szablon za pomocą azd**

---

## 2. Wybór szablonu

Platforma Microsoft Foundry oferuje [zestaw zalecanych szablonów AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), które obejmują popularne scenariusze rozwiązania, takie jak _automatyzacja przepływu pracy wieloagentowego_ oraz _wielomodalne przetwarzanie treści_. Możesz także odkryć te szablony, odwiedzając portal Microsoft Foundry.

1. Odwiedź [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Zaloguj się do portalu Microsoft Foundry po wyświetleniu monitu – zobaczysz coś takiego.

![Pick](../../../../../translated_images/pl/01-pick-template.60d2d5fff5ebc374.webp)


Opcje **Basic** to Twoje szablony startowe:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), który wdraża podstawową aplikację czatu _z własnymi danymi_ w Azure Container Apps. Użyj tego, aby poznać podstawowy scenariusz chatbota AI.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), który również wdraża standardowego Agenta AI (z Agentami Foundry). Użyj tego, aby zapoznać się z agentowymi rozwiązaniami AI wykorzystującymi narzędzia i modele.

Odwiedź drugi link w nowej karcie przeglądarki (lub kliknij `Open in GitHub` na powiązanej karcie). Powinieneś zobaczyć repozytorium tego szablonu AZD. Poświęć chwilę na zapoznanie się z README. Architektura aplikacji wygląda tak:

![Arch](../../../../../translated_images/pl/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktywacja szablonu

Spróbujmy wdrożyć ten szablon i upewnić się, że jest poprawny. Postępujemy zgodnie z wytycznymi w sekcji [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Kliknij [ten link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - potwierdź domyślną akcję „Create codespace”
1. Otworzy się nowa karta w przeglądarce – poczekaj na załadowanie sesji GitHub Codespaces
1. Otwórz terminal VS Code w Codespaces – wpisz następujące polecenie:

   ```bash title="" linenums="0"
   azd up
   ```

Wykonaj kroki przepływu pracy, które to uruchomi:

1. Zostaniesz poproszony o zalogowanie się do Azure – postępuj zgodnie z instrukcjami, aby przeprowadzić uwierzytelnianie
1. Wprowadź unikalną nazwę środowiska dla siebie – np. użyłem `nitya-mshack-azd`
1. To spowoduje utworzenie folderu `.azure/` – zobaczysz podfolder z nazwą środowiska
1. Zostaniesz poproszony o wybór subskrypcji – wybierz domyślną
1. Zostaniesz poproszony o wybór lokalizacji – użyj `East US 2`

Teraz poczekaj na zakończenie provisioningu. **Trwa to 10-15 minut**

1. Po zakończeniu konsola pokaże komunikat POWODZENIA jak ten:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. W portalu Azure pojawi się teraz utworzona grupa zasobów o tej nazwie środowiska:

      ![Infra](../../../../../translated_images/pl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Teraz możesz zweryfikować wdrożoną infrastrukturę i aplikację**.

---

## 4. Weryfikacja szablonu

1. Odwiedź stronę Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – zaloguj się, gdy zostaniesz o to poproszony
1. Kliknij grupę zasobów dla swojej nazwy środowiska – zobaczysz stronę podobną jak powyżej

      - kliknij zasób Azure Container Apps
      - kliknij adres URL aplikacji w sekcji _Essentials_ (w prawym górnym rogu)

1. Powinieneś zobaczyć interfejs front-end hostowanej aplikacji, taki jak ten:

   ![App](../../../../../translated_images/pl/03-test-application.471910da12c3038e.webp)

1. Spróbuj zadać kilka [przykładowych pytań](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zapytaj: ```Jaka jest stolica Francji?``` 
      1. Zapytaj: ```Jaki jest najlepszy namiot poniżej 200 dolarów dla dwóch osób i jakie ma cechy?```

1. Powinieneś otrzymać odpowiedzi podobne do pokazanych poniżej. _Ale jak to działa?_ 

      ![App](../../../../../translated_images/pl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Weryfikacja agenta

Azure Container App wdraża punkt końcowy, który łączy się z agentem AI provisionowanym w projekcie Microsoft Foundry dla tego szablonu. Spójrzmy, co to oznacza.

1. Wróć do strony _Overview_ na portalu Azure dla swojej grupy zasobów

1. Kliknij zasób `Microsoft Foundry` na tej liście

1. Powinieneś zobaczyć to. Kliknij przycisk `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Zobaczysz stronę projektu Foundry dla Twojej aplikacji AI
   ![Project](../../../../../translated_images/pl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknij na `Agents` – zobaczysz domyślnego Agenta provisionowanego w Twoim projekcie
   ![Agents](../../../../../translated_images/pl/06-visit-agents.bccb263f77b00a09.webp)

1. Wybierz go – zobaczysz szczegóły agenta. Zwróć uwagę na następujące elementy:

      - Agent korzysta domyślnie z File Search (zawsze)
      - Parametr `Knowledge` wskazuje, że ma załadowane 32 pliki (dla wyszukiwania plików)
      ![Agents](../../../../../translated_images/pl/07-view-agent-details.0e049f37f61eae62.webp)

1. Poszukaj opcji `Data+indexes` w lewym menu i kliknij ją, aby zobaczyć szczegóły.

      - Powinieneś zobaczyć 32 załadowane pliki danych do wiedzy.
      - Odzwierciedlają one 12 plików klientów i 20 plików produktów znajdujących się w `src/files` 
      ![Data](../../../../../translated_images/pl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Zweryfikowałeś działanie Agenta!** 

1. Odpowiedzi agenta są oparte na wiedzy zawartej w tych plikach.
1. Teraz możesz zadawać pytania dotyczące tych danych i otrzymywać oparte na nich odpowiedzi.
1. Przykład: `customer_info_10.json` opisuje 3 zakupy dokonane przez "Amandę Perez"

Wróć do karty przeglądarki z punktem końcowym Container App i zapytaj: `Jakie produkty posiada Amanda Perez?`. Powinieneś zobaczyć coś takiego:

![Data](../../../../../translated_images/pl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Plac zabaw agenta

Zbudujmy trochę więcej intuicji dotyczącej możliwości Microsoft Foundry, testując agenta w Agents Playground.

1. Wróć do strony `Agents` w Microsoft Foundry – wybierz domyślnego agenta
1. Kliknij opcję `Try in Playground` – powinieneś zobaczyć interfejs Playground taki jak ten
1. Zadaj to samo pytanie: `Jakie produkty posiada Amanda Perez?`

    ![Data](../../../../../translated_images/pl/09-ask-in-playground.a1b93794f78fa676.webp)

Otrzymasz tę samą (lub podobną) odpowiedź – ale otrzymujesz też dodatkowe informacje, które możesz wykorzystać do oceny jakości, kosztów i wydajności swojej aplikacji agentowej. Na przykład:

1. Zauważ, że odpowiedź cytuje pliki danych użyte do "podparcia" odpowiedzi
1. Najedź kursorem na etykiety tych plików – czy dane odpowiadają Twojemu zapytaniu i wyświetlanej odpowiedzi?

Widoczny jest również rząd _statystyk_ poniżej odpowiedzi.

1. Najedź kursorem na dowolną metrykę – np. Safety. Zobaczysz coś takiego
1. Czy oceniana ocena odpowiada Twojemu wyczuciu poziomu bezpieczeństwa odpowiedzi?

      ![Data](../../../../../translated_images/pl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Wbudowana obserwacja

Obserwowalność polega na instrumentacji aplikacji w celu generowania danych, które mogą służyć do zrozumienia, debugowania i optymalizacji jej działania. Aby się z tym zapoznać:

1. Kliknij przycisk `View Run Info` – powinieneś zobaczyć ten widok. To przykład działania [śledzenia agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Możesz także uzyskać ten widok, klikając Thread Logs w menu najwyższego poziomu_.

   - Zapoznaj się z krokami wykonania i narzędziami używanymi przez agenta
   - Zrozum całkowitą liczbę Tokenów (w porównaniu z liczbą tokenów wyjściowych) dla odpowiedzi
   - Zrozum opóźnienia i gdzie jest spędzany czas wykonania

      ![Agent](../../../../../translated_images/pl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknij kartę `Metadata`, aby zobaczyć dodatkowe atrybuty wykonania, które mogą dostarczyć przydatnego kontekstu do debugowania problemów w przyszłości.

      ![Agent](../../../../../translated_images/pl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknij kartę `Evaluations`, aby zobaczyć autooceny wykonane na odpowiedzi agenta. Obejmują one oceny bezpieczeństwa (np. samookaleczenie) oraz oceny specyficzne dla agenta (np. rozpoznanie intencji, przestrzeganie zadań).

      ![Agent](../../../../../translated_images/pl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na koniec kliknij kartę `Monitoring` w menu bocznym.

      - Wybierz kartę `Resource usage` na wyświetlonej stronie – i zobacz metryki.
      - Śledź użycie aplikacji pod względem kosztów (tokeny) i obciążenia (zapytania).
      - Śledź opóźnienie aplikacji od pierwszego bajtu (przetwarzanie wejścia) do ostatniego bajtu (wyjścia).

      ![Agent](../../../../../translated_images/pl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Zmienne środowiskowe

Do tej pory przeszliśmy przez wdrożenie w przeglądarce – i zweryfikowaliśmy, że nasza infrastruktura jest provisionowana, a aplikacja działa. Aby jednak pracować z aplikacją _kodowo_, musimy skonfigurować lokalne środowisko programistyczne odpowiednimi zmiennymi wymaganymi do pracy z tymi zasobami. Korzystanie z `azd` ułatwia to zadanie.

1. Azure Developer CLI [używa zmiennych środowiskowych](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) do przechowywania i zarządzania ustawieniami konfiguracyjnymi wdrożeń aplikacji.

1. Zmienne środowiskowe są przechowywane w `.azure/<env-name>/.env` – ogranicza to ich zakres do środowiska o nazwie `env-name` używanego podczas wdrożenia i pomaga izolować środowiska między różnymi celami wdrożenia w tym samym repozytorium.

1. Zmienne środowiskowe są automatycznie ładowane przez polecenie `azd` zawsze, gdy wykonuje ono określone polecenie (np. `azd up`). Uwaga: `azd` nie odczytuje automatycznie zmiennych środowiskowych _poziomu systemu operacyjnego_ (np. ustawionych w powłoce) – zamiast tego używaj `azd set env` i `azd get env`, aby przekazywać informacje w skryptach.


Wypróbujmy kilka poleceń:

1. Pobierz wszystkie ustawione zmienne środowiskowe dla `azd` w tym środowisku:

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

1. Pobierz wartość określonej zmiennej – np. chcę sprawdzić, czy mamy ustawioną wartość `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Zobaczysz coś takiego – nie została ustawiona domyślnie!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Ustaw nową zmienną środowiskową dla `azd`. Tutaj aktualizujemy nazwę modelu agenta. _Uwaga: wszelkie zmiany zostaną natychmiast odzwierciedlone w pliku `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz wartość powinna być ustawiona:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Zauważ, że niektóre zasoby są trwałe (np. wdrożenia modelu) i mogą wymagać czegoś więcej niż tylko `azd up`, aby wymusić ponowne wdrożenie. Spróbujmy usunąć oryginalne wdrożenie i ponownie wdrożyć z zmienionymi zmiennymi środowiskowymi.

1. **Odświeżanie** Jeśli wcześniej wdrożyłeś infrastrukturę przy użyciu szablonu azd – możesz _odświeżyć_ stan swoich lokalnych zmiennych środowiskowych na podstawie bieżącego stanu wdrożenia Azure, używając tego polecenia:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      To potężny sposób na _synchronizację_ zmiennych środowiskowych pomiędzy dwoma lub więcej lokalnymi środowiskami deweloperskimi (np. zespół z wieloma programistami) – pozwalający wdrożonej infrastrukturze służyć jako prawdziwe źródło stanu zmiennych środowiskowych. Członkowie zespołu po prostu _odświeżają_ zmienne, aby ponownie się zsynchronizować.

---

## 9. Gratulacje 🏆

Właśnie ukończyłeś pełen cykl pracy, w którym:

- [X] Wybrałeś szablon AZD, którego chcesz użyć
- [X] Uruchomiłeś szablon za pomocą GitHub Codespaces 
- [X] Wdrożyłeś szablon i potwierdziłeś, że działa prawidłowo

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->