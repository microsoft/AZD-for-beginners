# 6. Usuwanie infrastruktury

!!! tip "PO ZAKOŃCZENIU TEGO MODUŁU BĘDZIESZ POTRAFIŁ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Ćwiczenia dodatkowe

Zanim usuniesz projekt, poświęć kilka minut na otwarte eksploracje.

!!! info "Wypróbuj poniższe pomysły do eksploracji"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Usuwanie infrastruktury

!!! warning "Jeśli ukończyłeś także ćwiczenie z agentem hostowanym przez GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Usuwanie infrastruktury jest tak proste jak:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potwierdź wybrane środowisko i sprawdź zasoby do usunięcia. Usuwa to zasoby Azure i może zniszczyć dane. Zachowaj monit potwierdzający dla tego procesu nauki. Po zakończeniu zobaczysz podobne wyjście:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Zweryfikuj usunięcie w portalu i sprawdź zasoby poza zakresem wdrożenia. Raportowanie kosztów i aktualizacje limitów mogą się opóźniać. Lokalna konfiguracja `.azure` pozostaje, chyba że wyraźnie ją usuniesz.

1. `azd down --purge` dodatkowo żąda trwałego usunięcia obsługiwanych zasobów z miękkiego usunięcia. Używaj go tylko, gdy odzyskanie nie jest wymagane i rozumiesz zasady retencji/ochrony przed oczyszczaniem. Nie gwarantuje natychmiastowego zwolnienia limitu.

1. Nie wdrażaj ponownie tylko po to, by zweryfikować czyszczenie. Późniejsze celowe `azd up` może odtworzyć zasoby korzystając z pozostałych lokalnych danych wejściowych, co ponownie generuje opłaty. Aktualizacje modelu zwykle używają obsługiwanych zmian provisioningowych, a nie usuwania.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->