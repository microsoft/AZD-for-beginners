# Kapitel 1: Grundlag & Hurtig Start

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 30-45 minutter | **⭐ Sværhedsgrad**: Begynder

---

## Oversigt

Dette kapitel introducerer Azure Developer CLI (azd) grundlæggende. Du vil lære kernebegreber, installere værktøjerne og implementere din første applikation til Azure.

> Valideret med `azd 1.27.1` i juli 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå hvad Azure Developer CLI er, og hvordan det adskiller sig fra Azure CLI
- Installere og konfigurere AZD på din platform
- Implementere din første applikation til Azure med `azd up`
- Rydde op i ressourcer med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Kernebegreber, terminologi og projektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Platform-specifikke installationsvejledninger | 10 min |
| 3 | [Dit Første Projekt](first-project.md) | Hands-on: Implementer en webapp til Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Tilføj azd til et eksisterende projekt, du allerede har | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproducerbare azd-miljøer med dev-containere | 15 min |

---

## ✅ Start Her: Bekræft Din Opsætning

Før du starter, bekræft at din lokale maskine er klar til Kapitel 1 skabelonen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis scriptet rapporterer manglende værktøjer, ret dem først og fortsæt derefter med kapitlet.

---

## 🚀 Hurtig Start

```bash
# Tjek installation
azd version

# Godkend for AZD
# Valgfrit: az login hvis du planlægger at køre Azure CLI-kommandoer direkte
azd auth login

# Udrul din første app
azd init --template todo-nodejs-mongo
azd up

# Ryd op når du er færdig
azd down --force --purge
```

---

## ✅ Succeskriterier

Når du har gennemført dette kapitel, bør du kunne:

```bash
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                   # Udruller til Azure
azd show                 # Viser kørende app URL
azd down --force --purge # Rydder op i ressourcer
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Næste** | [Kapitel 2: AI-Først Udvikling](../chapter-02-ai-development/README.md) |
| **Spring til** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterede Ressourcer

- [Kommandocheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->