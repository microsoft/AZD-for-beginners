# 1. Wybierz szablon

!!! tip "NA KOŃCU TEGO MODUŁU BĘDZIESZ W STANIE"

    - [ ] Opisać, czym są szablony AZD
    - [ ] Odkrywać i używać szablonów AZD dla AI
    - [ ] Rozpocząć pracę z szablonem AI Agents
    - [ ] **Lab 1:** Szybki start z AZD w GitHub Codespaces

---

## 1. Analogią do budowniczego

Budowa nowoczesnej, gotowej na zastosowania biznesowe aplikacji AI _od podstaw_ może być przytłaczająca. To trochę jak budowanie własnego nowego domu, cegła po cegle. Tak, można to zrobić! Ale nie jest to najbardziej efektywny sposób na uzyskanie pożądanego efektu końcowego!

Zamiast tego często zaczynamy od istniejącego _planu architektonicznego_ i współpracujemy z architektem, aby dostosować go do naszych indywidualnych wymagań. I dokładnie takie podejście należy zastosować przy tworzeniu inteligentnych aplikacji. Najpierw znajdź dobry projekt architektury, który odpowiada Twojemu obszarowi problemowemu. Następnie współpracuj z architektem rozwiązań, aby dostosować i rozwinąć rozwiązanie do swojego konkretnego scenariusza.

Ale gdzie można znaleźć takie plany architektoniczne? I jak znaleźć architekta, który zechce nauczyć nas, jak samodzielnie dostosować i wdrożyć te plany? W tym warsztacie odpowiadamy na te pytania, wprowadzając Cię do trzech technologii:

1. [Azure Developer CLI](https://aka.ms/azd) - narzędzie open-source, które przyspiesza ścieżkę dewelopera od lokalnego rozwoju (build) do wdrożenia w chmurze (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardowe repozytoria open-source zawierające przykładowy kod, infrastrukturę i pliki konfiguracyjne do wdrażania architektury rozwiązania AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - agent kodujący oparty na wiedzy Azure, który może nas prowadzić w nawigacji po kodzie i wprowadzaniu zmian - używając języka naturalnego.

Dysponując tymi narzędziami, możemy teraz _odkryć_ odpowiedni szablon, _wdrożyć_ go, aby sprawdzić, czy działa, oraz _dostosować_ do naszych konkretnych scenariuszy. Zagłębmy się i zobaczmy, jak to działa.


---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (lub `azd`) to open-source’owe narzędzie wiersza poleceń, które może przyspieszyć Twoją ścieżkę od kodu do chmury dzięki zestawowi przyjaznych dla dewelopera poleceń działających spójnie zarówno w Twoim środowisku IDE (development), jak i CI/CD (devops).

Dzięki `azd` Twoja podróż wdrożeniowa może być tak prosta jak:

- `azd init` - inicjalizuje nowy projekt AI na podstawie istniejącego szablonu AZD.
- `azd up` - jednocześnie tworzy infrastrukturę i wdraża aplikację.
- `azd monitor` - zapewnia monitorowanie w czasie rzeczywistym i diagnostykę wdrożonej aplikacji.
- `azd pipeline config` - konfiguruje pipeline’y CI/CD do automatyzacji wdrożenia w Azure.

**🎯 | ĆWICZENIE**: <br/> 
Przetestuj teraz narzędzie `azd` w swoim środowisku GitHub Codespaces. Zacznij od wpisania tego polecenia, aby zobaczyć, co to narzędzie potrafi:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/pl/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Szablon AZD

Aby `azd` mógł to osiągnąć, musi znać infrastrukturę do utworzenia, ustawienia konfiguracyjne do wymuszenia oraz aplikację do wdrożenia. Właśnie tutaj wchodzą w grę [szablony AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Szablony AZD to repozytoria open-source, które łączą przykładowy kod z plikami infrastruktury i konfiguracji potrzebnymi do wdrożenia architektury rozwiązania.  
Stosując podejście _Infrastructure-as-Code_ (IaC), pozwalają na wersjonowanie definicji zasobów i ustawień konfiguracyjnych (tak samo jak kod źródłowy aplikacji) — tworząc powtarzalne i spójne workflow dla użytkowników projektu.

Tworząc lub ponownie wykorzystując szablon AZD dla _Twojego_ scenariusza, rozważ następujące pytania:

1. Co budujesz? → Czy jest dostępny szablon z kodem początkowym dla tego scenariusza?
1. Jak jest zaprojektowane Twoje rozwiązanie? → Czy jest szablon z niezbędnymi zasobami?
1. Jak jest wdrażane Twoje rozwiązanie? → Pomyśl o `azd deploy` z hookami przed/po przetwarzaniu!
1. Jak możesz je jeszcze bardziej zoptymalizować? → Pomyśl o wbudowanym monitoringu i pipeline’ach automatyzacji!

**🎯 | ĆWICZENIE**: <br/> 
Odwiedź galerię [Awesome AZD](https://azure.github.io/awesome-azd/) i użyj filtrów, aby przejrzeć ponad 250 dostępnych szablonów. Sprawdź, czy znajdziesz taki, który pasuje do _Twoich_ wymagań scenariusza.

![Code](../../../../../translated_images/pl/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Szablony aplikacji AI

Dla aplikacji zasilanych AI Microsoft udostępnia specjalistyczne szablony zawierające **Microsoft Foundry** i **Foundry Agents**. Szablony te przyspieszają budowę inteligentnych, gotowych do produkcji aplikacji.

### Szablony Microsoft Foundry i Foundry Agents

Wybierz szablon poniżej, aby go wdrożyć. Każdy szablon jest dostępny w [Awesome AZD](https://azure.github.io/awesome-azd/) i można go zainicjować jednym poleceniem.

| Szablon | Opis | Polecenie wdrożenia |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplikacja czatu z Retrieval Augmented Generation przy użyciu Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Budowa agentów AI z Foundry Agents do autonomicznego wykonywania zadań | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordynacja wielu agentów Foundry dla złożonych workflow | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Ekstrakcja i analiza dokumentów za pomocą modeli Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Budowa inteligentnych chatbotów z integracją Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generowanie obrazów za pomocą DALL-E poprzez Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agenci AI używający Semantic Kernel wraz z Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Systemy wieloagentowe korzystające z frameworka AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Szybki start

1. **Przeglądaj szablony**: Odwiedź [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) i filtruj po `AI`, `Agents` lub `Microsoft Foundry`
2. **Wybierz swój szablon**: Wybierz taki, który odpowiada Twojemu przypadkowi użycia
3. **Inicjalizuj**: Uruchom polecenie `azd init` dla wybranego szablonu
4. **Wdróż**: Uruchom `azd up`, aby utworzyć infrastrukturę i wdrożyć rozwiązanie

**🎯 | ĆWICZENIE**: <br/>
Wybierz jeden z powyższych szablonów zgodny z Twoim scenariuszem:

- **Budujesz chatbota?** → Zacznij od **AI Chat with RAG** lub **Conversational AI Bot**
- **Potrzebujesz autonomicznych agentów?** → Wypróbuj **Foundry Agent Service Starter** lub **Multi-Agent Orchestration**
- **Przetwarzasz dokumenty?** → Skorzystaj z **AI Document Intelligence**
- **Chcesz pomocy przy kodowaniu AI?** → Sprawdź **Semantic Kernel Agent** lub **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Poznaj więcej szablonów"
    Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) zawiera ponad 250 szablonów. Użyj filtrów, aby znaleźć szablony odpowiadające Twoim konkretnym wymaganiom dotyczącym języka, frameworka i usług Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikłe z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->