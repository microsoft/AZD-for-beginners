# Kapitel 1: Grundlag & Hurtigstart

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 30-45 minutter | **⭐ Kompleksitet**: Begynder

---

## Oversigt

Dette kapitel introducerer Azure Developer CLI (azd) grundlæggende. Du vil lære kernebegreber, installere værktøjerne og udrulle din første applikation til Azure.

> Valideret mod `azd 1.25.6` i juni 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå hvad Azure Developer CLI er og hvordan det adskiller sig fra Azure CLI
- Installere og konfigurere AZD på din platform
- Udrulle din første applikation til Azure med `azd up`
- Rydde op i ressourcer med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD - Grundlæggende](azd-basics.md) | Kernebegreber, terminologi og projektstruktur | 15 min |
| 2 | [Installation & Opsætning](installation.md) | Platformsspecifikke installationsvejledninger | 10 min |
| 3 | [Dit første projekt](first-project.md) | Praktisk: Udrul en webapp til Azure | 20 min |
| 4 | [Brug din egen app](bring-your-own-app.md) | Tilføj azd til et eksisterende projekt, du allerede har | 15 min |
| 5 | [Udviklercontainere & Codespaces](dev-containers.md) | Reproducerbare azd-miljøer med dev-containere | 15 min |

---

## ✅ Start her: Valider din opsætning

Før du begynder, bekræft at din lokale maskine er klar til Kapitel 1-skabelonen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis scriptet melder manglende værktøjer, ret disse først og fortsæt derefter med kapitlet.

---

## 🚀 Hurtigstart

```bash
# Kontroller installationen
azd version

# Autentificer til AZD
# Valgfrit: az login hvis du planlægger at køre Azure CLI-kommandoer direkte
azd auth login

# Udrul din første app
azd init --template todo-nodejs-mongo
azd up

# Ryd op, når du er færdig
azd down --force --purge
```

---

## ✅ Succeskriterier

Efter at have gennemført dette kapitel, bør du kunne:

```bash
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                   # Udruller til Azure
azd show                 # Viser URL for kørende app
azd down --force --purge # Rydder op i ressourcer
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Næste** | [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/README.md) |
| **Spring til** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterede ressourcer

- [Kommandooversigt](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Gloseliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->