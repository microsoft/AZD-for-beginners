# Kapitel 1: Grundlag & Hurtigstart

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 30-45 minutter | **⭐ Kompleksitet**: Begynder

---

## Oversigt

Dette kapitel introducerer Azure Developer CLI (azd) grundlæggende. Du vil lære kernekoncepter, installere værktøjerne og udrulle din første applikation til Azure.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Forstå hvad Azure Developer CLI er, og hvordan det adskiller sig fra Azure CLI
- Installere og konfigurere AZD på din platform
- Udrulle din første applikation til Azure med `azd up`
- Fjerne ressourcer med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Grundlæggende](azd-basics.md) | Kernebegreber, terminologi og projektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Platformsspecifikke installationsvejledninger | 10 min |
| 3 | [Dit første projekt](first-project.md) | Hands-on: Udrul en webapp til Azure | 20 min |

---

## 🚀 Hurtigstart

```bash
# Kontroller installationen
azd version

# Log ind på Azure
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
azd show                 # Viser URL'en for den kørende app
azd down --force --purge # Rydder op i ressourcerne
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Next** | [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/README.md) |
| **Skip to** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterede ressourcer

- [Kommandooversigt](../../resources/cheat-sheet.md)
- [Ofte stillede spørgsmål](../../resources/faq.md)
- [Ordliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør anses for den autoritative kilde. For kritisk information anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->