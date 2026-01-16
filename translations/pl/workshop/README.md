<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:44:19+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pl"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Warsztat w budowie 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Ten warsztat jest obecnie aktywnie rozwijany.</strong><br>
      Treści mogą być niekompletne lub ulegać zmianom. Wróć wkrótce, aby zobaczyć aktualizacje!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ostatnia aktualizacja: październik 2025
      </span>
    </div>
  </div>
</div>

# Warsztat AZD dla deweloperów AI

Witamy w praktycznym warsztacie dotyczącym nauki Azure Developer CLI (AZD) z naciskiem na wdrażanie aplikacji AI. Ten warsztat pomoże Ci zdobyć praktyczne zrozumienie szablonów AZD w 3 krokach:

1. **Odkrywanie** - znajdź szablon odpowiedni dla siebie.
1. **Wdrażanie** - wdrożenie i weryfikacja działania.
1. **Dostosowanie** - modyfikacja i iteracja, aby dopasować do swoich potrzeb!

Podczas warsztatu poznasz również podstawowe narzędzia i przepływy pracy dewelopera, które pomogą Ci usprawnić proces rozwoju od początku do końca.

<br/>

## Przewodnik w przeglądarce

Lekcje warsztatowe są zapisane w formacie Markdown. Możesz je przeglądać bezpośrednio na GitHubie lub uruchomić podgląd w przeglądarce, jak pokazano na poniższym zrzucie ekranu.

![Warsztat](../../../translated_images/pl/workshop.75906f133e6f8ba0.png)

Aby skorzystać z tej opcji - zrób fork repozytorium na swoim profilu i uruchom GitHub Codespaces. Gdy terminal VS Code będzie aktywny, wpisz następujące polecenie:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Po kilku sekundach pojawi się okno dialogowe. Wybierz opcję `Open in browser`. Przewodnik w przeglądarce otworzy się w nowej karcie. Korzyści z tego podglądu:

1. **Wbudowane wyszukiwanie** - szybko znajdź słowa kluczowe lub lekcje.
1. **Ikona kopiowania** - najedź na bloki kodu, aby zobaczyć tę opcję.
1. **Przełącznik motywu** - zmieniaj między motywem ciemnym a jasnym.
1. **Uzyskaj pomoc** - kliknij ikonę Discord w stopce, aby dołączyć!

<br/>

## Przegląd warsztatu

**Czas trwania:** 3-4 godziny  
**Poziom:** Początkujący do średniozaawansowanego  
**Wymagania wstępne:** Znajomość Azure, podstaw AI, VS Code i narzędzi wiersza poleceń.

To praktyczny warsztat, w którym uczysz się poprzez działanie. Po ukończeniu ćwiczeń zalecamy zapoznanie się z programem AZD dla początkujących, aby kontynuować naukę w zakresie najlepszych praktyk dotyczących bezpieczeństwa i produktywności.

| Czas | Moduł  | Cel |
|:---|:---|:---|
| 15 min | [Wprowadzenie](docs/instructions/0-Introduction.md) | Ustawienie sceny, zrozumienie celów |
| 30 min | [Wybór szablonu AI](docs/instructions/1-Select-AI-Template.md) | Eksploracja opcji i wybór szablonu startowego | 
| 30 min | [Weryfikacja szablonu AI](docs/instructions/2-Validate-AI-Template.md) | Wdrożenie domyślnego rozwiązania na Azure |
| 30 min | [Analiza szablonu AI](docs/instructions/3-Deconstruct-AI-Template.md) | Eksploracja struktury i konfiguracji |
| 30 min | [Konfiguracja szablonu AI](docs/instructions/4-Configure-AI-Template.md) | Aktywacja i testowanie dostępnych funkcji |
| 30 min | [Dostosowanie szablonu AI](docs/instructions/5-Customize-AI-Template.md) | Adaptacja szablonu do własnych potrzeb |
| 30 min | [Usuwanie infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) | Czyszczenie i zwalnianie zasobów |
| 15 min | [Podsumowanie i kolejne kroki](docs/instructions/7-Wrap-up.md) | Zasoby edukacyjne, wyzwanie warsztatowe |

<br/>

## Czego się nauczysz

Traktuj szablon AZD jako piaskownicę edukacyjną do eksploracji różnych możliwości i narzędzi dla kompleksowego rozwoju na platformie Azure AI Foundry. Po ukończeniu warsztatu powinieneś intuicyjnie rozumieć różne narzędzia i koncepcje w tym kontekście.

| Koncepcja  | Cel |
|:---|:---|
| **Azure Developer CLI** | Zrozumienie poleceń narzędzia i przepływów pracy |
| **Szablony AZD**| Zrozumienie struktury projektu i konfiguracji |
| **Agent Azure AI**| Tworzenie i wdrażanie projektu Azure AI Foundry |
| **Azure AI Search**| Włączanie inżynierii kontekstowej z agentami |
| **Obserwowalność**| Eksploracja śledzenia, monitorowania i ewaluacji |
| **Testy Red Teaming**| Eksploracja testów przeciwdziałających i ich rozwiązań |

<br/>

## Struktura warsztatu

Warsztat jest zaprojektowany tak, aby przeprowadzić Cię przez proces od odkrycia szablonu, przez wdrożenie, analizę, aż po dostosowanie - wykorzystując oficjalny szablon startowy [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) jako podstawę.

### [Moduł 1: Wybór szablonu AI](docs/instructions/1-Select-AI-Template.md) (30 min)

- Czym są szablony AI?
- Gdzie mogę znaleźć szablony AI?
- Jak mogę zacząć budować agentów AI?
- **Laboratorium**: Szybki start z GitHub Codespaces

### [Moduł 2: Weryfikacja szablonu AI](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Jaka jest architektura szablonu AI?
- Jaki jest przepływ pracy w AZD?
- Jak mogę uzyskać pomoc w rozwoju AZD?
- **Laboratorium**: Wdrożenie i weryfikacja szablonu agentów AI

### [Moduł 3: Analiza szablonu AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Eksploracja środowiska w `.azure/` 
- Eksploracja konfiguracji zasobów w `infra/` 
- Eksploracja konfiguracji AZD w `azure.yaml`
- **Laboratorium**: Modyfikacja zmiennych środowiskowych i ponowne wdrożenie

### [Moduł 4: Konfiguracja szablonu AI](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Eksploracja: Retrieval Augmented Generation
- Eksploracja: Ocena agentów i testy Red Teaming
- Eksploracja: Śledzenie i monitorowanie
- **Laboratorium**: Eksploracja agenta AI + obserwowalność 

### [Moduł 5: Dostosowanie szablonu AI](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definiowanie: PRD z wymaganiami scenariusza
- Konfiguracja: Zmienne środowiskowe dla AZD
- Implementacja: Lifecycle Hooks dla dodatkowych zadań
- **Laboratorium**: Dostosowanie szablonu do mojego scenariusza

### [Moduł 6: Usuwanie infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Podsumowanie: Czym są szablony AZD?
- Podsumowanie: Dlaczego warto korzystać z Azure Developer CLI?
- Kolejne kroki: Wypróbuj inny szablon!
- **Laboratorium**: Usunięcie infrastruktury i czyszczenie

<br/>

## Wyzwanie warsztatowe

Chcesz się sprawdzić i zrobić coś więcej? Oto kilka propozycji projektów - lub podziel się swoimi pomysłami z nami!!

| Projekt | Opis |
|:---|:---|
|1. **Analiza złożonego szablonu AI** | Wykorzystaj opisany przepływ pracy i narzędzia, aby wdrożyć, zweryfikować i dostosować inny szablon rozwiązania AI. _Czego się nauczyłeś?_|
|2. **Dostosowanie do własnego scenariusza**  | Spróbuj napisać PRD (Product Requirements Document) dla innego scenariusza. Następnie użyj GitHub Copilot w repozytorium szablonu w trybie Agent Model - i poproś go o wygenerowanie dla Ciebie przepływu dostosowania. _Czego się nauczyłeś? Jak możesz ulepszyć te sugestie?_|
| | |

## Masz uwagi?

1. Zgłoś problem w tym repozytorium - oznacz go tagiem `Workshop` dla wygody.
1. Dołącz do Discorda Azure AI Foundry - połącz się z innymi uczestnikami!


| | | 
|:---|:---|
| **📚 Strona główna kursu**| [AZD dla początkujących](../README.md)|
| **📖 Dokumentacja** | [Rozpocznij pracę z szablonami AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Szablony AI** | [Szablony Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Kolejne kroki** | [Podejmij wyzwanie](../../../workshop) |
| | |

<br/>

---

**Poprzednie:** [Przewodnik rozwiązywania problemów AI](../docs/troubleshooting/ai-troubleshooting.md) | **Następne:** Rozpocznij od [Laboratorium 1: Podstawy AZD](../../../workshop/lab-1-azd-basics)

**Gotowy, aby zacząć budować aplikacje AI z AZD?**

[Rozpocznij Laboratorium 1: Podstawy AZD →](./lab-1-azd-basics/README.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.