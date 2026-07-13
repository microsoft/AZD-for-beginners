# Kapitel 3: Konfiguration & Autentificering

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 45-60 minutter | **⭐ Sværhedsgrad**: Mellemtrin

---

## Oversigt

Dette kapitel dækker miljøkonfiguration, autentificeringsmønstre og sikkerhedsbest practices for Azure Developer CLI-udrulninger.

> Valideret mod `azd 1.27.1` i juli 2026.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Mestre AZD konfigurationshierarki
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentificering med managed identities
- Konfigurere miljøspecifikke indstillinger

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsguide](configuration.md) | Miljøopsætning og administration | 30 min |
| 2 | [Autentificering & Sikkerhed](authsecurity.md) | Managed identity og RBAC-mønstre | 30 min |

---

## 🚀 Kom godt i gang

```bash
# Opret flere miljøer
azd env new dev
azd env new staging
azd env new prod

# Skift miljøer
azd env select prod

# Indstil miljøvariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Se konfiguration
azd env get-values
```

---

## 🔧 Konfigurationshierarki

AZD anvender indstillinger i denne rækkefølge (senere overskriver tidligere):

1. **Standardværdier** (indbyggede i skabeloner)
2. **azure.yaml** (projektkonfiguration)
3. **Miljøvariabler** (`azd env set`)
4. **Kommandolinjeflag** (`--location eastus`)

---

## 🔐 Sikkerhed bedste praksis

```bash
# Brug administreret identitet (anbefales)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Tjek AZD autentificeringsstatus
azd auth status

# Valgfrit: verificer Azure CLI-kontekst, hvis du planlægger at køre az kommandoer
az account show

# Autentificer igen, hvis nødvendigt
azd auth login

# Valgfrit: opdater Azure CLI-autentificering for az kommandoer
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

- [Forudgående udrulningskontroller](../chapter-06-pre-deployment/README.md)
- [Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->