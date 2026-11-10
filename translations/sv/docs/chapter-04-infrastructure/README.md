# Kapitel 4: Infrastruktur som kod & distribution

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 2-3 timmar läsning; reservera extra tid för distributionsövningar | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Detta kapitel täcker mönster för Infrastruktur som Kod (IaC) med Bicep-mallar, resursprovisionering och distributionsstrategier med Azure Developer CLI.

> Kommando- och konfigurationsgranskning mål: `azd 1.37.2` (november 2026). Live Azure-provisionering kördes inte under granskningen.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå Bicep-mallens struktur och syntax
- Provisionera Azure-resurser med `azd provision`
- Distribuera applikationer med `azd deploy`
- Implementera blågrön- och rullande distributionsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering av resurser](provisioning.md) | Hantering av Azure-resurser med AZD | 45 min |
| 2 | [Distributionsguide](deployment-guide.md) | Strategier för applikationsdistribution | 45 min |
| 3 | [Skapa din egen mall](custom-templates.md) | Bygg och publicera återanvändbara azd-mallar | 30 min |

---

## 🚀 Snabbstart

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| **Nästa** | [Kapitel 5: Multi-Agent Lösningar](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterade resurser

- [Kontroller före distribution](../chapter-06-pre-deployment/README.md)
- [Exempel på Container-appar](../../examples/container-app/README.md)
- [Exempel på databasapp](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->