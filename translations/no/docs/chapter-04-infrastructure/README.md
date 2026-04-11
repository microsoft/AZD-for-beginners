# Kapittel 4: Infrastruktur som kode og distribusjon

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1,5 timer | **⭐ Vanskelighetsgrad**: Mellomnivå

---

## Oversikt

Dette kapittelet dekker mønstre for Infrastruktur som kode (IaC) med Bicep-maler, ressursprovisjonering og distribusjonsstrategier ved bruk av Azure Developer CLI.

> Validert mot `azd 1.23.12` i mars 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Forstå Bicep-malens struktur og syntaks
- Provisionere Azure-ressurser med `azd provision`
- Distribuere applikasjoner med `azd deploy`
- Implementere blue-green og rullende distribusjonsstrategier

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering av ressurser](provisioning.md) | Azure ressursadministrasjon med AZD | 45 min |
| 2 | [Distribusjonsveiledning](deployment-guide.md) | Applikasjonsdistribusjonsstrategier | 45 min |

---

## 🚀 Kom i gang raskt

```bash
# Initialiser fra mal
azd init --template azure-functions-python-v2-http

# Forhåndsvis hva som vil bli opprettet
azd provision --preview

# Tilrettelegg infrastruktur kun
azd provision

# Distribuer kode kun
azd deploy

# Eller begge sammen
azd up
```

---

## 📁 AZD prosjektstruktur

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

## 🔧 Viktige kommandoer

| Kommando | Beskrivelse |
|---------|-------------|
| `azd init` | Initialiser prosjekt |
| `azd provision` | Opprett Azure-ressurser |
| `azd deploy` | Distribuer applikasjonskode |
| `azd up` | provisjon + distribusjon |
| `azd down` | Slett alle ressurser |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Neste** | [Kapittel 5: Multi-agentløsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterte ressurser

- [Kontroller før distribusjon](../chapter-06-pre-deployment/README.md)
- [Container App Eksempler](../../examples/container-app/README.md)
- [Database App Eksempel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på det opprinnelige språket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->