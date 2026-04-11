# Kapitel 3: Konfiguration & Godkendelse

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 45-60 minutter | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel dækker miljøkonfiguration, godkendelsesmønstre og bedste praksis for sikkerhed ved Azure Developer CLI-udrulninger.

> Valideret mod `azd 1.23.12` i marts 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Beherske AZD's konfigurationshierarki
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker godkendelse med styrede identiteter
- Konfigurere miljøspecifikke indstillinger

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsguide](configuration.md) | Miljøopsætning og styring | 30 min |
| 2 | [Godkendelse & Sikkerhed](authsecurity.md) | Mønstre for styrede identiteter og RBAC | 30 min |

---

## 🚀 Hurtig start

```bash
# Opret flere miljøer
azd env new dev
azd env new staging
azd env new prod

# Skift mellem miljøer
azd env select prod

# Indstil miljøvariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vis konfiguration
azd env get-values
```

---

## 🔧 Konfigurationshierarki

AZD anvender indstillinger i denne rækkefølge (senere overskriver tidligere):

1. **Standardværdier** (indbygget i skabeloner)
2. **azure.yaml** (projektkonfiguration)
3. **Miljøvariabler** (`azd env set`)
4. **Kommandolinjeflag** (`--location eastus`)

---

## 🔐 Bedste praksis for sikkerhed

```bash
# Brug administreret identitet (anbefales)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontroller AZD-autentificeringsstatus
azd auth status

# Valgfrit: bekræft Azure CLI-kontekst, hvis du planlægger at køre az-kommandoer
az account show

# Autentificer igen om nødvendigt
azd auth login

# Valgfrit: opdater Azure CLI-autentificering for az-kommandoer
az login
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 2: AI-udvikling](../chapter-02-ai-development/README.md) |
| **Næste** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterede ressourcer

- [Tjek før udrulning](../chapter-06-pre-deployment/README.md)
- [Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->