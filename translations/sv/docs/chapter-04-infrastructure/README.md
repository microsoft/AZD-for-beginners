# Kapitel 4: Infrastruktur som kod & Distribution

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 1–1,5 timmar | **⭐ Komplexitet**: Medel

---

## Översikt

Detta kapitel täcker mönster för Infrastruktur som kod (IaC) med Bicep-mallar, resursprovisionering och distributionsstrategier med Azure Developer CLI.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå Bicep-mallars struktur och syntax
- Provisionera Azure-resurser med `azd provision`
- Distribuera applikationer med `azd deploy`
- Implementera blue-green- och rolling-distributionsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering av resurser](provisioning.md) | Azure-resurshantering med AZD | 45 min |
| 2 | [Distributionsguide](deployment-guide.md) | Strategier för distribution av applikationer | 45 min |

---

## 🚀 Snabbstart

```bash
# Initiera från mall
azd init --template azure-functions-python-v2-http

# Förhandsgranska vad som kommer att skapas
azd provision --preview

# Endast provisionera infrastruktur
azd provision

# Endast distribuera kod
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

- [Kontroller före distribution](../chapter-06-pre-deployment/README.md)
- [Exempel på Container-appar](../../examples/container-app/README.md)
- [Exempel på databasapp](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på sitt ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->