# 2. Walidacja szablonu

> Zwalidowano na `azd 1.27.1` w lipcu 2026.

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ UMIEĆ"

    - [ ] Analizować architekturę rozwiązania AI
    - [ ] Rozumieć workflow wdrażania AZD
    - [ ] Korzystać z GitHub Copilot w celu pomocy przy użyciu AZD
    - [ ] **Laboratorium 2:** Wdrażanie i walidacja szablonu AI Agents

---


## 1. Wprowadzenie

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) lub `azd` to narzędzie open source wiersza poleceń, które usprawnia workflow dewelopera podczas tworzenia i wdrażania aplikacji na platformie Azure.

[Szablony AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) to ustandaryzowane repozytoria, które zawierają przykładowy kod aplikacji, zasoby _infrastruktury jako kodu_ oraz pliki konfiguracyjne `azd` tworzące spójną architekturę rozwiązania. Provisioning infrastruktury staje się tak prosty jak polecenie `azd provision` – a używając `azd up` możesz naraz provisionować infrastrukturę **i** wdrażać aplikację!

W rezultacie rozpoczęcie tworzenia aplikacji może być tak proste, jak znalezienie odpowiedniego _szablonu startowego AZD_ jak najlepiej odpowiadającego Twoim potrzebom aplikacyjnym i infrastrukturalnym – a następnie dostosowanie repozytorium do wymagań scenariusza.

Zanim zaczniemy, upewnij się, że masz zainstalowany Azure Developer CLI.

1. Otwórz terminal w VS Code i wpisz to polecenie:

      ```bash title="" linenums="0"
      azd version
      ```

1. Powinieneś zobaczyć coś podobnego!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Jesteś teraz gotów, aby wybrać i wdrożyć szablon za pomocą azd**

---

## 2. Wybór szablonu

Platforma Microsoft Foundry oferuje [zestaw rekomendowanych szablonów AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), które obejmują popularne scenariusze rozwiązań takie jak _automatyzacja wieloagentowych workflow_ oraz _wielo-modalne przetwarzanie treści_. Możesz je także odkryć, odwiedzając portal Microsoft Foundry.

1. Odwiedź [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Zaloguj się do portalu Microsoft Foundry, gdy zostaniesz poproszony — zobaczysz coś takiego.

![Pick](../../../../../translated_images/pl/01-pick-template.60d2d5fff5ebc374.webp)


Opcje **Basic** to Twoje szablony startowe:

1. [ ] [Rozpocznij z AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), który wdraża podstawową aplikację czatu _z Twoimi danymi_ na Azure Container Apps. Użyj tego, aby zbadać podstawowy scenariusz botów AI.
1. [X] [Rozpocznij z AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), który wdraża również standardowego AI Agenta (z Foundry Agents). Użyj tego, aby zapoznać się z rozwiązaniami agentowymi AI obejmującymi narzędzia i modele.

Odwiedź drugi link w nowej karcie przeglądarki (lub kliknij `Open in GitHub` na powiązanej karcie). Powinieneś zobaczyć repozytorium tego szablonu AZD. Poświęć chwilę na zapoznanie się z README. Architektura aplikacji wygląda następująco:

![Arch](../../../../../translated_images/pl/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktywacja szablonu

Spróbujmy wdrożyć ten szablon i upewnić się, że jest poprawny. Podążymy za wskazówkami w sekcji [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wybierz środowisko pracy dla repozytorium szablonu:

      - **GitHub Codespaces**: Kliknij [ten link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potwierdź `Create codespace`
      - **Lokalne klonowanie lub kontener deweloperski**: Sklonuj `Azure-Samples/get-started-with-ai-agents` i otwórz w VS Code

1. Poczekaj, aż terminal w VS Code będzie gotowy, a następnie wpisz następujące polecenie:

   ```bash title="" linenums="0"
   azd up
   ```

Wykonaj kroki workflow, które zostaną uruchomione:

1. Zostaniesz poproszony o zalogowanie się do Azure - postępuj zgodnie z instrukcjami, aby się uwierzytelnić
1. Wprowadź unikalną nazwę środowiska dla siebie - np. użyłem `nitya-mshack-azd`
1. To utworzy folder `.azure/` - zobaczysz podfolder z nazwą środowiska
1. Zostaniesz poproszony o wybór subskrypcji - wybierz domyślną
1. Zostaniesz zapytany o lokalizację - użyj `East US 2`

Teraz poczekaj na zakończenie provisioning. **To zajmuje 10-15 minut**

1. Po zakończeniu, konsola wyświetli komunikat SUKCESU jak ten:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Twój Azure Portal będzie teraz miał utworzoną grupę zasobów z nazwą środowiska:

      ![Infra](../../../../../translated_images/pl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Jesteś teraz gotów do walidacji wdrożonej infrastruktury i aplikacji**.

---

## 4. Walidacja szablonu

1. Odwiedź stronę Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - zaloguj się, gdy zostaniesz poproszony
1. Kliknij grupę zasobów dla swojej nazwy środowiska - zobaczysz stronę jak powyżej

      - kliknij na zasób Azure Container Apps
      - kliknij na URL aplikacji w sekcji _Essentials_ (prawy górny róg)

1. Powinieneś zobaczyć interfejs front-end hostowanej aplikacji jak ten:

   ![App](../../../../../translated_images/pl/03-test-application.471910da12c3038e.webp)

1. Spróbuj zadać kilka [przykładowych pytań](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zapytaj: ```Jaka jest stolica Francji?``` 
      1. Zapytaj: ```Jaki jest najlepszy namiot do 200 dolarów dla dwóch osób i jakie posiada cechy?```

1. Powinieneś otrzymać odpowiedzi podobne do pokazanych poniżej. _Ale jak to działa?_ 

      ![App](../../../../../translated_images/pl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Walidacja agenta

Azure Container App udostępnia punkt końcowy łączący się z agentem AI wdrożonym w projekcie Microsoft Foundry dla tego szablonu. Spójrzmy, co to oznacza.

1. Wróć do strony _Overview_ grupy zasobów w Azure Portal

1. Kliknij na zasób `Microsoft Foundry` w tej liście

1. Powinieneś zobaczyć to. Kliknij przycisk `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Zobaczysz stronę projektu Foundry dla Twojej aplikacji AI
   ![Project](../../../../../translated_images/pl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknij `Agents` - zobaczysz domyślnego agenta wdrożonego w Twoim projekcie
   ![Agents](../../../../../translated_images/pl/06-visit-agents.bccb263f77b00a09.webp)

1. Wybierz go - zobaczysz szczegóły agenta. Zwróć uwagę na następujące elementy:

      - Agent domyślnie używa File Search (zawsze)
      - W polu `Knowledge` agenta znajduje się informacja, że ma 32 przesłane pliki (do wyszukiwania w plikach)
      ![Agents](../../../../../translated_images/pl/07-view-agent-details.0e049f37f61eae62.webp)

1. Poszukaj opcji `Data+indexes` w lewym menu i kliknij, aby zobaczyć szczegóły.

      - Powinieneś zobaczyć 32 przesłane pliki danych dla wiedzy.
      - Będą one odpowiadały 12 plikom klienta i 20 plikom produktów w `src/files` 
      ![Data](../../../../../translated_images/pl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Zweryfikowałeś działanie agenta!** 

1. Odpowiedzi agenta opierają się na wiedzy zawartej w tych plikach. 
1. Możesz teraz zadawać pytania związane z tymi danymi i otrzymywać ugruntowane odpowiedzi.
1. Przykład: `customer_info_10.json` opisuje 3 zakupy dokonane przez "Amandę Perez"

Wróć do karty przeglądarki z punktem końcowym Container App i zapytaj: `Jakie produkty posiada Amanda Perez?`. Powinieneś zobaczyć coś podobnego:

![Data](../../../../../translated_images/pl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Plac zabaw agenta

Zbudujmy trochę więcej intuicji o możliwościach Microsoft Foundry, biorąc agenta na jazdę próbną na Agents Playground. 

1. Wróć do strony `Agents` w Microsoft Foundry - wybierz domyślnego agenta
1. Kliknij opcję `Try in Playground` - powinieneś zobaczyć interfejs placu zabaw jak ten
1. Zadaj to samo pytanie: `Jakie produkty posiada Amanda Perez?`

    ![Data](../../../../../translated_images/pl/09-ask-in-playground.a1b93794f78fa676.webp)

Otrzymujesz tę samą (lub podobną) odpowiedź - ale także dodatkowe informacje, które możesz wykorzystać do oceny jakości, kosztu i wydajności swojej aplikacji agentowej. Na przykład:

1. Zauważ, że odpowiedź cytuje pliki danych użyte do "podstawienia" odpowiedzi
1. Najedź kursorem na którąkolwiek z etykiet plików — czy dane odpowiadają Twojemu zapytaniu i wyświetlonej odpowiedzi?

Widzisz również wiersz _statystyk_ poniżej odpowiedzi. 

1. Najedź kursorem na dowolną metrykę — np. Safety. Zobaczysz coś takiego
1. Czy oceniona ocena odpowiada Twojej intuicji co do poziomu bezpieczeństwa odpowiedzi?

      ![Data](../../../../../translated_images/pl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Wbudowana obserwowalność

Obserwowalność oznacza instrumentowanie aplikacji w celu generowania danych, które można wykorzystać do zrozumienia, debugowania i optymalizacji jej działania. Aby to poczuć:

1. Kliknij przycisk `View Run Info` - zobaczysz ten widok. To przykład działania [Śledzenia agenta (Agent tracing)](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Ten widok możesz także uzyskać, klikając Thread Logs w menu na najwyższym poziomie_.

   - Zapoznaj się ze krokami uruchomienia i narzędziami użytymi przez agenta
   - Zrozum całkowitą liczbę tokenów (w porównaniu do zużycia tokenów wyjściowych) dla odpowiedzi
   - Poznaj opóźnienia i gdzie spędzany jest czas podczas wykonania

      ![Agent](../../../../../translated_images/pl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknij zakładkę `Metadata`, aby zobaczyć dodatkowe atrybuty uruchomienia, które mogą zapewnić użyteczny kontekst do debugowania problemów później.   

      ![Agent](../../../../../translated_images/pl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknij zakładkę `Evaluations`, aby zobaczyć automatyczne oceny odpowiedzi agenta. Obejmują one oceny bezpieczeństwa (np. samookaleczenie) oraz specyficzne dla agenta oceny (np. rozstrzygnięcie intencji, zgodność z zadaniem).

      ![Agent](../../../../../translated_images/pl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na koniec, kliknij zakładkę `Monitoring` w menu bocznym.

      - Wybierz zakładkę `Resource usage` na wyświetlonej stronie i zobacz metryki.
      - Śledź użycie aplikacji pod względem kosztów (tokeny) i obciążenia (żądania).
      - Śledź opóźnienie aplikacji do pierwszego bajtu (przetwarzanie wejścia) i ostatniego bajtu (wyjście).

      ![Agent](../../../../../translated_images/pl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Zmienne środowiskowe

Jak dotąd przeszliśmy przez wdrożenie w przeglądarce — i zwalidowaliśmy provisioning infrastruktury oraz działanie aplikacji. Ale aby pracować z aplikacją _na poziomie kodu_, musimy skonfigurować lokalne środowisko deweloperskie odpowiednimi zmiennymi potrzebnymi do pracy z tymi zasobami. Użycie `azd` to ułatwia.

1. Azure Developer CLI [używa zmiennych środowiskowych](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) do przechowywania i zarządzania ustawieniami konfiguracyjnymi wdrożeń aplikacji.

1. Zmienne środowiskowe są przechowywane w `.azure/<env-name>/.env` – w ten sposób są przypisane do środowiska `env-name` używanego podczas wdrożenia i pomagają izolować środowiska dla różnych celów wdrożeniowych w tym samym repozytorium.

1. Zmienne środowiskowe są automatycznie ładowane przez polecenie `azd` przy każdym wykonaniu konkretnej komendy (np. `azd up`). Zauważ, że `azd` nie odczytuje automatycznie zmiennych środowiskowych na poziomie systemu operacyjnego (np. ustawionych w terminalu) – zamiast tego użyj `azd set env` i `azd get env`, aby przekazać informacje w skryptach.


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
      
      Zobaczysz coś takiego – domyślnie nie było ustawione!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Ustaw nową zmienną środowiskową dla `azd`. Tutaj aktualizujemy nazwę modelu agenta. _Uwaga: wszelkie zmiany będą natychmiast odzwierciedlone w pliku `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz wartość powinna być ustawiona:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Zauważ, że niektóre zasoby są trwałe (np. wdrożenia modeli) i mogą wymagać więcej niż tylko `azd up`, aby wymusić ponowne wdrożenie. Spróbujmy wyczyścić pierwotne wdrożenie i ponownie wdrożyć z zmienionymi zmiennymi środowiskowymi.

1. **Odświeżenie** Jeśli wcześniej wdrożyłeś infrastrukturę za pomocą szablonu azd – możesz _odświeżyć_ stan swoich lokalnych zmiennych środowiskowych na podstawie aktualnego stanu wdrożenia Azure, używając tego polecenia:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      To potężny sposób na _synchronizację_ zmiennych środowiskowych między dwoma lub więcej lokalnymi środowiskami deweloperskimi (np. zespół z wieloma programistami) - pozwalający wdrożonej infrastrukturze służyć jako źródło prawdy dla stanu zmiennych środowiskowych. Członkowie zespołu po prostu _odświeżają_ zmienne, aby wrócić do synchronizacji.

---

## 9. Gratulacje 🏆

Właśnie ukończyłeś kompletny przepływ pracy, w którym:

- [X] Wybrałeś szablon AZD, którego chcesz użyć
- [X] Otworzyłeś szablon w obsługiwanym środowisku deweloperskim
- [X] Wdrożyłeś szablon i potwierdziłeś, że działa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->