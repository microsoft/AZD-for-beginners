# Capitolul 5: Soluții AI Multi-Agent

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 2-3 ore | **⭐ Complexitate**: Avansat

---

## Prezentare generală

Acest capitol acoperă modele avansate de arhitectură multi-agent, orchestrarea agenților și implementări AI gata pentru producție pentru scenarii complexe.

> Validat cu `azd 1.27.1` în iulie 2026.

## Obiective de învățare

Parcurgând acest capitol, vei:
- Înțelege modele de arhitectură multi-agent
- Implementa sisteme AI coordonate de agenți
- Implementa comunicarea agent-la-agent
- Construi soluții multi-agent gata pentru producție

---

## 📚 Lecții

| # | Lecția | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Bazele Multi-Agent](multi-agent-basics.md) | Practic: implementează o aplicație multi-agent funcțională cu `azd up` | 45 min |
| 2 | [Modele de coordonare](../chapter-06-pre-deployment/coordination-patterns.md) | Strategii de orchestrare a agenților (continuă în Capitolul 6) | 30 min |
| 3 | [Implementare ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Exemplu de implementare cu un singur clic | 30 min |

> **Începe cu Lecția 1.** Este singura lecție complet practică și implementabilă din acest capitol. Lecția 2 se află în Capitolul 6 (este împărtășită cu planificarea pre-implementării), iar [Soluția Multi-Agent Retail](../../examples/retail-scenario.md) este un plan arhitectural—o referință de design, nu un șablon cu o comandă unică.

---

## 🚀 Pornire rapidă

```bash
# Opțiunea 1: Implementați dintr-un șablon
azd init --template agent-openai-python-prompty
azd up

# Opțiunea 2: Implementați dintr-un manifest de agent (necesită extensia azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Ce abordare?** Folosește `azd init --template` pentru a porni de la un exemplu funcțional. Folosește `azd ai agent init` când ai propriul manifest de agent. Vezi [referința AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru detalii complete.

---

## 🤖 Arhitectura Multi-Agent

```mermaid
graph TD
    Orchestrator[Agent Orchestrator<br/>Redirecționează solicitările, gestionează fluxul de lucru] --> Customer[Agent Client<br/>Interogări utilizator, preferințe]
    Orchestrator --> Inventory[Agent Inventar<br/>Niveluri stoc, comenzi]
```

---

## 🎯 Soluția evidențiată: Retail Multi-Agent

[Soluția Multi-Agent Retail](../../examples/retail-scenario.md) demonstrează:

- **Agent Clienți**: Gestionează interacțiunile și preferințele utilizatorilor
- **Agent Inventar**: Controlează stocurile și procesarea comenzilor
- **Orchestrator**: Coordonează între agenți
- **Memorie partajată**: Gestionarea contextului între agenți

### Servicii utilizate

| Serviciu | Scop |
|---------|---------|
| Microsoft Foundry Models | Înțelegerea limbajului |
| Azure AI Search | Catalog de produse |
| Cosmos DB | Starea și memoria agenților |
| Container Apps | Găzduirea agenților |
| Application Insights | Monitorizare |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 4: Infrastructură](../chapter-04-infrastructure/README.md) |
| **Următor** | [Capitolul 6: Pre-Implementare](../chapter-06-pre-deployment/README.md) |

---

## 📖 Resurse conexe

- [Ghid agenți AI](../chapter-02-ai-development/agents.md)
- [Practici AI pentru Producție](../chapter-08-production/production-ai-practices.md)
- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->