<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7816c6ec50c694c331e7c6092371be4d",
  "translation_date": "2025-09-24T11:00:29+00:00",
  "source_file": "workshop/docs/instructions/2-Validate-AI-Template.md",
  "language_code": "pl"
}
-->
# 2. Walidacja szablonu

!!! tip "PO ZAKOŃCZENIU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Analizować architekturę rozwiązania AI
    - [ ] Zrozumieć przepływ pracy wdrożenia AZD
    - [ ] Korzystać z GitHub Copilot w celu uzyskania pomocy dotyczącej AZD
    - [ ] **Laboratorium 2:** Wdrażanie i walidacja szablonu AI Agents

---

## 1. Wprowadzenie

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) lub `azd` to narzędzie wiersza poleceń typu open-source, które upraszcza przepływ pracy programisty podczas tworzenia i wdrażania aplikacji na platformie Azure.

[Szablony AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) to standaryzowane repozytoria zawierające przykładowy kod aplikacji, zasoby _infrastruktury jako kodu_ oraz pliki konfiguracyjne `azd`, które tworzą spójną architekturę rozwiązania. Udostępnienie infrastruktury staje się tak proste, jak polecenie `azd provision`, a użycie `azd up` pozwala na jednoczesne udostępnienie infrastruktury **i** wdrożenie aplikacji!

W rezultacie rozpoczęcie procesu tworzenia aplikacji może być tak proste, jak znalezienie odpowiedniego _szablonu startowego AZD_, który najlepiej odpowiada Twoim potrzebom aplikacyjnym i infrastrukturalnym, a następnie dostosowanie repozytorium do wymagań scenariusza.

Zanim zaczniemy, upewnijmy się, że masz zainstalowany Azure Developer CLI.

1. Otwórz terminal w VS Code i wpisz następujące polecenie:

      ```bash title="" linenums="0"
      azd version
      ```

1. Powinieneś zobaczyć coś takiego!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Teraz jesteś gotowy do wyboru i wdrożenia szablonu za pomocą azd**

---

## 2. Wybór szablonu

Platforma Azure AI Foundry oferuje [zestaw rekomendowanych szablonów AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), które obejmują popularne scenariusze rozwiązań, takie jak _automatyzacja przepływu pracy z wieloma agentami_ i _przetwarzanie treści wielomodalnych_. Możesz również odkrywać te szablony, odwiedzając portal Azure AI Foundry.

1. Odwiedź [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Zaloguj się do portalu Azure AI Foundry, gdy zostaniesz o to poproszony - zobaczysz coś takiego.

![Pick](../../../../../translated_images/pl/01-pick-template.60d2d5fff5ebc374.png)

**Podstawowe** opcje to Twoje szablony startowe:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), który wdraża podstawową aplikację czatu _z Twoimi danymi_ na Azure Container Apps. Użyj tego, aby eksplorować podstawowy scenariusz chatbotów AI.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), który również wdraża standardowego agenta AI (z usługą Azure AI Agent Service). Użyj tego, aby zapoznać się z rozwiązaniami AI opartymi na agentach, które wykorzystują narzędzia i modele.

Otwórz drugi link w nowej karcie przeglądarki (lub kliknij `Open in GitHub` na powiązanej karcie). Powinieneś zobaczyć repozytorium dla tego szablonu AZD. Poświęć chwilę na zapoznanie się z plikiem README. Architektura aplikacji wygląda tak:

![Arch](../../../../../translated_images/pl/architecture.8cec470ec15c65c7.png)

---

## 3. Aktywacja szablonu

Spróbujmy wdrożyć ten szablon i upewnić się, że jest poprawny. Postępuj zgodnie z wytycznymi w sekcji [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Kliknij [ten link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - potwierdź domyślną akcję `Create codespace`
1. Otworzy się nowa karta przeglądarki - poczekaj, aż sesja GitHub Codespaces zakończy ładowanie
1. Otwórz terminal VS Code w Codespaces - wpisz następujące polecenie:

   ```bash title="" linenums="0"
   azd up
   ```

Wykonaj kroki przepływu pracy, które zostaną uruchomione:

1. Zostaniesz poproszony o zalogowanie się do Azure - postępuj zgodnie z instrukcjami, aby się uwierzytelnić
1. Wprowadź unikalną nazwę środowiska - np. użyłem `nitya-mshack-azd`
1. To utworzy folder `.azure/` - zobaczysz podfolder z nazwą środowiska
1. Zostaniesz poproszony o wybranie nazwy subskrypcji - wybierz domyślną
1. Zostaniesz poproszony o lokalizację - użyj `East US 2`

Teraz poczekaj na zakończenie udostępniania. **To zajmuje 10-15 minut**

1. Po zakończeniu, Twój konsola pokaże komunikat SUKCESU, taki jak ten:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```

1. Twój portal Azure będzie teraz zawierał udostępnioną grupę zasobów z nazwą środowiska:

      ![Infra](../../../../../translated_images/pl/02-provisioned-infra.46c706b14f56e0bf.png)

1. **Teraz jesteś gotowy do walidacji wdrożonej infrastruktury i aplikacji**.

---

## 4. Walidacja szablonu

1. Odwiedź stronę [Resource Groups](https://portal.azure.com/#browse/resourcegroups) w portalu Azure - zaloguj się, gdy zostaniesz o to poproszony
1. Kliknij na RG dla nazwy swojego środowiska - zobaczysz powyższą stronę

      - kliknij na zasób Azure Container Apps
      - kliknij na URL aplikacji w sekcji _Essentials_ (prawy górny róg)

1. Powinieneś zobaczyć hostowany interfejs użytkownika aplikacji, taki jak ten:

   ![App](../../../../../translated_images/pl/03-test-application.471910da12c3038e.png)

1. Spróbuj zadać kilka [przykładowych pytań](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zapytaj: ```What is the capital of France?``` 
      1. Zapytaj: ```What's the best tent under $200 for two people, and what features does it include?```

1. Powinieneś otrzymać odpowiedzi podobne do tych pokazanych poniżej. _Ale jak to działa?_ 

      ![App](../../../../../translated_images/pl/03-test-question.521c1e863cbaddb6.png)

---

## 5. Walidacja agenta

Azure Container App wdraża punkt końcowy, który łączy się z agentem AI udostępnionym w projekcie Azure AI Foundry dla tego szablonu. Przyjrzyjmy się, co to oznacza.

1. Wróć do strony _Overview_ w portalu Azure dla swojej grupy zasobów

1. Kliknij na zasób `Azure AI Foundry` na tej liście

1. Powinieneś zobaczyć to. Kliknij przycisk `Go to Azure AI Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pl/04-view-foundry-project.fb94ca41803f28f3.png)

1. Powinieneś zobaczyć stronę projektu Foundry dla swojej aplikacji AI
   ![Project](../../../../../translated_images/pl/05-visit-foundry-portal.d734e98135892d7e.png)

1. Kliknij na `Agents` - zobaczysz domyślnego agenta udostępnionego w Twoim projekcie
   ![Agents](../../../../../translated_images/pl/06-visit-agents.bccb263f77b00a09.png)

1. Wybierz go - i zobacz szczegóły agenta. Zwróć uwagę na następujące informacje:

      - Agent domyślnie używa File Search (zawsze)
      - `Knowledge` agenta wskazuje, że ma załadowane 32 pliki (do wyszukiwania plików)
      ![Agents](../../../../../translated_images/pl/07-view-agent-details.0e049f37f61eae62.png)

1. Poszukaj opcji `Data+indexes` w lewym menu i kliknij, aby zobaczyć szczegóły. 

      - Powinieneś zobaczyć 32 załadowane pliki danych dla wiedzy.
      - Odpowiadają one 12 plikom klientów i 20 plikom produktów w folderze `src/files` 
      ![Data](../../../../../translated_images/pl/08-visit-data-indexes.5a4cc1686fa0d19a.png)

**Zweryfikowałeś działanie agenta!** 

1. Odpowiedzi agenta są oparte na wiedzy zawartej w tych plikach. 
1. Teraz możesz zadawać pytania związane z tymi danymi i otrzymywać odpowiedzi oparte na faktach.
1. Przykład: `customer_info_10.json` opisuje 3 zakupy dokonane przez "Amanda Perez"

Wróć do karty przeglądarki z punktem końcowym aplikacji Container App i zapytaj: `What products does Amanda Perez own?`. Powinieneś zobaczyć coś takiego:

![Data](../../../../../translated_images/pl/09-ask-in-aca.4102297fc465a4d5.png)

---

## 6. Plac zabaw agenta

Zbudujmy trochę intuicji dotyczącej możliwości Azure AI Foundry, testując agenta w placu zabaw Agents Playground. 

1. Wróć do strony `Agents` w Azure AI Foundry - wybierz domyślnego agenta
1. Kliknij opcję `Try in Playground` - powinieneś zobaczyć interfejs placu zabaw, taki jak ten
1. Zadaj to samo pytanie: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/pl/09-ask-in-playground.a1b93794f78fa676.png)

Otrzymasz tę samą (lub podobną) odpowiedź - ale zobaczysz również dodatkowe informacje, które możesz wykorzystać do zrozumienia jakości, kosztów i wydajności swojej aplikacji opartej na agentach. Na przykład:

1. Zauważ, że odpowiedź cytuje pliki danych użyte do "uzasadnienia" odpowiedzi
1. Najedź kursorem na dowolną etykietę pliku - czy dane odpowiadają Twojemu zapytaniu i wyświetlonej odpowiedzi?

Zobaczysz również wiersz _statystyk_ poniżej odpowiedzi. 

1. Najedź kursorem na dowolną metrykę - np. Safety. Zobaczysz coś takiego
1. Czy oceniony poziom bezpieczeństwa odpowiada Twojej intuicji dotyczącej poziomu bezpieczeństwa odpowiedzi?

      ![Data](../../../../../translated_images/pl/10-view-run-info-meter.6cdb89a0eea5531f.png)

---

## 7. Wbudowana obserwowalność

Obserwowalność polega na instrumentacji aplikacji w celu generowania danych, które można wykorzystać do zrozumienia, debugowania i optymalizacji jej działania. Aby to zrozumieć:

1. Kliknij przycisk `View Run Info` - powinieneś zobaczyć ten widok. To przykład [śledzenia agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) w akcji. _Możesz również uzyskać ten widok, klikając Thread Logs w menu głównym_.

   - Zrozum kroki wykonania i narzędzia zaangażowane przez agenta
   - Zrozum całkowitą liczbę tokenów (vs. użycie tokenów wyjściowych) dla odpowiedzi
   - Zrozum opóźnienie i gdzie czas jest spędzany podczas wykonania

      ![Agent](../../../../../translated_images/pl/10-view-run-info.b20ebd75fef6a1cc.png)

1. Kliknij kartę `Metadata`, aby zobaczyć dodatkowe atrybuty dla wykonania, które mogą dostarczyć przydatnego kontekstu do debugowania problemów później.   

      ![Agent](../../../../../translated_images/pl/11-view-run-info-metadata.7966986122c7c2df.png)

1. Kliknij kartę `Evaluations`, aby zobaczyć automatyczne oceny odpowiedzi agenta. Obejmują one oceny bezpieczeństwa (np. Samookaleczenie) i oceny specyficzne dla agenta (np. Rozwiązanie intencji, Zgodność z zadaniem).

      ![Agent](../../../../../translated_images/pl/12-view-run-info-evaluations.ef25e4577d70efeb.png)

1. Na koniec kliknij kartę `Monitoring` w menu bocznym.

      - Wybierz kartę `Resource usage` na wyświetlonej stronie - i zobacz metryki.
      - Śledź użycie aplikacji pod względem kosztów (tokeny) i obciążenia (żądania).
      - Śledź opóźnienie aplikacji od pierwszego bajtu (przetwarzanie wejścia) do ostatniego bajtu (wyjście).

      ![Agent](../../../../../translated_images/pl/13-monitoring-resources.5148015f7311807f.png)

---

## 8. Zmienne środowiskowe

Do tej pory przeszliśmy przez wdrożenie w przeglądarce - i zweryfikowaliśmy, że nasza infrastruktura została udostępniona, a aplikacja działa. Jednak aby pracować z aplikacją _z poziomu kodu_, musimy skonfigurować nasze lokalne środowisko programistyczne z odpowiednimi zmiennymi wymaganymi do pracy z tymi zasobami. Korzystanie z `azd` to ułatwia.

1. Azure Developer CLI [używa zmiennych środowiskowych](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) do przechowywania i zarządzania ustawieniami konfiguracyjnymi dla wdrożeń aplikacji.

1. Zmienne środowiskowe są przechowywane w `.azure/<env-name>/.env` - co ogranicza je do środowiska `env-name` używanego podczas wdrożenia i pomaga izolować środowiska między różnymi celami wdrożenia w tym samym repozytorium.

1. Zmienne środowiskowe są automatycznie ładowane przez polecenie `azd` za każdym razem, gdy wykonuje ono określone polecenie (np. `azd up`). Zauważ, że `azd` nie odczytuje automatycznie _zmiennych środowiskowych na poziomie systemu operacyjnego_ (np. ustawionych w powłoce) - zamiast tego użyj `azd set env` i `azd get env`, aby przenosić informacje w skryptach.

Wypróbujmy kilka poleceń:

1. Pobierz wszystkie zmienne środowiskowe ustawione dla `azd` w tym środowisku:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Zobaczysz coś takiego:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Pobierz konkretną wartość - np. chcę wiedzieć, czy ustawiliśmy wartość `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Zobaczysz coś takiego - nie została ustawiona domyślnie!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Ustaw nową zmienną środowiskową dla `azd`. Tutaj aktualizujemy nazwę modelu agenta. _Uwaga: wszelkie zmiany zostaną natychmiast odzwierciedlone w pliku `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz powinniśmy znaleźć ustawioną wartość:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Zauważ, że niektóre zasoby są trwałe (np. wdrożenia modeli) i będą wymagały więcej niż tylko `azd up`, aby wymusić ponowne wdrożenie. Spróbujmy usunąć pierwotne wdrożenie i ponownie wdrożyć z zmienionymi zmiennymi środowiskowymi.

1. **Odśwież** Jeśli wcześniej wdrożyłeś infrastrukturę za pomocą szablonu azd - możesz _odświeżyć_ stan swoich lokalnych zmiennych środowiskowych na podstawie aktualnego stanu wdrożenia Azure za pomocą tego polecenia:
      ```bash title="" linenums="0"
      azd env refresh
      ```

      To potężny sposób na _synchronizację_ zmiennych środowiskowych między dwoma lub więcej lokalnymi środowiskami deweloperskimi (np. zespołem z wieloma programistami) - pozwalający wdrożonej infrastrukturze pełnić rolę źródła prawdy dla stanu zmiennych środowiskowych. Członkowie zespołu po prostu _odświeżają_ zmienne, aby ponownie się zsynchronizować.

---

## 9. Gratulacje 🏆

Właśnie ukończyłeś kompletny przepływ pracy, w którym:

- [X] Wybrałeś szablon AZD, którego chcesz użyć
- [X] Uruchomiłeś szablon za pomocą GitHub Codespaces 
- [X] Wdrożyłeś szablon i zweryfikowałeś, że działa

---

