# Kapitel 4: Infrastruktur som kod & distribution

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 1–1,5 timmar | **⭐ Svårighetsgrad**: Medelnivå

---

## Översikt

Detta kapitel täcker mönster för Infrastruktur som kod (IaC) med Bicep-mallar, resursprovisionering och distributionsstrategier med Azure Developer CLI.

> Validerad mot `azd 1.23.12` i mars 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå Bicep-mallars struktur och syntax
- Provisionera Azure-resurser med `azd provision`
- Distribuera applikationer med `azd deploy`
- Implementera blue-green- och rullande distributionsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering av resurser](provisioning.md) | Hantering av Azure-resurser med AZD | 45 min |
| 2 | [Distributionsguide](deployment-guide.md) | Strategier för applikationsdistribution | 45 min |

---

## 🚀 Snabbstart

```bash
# Initiera från en mall
azd init --template azure-functions-python-v2-http

# Förhandsgranska vad som kommer att skapas
azd provision --preview

# Provisionera endast infrastruktur
azd provision

# Distribuera endast kod
azd deploy

# Eller båda tillsammans
azd up
```

---

## 📁 AZD-projektstruktur

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Viktiga kommandon

| Kommando | Beskrivning |
|---------|-------------|
| `azd init` | Initiera projekt |
| `azd provision` | Skapa Azure-resurser |
| `azd deploy` | Distribuera applikationskod |
| `azd up` | provisionera + distribuera |
| `azd down` | Ta bort alla resurser |

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Nästa** | [Kapitel 5: Multi-agentlösningar](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterade resurser

- [Kontroller inför distribution](../chapter-06-pre-deployment/README.md)
- [Exempel på containerappar](../../examples/container-app/README.md)
- [Exempel på databasapp](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För viktig information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->