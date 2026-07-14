# Kapitel 4: Infrastruktur som kod & distribution

**📚 Kurs**: [AZD För nybörjare](../../README.md) | **⏱️ Varaktighet**: 1-1.5 timmar | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Detta kapitel täcker Infrastructure as Code (IaC) mönster med Bicep-mallar, resurstilldelning och distributionsstrategier med Azure Developer CLI.

> Validerat mot `azd 1.27.1` i juli 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå Bicep-mallens struktur och syntax
- Tilldela Azure-resurser med `azd provision`
- Distribuera applikationer med `azd deploy`
- Implementera blue-green och rolling deployment-strategier

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Tilldelning av resurser](provisioning.md) | Hantering av Azure-resurser med AZD | 45 min |
| 2 | [Distributionsguide](deployment-guide.md) | Applikationsdistributionsstrategier | 45 min |
| 3 | [Skapa din egen mall](custom-templates.md) | Bygg och publicera återanvändbara azd-mallar | 30 min |

---

## 🚀 Snabbstart

```bash
# Initiera från mall
azd init --template azure-functions-python-v2-http

# Förhandsgranska vad som kommer att skapas
azd provision --preview

# Tillhandahåll endast infrastruktur
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
| `azd up` | tilldela + distribuera |
| `azd down` | Ta bort alla resurser |

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Nästa** | [Kapitel 5: Multi-Agentlösningar](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterade resurser

- [Kontroller före distribution](../chapter-06-pre-deployment/README.md)
- [Exempel på Container App](../../examples/container-app/README.md)
- [Exempel på Databasapp](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->