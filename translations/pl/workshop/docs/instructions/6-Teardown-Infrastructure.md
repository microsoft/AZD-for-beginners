# 6. Demontaż infrastruktury

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ UMIAŁ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Ćwiczenia dodatkowe

Zanim zdemontujesz projekt, poświęć kilka minut na swobodne eksploracje.

!!! info "Wypróbuj te pytania do eksploracji"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Demontaż infrastruktury

1. Demontaż infrastruktury jest tak prosty jak:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potwierdź wybrane środowisko i przejrzyj zasoby do usunięcia. Usuwa to zasoby Azure i może spowodować utratę danych. Zachowaj monit potwierdzenia dla tego procesu nauki. Po zakończeniu zobaczysz podobny wynik:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Zweryfikuj usunięcie w portalu i sprawdź zasoby poza zakresem wdrożenia. Raportowanie kosztów i aktualizacje limitów mogą mieć opóźnienie. Lokalna konfiguracja `.azure` pozostaje, chyba że ją wyraźnie usuniesz.

1. `azd down --purge` dodatkowo żąda trwałego usunięcia obsługiwanych zasobów w stanie miękkiego usunięcia. Używaj go tylko, gdy odzyskanie nie jest potrzebne i rozumiesz zasady retencji/ochrony przed usunięciem. Nie gwarantuje natychmiastowego zwolnienia limitów.

1. Nie wdrażaj ponownie tylko po to, by zweryfikować czyszczenie. Późniejsza celowa komenda `azd up` może odtworzyć zasoby, używając pozostałych lokalnych danych wejściowych, co spowoduje ponowne naliczenie opłat. Aktualizacje modelu zazwyczaj używają wspieranych zmian provisioningowych, a nie demontażu.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->