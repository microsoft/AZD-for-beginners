# 2. Walidacja szablonu

> Zweryfikowano na podstawie `azd 1.23.12` w marcu 2026 roku.

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ POTRAFIEĆ"

    - [ ] Analizować architekturę rozwiązania AI
    - [ ] Rozumieć przepływ pracy wdrażania AZD
    - [ ] Korzystać z GitHub Copilot, aby otrzymać pomoc w użyciu AZD
    - [ ] **Laboratorium 2:** Wdrażać i weryfikować szablon AI Agents

---


## 1. Wprowadzenie

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) lub `azd` to narzędzie wiersza poleceń open-source, które usprawnia pracę programisty podczas tworzenia i wdrażania aplikacji w Azure.

[Szablony AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) to ustandaryzowane repozytoria zawierające przykładowy kod aplikacji, zasoby _infrastruktury jako kodu_ oraz pliki konfiguracyjne `azd` tworzące spójną architekturę rozwiązania. Zapewnienie infrastruktury staje się tak proste jak wykonanie polecenia `azd provision` – natomiast użycie `azd up` pozwala jednocześnie na utworzenie infrastruktury **i** wdrożenie aplikacji!

W efekcie rozpoczęcie tworzenia aplikacji może być tak proste, jak znalezienie odpowiedniego _szablonu startowego AZD_, który najbardziej odpowiada Twoim potrzebom aplikacyjnym i infrastrukturalnym – a następnie dostosowanie repozytorium do wymagań scenariusza.

Zanim zaczniemy, upewnijmy się, że masz zainstalowany Azure Developer CLI.

1. Otwórz terminal w VS Code i wpisz to polecenie:

      ```bash title="" linenums="0"
      azd version
      ```

1. Powinieneś zobaczyć coś takiego!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Jesteś teraz gotowy, aby wybrać i wdrożyć szablon za pomocą azd**

---

## 2. Wybór szablonu

Platforma Microsoft Foundry oferuje [zbiór rekomendowanych szablonów AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), które obejmują popularne scenariusze rozwiązania, takie jak _automatyzacja wielu agentów w przepływach pracy_ i _wielomodalne przetwarzanie treści_. Możesz również odnaleźć te szablony, odwiedzając portal Microsoft Foundry.

1. Odwiedź [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Zaloguj się do portalu Microsoft Foundry po wyświetleniu monitów – zobaczysz coś takiego.

![Pick](../../../../../translated_images/pl/01-pick-template.60d2d5fff5ebc374.webp)


Opcje **Basic** to Twoje szablony startowe:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), który wdraża podstawową aplikację czatu _z Twoimi danymi_ na Azure Container Apps. Użyj tego, aby zapoznać się z podstawowym scenariuszem chatbota AI.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), który również wdraża standardowego Agenta AI (z Foundry Agents). Użyj tego, aby poznać rozwiązania agentowe AI obejmujące narzędzia i modele.

Odwiedź drugi link w nowej karcie przeglądarki (lub kliknij `Open in GitHub` na powiązanej karcie). Powinieneś zobaczyć repozytorium dla tego szablonu AZD. Poświęć chwilę na zapoznanie się z README. Architektura aplikacji wygląda tak:

![Arch](../../../../../translated_images/pl/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktywacja szablonu

Spróbujmy wdrożyć ten szablon i upewnić się, że jest prawidłowy. Będziemy postępować zgodnie z wytycznymi w sekcji [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wybierz środowisko pracy dla repozytorium szablonu:

      - **GitHub Codespaces**: Kliknij [ten link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potwierdź `Create codespace`
      - **Lokalne klonowanie lub kontener deweloperski**: Sklonuj `Azure-Samples/get-started-with-ai-agents` i otwórz w VS Code

1. Poczekaj, aż terminal VS Code będzie gotowy, a następnie wpisz następujące polecenie:

   ```bash title="" linenums="0"
   azd up
   ```

Wykonaj kolejne kroki przepływu pracy, które to polecenie rozpocznie:

1. Zostaniesz poproszony o zalogowanie się do Azure – postępuj zgodnie z instrukcjami, aby się uwierzytelnić
1. Wprowadź unikatową nazwę środowiska dla siebie – np. użyłem `nitya-mshack-azd`
1. To spowoduje utworzenie folderu `.azure/` – zobaczysz podfolder o nazwie środowiska
1. Zostaniesz poproszony o wybór nazwy subskrypcji – wybierz domyślną
1. Zostaniesz poproszony o lokalizację – użyj `East US 2`

Teraz poczekaj na zakończenie procesu provisioningu. **To zajmuje 10-15 minut**

1. Po zakończeniu na konsoli pojawi się komunikat SUKCESU, taki jak ten:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. W portalu Azure pojawi się teraz grupa zasobów z nazwą środowiska:

      ![Infra](../../../../../translated_images/pl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Jesteś teraz gotowy, aby zweryfikować wdrożoną infrastrukturę i aplikację**.

---

## 4. Walidacja szablonu

1. Odwiedź stronę grup zasobów w Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – zaloguj się, gdy pojawi się monit
1. Kliknij na RG dla Twojej nazwy środowiska – zobaczysz powyższą stronę

      - kliknij na zasób Azure Container Apps
      - kliknij na adres URL aplikacji w sekcji _Essentials_ (góra po prawej)

1. Powinieneś zobaczyć interfejs front-end aplikacji hostowanej, taki jak ten:

   ![App](../../../../../translated_images/pl/03-test-application.471910da12c3038e.webp)

1. Spróbuj zadać kilka [przykładowych pytań](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zapytaj: ```What is the capital of France?``` 
      1. Zapytaj: ```What's the best tent under $200 for two people, and what features does it include?```

1. Powinieneś otrzymać odpowiedzi podobne do pokazanych poniżej. _Ale jak to działa?_ 

      ![App](../../../../../translated_images/pl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Walidacja agenta

Azure Container App wdraża punkt końcowy, który łączy się z agentem AI udostępnionym w projekcie Microsoft Foundry dla tego szablonu. Przyjrzyjmy się, co to oznacza.

1. Wróć do strony _Przegląd_ w Azure Portal dla Twojej grupy zasobów

1. Kliknij na zasób `Microsoft Foundry` na liście

1. Powinieneś zobaczyć to. Kliknij przycisk `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/pl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Powinieneś zobaczyć stronę projektu Foundry dla Twojej aplikacji AI
   ![Project](../../../../../translated_images/pl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknij na `Agents` – zobaczysz domyślnego agenta wdrożonego w Twoim projekcie
   ![Agents](../../../../../translated_images/pl/06-visit-agents.bccb263f77b00a09.webp)

1. Wybierz go – zobaczysz szczegóły agenta. Zwróć uwagę na następujące informacje:

      - Agent domyślnie korzysta z File Search (zawsze)
      - W `Knowledge` agenta widzisz, że 32 pliki zostały przesłane (do wyszukiwania plików)
      ![Agents](../../../../../translated_images/pl/07-view-agent-details.0e049f37f61eae62.webp)

1. Poszukaj opcji `Data+indexes` w menu po lewej i kliknij, aby zobaczyć szczegóły.

      - Powinieneś zobaczyć 32 pliki danych przesłane jako wiedza.
      - Odpowiadają one 12 plikom klienta i 20 plikom produktu w folderze `src/files`
      ![Data](../../../../../translated_images/pl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Zweryfikowałeś działanie Agenta!**

1. Odpowiedzi agenta opierają się na wiedzy zawartej w tych plikach.
1. Możesz teraz zadawać pytania związane z tymi danymi i otrzymywać oparte na nich odpowiedzi.
1. Przykład: `customer_info_10.json` opisuje 3 zakupy dokonane przez "Amanda Perez".

Wróć do karty przeglądarki z punktem końcowym Container App i zapytaj: `What products does Amanda Perez own?`. Powinieneś zobaczyć coś takiego:

![Data](../../../../../translated_images/pl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Plac zabaw agenta

Zbudujmy trochę większą intuicję co do możliwości Microsoft Foundry, testując agenta w Agents Playground.

1. Wróć do strony `Agents` w Microsoft Foundry – wybierz domyślnego agenta
1. Kliknij opcję `Try in Playground` – powinien wyświetlić się interfejs Playground jak poniżej
1. Zadaj to samo pytanie: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/pl/09-ask-in-playground.a1b93794f78fa676.webp)

Otrzymasz tę samą (lub podobną) odpowiedź – ale także dodatkowe informacje, które pomogą Ci zrozumieć jakość, koszt i wydajność Twojej aplikacji agentowej. Na przykład:

1. Zauważ, że odpowiedź odwołuje się do plików danych wykorzystanych do "umocowania" odpowiedzi
1. Najedź kursorem na którąkolwiek z etykiet plików – czy dane pokrywają się z Twoim zapytaniem i wyświetloną odpowiedzią?

Poniżej odpowiedzi zobaczysz również wiersz ze statystykami.

1. Najedź kursorem na dowolną metrykę – np. Safety. Zobaczysz coś takiego
1. Czy oceniona ocena odpowiada Twojej intuicji co do poziomu bezpieczeństwa odpowiedzi?

      ![Data](../../../../../translated_images/pl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Wbudowana obserwowalność

Obserwowalność polega na instrumentowaniu aplikacji w celu generowania danych, które można wykorzystać do zrozumienia, debugowania i optymalizacji jej działania. Aby zorientować się w tym:

1. Kliknij przycisk `View Run Info` – powinieneś zobaczyć ten widok. To przykład działania [śledzenia Agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Możesz też uzyskać ten widok, klikając Thread Logs w menu głównym_.

   - Zapoznaj się ze krokami wykonania i użytymi przez agenta narzędziami
   - Zrozum całkowitą liczbę tokenów (vs. zużycie tokenów w wyjściu) dla odpowiedzi
   - Zrozum opóźnienie i gdzie czas jest poświęcany podczas wykonywania

      ![Agent](../../../../../translated_images/pl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknij zakładkę `Metadata`, aby zobaczyć dodatkowe atrybuty wykonania, które mogą być użyteczne przy debugowaniu problemów później.

      ![Agent](../../../../../translated_images/pl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknij zakładkę `Evaluations`, aby zobaczyć automatyczne oceny odpowiedzi agenta. Zawierają one oceny bezpieczeństwa (np. Samouszkodzenia) oraz specyficzne oceny agenta (np. Rozpoznanie intencji, Przestrzeganie zadań).

      ![Agent](../../../../../translated_images/pl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Wreszcie, kliknij zakładkę `Monitoring` w menu bocznym.

      - Wybierz zakładkę `Resource usage` na wyświetlonej stronie - i zapoznaj się z metrykami.
      - Śledź użycie aplikacji pod kątem kosztów (tokeny) i obciążenia (żądania).
      - Śledź opóźnienie aplikacji do pierwszego bajtu (przetwarzanie wejścia) i ostatniego bajtu (wyjście).

      ![Agent](../../../../../translated_images/pl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Zmienne środowiskowe

Do tej pory przeprowadziliśmy wdrożenie w przeglądarce – i zweryfikowaliśmy, że nasza infrastruktura została udostępniona, a aplikacja działa. Ale aby pracować z aplikacją _od strony kodu_, musimy skonfigurować lokalne środowisko deweloperskie z odpowiednimi zmiennymi wymaganymi do pracy z tymi zasobami. Użycie `azd` to ułatwia.

1. Azure Developer CLI [używa zmiennych środowiskowych](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) do przechowywania i zarządzania ustawieniami konfiguracyjnymi dla wdrożeń aplikacji.

1. Zmienne środowiskowe są przechowywane w `.azure/<env-name>/.env` – przypisując je do środowiska o nazwie `env-name` używanego podczas wdrożenia, co pomaga izolować środowiska między różnymi celami wdrożeniowymi w tym samym repozytorium.

1. Zmienne środowiskowe są automatycznie wczytywane przez polecenie `azd` za każdym razem, gdy uruchamiasz określone polecenie (np. `azd up`). Uwaga: `azd` nie odczytuje automatycznie zmiennych środowiskowych na poziomie systemu operacyjnego (np. ustawionych w powłoce) – zamiast tego użyj `azd set env` i `azd get env`, aby przesyłać informacje w skryptach.


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

1. Pobierz konkretną wartość – np. chcę wiedzieć, czy ustawiono wartość `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Zobaczysz coś takiego – nie została ustawiona domyślnie!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Ustaw nową zmienną środowiskową dla `azd`. Tutaj aktualizujemy nazwę modelu agenta. _Uwaga: wszelkie zmiany zostaną od razu odzwierciedlone w pliku `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz powinniśmy zobaczyć ustawioną wartość:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Zauważ, że niektóre zasoby są trwałe (np. wdrożenia modeli) i będą wymagały więcej niż tylko `azd up`, aby wymusić ponowne wdrożenie. Spróbujmy rozebrać oryginalne wdrożenie i wdrożyć ponownie ze zmienionymi zmiennymi środowiskowymi.

1. **Odśwież** Jeśli wcześniej wdrożyłeś infrastrukturę za pomocą szablonu azd – możesz _odświeżyć_ stan swoich lokalnych zmiennych środowiskowych na podstawie aktualnego stanu wdrożenia Azure, używając tego polecenia:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      To potężny sposób na _synchronizację_ zmiennych środowiskowych pomiędzy dwoma lub więcej lokalnymi środowiskami deweloperskimi (np. zespół z wieloma deweloperami) - pozwalając wdrożonej infrastrukturze pełnić rolę prawdziwego źródła stanu zmiennych środowiskowych. Członkowie zespołu po prostu _odświeżają_ zmienne, aby zsynchronizować się ponownie.

---

## 9. Gratulacje 🏆

Właśnie ukończyłeś kompletny proces pracy, w którym:

- [X] Wybrałeś szablon AZD, którego chcesz użyć
- [X] Otworzyłeś szablon w obsługiwanym środowisku deweloperskim
- [X] Wdrożyłeś szablon i potwierdziłeś, że działa

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uważany za źródło autorytatywne. W przypadku informacji krytycznych zaleca się profesjonalne tłumaczenie wykonane przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->