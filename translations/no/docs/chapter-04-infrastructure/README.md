# Kapittel 4: Infrastruktur som kode og utrulling

**📚 Kurs**: [AZD For Nybegynnere](../../README.md) | **⏱️ Varighet**: 2-3 timer lesing; beregn ekstra tid til utrullingsøvelser | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker mønstre for Infrastruktur som kode (IaC) med Bicep-maler, ressursprovisjonering og utrullingsstrategier med Azure Developer CLI.

> Mål for gjennomgang av kommandoer og konfigurasjon: `azd 1.37.2` (November 2026). Live Azure-provisjonering ble ikke kjørt under gjennomgangen.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Forstå Bicep-malenes struktur og syntaks
- Provisionere Azure-ressurser med `azd provision`
- Rulle ut applikasjoner med `azd deploy`
- Implementere blue-green og rullerende utrullingsstrategier

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering av ressurser](provisioning.md) | Azure ressursadministrasjon med AZD | 45 min |
| 2 | [Utrullingsguide](deployment-guide.md) | Applikasjonsutrullingsstrategier | 45 min |
| 3 | [Skrive din egen mal](custom-templates.md) | Bygg og publiser gjenbrukbare azd-maler | 30 min |

---

## 🚀 Komme i gang raskt

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

## 📁 AZD prosjekstruktur

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

## 🔧 Essensielle kommandoer

| Kommando | Beskrivelse |
|---------|-------------|
| `azd init` | Initialiser prosjekt |
| `azd provision` | Opprett Azure-ressurser |
| `azd deploy` | Rull ut applikasjonskode |
| `azd up` | provisjonér + deployer |
| `azd down` | Slett alle ressurser |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Neste** | [Kapittel 5: Multi-agent løsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterte ressurser

- [Sjekkliste før utrulling](../chapter-06-pre-deployment/README.md)
- [Container app-eksempler](../../examples/container-app/README.md)
- [Database app-eksempel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->