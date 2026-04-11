# Kapitel 1: Grundlag & Hurtigstart

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 30-45 minutter | **⭐ Kompleksitet**: Begynder

---

## Oversigt

Dette kapitel introducerer grundlæggende om Azure Developer CLI (azd). Du lærer centrale begreber, installerer værktøjerne og udruller din første applikation til Azure.

> Valideret mod `azd 1.23.12` i marts 2026.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Forstå, hvad Azure Developer CLI er, og hvordan det adskiller sig fra Azure CLI
- Installere og konfigurere AZD på din platform
- Udrulle din første applikation til Azure med `azd up`
- Rydde op i ressourcer med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Grundlæggende](azd-basics.md) | Kernebegreber, terminologi og projektstruktur | 15 min |
| 2 | [Installation & Opsætning](installation.md) | Platform-specifikke installationsvejledninger | 10 min |
| 3 | [Dit første projekt](first-project.md) | Praktisk: Udrul en webapp til Azure | 20 min |

---

## ✅ Start her: Bekræft din opsætning

Før du begynder, skal du bekræfte, at din lokale maskine er klar til Kapitel 1-skabelonen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis scriptet rapporterer manglende værktøjer, skal du rette dem først og derefter fortsætte med kapitlet.

---

## 🚀 Hurtigstart

```bash
# Kontroller installationen
azd version

# Autentificer til AZD
# Valgfrit: az login, hvis du planlægger at køre Azure CLI-kommandoer direkte
azd auth login

# Udrul din første app
azd init --template todo-nodejs-mongo
azd up

# Ryd op, når du er færdig
azd down --force --purge
```

---

## ✅ Succeskriterier

Efter at have gennemført dette kapitel bør du kunne:

```bash
azd version              # Viser den installerede version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                   # Udruller til Azure
azd show                 # Viser URL for den kørende app
azd down --force --purge # Rydder op i ressourcerne
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Næste** | [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/README.md) |
| **Spring til** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterede ressourcer

- [Kommando-oversigt](../../resources/cheat-sheet.md)
- [Ofte stillede spørgsmål](../../resources/faq.md)
- [Begrebsregister](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for nogen misforståelser eller fejltolkninger som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->