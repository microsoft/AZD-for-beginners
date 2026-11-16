# Kapitel 1: Fundament & Hurtig Start

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 75-120 minutter inklusive den første udrulning; yderligere øvelser tager længere tid | **⭐ Kompleksitet**: Begynder

---

## Oversigt

Dette kapitel introducerer Azure Developer CLI (azd) grundlæggende. Du vil lære kernekoncepter, installere værktøjerne og udrulle din første applikation til Azure.

> Kommando- og konfigurationsgennemgang mål: `azd 1.37.2` (november 2026). Live Azure-provisionering blev ikke kørt under gennemgangen.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå hvad Azure Developer CLI er, og hvordan det adskiller sig fra Azure CLI
- Installere og konfigurere AZD på din platform
- Udrulle din første applikation til Azure med `azd up`
- Rydde op i ressourcer med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Kernekoncepter, terminologi og projektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Platform-specifikke installationsvejledninger | 10 min |
| 3 | [Dit Første Projekt](first-project.md) | Praktisk: Udrul en webapp til Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Tilføj azd til et eksisterende projekt, du allerede har | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproducerbare azd-miljøer med dev containere | 15 min |

---

## ✅ Start Her: Bekræft Din Opsætning

Før du begynder, bekræft at din lokale maskine er klar til Kapitel 1-skabelonen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis scriptet rapporterer manglende værktøjer, ret disse først og fortsæt derefter med kapitlet.

---

## 🚀 Hurtig Start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Succes Kriterier

Efter at have gennemført dette kapitel, bør du kunne:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Næste** | [Kapitel 2: AI-First Udvikling](../chapter-02-ai-development/README.md) |
| **Spring til** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterede Ressourcer

- [Kommando Hurtigguide](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->