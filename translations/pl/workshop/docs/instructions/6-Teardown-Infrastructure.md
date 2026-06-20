# 6. Usuwanie infrastruktury

!!! tip "PO ZAKOŃCZENIU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Zrozumieć znaczenie sprzątania zasobów i zarządzania kosztami
    - [ ] Używać `azd down` do bezpiecznego wycofywania infrastruktury
    - [ ] Odzyskać miękko usunięte usługi Azure AI, jeśli zajdzie taka potrzeba
    - [ ] **Lab 6:** Posprzątać zasoby Azure i zweryfikować ich usunięcie

---

## Ćwiczenia dodatkowe

Zanim usuniemy projekt, poświęć kilka minut na swobodne eksploracje.

!!! info "Wypróbuj te propozycje eksploracji"

    **Eksperymentuj z GitHub Copilot:**
    
    1. Zapytaj: `Jakie inne szablony AZD mógłbym wypróbować dla scenariuszy wieloagentowych?`
    2. Zapytaj: `Jak mogę dostosować instrukcje agenta dla zastosowania w opiece zdrowotnej?`
    3. Zapytaj: `Jakie zmienne środowiskowe kontrolują optymalizację kosztów?`
    
    **Zbadaj portal Azure:**
    
    1. Przejrzyj metryki Application Insights dla swojej wdrożonej aplikacji
    2. Sprawdź analizę kosztów dla uruchomionych zasobów
    3. Jeszcze raz zbadaj „plac zabaw” agenta w portalu Microsoft Foundry

---

## Usuwanie infrastruktury

1. Usunięcie infrastruktury jest tak proste jak:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flaga `--purge` zapewnia również usunięcie miękko usuniętych zasobów Cognitive Service, co zwalnia kwotę zajmowaną przez te zasoby. Po zakończeniu zobaczysz coś takiego:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcjonalnie) Jeśli teraz ponownie uruchomisz `azd up`, zauważysz, że model gpt-4.1 zostaje wdrożony, ponieważ zmienna środowiskowa została zmieniona (i zapisana) w lokalnym folderze `.azure`. 

      Oto wdrożenia modelu **przed**:

      ![Initial](../../../../../translated_images/pl/14-deploy-initial.30e4cf1c29b587bc.webp)

      A tutaj **po**:
      ![New](../../../../../translated_images/pl/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->